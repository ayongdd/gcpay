import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:GCPay/widget/paypass/pin_input_controller.dart';
import 'package:GCPay/widget/paypass/pin_plus_keyboard_package.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_core/src/get_main.dart';

import 'flutter_verification_code.dart';
import 'onscreen_num_keyboard.dart';

String text = "";

onKeyboardTap(String value) {
  // setState(() {
  //   text = text + value;
  // });
}

void openPayVerifyDialog() async {
  Size size = MediaQuery.of(Get.context!).size;
  PinInputController pinInputController = PinInputController(length: 6);
  locationDialog({
    required AlignmentGeometry alignment,
    double width = double.infinity,
    double height = double.infinity,
  }) async {
    SmartDialog.show(
      alignment: alignment,
      builder: (_) {
        return Container(
            height: 600,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            alignment: Alignment.topCenter,
            child: Center(
                child: Container(
                    width: size.width,
                    height: size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PinPlusKeyBoardPackage(
                          spacing: 80,
                          keyboardFontSize:28,
                          btnHasBorder:false,
                          extraInput: '',
                          pinInputController: pinInputController,
                          onSubmit: () {
                            /// ignore: avoid_print
                            print("Text is : " + pinInputController.text);
                          }, keyboardFontFamily: 'Helvetica Neue',
                        ),
                      ],
                    ))),
        );
      },
    );
    await Future.delayed(Duration(milliseconds: 100));
  }
  //bottom
  await locationDialog(height: 70, alignment: Alignment.bottomCenter);

}


class PayCodeDialogPage extends StatefulWidget {
  const PayCodeDialogPage({super.key});

  @override
  State<PayCodeDialogPage> createState() => _PayCodeDialogPageState();
}

class _PayCodeDialogPageState extends State<PayCodeDialogPage> {
  bool _onEditing = true;
  String? _code;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Example verify code'),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Enter your code',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          VerificationCode(
            textStyle: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.black),
            keyboardType: TextInputType.number,
            fullBorder:true,
            underlineColor: Colors
                .grey, // If this is null it will use primaryColor: Colors.red from Theme
            length: 6,
            isSecure:true,
            digitsOnly:true,
            cursorColor:
            Colors.blue, // If this is null it will default to the ambient
            // clearAll is NOT required, you can delete it
            // takes any widget, so you can implement your design
            clearAll: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'clear all',
                style: TextStyle(
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                    color: Colors.blue[700]),
              ),
            ),
            margin: const EdgeInsets.all(0),
            onCompleted: (String value) {
              setState(() {
                _code = value;
              });
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: _onEditing
                  ? const Text('Please enter full code')
                  : Text('Your code: $_code'),
            ),
          )
        ],
      ),
    );
  }
}