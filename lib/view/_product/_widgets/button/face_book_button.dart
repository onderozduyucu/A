import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/components/button/title_text_button.dart';

class FaceBookButton extends StatelessWidget {
  const FaceBookButton({super.key, this.onComplete});
  final void Function(FaceBookModel? data, {String? errorMessage})? onComplete;

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
      text: 'Facebbok login',
      onPressed: () {
        const isLengthSixCharacter = 'asdasdasd'.length == 6;

        if (isLengthSixCharacter) {
          onComplete!(FaceBookModel('asdasd', 'ASdasd'));
        } else {
          onComplete!(null, errorMessage: 'Facebook user not found');
        }
      },
    );
  }
}

class FaceBookModel {
  FaceBookModel(this.token, this.mail);
  final String token;
  final String mail;
}
