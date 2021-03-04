import 'package:flutter/material.dart';
import '../model/Post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
//            title: Text(
//              '列表',
//            ),
            floating: true,
//            pinned: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'ninghao  flutter'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w300),
              ),
              background: Image.network(
                'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdesk.fd.zol-img.com.cn%2Fg5%2FM00%2F02%2F0E%2FChMkJlbK5pqIcV7dAAQDU4JGja0AALKWgKa4WUABANr295.jpg&refer=http%3A%2F%2Fdesk.fd.zol-img.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1613109918&t=cc864161e492212b1c40274cd30f3379',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
              sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGridDemo(),
          ))
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
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
        "http://pic.netbian.com/uploads/allimg/190909/193047-15680286478a48.jpg"),
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

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            elevation: 14.0,
            shadowColor: Colors.blueAccent.withOpacity(0.5),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                posts[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }, childCount: posts.length),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
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
        "http://pic.netbian.com/uploads/allimg/190909/193047-15680286478a48.jpg"),
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

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        }, childCount: posts.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1 / 2));
  }
}
