import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckNetworkConnectivity extends StatefulWidget {
  const CheckNetworkConnectivity({super.key});

  @override
  State<CheckNetworkConnectivity> createState() => _HomePageState();
}

class _HomePageState extends State<CheckNetworkConnectivity> {
  late StreamSubscription _streamSubscription;
  bool isDeviceConnect = false;
  bool isAleart = false;

  @override
  void initState() {
    super.initState();
    internetConnection();
  }

  internetConnection() => _streamSubscription =
          Connectivity().onConnectivityChanged.listen((result) async {
        isDeviceConnect = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnect && isAleart == false) {
          showDialogBox();
          setState(() {
            isAleart = true;
          });
        }
      });
      // lets try it in next page
      // it is working on the entire app

  void despose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  showDialogBox() => showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text("You Appear to be Offline"),
            content: const Text(
                "You can't use this app until you're connected to the interenet"),
            actions: [
              TextButton(
                onPressed: () async {
                  // dialog is disappear if user is click after the internet connection
                  Navigator.pop(context);
                  setState(() {
                    // initially it is false
                    isAleart = false;
                  });
                  isDeviceConnect =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnect && isAleart == false) {
                    showDialogBox();
                    // at the end it is true
                    setState(() {
                      isAleart = true;
                    });
                  }
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "Check Internet Connection",
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondSceen(),
              ),
            );
          },
          child: const Text("Go to Next Screen"),
        ),
      ),
    );
  }
}

class SecondSceen extends StatelessWidget {
  const SecondSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "Check Internet Connection",
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Go Back"),
        ),
      ),
    );
  }
}
