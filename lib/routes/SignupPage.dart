import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


//THIS WHOLE SITE IS FROM GITHUB, NEEDS SOME CHANGES //CJ

class SignupPage extends StatefulWidget{
  @override
  SignupPageSate createState() => SignupPageSate();
}
class SignupPageSate extends State<SignupPage>{
  String _email;
  String _password;
  String _password_same;
  //google sign
  GoogleSignIn googleauth = new GoogleSignIn();
  final formkey=new GlobalKey<FormState>();
  checkFields(){
    final form=formkey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }



  createUser(){
    if (checkFields()) {
      if (_password == _password_same) {
        FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email, password: _password)
            .then((user) {
          print("Registered user: ${user.uid}");
          Navigator.of(context).pushReplacementNamed('/userpage');
        }).catchError((e) {
          print(e);
        });
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.pink[300],
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
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Pictures/nobel1.jpg"),
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
                  padding: const EdgeInsets.only(right: 8.0 , left: 8.0, top: 8.0 ),
                  child: new OutlineButton(
                      color: Colors.transparent,
                      borderSide: const BorderSide (style: BorderStyle.none),
                      onPressed: () {
                        Navigator.of(context).pushNamed('login');
                      },
                      child: new Text("LOGIN",
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    child: new Text("SIGN UP",
                      style: new TextStyle(
                          fontSize: 25.0, color: Colors.white),
                    ),
                  ),
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
                          SizedBox(width: 20.0,height: 20.0,),
                          _input("required password",true,"PASSWORD",'Password',(value) => _password_same = value),
                          new Padding(padding: EdgeInsets.all(8.0),

                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
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
                                                    child: new Text("Create new account",
                                                        style: new TextStyle(
                                                            fontSize: 20.0, color: Colors.white))),
                                                /*child: Text("OK! "),*/
                                                onPressed: createUser
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(width: 5.0),
                                        InkWell(
                                          child: Text(
                                            'create new account',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.underline),
                                          ),
                                        )
                                      ],
                                    ),
                                    OutlineButton(
                                        child: Text("signup"),
                                        onPressed: (){
                                          Navigator.of(context).pushNamed('/signup');
                                        }),
                                    OutlineButton(
                                        child: Text("ui"),
                                        onPressed: (){
                                          Navigator.of(context).pushNamed('/userpage');
                                        })
                                  ],

                                ),

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