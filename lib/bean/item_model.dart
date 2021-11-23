import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/cupertino.dart';

class ItemModel extends ISuspensionBean {
  String name;
  String tagIndex;

  ItemModel({@required this.name, this.tagIndex});

  ItemModel.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'tagIndex': tagIndex,
      };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() {
    return json.encode(this);
  }
}
