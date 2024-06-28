import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/screens/widgets/elipsis_bottom_sheet.dart';

class PostWidget extends StatelessWidget {
  final bool isVerified, hasImage;
  final String title, subtitle;
  final int widgetIndex, itemCount;
  final int? imageId, fixedAvatarId;
  const PostWidget({
    super.key,
    this.imageId,
    this.fixedAvatarId,
    required this.title,
    required this.subtitle,
    required this.isVerified,
    required this.widgetIndex,
    required this.itemCount,
  }) : hasImage = imageId != null ? true : false;

  void _onTap(BuildContext context) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: .4,
      backgroundColor: Colors.white,
      useSafeArea: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return const ElipsisBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 20,
          ),
          height: hasImage ? 330 : 90,
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        foregroundImage: NetworkImage(
                            "https://picsum.photos/id/${fixedAvatarId ?? widgetIndex * 3}/350/250"),
                        radius: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          width: 0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (isVerified)
                                  const SizedBox(
                                    width: 6,
                                  ),
                                if (isVerified)
                                  const FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    size: 12,
                                    color: Colors.blue,
                                  ),
                              ],
                            ),
                            GestureDetector(
                              child: const FaIcon(FontAwesomeIcons.ellipsis),
                              onTap: () => _onTap(context),
                            ),
                          ],
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: hasImage ? 250 : 10,
                        ),
                        const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.heart),
                            SizedBox(
                              width: 20,
                            ),
                            FaIcon(FontAwesomeIcons.comment),
                            SizedBox(
                              width: 20,
                            ),
                            FaIcon(FontAwesomeIcons.shareFromSquare),
                            SizedBox(
                              width: 20,
                            ),
                            FaIcon(FontAwesomeIcons.paperPlane)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (hasImage)
                Positioned(
                  top: 60,
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 50 : 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            "https://picsum.photos/id/${(widgetIndex * 10) + index}/350/250",
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 10,
                      foregroundImage: NetworkImage("https://picsum.photos/300/300"),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 10,
                    child: CircleAvatar(
                      radius: 8,
                      foregroundImage: NetworkImage("https://picsum.photos/300/300"),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 6,
                      foregroundImage: NetworkImage("https://picsum.photos/300/300"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "36 replies · 391 likes",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            )
          ],
        )
      ],
    );
  }
}
