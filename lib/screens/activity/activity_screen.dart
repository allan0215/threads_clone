import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constant/activity_types.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: activityTabList.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          forceMaterialTransparency: true,
          // shadowColor: Colors.transparent,
          // elevation: 0,
          // scrolledUnderElevation: 0,
          // surfaceTintColor: null,
          title: const Row(
            children: [
              Text(
                "Activity",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            dividerColor: Colors.white.withOpacity(0),
            indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
            labelPadding: const EdgeInsets.only(left: 14),
            tabAlignment: TabAlignment.center,
            tabs: [
              for (var tab in activityTabList)
                Tab(
                  child: Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary.withOpacity(.25),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      tab,
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
            ],
            isScrollable: true,
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Stack(
                        children: [
                          ListView.separated(
                            itemBuilder: (context, index) {
                              final faker = Faker();
                              final activityIndex = Random().nextInt(6);
                              final activityType = ActivityTypes.values[activityIndex];
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: SizedBox(
                                  width: 52,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 26,
                                        foregroundImage: NetworkImage(
                                            "https://picsum.photos/id/${100 + (index * 2)}/300/300"),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            color: activityTypeColors[activityIndex],
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Theme.of(context).secondaryHeaderColor,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: FaIcon(
                                            activityTypeIcon[activityIndex],
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                title: Text(
                                  faker.internet.userName(),
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  faker.lorem.sentence(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: activityType == ActivityTypes.follow
                                    ? Container(
                                        width: 100,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.black45,
                                            width: .5,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Following",
                                          style: TextStyle(
                                              letterSpacing: -.8,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Theme.of(context).colorScheme.secondary),
                                        ),
                                      )
                                    : null,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1,
                                color: Theme.of(context).secondaryHeaderColor.withOpacity(.25),
                                indent: 50,
                                height: 6,
                              );
                            },
                            itemCount: 14,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).primaryColor,
                                    Theme.of(context).primaryColor.withOpacity(0),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              for (int i = 0; i < activityTabList.length - 1; i++) const Placeholder()
            ],
          ),
        ),
      ),
    );
  }
}
