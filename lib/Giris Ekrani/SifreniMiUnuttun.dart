import 'package:anlamayanyok/Giris%20Ekrani/Giris_Ekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SifreniMiUnuttun extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User> get authStateChanges => _auth.authStateChanges();
  @override
  _SifreniMiUnuttunState createState() => _SifreniMiUnuttunState();
}

class _SifreniMiUnuttunState extends State<SifreniMiUnuttun> {
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final snackBar = SnackBar(
    content: Text('Şifre sıfırlanırken bir hata oluştu!'),
    action: SnackBarAction(
      label: 'Tekrar dene', textColor: Colors.white,
      onPressed: () {
        // Some code to undo the change.
      },
    ),
    backgroundColor: Colors.red,
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool progressDurumu = false;
  bool emaildogrumu = false;
  @override
  Widget build(BuildContext context) {

    double _fontSizeQuery = MediaQuery.of(context).size.width;
    double _fontSizeHeight = MediaQuery.of(context).size.height;
    double textSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFACDFAFA),
                  Color(0xFAD5F8F8),
                  Color(0xFAE7FCFC),
                  Color(0xFAE8F6F6),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: _fontSizeHeight/7),
                      child: Container(
                        height:_fontSizeHeight/5,
                        width: _fontSizeQuery/2.5,
                        child: Image.asset("pdfs/icon2.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _fontSizeHeight/40,
                  ),
                  Container(
                    width: _fontSizeQuery/1.5,
                    height: _fontSizeHeight/14,
                    child: Center(
                      child: Text(
                        "Şifreni Sıfırla",
                        style: GoogleFonts.cinzel(
                          fontStyle: FontStyle.normal,
                          fontSize: textSize * 27,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _fontSizeHeight * .027,
                  ),
                  Container(
                    height: _fontSizeHeight / 10.5,
                    width: _fontSizeQuery / 1.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(11.0),
                      child: TextFormField(
                        onChanged: (text){
                          setState(() {
                            if(_emailController.text.length != 0 && _emailController.text.contains("@") && _emailController.text.contains(".")){
                              setState(() {
                                emaildogrumu = true;
                              });
                            }else{
                              setState(() {
                                emaildogrumu = false;
                              });
                            }
                          });
                        },
                        controller: _emailController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email_rounded),
                          hintText: "E-posta",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _fontSizeHeight * .047,
                  ),
                  emaildogrumu ?
                  GestureDetector(
                    onTap: () async {
                        setState(() {
                          progressDurumu = true;
                        });
                        try {
                        await _auth.sendPasswordResetEmail(email: _emailController.text);
                         print("45464");
                         setState(() {
                           progressDurumu =false;
                         });
                         await showDialog(context: context,
                             builder: (BuildContext context){
                               return AlertDialog(
                                 title: Center(child: Text("E-posta gönderildi",style: TextStyle(
                                   color: Colors.green,
                                   fontSize: textSize*19,
                                   fontWeight: FontWeight.w500,
                                 ),)),
                                 actions: [
                                   Column(
                                     children: [
                                       Center(
                                         child: Text("E-posta hesabınızı kontrol edin", style: TextStyle(
                                           color: Colors.black87,
                                           fontSize: textSize*18,
                                           fontWeight: FontWeight.w400,
                                         ),),
                                       ),
                                       SizedBox(height: 20,),
                                       Center(
                                         child: Container(
                                           height:1,
                                           width:265,
                                           color:Colors.grey,
                                         ),
                                       ),
                                       TextButton(
                                         child: Text("Tamam", style:TextStyle(
                                           color: Colors.blue,
                                           fontSize: textSize*18,
                                           fontWeight: FontWeight.w400,
                                         ) ,),
                                         onPressed: (){
                                           _push(context, Giris_Ekrani());
                                         },
                                       )
                                     ],
                                   )
                                 ],
                                 elevation: 8,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(16)
                                 ),
                               );
                             });
                        } catch (e) {
                          setState(() {
                            progressDurumu = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                    },
                    child: Container(
                      height: _fontSizeHeight / 11,
                      width: _fontSizeQuery / 1.20,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        color: Color(0xFA08101C),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                          child: progressDurumu
                              ? CircularProgressIndicator(
                            strokeWidth: 2,
                          )
                              : Text(
                            "İlerle",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textSize * 20,
                            ),
                          )),
                    ),
                  ):
                  Container(
                    height: _fontSizeHeight / 11,
                    width: _fontSizeQuery / 1.20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                        ),
                      ],
                      color: Color(0xFA525F72),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                        child: progressDurumu
                            ? CircularProgressIndicator(
                          strokeWidth: 2,
                        )
                            : Text(
                          "İlerle",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: textSize * 20,
                          ),
                        )),
                  ),
                  SizedBox(height: _fontSizeHeight/15,),
                  Container(
                    height: _fontSizeHeight/4.7,
                    width: _fontSizeQuery,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:(){
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                        Icons.arrow_back_outlined
                                    ),
                                    SizedBox(width: _fontSizeQuery/50),
                                    Text("Geri dön",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: textSize*17
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _push(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
