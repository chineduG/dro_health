import 'package:dro_health/model/product.dart';
import 'package:dro_health/screens/widgets/details/body_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../constants.dart';

class CardData extends StatefulWidget {
  final Product imageData;
  const CardData({
    Key key,
    this.imageData,
  }) : super(key: key);
  @override
  _CardDataState createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          crossAxisCount: 2,
          itemCount: infoData.length,
          itemBuilder: (context, index) {
// if error remove product and put card
            Product imageData = infoData[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(
                            imageData: infoData[index],
                          )),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: ClipRRect(
                  //! Create border radius or get a new picture
                  // borderRadius: BorderRadius.all(90),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Image.asset(
                            imageData.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              imageData.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('${imageData.description}',
                                style:
                                    TextStyle(fontSize: 12, color: kTextColor)),
                            Text(imageData.info,
                                style:
                                    TextStyle(fontSize: 12, color: kTextColor)),
                          ]),
                      SizedBox(
                        height: 2,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 2, right: 5),
                          width: 60,
                          height: 30,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45.0),
                            ),
                            margin: EdgeInsets.only(bottom: 5, right: 5),
                            color: kPriceColor,
                            child: Align(
                                child: Text(
                              '\₦${imageData.price}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
      ),
    );
  }
}
