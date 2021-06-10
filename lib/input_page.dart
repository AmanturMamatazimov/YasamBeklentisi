import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/constants.dart';
import 'package:yasam_beklentisi/result_page.dart';
import 'package:yasam_beklentisi/user_data.dart';
import 'MyWidgets.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double icilenSigara = 15;
  double sporGunu = 3;
  int boy = 170;
  int kilo = 72;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyContainer(
                  child: buildRowOutlineButton('BOY'),
                ),
              ),
              Expanded(
                  child: MyContainer(
                child: buildRowOutlineButton('KİLO'),
              )),
            ],
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haftada Kaç Gün Spor Yapıyorsunuz?',
                    style: metinStili,
                  ),
                  Text(
                    sporGunu.round().toString(),
                    style: sayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: sporGunu,
                    onChanged: (double newValue) {
                      setState(() {
                        sporGunu = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Günde Kaç Sigara İçiyorsunuz?",
                    style: metinStili,
                  ),
                  Text(
                    "${icilenSigara.round()}",
                    style: sayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.blue
                        : Colors.white,
                    child: IconCinsiyet(
                      icon: FontAwesomeIcons.venus,
                      cinis: 'KADIN',
                    ),
                  ),
                ),
                Expanded(
                    child: MyContainer(
                  onPress: () {
                    setState(() {
                      seciliCinsiyet = 'ERKEK';
                    });
                  },
                  renk:
                      seciliCinsiyet == 'ERKEK' ? Colors.blue : Colors.white,
                  child: IconCinsiyet(
                    icon: FontAwesomeIcons.mars,
                    cinis: 'ERKEK',
                  ),
                )),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            minWidth: 600,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                      kilo: kilo,
                      boy: boy,
                      sporGunu: sporGunu,
                      icilenSigara: icilenSigara,
                      seciliCinsiyet: seciliCinsiyet,
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                'HESAPLA',
                style: metinStili,
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              text,
              style: metinStili,
            )),
        SizedBox(width: 10),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            text == 'BOY' ? '$boy' : '$kilo',
            style: sayiStili,
          ),
        ),
        SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    text == 'BOY' ? boy++ : kilo++;
                  });
                },
              ),
              minWidth: 36,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    text == 'BOY' ? boy-- : kilo--;
                  });
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
