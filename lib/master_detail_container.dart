
import 'item_details.dart';
import 'item_listing.dart';
import 'package:flutter/material.dart';

class MasterDetailContainer extends StatefulWidget {
  @override
  _ItemMasterDetailContainerState createState() =>
      _ItemMasterDetailContainerState();
}

class _ItemMasterDetailContainerState extends State<MasterDetailContainer> {

  Widget _buildMobileLayout() {
    return ItemListing(itemSelectedCallback: (item) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return ItemDetails(isInTabletLayout: false, item: item);
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    content = _buildMobileLayout();

    return Scaffold(
      body: content,
    );
  }
}
