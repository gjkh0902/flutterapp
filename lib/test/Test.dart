import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//路由管理
import 'package:flutterapp/router/NamedRouter.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FirstPage'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new OutlineButton.icon(
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  label: Text("Navigator.push SecondPage"),
                  onPressed: () {
                    _navigateSecondPage(context);
                  }),
              new Text(
                'You have pushed the button this many times:',
              ),
              new OutlineButton.icon(
                  icon: Icon(Icons.send),
                  textColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  label: Text("open new route"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NewRoute();
                    }));
                  }),
            ],
          ),
        ));
  }

  /// async关键字声明该函数内部有代码需要延迟执行
  ///  使用await会把延迟运算放入到延迟运算的队列（await）中。
  void _navigateSecondPage(BuildContext context) async {
    print(Navigator);
    print('执行了_navigateSecondPage');
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SecondPage();
    }));
    print('FirstPage收到数据：$result');
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: new Center(
          child: OutlineButton.icon(
              icon: Icon(Icons.send),
              label: Text("返回数据到FirstPage"),
              onPressed: () {
                _backCurrentPage(context);
              })),
    );
  }
}

///退出当前页面，返回到上一级页面
void _backCurrentPage(BuildContext context) {
  print('执行了_backCurrentPage');

  ///只有执行了这个方法，上级页面才会收到返回的数据
  Navigator.pop(context, '我是来自SecondPage的数据');
}
