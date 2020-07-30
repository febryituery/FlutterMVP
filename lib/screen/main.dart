import 'package:flutter/material.dart';
import 'package:mvpexample/presenter/MainPresenter.dart';
import 'package:mvpexample/view/MainView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter MVP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements MainView{
  MainPresenter presenter;
  String textContoh = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter = new MainPresenter(this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$textContoh")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          presenter.getRequest("http");
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void resultGoogle(int result) {
    setState(() {
      textContoh = "Hasilnya : $result";
    });
  }

  @override
  void resultError(String errorMessage) {
    setState(() {
      textContoh = errorMessage;
    });
  }


}
