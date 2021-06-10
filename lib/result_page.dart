import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/constants.dart';
import 'package:yasam_beklentisi/user_data.dart';
import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuc Sayfasi'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(child: Text('${Hesap(_userData).hesaplama().round()}',style: metinStili,)),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Geri Don',
                style: metinStili,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
