import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/screens/activity/activity_screen.dart';
import 'package:thread_clone/screens/excel/excel_screen.dart';
import 'package:thread_clone/screens/home_screen.dart';
import 'package:thread_clone/screens/post_screen_sheet.dart';
import 'package:thread_clone/screens/profile/profile_screen.dart';
import 'package:thread_clone/screens/search/search_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key, required this.tab});

  static const String routeName = "mainNavigation";

  final String tab;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  final List<String> _tabs = [
    "home",
    "search",
    "",
    "activity",
    "profile",
  ];

  void _onTap(int index) {
    if (index == 2) {
      _showPostBottomSheet();
    }
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showPostBottomSheet() async {
    await showModalBottomSheet(
      useSafeArea: true,
      scrollControlDisabledMaxHeightRatio: 1,
      context: context,
      builder: (context) => const PostScreenSheet(),
    );

    _selectedIndex = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0 && _selectedIndex != 2,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            NavTab(
              iconData: Icons.home_outlined,
              text: "home",
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
              selectedIcon: Icons.home_outlined,
              selectedIndex: _selectedIndex,
            ),
            NavTab(
              iconData: Icons.search,
              text: "home",
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
              selectedIcon: Icons.search,
              selectedIndex: _selectedIndex,
            ),
            NavTab(
              iconData: Icons.library_add_outlined,
              text: "home",
              isSelected: _selectedIndex == 2,
              onTap: () => _onTap(2),
              selectedIcon: Icons.library_add_outlined,
              selectedIndex: _selectedIndex,
            ),
            NavTab(
              iconData: FontAwesomeIcons.heart,
              text: "home",
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
              selectedIcon: FontAwesomeIcons.heart,
              selectedIndex: _selectedIndex,
            ),
            NavTab(
              iconData: FontAwesomeIcons.user,
              text: "home",
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
              selectedIcon: FontAwesomeIcons.user,
              selectedIndex: _selectedIndex,
            ),
          ],
        ),
      ),
      // BottomNavigationBar(
      //   onTap: (value) => _onTap(value),
      //   currentIndex: 0,
      //   type: BottomNavigationBarType.fixed,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   selectedFontSize: 14,
      //   unselectedFontSize: 14,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home_outlined,
      //           color: _selectedIndex == 0
      //               ? Theme.of(context).colorScheme.onPrimary
      //               : Theme.of(context).colorScheme.secondary.withOpacity(.5),
      //           size: 30,
      //         ),
      //         label: "home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.search,
      //           color: _selectedIndex == 1
      //               ? Theme.of(context).colorScheme.onPrimary
      //               : Theme.of(context).colorScheme.secondary.withOpacity(.5),
      //           size: 30,
      //         ),
      //         label: "search"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.library_add_outlined,
      //           color: _selectedIndex == 2
      //               ? Theme.of(context).colorScheme.onPrimary
      //               : Theme.of(context).colorScheme.secondary.withOpacity(.5),
      //           size: 30,
      //         ),
      //         label: "post"),
      //     BottomNavigationBarItem(
      //         icon: FaIcon(
      //           FontAwesomeIcons.heart,
      //           color: _selectedIndex == 3
      //               ? Theme.of(context).colorScheme.onPrimary
      //               : Theme.of(context).colorScheme.secondary.withOpacity(.5),
      //         ),
      //         label: "like"),
      //     BottomNavigationBarItem(
      //         icon: FaIcon(
      //           FontAwesomeIcons.user,
      //           color: _selectedIndex == 4
      //               ? Theme.of(context).colorScheme.onPrimary
      //               : Theme.of(context).colorScheme.secondary.withOpacity(.5),
      //         ),
      //         label: "profile"),
      //   ],
      // ),
    );
  }
}

class NavTab extends StatelessWidget {
  const NavTab(
      {super.key,
      required IconData iconData,
      required String text,
      required bool isSelected,
      required Function onTap,
      required IconData selectedIcon,
      required this.selectedIndex})
      : _iconData = iconData,
        _isSelected = isSelected,
        _onTap = onTap,
        _selectedIcon = selectedIcon;

  final IconData _iconData;
  final IconData _selectedIcon;
  final bool _isSelected;
  final Function _onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => _onTap(),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: _isSelected ? 1 : 0.6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                _isSelected ? _selectedIcon : _iconData,
                color: _isSelected
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.secondary.withOpacity(.5),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
