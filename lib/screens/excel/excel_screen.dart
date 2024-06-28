import 'package:flutter/material.dart';

class ExcelScreen extends StatelessWidget {
  const ExcelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Excel-like Scroll View')),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                minHeight: 50.0,
                maxHeight: 50.0,
                child: Container(color: Colors.blue, child: const Center(child: Text('Header'))),
              ),
              pinned: true,
            ),
          ];
        },
        body: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 100.0,
                color: Colors.grey[200],
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50.0,
                      alignment: Alignment.center,
                      child: Text('Row $index'),
                    );
                  },
                ),
              ),
              // Expanded or Flexible removed to fix the issue
              SizedBox(
                width: 800, // Define a fixed width for the inner scrolling area
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: List.generate(10, (index) => _buildHeaderCell(index)),
                      ),
                      Column(
                        children: List.generate(50, (rowIndex) {
                          return Row(
                            children: List.generate(10, (colIndex) {
                              return _buildCell(rowIndex, colIndex);
                            }),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(int index) {
    return Container(
      width: 100.0,
      height: 50.0,
      color: Colors.blue[100],
      alignment: Alignment.center,
      child: Text('Header $index'),
    );
  }

  Widget _buildCell(int rowIndex, int colIndex) {
    return Container(
      width: 100.0,
      height: 50.0,
      color: Colors.white,
      alignment: Alignment.center,
      child: Text('Cell $rowIndex,$colIndex'),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
