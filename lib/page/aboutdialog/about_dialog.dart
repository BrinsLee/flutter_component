import 'package:flutter/material.dart';

class AboutDialogPage extends StatefulWidget {
  final arguments;
  const AboutDialogPage({Key key, this.arguments}) : super(key: key);

  @override
  _AboutDialogState createState() => _AboutDialogState();
}

class _AboutDialogState extends State<AboutDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments['title']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '弹窗',
            ),
            GestureDetector(
              child: Text(
                '点击',
                style: Theme.of(context).textTheme.headline4,
              ),
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationIcon: FlutterLogo(),
                    applicationName: "应用程序",
                    applicationVersion: '1.0.0',
                    applicationLegalese: 'copyright xxx',
                    children: [
                      Container(
                        height: 30,
                        color: Colors.red,
                      )
                    ]);
              },
            )
          ],
        ),
      ),
    );
  }
}
