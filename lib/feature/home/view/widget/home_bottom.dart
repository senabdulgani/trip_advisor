part of '../home_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with HomeBottomMixin{
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: Icon(Icons.route), label: 'Route'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.filter_center_focus), label: 'Hub'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: 'More')
      ],
      onTap: onTabTapped,
    );
  }
}
