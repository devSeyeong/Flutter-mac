import 'package:first_flutter_app/http_subway_demo_v1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String _urlPrefix = 'http://swopenapi.seoul.go.kr/api/subway/';
const String _userKey = 'sample';
const String _urlSuffix = '/json/realtimeStationArrival/0/5/';
const String _defaultStation = '광화문';

const int STATUS_OK = 200;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class SubwayArrival {
  final int _rowNum;
  final String _subwayId;
  final String _trainLineNm;
  final String _arvlMsg2;

  SubwayArrival(this._rowNum, this._subwayId, this._trainLineNm,
       this._arvlMsg2);

  int get rowNum => _rowNum;

  String get subwayId => _subwayId;

  String get trainLineNm => _trainLineNm;

  String get arvlMsg2 => _arvlMsg2;
}

  class MainPageState extends State<MainPage> {
  late int _rowNum = 1;
  late String _subwayId = '';
  late String _trainLineNm = '';
  late String _arvlMsg2= '';

  String _buildUrl(String station){
    StringBuffer sb = StringBuffer();
    sb.write(_urlPrefix);
    sb.write(_userKey);
    sb.write(_urlSuffix);
    sb.write(station);
    return sb.toString();
  }

  _httpGet(String url) async {
    var response = await http.get(Uri.parse(_buildUrl(_defaultStation)));
    String responseBody = response.body;
    print('res >> $responseBody');

    var json = jsonDecode(responseBody);
    Map<String, dynamic> errorMessage = json['errorMessage'];

    if(errorMessage['status'] != STATUS_OK) {
      setState(() {
        final String errmessage = errorMessage['message'];
        _rowNum = -1;
        _subwayId = '';
        _trainLineNm = '';
        _arvlMsg2 = errmessage;
      });
      return;
    }

    List<dynamic> realtimeArrivalList = json['realtimeArrivalList'];
    final int cnt = realtimeArrivalList.length;

    List<SubwayArrival> list = List.generate(cnt,
            (int i)  {
      Map<String, dynamic> item = realtimeArrivalList[i];
      return SubwayArrival(
        item['rowNum'],
        item['subwayId'],
        item['trainLineNm'],
        item['arvlMsg2'],
    );
    });

    SubwayArrival first = list[0];

    setState(() {
      _rowNum = first.rowNum;
      _subwayId = first.subwayId;
      _trainLineNm = first.trainLineNm;
      _arvlMsg2 = first._arvlMsg2;
    });
  }

  @override
    void initState() {
    super.initState();
    _httpGet(_buildUrl(_defaultStation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지하철 실시간 정보'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          children: <Widget>[
            Text('rowNum: $_rowNum'),
            Text('subwayId: $_subwayId'),
            Text('trainLineNm : $_trainLineNm'),
            Text('arvlMsg2: $_arvlMsg2'),
          ],
        )
      )
    );
  }
}

