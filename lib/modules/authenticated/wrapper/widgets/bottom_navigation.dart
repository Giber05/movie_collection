// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../layout_screen.dart';

class _MCBottomNavigation extends StatelessWidget {
  const _MCBottomNavigation({
    Key? key,
    required this.selectedIndex,
    this.onTap,
  }) : super(key: key);
  final int selectedIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.home_rounded,
            color: Colors.red,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.search_rounded,
            color: Colors.red,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list_rounded,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.list_rounded,
            color: Colors.red,
          ),
          label: 'Watch List',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onTap,
      backgroundColor: Colors.black,
      selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 10,
    );
  }
}
