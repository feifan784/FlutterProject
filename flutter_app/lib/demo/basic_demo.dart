import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.grey[100],
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://goss.cfp.cn/creative/vcg/800/version23/VCG41596286209.jpg'),
              alignment: Alignment.topCenter,
//        repeat: ImageRepeat.repeatY
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(45, 222, 78, 0.5), BlendMode.hardLight))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
//            color: Color.fromRGBO(34,100, 255, 0.8),
            child: Icon(Icons.pool, size: 32, color: Colors.white),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(16),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Color.fromRGBO(34, 100, 255, 0.8),
              border: Border.all(
                  color: Colors.red, width: 4, style: BorderStyle.solid),
//                borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(22, 233, 16, 1.0),
                    offset: Offset(0, 28.0),
                    blurRadius: 20,
                    spreadRadius: -9),
                BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 15.0),
                    blurRadius: 5,
                    spreadRadius: -3)
              ],
              shape: BoxShape.circle,
              //镜像渐变
//                gradient: RadialGradient(colors: [
//                  Color.fromRGBO(145, 45, 45, 1),
//                  Color.fromRGBO(00, 90, 09, 1)
//                ]),
              //线性渐变
              gradient: LinearGradient(colors: [
                Color.fromRGBO(145, 45, 45, 1),
                Color.fromRGBO(00, 90, 09, 1)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          Container(
//            color: Color.fromRGBO(100,100, 255, 0.8),
            child: Icon(Icons.access_time_sharp, size: 32, color: Colors.white),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            width: 90,
            height: 90,
            decoration:
                BoxDecoration(color: Color.fromRGBO(100, 100, 255, 0.8)),
          )
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'ninghao',
            style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 34,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic),
            children: [
          TextSpan(
              text: '.net',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: '.www',
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 24,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold))
        ]));
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  final String _author = '刘禹锡 ';
  final String _title = '西塞山怀古 ';

  @override
  Widget build(BuildContext context) {
    return Text(
      '《$_title》--$_author\n王濬楼船下益州，金陵王气黯然收。(王濬 一作：西晋)千寻铁锁沉江底，一片降幡出石头。人世几回伤往事，山形依旧枕寒流。今逢四海为家日，故垒萧萧芦荻秋',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}
