import 'package:allergie/screens/home/bloc/BottomNavBarBloc.dart';
import 'package:allergie/screens/home/widgets/calendarWidget.dart';
import 'package:allergie/screens/home/widgets/symtomWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  void dispose() {
    _bottomNavBarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(DateTime.now().toString().split(" ")[0], style: TextStyle(color: Colors.black)),
      ),
      body: _bodyItems(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bodyItems() {
    return StreamBuilder<NavBarItem>(
      stream: _bottomNavBarBloc.itemStream,
      initialData: _bottomNavBarBloc.defaultItem,
      builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
        switch (snapshot.data) {
          case NavBarItem.SYMPTOM:
            return SymptomWidget();
          case NavBarItem.CALENDAR:
            return CalendarWidget();
          default:
            return Container();
        }
      },
    );
  }

  Widget _bottomNavBar() {
    return StreamBuilder(
      stream: _bottomNavBarBloc.itemStream,
      initialData: _bottomNavBarBloc.defaultItem,
      builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
        return BottomNavigationBar(
          fixedColor: Colors.blueAccent,
          currentIndex: snapshot.data.index,
          onTap: _bottomNavBarBloc.pickItem,
          items: [
            BottomNavigationBarItem(
              label: 'Symptomes',
              icon: Icon(Icons.medical_services_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Calendrier',
              icon: Icon(Icons.calendar_today_outlined),
            ),
          ],
        );
      },
    );
  }
}
