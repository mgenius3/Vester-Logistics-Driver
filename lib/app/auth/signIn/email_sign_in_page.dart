import 'package:flutter/material.dart';
import 'package:vester_driver/app/auth/signIn/email_sign_in_form.dart';
import 'package:vester_driver/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Center(
              child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: EmailSignInForm(
            auth: Auth(),
          ),
        ),
      ))),
    );
  }

  // Widget _buildContent() {
  //   return Container();
  // }
}
