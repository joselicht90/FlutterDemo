import 'item.dart';
import 'package:flutter/material.dart';

class ItemListing extends StatelessWidget{
  final Item selectedItem;
  final ValueChanged<Item> itemSelectedCallback;
  
  ItemListing({
    @required this.itemSelectedCallback,
    this.selectedItem
  });


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Master-detail flow sample'),
      ),
      body: ListView(
        children: items.map((item){
          return ListTile(
            title: Text(item.title),
            onTap: () => itemSelectedCallback(item),
          );
        }).toList(),
      ),
    );
  }
}