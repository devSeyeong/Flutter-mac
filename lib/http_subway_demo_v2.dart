import 'package:flutter/material.dart';
import 'page_subway_info.dart';

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