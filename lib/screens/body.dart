import 'package:dro_health/screens/views/card.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final Widget child;

  const Body({Key key, this.child}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '125 items(s)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffede9e8),
                child: Image.asset(
                  'assets/icons/arrow.png',
                  height: 20,
                  width: 15,
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(0xffede9e8),
                child: Image.asset(
                  'assets/icons/filter.png',
                  height: 20,
                  width: 15,
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(0xffede9e8),
                child: Icon(
                  Icons.search,
                  // color: Colors.black,
                ),
              ),
            ],
          ),
          //! getting the box is easy
          SizedBox(height: 10),
          CardData(),
          //  Stack(
          //    children: [],
          //  )
        ],
      ),
    );
  }
}
