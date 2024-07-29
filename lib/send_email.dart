import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class SendEmailFromFlutterApp extends StatefulWidget {
  const SendEmailFromFlutterApp({super.key});

  @override
  State<SendEmailFromFlutterApp> createState() =>
      _SendEmailFromFlutterAppState();
}

class _SendEmailFromFlutterAppState extends State<SendEmailFromFlutterApp> {
  final key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController subject = TextEditingController();

  TextEditingController body = TextEditingController();
  sendEmail(String subject, String body, String recipient) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipient],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: "Enter email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: subject,
                decoration: const InputDecoration(
                  hintText: "Enter subject",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: body,
                decoration: const InputDecoration(
                  hintText: "Enter body",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    key.currentState!.save();
                    sendEmail(subject.text, body.text, email.text);
                    // clear the text field after send the mail
                    subject.clear();
                    body.clear();
                    email.clear();
                  },
                  child: const Text("Send Mail"),)
            ],
          ),
        ),
      ),
    );
  }
}
// ok thank you that's it for today video.