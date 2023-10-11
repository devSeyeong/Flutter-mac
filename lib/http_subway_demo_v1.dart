import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const SubwayDemo());

class SubwayDemo extends StatelessWidget {
  const SubwayDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '지하철 실시간 정보',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}
class MainPageState extends State<MainPage> {
  static const String _urlPrefix = 'http://swopenapi.seoul.go.kr/api/subway/';
  static const String _userKey = 'sample';
  static const String _urlSuffix = '/json/realtimeStationArrival/0/5/';
  static const String _defaultStation = '광화문';

  String _response = '';

  String _buildUrl(String station) {
    StringBuffer sb = StringBuffer();
    sb.write(_urlPrefix);
    sb.write(_userKey);
    sb.write(_urlSuffix);
    sb.write(station);
    return sb.toString();
  }

  _httpGet(String url) async {
    var response = await http.get(Uri.parse(_buildUrl(_defaultStation)));
    String res = response.body;
    print('res >> $res');
    setState(() {
      _response = res;
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
        title: const Text('지하철 실시간 정보'),
      ),
      body: Center(
        child: Text(_response),
      ),
    );
  }
}
