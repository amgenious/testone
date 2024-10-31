class FeedModel{
  final int id;
  final String profileImg;
  final String username;
  final String time;
  final String postImg;
  final String caption;
  final int likecount;
  final String mutualFriendImg1;
  final String mutualFriendImg2;
  bool? liked;

  FeedModel({
    required this.id, 
    required this.profileImg, 
    required this.username,
    required this.caption,
    required this.time,
    required this.postImg,
    required this.likecount,
    required this.mutualFriendImg1,
    required this.mutualFriendImg2,
    required this.liked
    });
  

}