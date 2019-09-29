import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties for data
      String datetime = data['datetime'];
      String offsetH = data['utc_offset'].substring(1, 3);
      String offsetM = data['utc_offset'].substring(4, 6);
      // print(offsetH);
      // print(offsetM);

      //add offset to utc
      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(offsetH), minutes: int.parse(offsetM)));

      // set time property to string
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = 'Error';
    }
  }
}
