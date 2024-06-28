import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        // shadowColor: Colors.transparent,
        // elevation: 0,
        // scrolledUnderElevation: 0,
        // surfaceTintColor: null,
        title: const Row(
          children: [
            Text(
              "Search",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          border: InputBorder.none,
                          hintText: "Search",
                          prefixIconConstraints: BoxConstraints(maxWidth: 50),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 12,
                              right: 8,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: Stack(
                  children: [
                    ListView.separated(
                      itemBuilder: (context, index) {
                        final faker = Faker();
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 26,
                            foregroundImage: NetworkImage(
                                "https://picsum.photos/id/${100 + (index * 2)}/300/300"),
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
                          trailing: Container(
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Theme.of(context).primaryColor.withOpacity(.5),
                                width: .5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Follow",
                              style: TextStyle(
                                letterSpacing: -.8,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 1,
                          color: Theme.of(context).secondaryHeaderColor.withOpacity(.5),
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
      ),
    );
  }
}
