import 'mydrawer.dart';

import 'item.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ItemDetails extends StatelessWidget{
  final Item item;
  final bool isInTabletLayout;
  ItemDetails({
    @required this.item,
    @required this.isInTabletLayout,
  });

  @override
  Widget build(BuildContext context){
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item?.title ?? 'No item selected!',
          style: textTheme.headline,
        ),
        Text(
          item?.subtitle ?? 'Please select one on the left.',
          style: textTheme.subhead,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      drawer: MyDrawer(),
      body: Center(child: content,),
    );
  }
}