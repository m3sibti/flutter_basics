class Post {
  int userId;
  int postId;
  String title;
  String body;

  Post(this.userId, this.postId, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> m) {
    return Post(m['userId'], m['id'], m['title'], m['body']);
  }
}
