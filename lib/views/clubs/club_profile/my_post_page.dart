import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:workflow/controllers/profile_controller.dart';
import 'package:workflow/models/post_model.dart';
import 'package:workflow/views/widgets/comment_widgets.dart';
import 'package:workflow/views/widgets/postBuilder.dart';

class MyPostsPage extends StatefulWidget {
  int index;

  MyPostsPage({Key key, this.index}) : super(key: key);

  @override
  _MyPostsPageState createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
  AutoScrollController autoScrollController;

  ScrollController scroll;
  Future _scrollToIndex(int index) async {
    await autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
  }

  @override
  void initState() {
    super.initState();
    autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
    _scrollToIndex(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<ProfileController>(builder: (controller) {
        return ListView.builder(
          controller: autoScrollController,
          itemCount: controller.profilePosts.length,
          itemBuilder: (context, i) {
            return AutoScrollTag(
              controller: autoScrollController,
              key: ValueKey(i),
              index: i,
              child: PostCard(
                postInfo: controller.profilePosts[i],
                index: i,
              ),
            );
          },
        );
      }),
    );
  }
}
