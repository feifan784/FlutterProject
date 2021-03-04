import 'package:flutter/material.dart';
import '../model/Post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
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

  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
//      padding: EdgeInsets.all(8),
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
//        padding: EdgeInsets.all(10),
        itemCount: posts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8, mainAxisSpacing: 8, crossAxisCount: 3),
        itemBuilder: _itemBuilder);
  }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(
        length,
        (index) => Container(
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: Text(
                'item  $index',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
//      scrollDirection: Axis.horizontal,
      maxCrossAxisExtent: 150,
      children: _buildTiles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
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

  List<Widget> _buildTiles(int length) {
    return List.generate(
        length,
        (index) => Container(
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: Text(
                'item  $index',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
//      scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
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

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  posts[index].author,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                Text(posts[index].title,
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: posts.length, itemBuilder: _pageItemBuilder);
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true,
//    reverse: true,
//      scrollDirection: Axis.vertical,
      onPageChanged: (currentPage) => {debugPrint('$currentPage')},
      controller:
          PageController(initialPage: 1, keepPage: true, viewportFraction: 0.8),
      children: [
        Container(
          color: Colors.deepPurpleAccent,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'ONE',
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'TWO',
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.grey,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'THREE',
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        )
      ],
    );
  }
}
