import 'package:flutter/material.dart';
import 'package:thread_clone/screens/widgets/report_bottom_sheet.dart';

class ElipsisBottomSheet extends StatelessWidget {
  const ElipsisBottomSheet({
    super.key,
  });

  void _onReportTap(BuildContext context) {
    Navigator.of(context).push(
      ModalBottomSheetRoute(
        scrollControlDisabledMaxHeightRatio: .7,
        backgroundColor: Colors.white,
        showDragHandle: true,
        useSafeArea: true,
        isScrollControlled: false,
        builder: (context) => ReportBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Unfollow",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.25,
                        color: Colors.black12,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Mute",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Hide",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.25,
                        color: Colors.black12,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onReportTap(context),
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Report",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
