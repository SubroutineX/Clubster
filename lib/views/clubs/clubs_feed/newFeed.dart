import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/controllers/fetch_news_feed_controller.dart';
import 'package:workflow/models/story_model.dart';
import 'package:workflow/models/userInfo_storyModel.dart';
import 'package:workflow/views/clubs/clubs_upload/select_image.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/icons.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';
import 'package:workflow/views/widgets/postBuilder.dart';
import 'package:workflow/views/widgets/storyBuilder.dart';
import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Feed extends StatelessWidget {
  PermissionStatus _permissionStatus;

  final newsFeedCOntroller = Get.put(FetchNewsFeedController());

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          floating: true,
          backgroundColor: bw(),
          expandedHeight: 200,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, Nikhil!",
                              style: textStyleGilroyR(
                                16,
                                colorFontLight(),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Explore today",
                              style: textStyleGilroySB(
                                20,
                                colorFont(),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        UploadBuilder(
                          onTapCall: () async {
                            HapticFeedback.lightImpact();

                            _permissionStatus = await getPermissions();
                            if (_permissionStatus.isGranted) {
                              Get.to(
                                SelectImagePage(),
                              );
                            } else if (_permissionStatus.isDenied) {
                              Get.snackbar(
                                "Permission Denied",
                                "Cannot access images !",
                                borderColor: yellow,
                                borderWidth: .5,
                                isDismissible: true,
                                dismissDirection:
                                    SnackDismissDirection.HORIZONTAL,
                                barBlur: 50,
                                icon: Icon(
                                  FontAwesomeIcons.exclamationCircle,
                                  color: yellow,
                                ),
                              );
                            } else if (_permissionStatus.isPermanentlyDenied) {
                              Get.snackbar(
                                "Permission Denied Permanently",
                                "Please give storage permissions from your system settings",
                                borderColor: yellow,
                                borderWidth: .5,
                                isDismissible: true,
                                dismissDirection:
                                    SnackDismissDirection.HORIZONTAL,
                                barBlur: 50,
                                icon: Icon(
                                  FontAwesomeIcons.exclamationCircle,
                                  color: yellow,
                                ),
                              );
                            }
                          },
                          storyName: "Upload",
                          localUrl: "assets/images/profile.jpg",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StoryBuilder(
                          seen: false,
                          storyName: "Python",
                          localUrl: "assets/images/python.jpg",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StoryBuilder(
                          seen: false,
                          storyName: "Dance workshop",
                          localUrl: "assets/images/dance.jpg",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StoryBuilder(
                          seen: false,
                          storyName: "TATA motors",
                          localUrl: "assets/images/tata.jpg",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StoryBuilder(
                          seen: true,
                          storyName: "HTML/CSS",
                          localUrl: "assets/images/css.jpg",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StoryBuilder(
                          seen: true,
                          storyName: "Guest Lecture",
                          localUrl: "assets/images/guest.jpg",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StoryBuilder(
                          seen: true,
                          storyName: "Sing along",
                          localUrl: "assets/images/sing.jpg",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 3,
                    color: dividerColor(),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Obx(
            () => Column(
              children: [
                for (int i = newsFeedCOntroller.newsFeed.length - 1;
                    i >= 0;
                    i--)
                  PostCard(
                    postInfo: newsFeedCOntroller.newsFeed[i],
                  ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<PermissionStatus> getPermissions() async {
    PermissionStatus status = PermissionStatus.undetermined;
    if (status.isUndetermined) {
      status = await Permission.storage.request();
    }
    return status;
  }
}
//story view

class StoryScreen extends StatefulWidget {
  final List<Story> stories;

  const StoryScreen({@required this.stories});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  AnimationController _animController;
  VideoPlayerController _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            _currentIndex = 0;
            _loadStory(story: widget.stories[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.stories[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.stories.length,
              itemBuilder: (context, i) {
                final Story story = widget.stories[i];
                switch (story.media) {
                  case MediaType.image:
                    return CachedNetworkImage(
                      imageUrl: story.url,
                      fit: BoxFit.cover,
                    );
                  case MediaType.video:
                    if (_videoController != null &&
                        _videoController.value.initialized) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController.value.size.width,
                          height: _videoController.value.size.height,
                          child: VideoPlayer(_videoController),
                        ),
                      );
                    }
                }
                return const SizedBox.shrink();
              },
            ),
            Positioned(
              top: 40.0,
              left: 10.0,
              right: 10.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: widget.stories
                        .asMap()
                        .map((i, e) {
                          return MapEntry(
                            i,
                            AnimatedBar(
                              animController: _animController,
                              position: i,
                              currentIndex: _currentIndex,
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1.5,
                      vertical: 10.0,
                    ),
                    child: UserInfo(user: story.user),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          _currentIndex = 0;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else {
      if (story.media == MediaType.video) {
        if (_videoController.value.isPlaying) {
          _videoController.pause();
          _animController.stop();
        } else {
          _videoController.play();
          _animController.forward();
        }
      }
    }
  }

  void _loadStory({Story story, bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();
    switch (story.media) {
      case MediaType.image:
        _animController.duration = story.duration;
        _animController.forward();
        break;
      case MediaType.video:
        _videoController = null;
        _videoController?.dispose();
        _videoController = VideoPlayerController.network(story.url)
          ..initialize().then((_) {
            setState(() {});
            if (_videoController.value.initialized) {
              _animController.duration = _videoController.value.duration;
              _videoController.play();
              _animController.forward();
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key key,
    @required this.animController,
    @required this.position,
    @required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animController.value,
                            Colors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[300],
          backgroundImage: CachedNetworkImageProvider(
            user.profileImageUrl,
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            user.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.close,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
