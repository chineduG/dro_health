import 'package:dro_health/constants.dart';
import 'package:dro_health/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;

  const PanelWidget({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        controller: controller,
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 5,
          ),
          buildDragHandle(),
          SizedBox(height: 5),
          SizedBox(height: 10),
          buildCart(),
          SizedBox(
            height: 24,
          ),
          buildTap(),
          SizedBox(
            height: 500,
          ),
          buildButton(),
          SizedBox(height: 25),
        ],
      );

  Widget buildCart() => Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/shopping-bag.png',
                      height: 25,
                      color: kBag,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Bag',
                      style: TextStyle(color: kBag, fontSize: 20),
                    ),
                  ],
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: kBag,
                        child: Text(
                          state.counterValue.toString(),
                          style: TextStyle(color: kDROColor),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      );

  Widget buildDragHandle() => Center(
        child: Container(
          width: 40,
          height: 3,
          decoration: BoxDecoration(color: kBag),
        ),
      );

  Widget buildTap() => Center(
        child: Container(
          // alignment: Alignment.center,
          height: 30,
          width: 300,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Tap on an item for add, remove, delete options',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );

  Widget buildButton() => Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30, color: kBag),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '\$${900}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: kBag),
                      )),
                ],
              ),
            ),
            cardButton(),
          ],
        ),
      );

  Widget cardButton() => InkWell(
        onTap: () {
          print('Welcome');
        },
        child: Container(
          height: 50,
          width: 300,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Checkout',
                style: TextStyle(
                    fontSize: 23,
                    color: kDROColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );
}
