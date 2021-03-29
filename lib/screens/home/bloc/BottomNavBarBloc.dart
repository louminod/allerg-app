import 'dart:async';

enum NavBarItem { SYMPTOM, CALENDAR }

class BottomNavBarBloc {
  final StreamController<NavBarItem> _navBarController = StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.SYMPTOM;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.SYMPTOM);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.CALENDAR);
        break;
    }
  }

  close() {
    _navBarController?.close();
  }
}
