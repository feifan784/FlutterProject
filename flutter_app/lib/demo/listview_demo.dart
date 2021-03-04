import 'package:flutter/material.dart';
import '../model/Post.dart';

class ListViewDemo extends StatelessWidget {
  final List<Post> posts = [
    Post("百度", "王洪1",
        "http://pic.netbian.com/uploads/allimg/201228/214304-1609162984f208.jpg"),
    Post("阿里", "马云1",
        "http://pic.netbian.com/uploads/allimg/200410/213246-1586525566c099.jpg"),
    Post("百度", "王洪2",
        "http://pic.netbian.com/uploads/allimg/200714/224033-159473763328ff.jpg"),
    Post("阿里", "马云2",
        "http://pic.netbian.com/uploads/allimg/210103/232202-16096873226fa1.jpg"),
    Post("百度", "王洪3",
        "http://pic.netbian.com/uploads/allimg/210104/001409-16096904495aba.jpg"),
    Post("阿里", "马云3",
        "http://pic.netbian.com/uploads/allimg/190909/193047-15680286478a48.jpg")
  ];

  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  posts[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
          Positioned.fill(
              child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.6),
              highlightColor: Colors.white.withOpacity(0.3),
              onTap: () => {debugPrint('onTap')},
            ),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: posts.length, itemBuilder: _itemBuilder);
  }
}
