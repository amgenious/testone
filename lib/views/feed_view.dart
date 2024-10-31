import 'package:community_app/utils/contant.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../models/feed_model.dart';

class FeedsView extends StatefulWidget {
  const FeedsView({super.key});

  @override
  State<FeedsView> createState() => _FeedsViewState();
}

class _FeedsViewState extends State<FeedsView> {
  

Future<void> _handleRefresh() async {
  return await Future.delayed(const Duration(seconds: 2));
}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      height: size.height,
      child: LiquidPullToRefresh(onRefresh: _handleRefresh,
      color: Colors.amber,
      height: 200,
      animSpeedFactor: 3,
      showChildOpacityTransition: false,
        child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: feedmodel.length,
        itemBuilder: (context, index) {
          FeedModel current = feedmodel[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // User info and menu icon row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blueAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundImage: AssetImage(current.profileImg),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(current.username,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              Text(current.time,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      const Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Post Image
                Image.asset(
                  current.postImg,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                // Action icons row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                         Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    current.liked = !(current.liked ?? false);
                  });
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Icon(
                  current.liked == true ? Icons.favorite: Icons.favorite_border_sharp,
                  key: ValueKey<bool>(current.liked ?? false),
                  color: current.liked == true ? Colors.red : Colors.grey,
                  size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline, color: Colors.grey),
              const SizedBox(width: 16),
              const Icon(Icons.share, color: Colors.grey),
            ],
          ),
          const Icon(Icons.download, color: Colors.blue),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Mutual friends images
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: NetworkImage(current.mutualFriendImg1),
                          ),
                          Positioned(
                            left: 12,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundImage: NetworkImage(current.mutualFriendImg2),
                            ),
                          ),
                          const SizedBox(width: 35,)
                        ],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${current.likecount} likes',
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Caption and "more" link
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      children: [
                        TextSpan(text: current.caption),
                        const TextSpan(
                          text: ' ...',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.grey),
              ],
            ),
          );
        },
            ),
      ) 
    );
  }
}