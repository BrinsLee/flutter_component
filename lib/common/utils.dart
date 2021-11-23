import 'package:flutter/material.dart';
import 'package:flutter_components/bean/item_model.dart';

class Utils {
  static Widget getItemWidget(
      BuildContext context, ItemModel model, void Function() onTap,
      {double height = 40}) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.0),
            image:
                DecorationImage(image: AssetImage("assets/images/ic_favorite.png"))),
        child: null,
      ),
      title: Text(model.name),
      onTap: onTap,
    );
  }

  static Widget getSusItem(BuildContext context, String tag,
      {double susHeight = 40}) {
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        tag,
        softWrap: false,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
