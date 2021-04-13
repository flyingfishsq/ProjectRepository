import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   child: Text("header".toUpperCase()),
          //   decoration: BoxDecoration(color: Colors.grey[300]),
          // ),
          //显示用户信息的header
          UserAccountsDrawerHeader(
            accountName: Text(
              "王宝强",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
            ),
            accountEmail: Text("wangbaoqiang@hotmail.com.cn"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608183410036&di=3a66f2ecf73ee698a5f30159ab28bae2&imgtype=0&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F9e1a71de62c4a6b73f2c6693d745b5bf.jpeg"),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                  image: NetworkImage(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608184084216&di=882af644439d22b387fdaa4a73460db6&imgtype=0&src=http%3A%2F%2Fimgwcs3.soufunimg.com%2Fnews%2F2020_12%2F16%2F0b7d785b-34e2-4b83-a858-c55a42467c04.jpg"),
                  fit: BoxFit.cover,
                  //混合效果
                  colorFilter: ColorFilter.mode(
                      Colors.blue[600]!.withOpacity(0.2), BlendMode.srcOver)),
            ),
          ),
          ListTile(
            title: Text(
              "Messages",
              textAlign: TextAlign.right,
            ),
            //如果图标显示在左边，就用leading，右边就用trailing
            leading: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              "Favorite",
              textAlign: TextAlign.right,
            ),
            leading: Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              "Settings",
              textAlign: TextAlign.right,
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
