import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FaceFingerPrintAuth extends StatefulWidget {
  const FaceFingerPrintAuth({super.key});

  @override
  State<FaceFingerPrintAuth> createState() => _FaceFingerPrintAuthState();
}

class _FaceFingerPrintAuthState extends State<FaceFingerPrintAuth> {
  late final LocalAuthentication myauthentication;
  bool authState = false;
  @override
  void initState() {
    super.initState();
    myauthentication = LocalAuthentication();
    myauthentication.isDeviceSupported().then(
          (bool myAuth) => setState(
            () {
              authState = myAuth;
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Flutter Biometrics Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: authentication,
                child: const Text(
                  "Authenticate",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  Future<void> authentication() async {
    try {
      bool isAuthenticate = await myauthentication.authenticate(
        localizedReason: " local authentication",
        options: const AuthenticationOptions(
          stickyAuth: true,
          // if you have choose biometricOnly to truel it not show other option to authenticate
          biometricOnly: true,
        ),
      );
      print("Authentication Status is: $isAuthenticate");
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) {
      return;
    }
  }
}
