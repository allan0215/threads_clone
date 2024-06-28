import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/setting/privacy_screen.dart';
import 'package:thread_clone/setting/view_model/settings_vm.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  static const String routeName = "setting";
  static const String routeURL = "/setting";

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  bool _indicatorOn = false;

  void _toggleIndicator() {
    _indicatorOn = !_indicatorOn;
    setState(() {});
  }

  void _onPrivacyTap(BuildContext context) {
    context.pushNamed(PrivacyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = ref.watch(settingsProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              FaIcon(
                FontAwesomeIcons.chevronLeft,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Back",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: isDarkMode,
            onChanged: (value) => ref.read(settingsProvider.notifier).setDarkMode(value),
            title: const Text(
              "Dark Mode",
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          const ListTile(
            // minLeadingWidth: 36,
            leading: FaIcon(
              FontAwesomeIcons.user,
            ),
            title: Text("Follow and invite friends"),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bell,
            ),
            title: Text("Notifications"),
          ),
          ListTile(
            onTap: () => _onPrivacyTap(context),
            leading: const FaIcon(
              FontAwesomeIcons.lock,
            ),
            title: const Text("Privacy"),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleUser,
            ),
            title: Text("Account"),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.hand,
            ),
            title: Text("Help"),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleInfo,
            ),
            title: Text("About"),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          ListTile(
            title: GestureDetector(
              onTap: _toggleIndicator,
              child: const Text(
                "Log out",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            trailing: Opacity(
              opacity: _indicatorOn ? 1 : 0,
              child: const CircularProgressIndicator.adaptive(),
            ),
          ),
        ],
      ),
    );
  }
}
