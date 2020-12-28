import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  const FormDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //从main中的app中获取primaryColor
      // body: ThemeDemo(),

      //单独设置primaryColor替代原来的主题颜色
      // body: Theme(
      //   //单独设置primaryColor替代原来的主题颜色
      //   data: ThemeData(primaryColor: Colors.black26.withOpacity(0.5)),
      //   child: ThemeDemo(),
      // ),

      //覆盖某些特定的主题颜色的设置
      body: Theme(
        data: Theme.of(context)
            .copyWith(primaryColor: Colors.black26.withOpacity(0.5)),
        // child: ThemeDemo(),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //单个输入框属性的学习
              // TextFieldDemo(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //使用这个获取输入框里的文字
  final registerFormKey = GlobalKey<FormState>();
  String userName, password;

//与autovalidate结合使用，避免了打开界面的时候就检查合法性的问题，点击提交按钮之后启动自动检测
  void _submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();

      debugPrint("user name = $userName");
      debugPrint("password = $password");

      //等同与android原生的SnackBar
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('正在登录'),
      ));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }

    //在这里调用合法性检测
    registerFormKey.currentState.validate();
  }

//如果检验不通过，返回提示信息，否则返回null表示验证通过
  String _validateUserName(value) {
    if (value.isEmpty) {
      return '请输入用户名';
    }
    return null;
  }

  String _validatePassword(value) {
    if (value.isEmpty) {
      return '请输入密码';
    }
    return null;
  }

//与autovalidate结合使用，避免了打开界面的时候就检查合法性的问题
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: '用户名',
              // hintText: '请输入用户名',
              helperText: '',
            ),
            onSaved: (value) {
              userName = value;
            },
            //字符串验证器
            validator: _validateUserName,
            autovalidate: _autoValidate,
          ),
          TextFormField(
            //是否隐藏输入文字
            obscureText: true,
            decoration: InputDecoration(
              labelText: '密码',
              // hintText: '请输入密码',
              helperText: '',
            ),
            onSaved: (value) {
              password = value;
            },
            validator: _validatePassword,
            autovalidate: _autoValidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                "登录",
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0.5,
              onPressed: _submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}
