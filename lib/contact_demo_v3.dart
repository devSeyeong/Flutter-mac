import 'package:contacts_service/contacts_service.dart';
import 'package:first_flutter_app/contacts_demo_v1.dart';
import 'package:flutter/material.dart';
import 'page_contact_detail.dart';

void main()=> runApp(ContactsDemoV3());

class ContactsDemoV3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactListPage(),
      onGenerateRoute: (RouteSettings settings) {
        if(ContactDetailPage.routeName == settings.name){
          Object? c = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => ContactDetailPage(c as Contact)
          );
        }
        return _noWay;
      },
    );
  }
  final MaterialPageRoute _noWay = MaterialPageRoute(builder: (_)=>Scaffold(body: Center(
    child: Text('경로가 없습니다.'),
  )));
}