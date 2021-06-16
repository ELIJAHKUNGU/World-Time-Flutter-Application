import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  var location; //location
  var time; //time
  var flag;
  var url;
  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try{
      /*var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'todos/1'));
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);*/
      //make the request
      var respose = await http.get(Uri.https('worldtimeapi.org', '/api/timezones/$url'));
      Map Data = jsonDecode(respose.body);
      /*print(Data);print(Data);*/
      //get properties
      String datetime = Data['datetime'];
      //print(datetime);
      String offset = Data['utc_offset'].substring(1,3);
      //print(offset);
      //Create Datetime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(offset)));
      now = now.add(Duration(hours:int.parse(offset)));

      //set the time property
      time = now.toString();

    }
    catch(e){
      print('Sorry you have this error $e ');
      time = 'Sorry something happened';

    }


  }


}
