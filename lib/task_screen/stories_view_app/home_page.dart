import 'package:demo/core/constant/screen_util.dart';
import 'package:demo/task_screen/stories_view_app/util/story_circles.dart';
import 'package:flutter/material.dart';
import 'story_page.dart';

class StoriesTutorialPage extends StatefulWidget {
  const StoriesTutorialPage({Key? key}) : super(key: key);

  @override
  _StoriesTutorialPageState createState() => _StoriesTutorialPageState();
}

class _StoriesTutorialPageState extends State<StoriesTutorialPage> {
  List<String> imagesList = [];

  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StoryPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getRandomImageUrlString();
  }

  getRandomImageUrlString() {
    String images = "";

    List.generate(10, (index) {
      images = "https://source.unsplash.com/random?count=$index";
      imagesList.add(images);
      // print("image $index $images");
    });
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text('S T O R I E S'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 108,
            child: ListView.separated(
              itemCount: imagesList.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 8.sp),
              separatorBuilder: (context, index) {
                return SizedBox(width: 10.sp);
              },
              itemBuilder: (context, index) {
                return StoryCircle(
                  function: _openStory,
                  image: imagesList[index],
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                itemCount: imagesList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 18.sp),
                separatorBuilder: (context, index) {
                  return SizedBox(height: 18.sp);
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: 350,
                    width: double.infinity,
                    child: Container(
                      color: Colors.white,
                      child: Image.network( imagesList[index],fit: BoxFit.cover,),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
