import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName:
                Text('XUFEIFAN', style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text('xufeifan@163.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://goss3.cfp.cn/creative/vcg/800/new/VCG41N1002010700.jpg'),
            ),
            decoration: BoxDecoration(
//                color: Colors.yellow[400],
                image: DecorationImage(
                    image: NetworkImage(
                        'https://goss4.cfp.cn/creative/vcg/800/new/VCG41N832030462.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.yellow[400].withOpacity(0.6),
                        BlendMode.srcOver))),
          ),
          ListTile(
            title: Text('Message', textAlign: TextAlign.right),
            trailing: Icon(
              Icons.message,
              color: Colors.black38,
              size: 18.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favourite', textAlign: TextAlign.right),
            trailing: Icon(
              Icons.favorite,
              color: Colors.black38,
              size: 18.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right),
            trailing: Icon(
              Icons.settings,
              color: Colors.black38,
              size: 18.0,
            ),
            onTap: () =>
                {Navigator.pop(context), debugPrint('Settings is onpress')},
          )
        ],
      ),
    );
  }
}
