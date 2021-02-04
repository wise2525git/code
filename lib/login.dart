import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class LoginPage extends StatelessWidget {

  TextEditingController _userController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _errorController = new TextEditingController();
  _printLatestValue() {
    print("Second text field: ${_errorController.text}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('登入'),
        backgroundColor:Color.fromRGBO(166,142,118,0.7),
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.3), //加上一層透明0.3的白
                BlendMode.dstATop //混合模式，放到上面去
            ),
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            SizedBox(
              height: 52.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: TextFormField(
                controller:_userController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color:Color.fromRGBO(112,89,72,1),
                  ),
                  labelText: "Name*",
                  hintText: "請輸入名稱",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color:Color.fromRGBO(112,89,72,1),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color:Color.fromRGBO(112,89,72,1),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: TextFormField(
                controller:_passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color:Color.fromRGBO(112,89,72,1),
                  ),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color:Color.fromRGBO(112,89,72,1),
                  ),
                  labelText: "Password *",
                  hintText: "請輸入密碼",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color:Color.fromRGBO(112,89,72,1),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color:Color.fromRGBO(112,89,72,1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 52.0,
              child:TextField(
                enabled: false,
                controller:_errorController,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                  contentPadding: EdgeInsets.all(30.0),
                    ),
                style: TextStyle(
                  fontSize: 18,
                  color:Color.fromRGBO(112,89,72,1),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 48.0,
              height: 48.0,
              child: RaisedButton(
                child: Text(
                  "登入",
                  style: new TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                color:Color.fromRGBO(166,142,118,1),
                onPressed:(){
                  String userid = "大毛";
                  Logincheck(context,userid);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void Logincheck(context,userid){
    String username='';
    username=_userController.text;
    String password='';
    password=_passwordController.text;
    if(username != '' && password != '') {
      if(username == '123456' && password =='123456'){
        _errorController.text='';
        Navigator.pushNamed(context, '/home',arguments:userid);
      }else{
        _errorController.text="資料不正確!";
        _printLatestValue();
      }
    }else {
      _errorController.text="請輸入資料!";
      _printLatestValue();
    }
  }

}
class HomePage extends StatelessWidget {
  String userid;
  
  @override
  Widget build(BuildContext context) {
    userid = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: 2,
    child: Scaffold(
      appBar:AppBar(
        title:Text('$userid 你好'),
        backgroundColor:Color.fromRGBO(166,142,118,0.7),
        bottom:TabBar(
          indicatorColor:Colors.white,
          indicatorSize:TabBarIndicatorSize.label,
          unselectedLabelStyle: TextStyle(
            fontSize: 15,
          ),
          
          tabs:<Widget>[
            Tab(text:'首頁',),
            Tab(icon:Icon(Icons.add_alert_sharp,color:Colors.yellow[200]))
          ]
      ),
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.1), //加上一層透明0.3的白
                BlendMode.dstATop //混合模式，放到上面去
            ),
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      child:TabBarView(
        
        children: <Widget>[
            ListView(
              padding:const EdgeInsets.all(8),
              children: [
                CheckboxGroup(
                  activeColor:Color.fromRGBO(112,89,72,1),
                  labels:<String>[
                    "早安",
                    "午安",
                    "晚安",
                    "凌晨安",
                  ],
                  labelStyle: TextStyle(
                    fontSize:18,
                  ),
                )
              ],
              
              

              ),
        
            
            Center(child: Text("第二頁啦"),),
          ],
        )
    ),
    )
    );
    
      // body:Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       colorFilter: ColorFilter.mode(
      //           Colors.white.withOpacity(0.3), //加上一層透明0.3的白
      //           BlendMode.dstATop //混合模式，放到上面去
      //       ),
      //       image: AssetImage("assets/images/bg.jpg"),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: Center(
      //     child: Text(
      //         '你登入成功囉 $userid',
      //         style: new TextStyle(
      //         fontSize: 20,
      //         color:Color.fromRGBO(112,89,72,1),
      //     ),
      //     )
      //   ),
      // ),
    
  }
}



