import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


//THIS WHOLE SITE IS FROM GITHUB, NEEDS SOME CHANGES //CJ

class LoginPage extends StatefulWidget{
  @override
  _LoginPageSate createState()=>_LoginPageSate();
}
class _LoginPageSate extends State<LoginPage>{
  String _email;
  String   _password;
 /* //google sign
  GoogleSignIn googleauth = new GoogleSignIn();*/
  final formkey=new GlobalKey<FormState>();
  checkFields(){
    final form=formkey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }



  loginUser(){
    if (checkFields()){
      FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)
          .then((user){
        print("signed in as ${user.uid}");
        Navigator.of(context).pushReplacementNamed('/userpage');
      }).catchError((e){
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        /*title: Image(image:AssetImage("Pictures/nobel2.jpg"), height: 30.0,fit: BoxFit.fitHeight,),*/

        elevation: 0.0,

        centerTitle: true,
        backgroundColor: Colors.transparent,

      ),
      body:
      ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/logo_dataviz_1.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only
                (
                  bottomLeft: Radius.circular(500.0),
                  bottomRight: Radius.circular(500.0)
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    child: new Text("LOGIN",
                      style: new TextStyle(
                          fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new OutlineButton(
                      color: Colors.transparent,
                      borderSide: const BorderSide (style: BorderStyle.none),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: new Text("SIGN UP",
                          style: new TextStyle(
                              fontSize: 25.0, color: Colors.white30))),
                  /*child: new Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      child: new Text("SIGNUP",
                          style: new TextStyle(
                              fontSize: 25.0, color: Colors.white30))),*/
                ),
              ),
            ],
          ), //login and sign in menu button
          Center(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Center(
                  child: Form(
                    key: formkey,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          _input("required email",false,"EMAIL",'Enter your Email',(value) => _email = value),
                          SizedBox(width: 20.0,height: 20.0,),
                          _input("required password",true,"PASSWORD",'Password',(value) => _password = value),
                          new Padding(padding: EdgeInsets.all(0.0),

                            child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 80.0, right: 80.0, top: 20.0),
                                          child: OutlineButton(
                                              borderSide: const BorderSide (style: BorderStyle.none),
                                              child: new Container(
                                                  alignment: Alignment.center,
                                                  height: 60.0,
                                                  decoration: new BoxDecoration(
                                                    color: Color(0xFF2E7D32),
                                                    borderRadius: new BorderRadius.circular(25.0),
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        color: Colors.indigo[300],
                                                        offset: Offset(1.0, 1.0),
                                                        blurRadius: 10.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: new Text("OK!",
                                                      style: new TextStyle(
                                                          fontSize: 30.0, color: Colors.white))),
                                              /*child: Text("OK! "),*/
                                              onPressed:loginUser
                                          ),
                                        ),
                          ),
                                        SizedBox(height: 18.0,width: 18.0,),

                                        SizedBox(height: 18.0,width: 18.0,),
                                        /*Expanded(      //GOOGLE SIGNUP
                                          flex: 1,
                                          child: OutlineButton(
                                            //child: Text("login with google"),
                                            // child: ImageIcon(AssetImage("images/google1.png"),semanticLabel: "login",),
                                              child: Image(image: AssetImage("Pictures/nobel2.jpg"), height:28.0,fit: BoxFit.fitHeight),
                                              onPressed: (){

                                                googleauth.signIn().then((result){result.authentication.then((googleuser){
                                                  FirebaseAuth.instance.signInWithCustomToken(token: googleuser.idToken).then((user){
                                                    print("Signedin user ${user.displayName}");
                                                    Navigator.of(context).pushReplacementNamed("/userpage");
                                                  }).catchError((e){
                                                    print(e);
                                                  });
                                                }).catchError((e){
                                                  print(e);
                                                });}).catchError((e){
                                                  print(e);
                                                });
                                              }),
                                        )*/

                                      ],
                                    ),
                                    SizedBox(height: 15.0),
                                    new Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: OutlineButton(
                                              borderSide: const BorderSide (style: BorderStyle.none),
                                            child: new Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                /*child: new Checkbox(value: _isChecked, onChanged: (bool value){onChanged(value);}),*/
                                                child: new Text("REMEMBER ME",
                                                    style: new TextStyle(
                                                        fontSize: 15.0, color: Colors.white))),
                                          ),
                                        ),

                                        Expanded(
                                            child: OutlineButton(
                                              borderSide: const BorderSide (style: BorderStyle.none),
                                            child: new Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                child: new Text("FORGOT PASSWORD",
                                                    style: new TextStyle(
                                                        fontSize: 15.0, color: Colors.white))),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.0),
                                  ],

                                ),

                              ),
                          ),

                        ],

                      ),
                    ),
                  )
              ),
            ),
          ),
        ],
      ) ,
    );
  }
  Widget _input(String validation,bool ,String label,String hint, save ){

    return new TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),

      ),
      obscureText: bool,
      validator: (value)=>
      value.isEmpty ? validation: null,
      onSaved: save ,

    );

  }
}