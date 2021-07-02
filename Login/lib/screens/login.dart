
import 'package:flutter/material.dart';
import 'package:loginpage/data/join_or_login.dart';
import 'package:loginpage/helper/login_background.dart';
import 'package:loginpage/screens/main_page.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  // 키 값으로 상태 변화에 대한 접근 가능
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 휴대폰 사이즈 가져오기
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            size: size,
            painter: LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin),

          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _logoImage,
              Stack(
                children: <Widget>[
                  _inputForm(size),
                  _authButton(size),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Consumer<JoinOrLogin>(
                builder: (context, joinOrLogin, child) =>
                    GestureDetector(
                        onTap: () {
                          // 프로바이더로 데이터를 가져오면 바로 사용 가능
                          // JoinOrLogin joinOrLogin = Provider.of<JoinOrLogin>(context, listen: false);
                          // joinOrLogin.toggle();
                          joinOrLogin.toggle();
                        },
                        child: Text(joinOrLogin.isJoin?"Already Have an Account? Sign in":"Don't Have an Account? Create One", style: TextStyle(color: joinOrLogin.isJoin?Colors.red:Colors.blue),)),
              ),
              // 텍스트 클릭 시 이벤트가 발생할 수 있도록 감싸줌

              Container(
                height: size.height * 0.05,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 6,
        child: Padding(
          padding:
          const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input correct Email.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input correct Password.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Consumer<JoinOrLogin>(
                    // opacity : 투명함 정도
                    builder: (context, value, child) => Opacity(
                        opacity: value.isJoin? 0 : 1,
                        child: Text("Forgot Password")),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: Consumer<JoinOrLogin>(
          builder: (context, value, child) => RaisedButton(
              child: Text(
                value.isJoin?"Join":"Login",
                style: TextStyle(
                    fontSize: 20, color: Colors.white),),
              color: value.isJoin?Colors.red:Colors.blue,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                // null로 설정하면 회색으로 (disable) 바뀜
                if(_formKey.currentState!.validate()) {
                  value.isJoin?_register(context):_login(context);
                }
              }),
        ),
      ),
    );
  }

  // 계정 생성하기
  void _register(BuildContext context) async {
    // final AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passController.text);
    // final FirebaseUser user = result.user;
    //
    // if(user == null) {
    //   final snackBar = SnackBar(content: Text("Please try again later."),);
    //   Scaffold.of(context).showSnackBar(snackBar);
    // }

    //네비게이터 이용하여 화면 전환
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
  }

  // 로그인 하기
  void _login(BuildContext context) async {
    // final AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: _emailController.text, password: _passController.text);
    // final FirebaseUser user = result.user;
    //
    // if(user == null) {
    //   final snackBar = SnackBar(content: Text("Please try again later."),);
    //   Scaffold.of(context).showSnackBar(snackBar);
    // }

    //네비게이터 이용하여 화면 전환
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
  }

  // 파라미터 없을 때 get 사용해서 () 지울 수 있음!
  Widget get _logoImage{
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i3.wp.com/i.gifer.com/7pv.gif")),
        ),
      ),
    );
  }
}
