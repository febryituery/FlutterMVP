import 'package:mvpexample/model/MainModel.dart';
import 'package:mvpexample/view/MainView.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MainPresenter{
  MainModel mainModel;
  MainView view;

  MainPresenter(MainView view) {
    this.view = view;
  }

  void getRequest(String keyword) async {
    var url = 'https://www.googleapis.com/books/v1/volumes?q={$keyword}';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      MainModel model = MainModel.fromJson(convert.jsonDecode(response.body));
      view.resultGoogle(model.totalItems);
    } else {
      view.resultError("Terjadi Kesalahan");
    }
  }
}