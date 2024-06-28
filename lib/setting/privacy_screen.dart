import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});
  static const String routeName = "privacy";
  static const String routeURL = "privacy";

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _privateProfile = false;

  void _privateProfileToggle(bool value) {
    _privateProfile = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        title: const Text(
          "Privacy",
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.lock,
                ),
                SizedBox(
                  width: 20,
                ),
                Text("Private profile"),
              ],
            ),
            activeColor: Colors.black,
            value: _privateProfile,
            onChanged: (value) => _privateProfileToggle(value),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.threads),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mentions"),
                Text(
                  "Everyone",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade400,
              size: 18,
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.bellSlash),
            title: const Text("Muted"),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade400,
              size: 18,
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.eyeSlash),
            title: const Text("Hidden Words"),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade400,
              size: 18,
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.users),
            title: const Text("Profiles you follow"),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade400,
              size: 18,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text("Other privacy settings"),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
                style: TextStyle(
                  height: 1.2,
                  color: Colors.grey,
                ),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FaIcon(
                  FontAwesomeIcons.arrowUpRightFromSquare,
                  color: Colors.grey.shade400,
                  size: 18,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.circleXmark),
            title: const Text("Blocked profiles"),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey.shade400,
              size: 18,
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.heartCrack),
            title: const Text("Muted"),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey.shade400,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
