import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/screens/widgets/post_widget.dart';
import 'package:thread_clone/setting/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<String> _tabs = ["Threads", "Replies"];

  void _onSettingTap(BuildContext context) {
    context.push(SettingScreen.routeURL);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  leading: const Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: FaIcon(
                          FontAwesomeIcons.globe,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () => _onSettingTap(context),
                      child: const FaIcon(
                        FontAwesomeIcons.bars,
                        size: 26,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jane",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "jane_mobbin",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              "Planet entusiast!",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "2 follwers",
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).secondaryHeaderColor.withOpacity(.75),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 30,
                          foregroundImage: NetworkImage("https://picsum.photos/id/63/300/300"),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width * (9 / 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: .5,
                              color: Theme.of(context).colorScheme.secondary.withOpacity(.5),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Edit profile",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width * (9 / 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: .5,
                              color: Theme.of(context).colorScheme.secondary.withOpacity(.5),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Share profile",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverHeader(
                    minHeight: 50,
                    maxHeight: 50,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Theme.of(context).colorScheme.onPrimary,
                      tabs: [
                        for (var tab in _tabs)
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: Text(
                              tab,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                ListView.separated(
                    padding: const EdgeInsets.only(top: 12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: PostWidget(
                          fixedAvatarId: 63,
                          itemCount: Random().nextInt(9) + 1,
                          widgetIndex: index,
                          imageId: Random().nextBool() ? (index + 1) : null,
                          title: "Jane",
                          subtitle: lorem(paragraphs: 1, words: Random().nextInt(100) + 20),
                          isVerified: Random().nextBool(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black26,
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                    itemCount: 10),
                ListView.separated(
                    padding: const EdgeInsets.only(top: 12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: PostWidget(
                          itemCount: Random().nextInt(9) + 1,
                          widgetIndex: index,
                          imageId: Random().nextBool() ? (index + 1) : null,
                          title: "Jane",
                          subtitle: lorem(paragraphs: 1, words: Random().nextInt(100) + 20),
                          isVerified: Random().nextBool(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black26,
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                    itemCount: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight, maxHeight;

  _SliverHeader({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: SizedBox.expand(child: child),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverHeader oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}


// slivers: <Widget>[
//           SliverAppBar(
//             toolbarHeight: 200,
//             title: Container(
//                 height: 300,
//                 width: 300,
//                 decoration: const BoxDecoration(
//                   color: Colors.grey,
//                 ),
//                 child: const Text("Title")),
//             pinned: false,
//             expandedHeight: 250.0,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Container(
//                   height: 200,
//                   decoration: const BoxDecoration(
//                     color: Colors.blue,
//                   ),
//                   child: const Text('flexible Space')),
//             ),
//           ),
//           SliverGrid(
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 200.0,
//               mainAxisSpacing: 10.0,
//               crossAxisSpacing: 10.0,
//               childAspectRatio: 4.0,
//             ),
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Container(
//                   alignment: Alignment.center,
//                   color: Colors.teal[100 * (index % 9)],
//                   child: Text('Grid Item $index'),
//                 );
//               },
//               childCount: 20,
//             ),
//           ),
//           SliverFixedExtentList(
//             itemExtent: 50.0,
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Container(
//                   alignment: Alignment.center,
//                   color: Colors.lightBlue[100 * (index % 9)],
//                   child: Text('List Item $index'),
//                 );
//               },
//             ),
//           ),
//         ],