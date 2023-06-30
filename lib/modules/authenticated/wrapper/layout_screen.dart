import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_collection/modules/authenticated/features/home/presentation/screens/home/home_screen.dart';
import 'package:movie_collection/modules/authenticated/features/search/presentation/screens/search_screen.dart';
part 'widgets/bottom_navigation.dart';

enum BotNavMenu {
  home,
  search,
  watchList;

  const BotNavMenu();
}

@RoutePage()
class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({Key? key}) : super(key: key);

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  late BotNavMenu _selectedMenu;
  final contentScreens = [
    const HomeScreen(),
    SearchScreen(),
    const Center(child: Text('Watch list'))
  ];

  @override
  void initState() {
    super.initState();
    _selectedMenu = BotNavMenu.home;
  }

  void _onItemTapped(BotNavMenu menu) {
    setState(() {
      _selectedMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _MCBottomNavigation(
        selectedIndex: _selectedMenu.index,
        onTap: (int index) {
          _onItemTapped(BotNavMenu.values[index]);
        },
      ),
      body: SafeArea(child: contentScreens.elementAt(_selectedMenu.index)),
    );
  }
}
