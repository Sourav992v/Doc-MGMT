import 'package:country_code_picker/country_code_picker.dart';
import 'package:doctor_management/ui/home/home_screen.dart';
import 'package:doctor_management/ui/login/components/checkbox.dart';
import 'package:doctor_management/utils/constants.dart';
import 'package:doctor_management/utils/custom_widget.dart';
import 'package:doctor_management/utils/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var currentState = LoginVerificationState.formState;
  final phoneTextController = TextEditingController();
  final otpController = TextEditingController();

  late String verificationId;

  String countryCode = '+91';

  bool _checked = false;

  bool showLoading = false;

  void toggleCheckBox() {
    setState(() {
      _checked = !_checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorPrimaryDark,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: currentState == LoginVerificationState.formState
                  ? getPhoneScreen(context)
                  : getOtpScreen(context),
        ));
  }

  getPhoneScreen(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'ENTER YOUR MOBILE NUMBER',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              child: TextField(

                cursorColor: Colors.white,
                style: TextStyle(color: kColorAccent,fontSize: 16.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
                controller: phoneTextController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: '9988776655',
                    hintStyle:
                        TextStyle(color: Colors.white.withOpacity(0.4)),
                suffixIcon: const Icon(
                  Icons.cancel_outlined,
                  color: kColorAccent,
                  size: 16,
                ),
                prefixIcon: CountryCodePicker(
                  onChanged: (value){
                    setState(() {
                      countryCode = value.dialCode.toString();
                    });
                  },
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'IN',
                  favorite: ['+91','IN'],
                  textStyle: TextStyle(color: Colors.green),
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  showFlag: false,
                  showDropDownButton: true,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),),
              ),
            ),
            const Text(
              'We will send you an SMS with the verification code to this number',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
                phoneNumber: '$countryCode${phoneTextController.value.text}',
                verificationCompleted: (phoneAuthCredential) async {
                  setState(() {
                    showLoading = false;
                  });
                },
                verificationFailed: (verificationFailed) async {
                  setState(() {
                    showLoading = false;
                  });
                  CustomWidgets.buildSnackBar(
                      context, verificationFailed.message ?? '');
                },
                codeSent: (id, token) async {
                  setState(() {
                    showLoading = false;
                    currentState = LoginVerificationState.otpState;
                    verificationId = id;
                  });
                },
                codeAutoRetrievalTimeout: (verificationId) async {});
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: showLoading ? Center(child: CircularProgressIndicator(color: Colors.white),):const Text(
              'Continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0))),
        )
      ],
    );
  }

  getOtpScreen(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Enter verification code',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            ClipRect(child: _otpTextField(context)),
            Text(
              'Please enter the verification code that \nwas sent to ${phoneTextController.value.text}',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: otpController.value.text);

                signInWithPhone(phoneAuthCredential);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: showLoading ? const Center(child: CircularProgressIndicator(color: Colors.white),):const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0))),
            ),
            Container(
              child: CheckBox(
                value: _checked,
                checked: () {
                  toggleCheckBox();
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _otpTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: PinCodeTextField(
        controller: otpController,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          selectedFillColor: Colors.white,
          inactiveColor: kColorPrimary,
          inactiveFillColor: Colors.white,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: kColorPrimaryDark,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        textStyle: TextStyle(color: kColorAccent),
        validator: (v) {},
        onCompleted: (v) {
          print("Completed");
        },
        onChanged: (value) {
          print(value);
          setState(() {
            //currentText = value;
          });
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");

          return true;
        },
        appContext: context,
      ),
    );
  }

  void signInWithPhone(PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential).then((value) {
        setState(() {
          showLoading = false;
        });
        if (value.user != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      CustomWidgets.buildSnackBar(context, e.message.toString());
    }
  }
}
