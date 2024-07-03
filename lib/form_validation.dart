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
  bool success = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Column(
          children: [
            Text(
              "Password Form Validation",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: success
                    ? Lottie.network(
                        "https://lottie.host/c288e345-7b57-45c8-b224-cc6af457bfe0/7wi1v8ZrWM.json",
                      )
                    : Lottie.network(
                        "https://lottie.host/de8895c3-39b1-488d-8089-d42c697bd7f2/8q4PKhMEyb.json",
                      ),
              ),
              SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: controller,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black45,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: success ? Colors.green : Colors.red,
                              width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    FlutterPwValidator(
                      defaultColor: Colors.grey,
                      controller: controller,
                      successColor: Colors.green,
                      minLength: 8,
                      uppercaseCharCount: 1,
                      lowercaseCharCount: 2,
                      numericCharCount: 1,
                      specialCharCount: 1,
                      normalCharCount: 3,
                      width: 350,
                      height: 200,
                      onSuccess: () {
                        setState(() {
                          success = true;
                        });
                      },
                      onFail: () {
                        setState(() {
                          success = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
