import 'package:admin/core/constants/colors.dart';
import 'package:admin/view/videos/widgets/video_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoCollectionScreen extends StatelessWidget {
  const VideoCollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Videos',
          style: GoogleFonts.abel(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          childAspectRatio: .6,
        ),
        itemBuilder: (context, index) {
          return const VideoGridViewItemGrid();
        },
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kGreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
