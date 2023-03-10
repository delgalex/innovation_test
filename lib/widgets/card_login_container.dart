import 'package:flutter/material.dart';

class CardLoginContainer extends StatelessWidget {
  final Widget child;

  const CardLoginContainer({
    Key? key, 
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: _createCard(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCard() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0,15),
      )
    ]
  );
}