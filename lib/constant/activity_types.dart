import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ActivityTypes { request, reply, mention, repost, like, follow }

List<String> activityTabList = ["all", "request", "reply", "mention", "repost", "like", "follow"];

List<Color> activityTypeColors = [
  const Color(0xffFFE400),
  const Color(0xff5DC0F9),
  const Color(0xff5EC389),
  const Color(0xffC32ABF),
  const Color(0xffEA347B),
  const Color(0xff673FE5),
];

List<IconData> activityTypeIcon = [
  FontAwesomeIcons.solidHand,
  FontAwesomeIcons.share,
  FontAwesomeIcons.threads,
  FontAwesomeIcons.arrowsRotate,
  FontAwesomeIcons.solidHeart,
  FontAwesomeIcons.solidUser,
];
