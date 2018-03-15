import 'package:flutter/material.dart';
import 'package:app_conference/pages/schedule_page.dart';
import 'package:app_conference/pages/speakers_page.dart';
import 'package:app_conference/pages/sponsers_page.dart';
import 'package:app_conference/ui/drawer.dart';


class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> {

  int currentTab = 0; 
  SchedulePage schedulePage = new SchedulePage(); 
  SpeakersPage speakersPage = new SpeakersPage(); 
  SponsersPage sponsersPage = new SponsersPage(); 
  List<Widget> pages; 
  Widget currentPage; 


  @override
  void initState() {
    super.initState();
    pages = [schedulePage, speakersPage, sponsersPage]; 
    currentPage = schedulePage; 
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar navBar = new BottomNavigationBar(
      currentIndex: currentTab, 
      type: BottomNavigationBarType.shifting,
      onTap: (int numTab) { 
        setState(() { 
          print("Current tab: " + numTab.toString()); 
          currentTab = numTab; 
          currentPage = pages[numTab]; 
        });
      },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem( 
          backgroundColor: new Color.fromRGBO(255, 22, 65, 10.0),
          icon: new Icon(Icons.event_available),
          title: new Text("Schedule")
        ),
        new BottomNavigationBarItem( 
          backgroundColor: new Color.fromRGBO(255, 22, 65, 10.0),
          icon: new Icon(Icons.group),
          title: new Text("Speakers")
        ),
        new BottomNavigationBarItem( 
          backgroundColor: new Color.fromRGBO(255, 22, 65, 10.0),
          icon: new Icon(Icons.monetization_on),
          title: new Text("Sponsers")
        )
      ],
    );


    return new Scaffold(
      bottomNavigationBar: navBar, 
      body: currentPage, 
    );
  }
}