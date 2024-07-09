import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:lottie/lottie.dart';

class PasswordFormValidator extends StatefulWidget {
  const PasswordFormValidator({super.key});

  @override
  State<PasswordFormValidator> createState() => _PasswordFormValidatorState();
}

class _PasswordFormValidatorState extends State<PasswordFormValidator> {
  final TextEditingController controller = TextEditingController();
  bool isSuccess = false; // initially
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true, // for android
        backgroundColor: Colors.blue,
        title: const Text(
          "Password Form Validation",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: isSuccess
                    ? Lottie.network(
                        "https://lottie.host/c288e345-7b57-45c8-b224-cc6af457bfe0/7wi1v8ZrWM.json")
                    : Lottie.network(
                        "https://lottie.host/de8895c3-39b1-488d-8089-d42c697bd7f2/8q4PKhMEyb.json"),
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    TextField(
                      obscureText: _obscureText,
                      controller: controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black45,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isSuccess ? Colors.green : Colors.red,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    // the main parts
                    // validation parts
                    FlutterPwValidator(
                      defaultColor: Colors.grey,
                      uppercaseCharCount: 1,
                      lowercaseCharCount: 2,
                      numericCharCount: 1,
                      normalCharCount: 3,
                      specialCharCount: 1,

                      width: 350,
                      height: 200,
                      minLength:
                          8, // password should be at list 8 character length
                      onSuccess: () {
                        setState(() {
                          isSuccess = true;
                        });
                      },
                      onFail: () {
                        isSuccess = false;
                      },
                      controller: controller,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/* lottie file link
https://lottiefiles.com/free-animation/lock-0pPUaBrxWL?from=search
https://lottiefiles.com/free-animation/lock-blue-JyX7xr7bSs?from=search
*/
