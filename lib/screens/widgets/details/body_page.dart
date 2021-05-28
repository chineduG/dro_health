import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dro_health/constants.dart';
import 'package:dro_health/cubits/counter_cubit.dart';
import 'package:dro_health/model/product.dart';
import 'package:dro_health/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyPage extends StatefulWidget {
  final Product imageData;
  const BodyPage({Key key, this.imageData}) : super(key: key);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: kBag,
          child: Column(
            children: [
              topWidget(),
              SizedBox(height: 10),
              cardDetails(),
              SizedBox(height: 15),
              addCart(),
              SizedBox(height: 20),
              productInfo(),
              SizedBox(height: 50),
              btn(),
            ],
          ),
        ),
      ),
    );
  }

//TODO Top widgets for the icon & row
  Widget topWidget() => Row(children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        Spacer(),
        Container(
          width: 60,
          height: 45,
          decoration: BoxDecoration(
              color: kDROColor, borderRadius: BorderRadius.circular(14)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/sb.png', height: 30, color: kBag),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: TextStyle(fontSize: 15, color: kBag),
                  );
                },
              )
            ],
          ),
        )
      ]);
//TODO Image displayed from the previous screen
  Widget cardDetails() => Container(
        child: Column(children: [
          Image.asset(widget.imageData.image),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.imageData.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: kBlack),
                ),
                Text(
                  widget.imageData.description,
                  style: TextStyle(fontSize: 15, color: kBlack),
                ),
                ListTile(
                  title: Text(
                    'Sold by'.toUpperCase(),
                    style: TextStyle(fontSize: 10),
                  ),
                  subtitle: Text(
                    widget.imageData.company,
                    style: TextStyle(fontSize: 13, color: kTol),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: kPriceColor,
                  ),
                )
              ],
            ),
          ),
        ]),
      );
//TODO add to Cart and showSnackbar
  Widget addCart() => Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              height: 45,
              width: 120,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(20)),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: kBag,
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.minimize),
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).reducePrice();
                          // print('Remove 1');
                        }),
                    // Bloc
                    BlocConsumer<CounterCubit, CounterState>(
                      listener: (context, state) {
                        if (state.wasIncremented == true) {
                          return ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                  backgroundColor: kDROColor,
                                  duration: Duration(milliseconds: 2000),
                                  content: Text(
                                    'Added one item',
                                    style: TextStyle(color: kTol),
                                  )));
                        } else if (state.wasIncremented == false) {
                          return ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                  duration: Duration(milliseconds: 2000),
                                  backgroundColor: kDROColor,
                                  content: Text(
                                    'Reduced one item',
                                    style: TextStyle(color: kTol),
                                  )));
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return Text(state.counterValue.toString());
                      },
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).addPrice();
                          // print('Add 1');
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Pack(s)',
              style: TextStyle(color: kPriceColor, fontSize: 15),
            ),
            Spacer(),
            Text(
              '\₦${widget.imageData.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
//TODO Product Details(id, company & size)
  Widget productInfo() => Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Product Details'.toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    color: kPriceColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/icons/drug.png',
                  height: 30,
                  color: kDarkColor,
                ),
                SizedBox(width: 5),
                Column(
                  children: [
                    Text(
                      'Pack size'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 12,
                          color: kPriceColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '3x10'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 10,
                            color: kPriceColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/icons/qr-code-scan.png',
                  height: 30,
                  color: kDarkColor,
                ),
                SizedBox(width: 5),
                Column(
                  children: [
                    Text(
                      'Product id'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 12,
                          color: kPriceColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.imageData.productID.toUpperCase(),
                        style: TextStyle(
                            fontSize: 10,
                            color: kPriceColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(children: [
              Image.asset(
                'assets/icons/meds.png',
                height: 30,
                color: kDarkColor,
              ),
              SizedBox(width: 5),
              Column(
                children: [
                  Text(
                    'Constituents'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        color: kPriceColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.imageData.title.toUpperCase(),
                      style: TextStyle(
                          fontSize: 10,
                          color: kPriceColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(height: 15),
            Row(children: [
              Image.asset(
                'assets/icons/medicament.png',
                height: 30,
                color: kDarkColor,
              ),
              SizedBox(width: 5),
              Column(
                children: [
                  Text(
                    'dispensed'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        color: kPriceColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'packs'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 10,
                          color: kPriceColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(height: 10),
            // Suppose to have done this in the models
            Align(
              child: Text(
                '1 pack ${widget.imageData.title} contains 4 Tablets',
                style: TextStyle(color: kPriceColor),
              ),
              alignment: Alignment.center,
            )
          ],
        ),
      );
  Widget btn() => AnimatedButton(
        text: 'Add to bag',
        color: kDROColor,
        pressEvent: () {
          AwesomeDialog(
            // set to false to Touch outside
            dismissOnTouchOutside: true,
            btnCancel: Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kTol)),
                  child: Text('View Bag'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kTol)),
                  child: Text('Done'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
              ],
            ),
            context: context,
            animType: AnimType.LEFTSLIDE,
            // headerAnimationLoop: false,
            dialogType: DialogType.SUCCES,
            title: 'Successful',
            desc: '${widget.imageData.title} has been added to bag',
            // btnOkOnPress: () {},
            // btnOkIcon: Icons.check_circle,
          )..show();
        },
      );
  //TODO Button add to Bag, I used another plugin.
  // Widget addToCart() => InkWell(
  //       onTap: () {},
  //       child: Container(
  //         height: 50,
  //         width: 300,
  //         child: Card(
  //           color: kDROColor,
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //           child: Align(
  //             alignment: Alignment.center,
  //             child: Row(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Image.asset(
  //                   'assets/icons/shopping-bag (3).png',
  //                   height: 30,
  //                   color: kBag,
  //                 ),
  //                 SizedBox(height: 15),
  //                 Text(
  //                   'Add to Bag',
  //                   style: TextStyle(
  //                     fontSize: 15,
  //                     color: kBag,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     );

}
