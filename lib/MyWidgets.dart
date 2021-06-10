import 'package:flutter/material.dart';

class IconCinsiyet extends StatelessWidget {
  final IconData icon;
  final String cinis;

  IconCinsiyet({this.icon, this.cinis});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(height: 10,),
        Text(
          cinis,
          style: TextStyle(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color renk;
  Widget child;
  Function onPress;

  MyContainer({this.renk = Colors.white, this.child,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(12),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: renk,
        ),
        child: child,
      ),
    );
  }
}