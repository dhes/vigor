import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderedList extends StatelessWidget {
  const OrderedList({
    @required this.label1,
    @required this.sortCol1,
    @required this.order1,
    @required this.entry1,
    @required this.label2,
    @required this.sortCol2,
    @required this.order2,
    @required this.entry2,
    @required this.label3,
    @required this.sortCol3,
    @required this.order3,
    @required this.entry3,
    @required this.listLength,
    @required this.selectEntry,
  });

  final Widget label1;
  final Function sortCol1;
  final Widget order1;
  final Function entry1;
  final Widget label2;
  final Function sortCol2;
  final Widget order2;
  final Function entry2;
  final Widget label3;
  final Function sortCol3;
  final Widget order3;
  final Function entry3;
  final int listLength;
  final Function selectEntry;

  @override
  Widget build(BuildContext context) {
    final _padding = EdgeInsets.fromLTRB(0, 0, 0, 0);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width * .35,
              child: FlatButton(
                onPressed: () => sortCol1(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [label1, order1],
                ),
              ),
            ),
            Container(
              width: Get.width * .3,
              child: FlatButton(
                onPressed: () => sortCol2(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [label2, order2],
                ),
              ),
            ),
            Container(
              width: Get.width * .25,
              child: FlatButton(
                onPressed: () => sortCol3(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [label3, order3],
                ),
              ),
            ),
          ],
        ),
        Divider(thickness: 3.0),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: listLength,
            separatorBuilder: (context, index) => Divider(
              thickness: 1.0,
              color: Get.theme.colorScheme.onPrimary,
            ),
            itemBuilder: (context, index) => FlatButton(
              onPressed: () => selectEntry(index),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: _padding,
                    width: Get.width * .35,
                    child: Text(entry1(index),
                        style: Get.theme.textTheme.headline6),
                  ),
                  Container(
                    padding: _padding,
                    width: Get.width * .3,
                    child: Text(
                      entry2(index),
                      style: Get.theme.textTheme.headline6,
                    ),
                  ),
                  Container(
                    padding: _padding,
                    width: Get.width * .25,
                    child: Text(
                      entry3(index),
                      overflow: TextOverflow.ellipsis,
                      style: Get.theme.textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
