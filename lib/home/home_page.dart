import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_components/bean/item_model.dart';
import 'package:flutter_components/common/utils.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ItemModel> _title = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    _handleTag();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFEDEDED),
        title: Text(
          'Flutter demo',
          style: TextStyle(color: Color(0xFF171717)),
        ),
      ),
      body: Container(
          child: AzListView(
        data: _title,
        itemCount: _title.length,
        itemBuilder: (BuildContext context, int index) {
          ItemModel itemModel = _title[index];
          return Utils.getItemWidget(context, itemModel, () {
            Navigator.pushNamed(context, "/${itemModel.name}", arguments: {
              "title": itemModel.name
            });
          });
        },
        physics: BouncingScrollPhysics(),
        susItemBuilder: (BuildContext context, int index) {
          ItemModel itemModel = _title[index];
          if ('↑' == itemModel.getSuspensionTag()) {
            return Container();
          }
          return Utils.getSusItem(context, itemModel.getSuspensionTag());
        },
        indexBarData: [...kIndexBarData],
        indexBarOptions: IndexBarOptions(
          needRebuild: true,
          ignoreDragCancel: true,
          downTextStyle: TextStyle(fontSize: 12, color: Colors.white),
          downItemDecoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          indexHintWidth: 120 / 2,
          indexHintHeight: 100 / 2,
          indexHintDecoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ic_index_bar_bubble_gray.png'),
              fit: BoxFit.contain,
            ),
          ),
          indexHintAlignment: Alignment.centerRight,
          indexHintChildAlignment: Alignment(-0.25, 0.0),
          indexHintOffset: Offset(-20, 0),
        ),
      )),
    );
  }

  void _loadData() {
    rootBundle.loadString('assets/data/item_models.json').then((value) {
      List list = json.decode(value);
      list.forEach((element) {
        _title.add(ItemModel.fromJson(element));
      });
      _handleTag();
    });
  }

  void _handleTag() {
    for (int i = 0, length = _title.length; i < length; i++) {
      String tag = _title[i].name.substring(0, 1);
      if (RegExp("[A-Z]").hasMatch(tag)) {
        _title[i].tagIndex = tag;
      } else {
        _title[i].tagIndex = "#";
      }
    }
    SuspensionUtil.sortListBySuspensionTag(_title);
    SuspensionUtil.setShowSuspensionStatus(_title);
    setState(() {});
  }
}
