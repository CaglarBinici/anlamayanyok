import 'dart:io';

import 'package:anlamayanyok/Giris%20Ekrani/Authentication_Service.dart';
import 'package:anlamayanyok/Services/DBService.dart';
import 'package:anlamayanyok/Services/cloud_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'ProfileView.dart';
class Ayarlar extends StatefulWidget {
  @override
  _AyarlarState createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  final AuthService authx = AuthService();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _displayname = TextEditingController();
  final TextEditingController _passwordControllerx = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isPhotoUploaded = false;
  bool isPassVisibley = true;
  File _image;
  bool isPassVisiblex = true;
  bool progressDurumu= false;
  bool Controlofpass = false;
  String YeniSifre = "";
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    double _fontSizeQuery = MediaQuery.of(context).size.width;
    double _fontSizeHeight = MediaQuery.of(context).size.height;
    double textSize = MediaQuery.of(context).textScaleFactor;
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          child: Center(child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/30),
            child: Text("Ayarlar",style:
            GoogleFonts.anticSlab(fontStyle: FontStyle.normal,fontSize:_fontSizeQuery*.060, color: Color(
                0xFA1C2F40),fontWeight:
            FontWeight.bold),),
          )),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors:
            [Color(0xFA8CC6C6),Color(0xFACDFAFA)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0,0.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      body:SafeArea(
        child: Stack(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: _fontSizeHeight/30, left: _fontSizeQuery/22),
                    child: Text("Hesabı Düzenle",style: TextStyle(
                      color: Colors.black87 ,
                      fontSize: textSize*22,
                    ),),
                  ),
                  SizedBox(height:_fontSizeHeight/45 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: _fontSizeHeight * .20,
                        width: _fontSizeQuery * .30,
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            CircleAvatar(backgroundImage: AssetImage("pdfs/placeholderpp.jpg"),
                              backgroundColor: Colors.transparent,),
                            (user.photoURL != null)
                                ? CircleAvatar(
                              backgroundImage: NetworkImage(user.photoURL),
                              backgroundColor: Colors.transparent,)
                                :CircleAvatar(backgroundImage: AssetImage("pdfs/placeholderpp.jpg"),
                              backgroundColor: Colors.transparent,)
                            ,isPhotoUploaded ?
                            Center(
                              child: CircularProgressIndicator(),
                            ): Container(),
                            Positioned(
                              right: 4,
                              bottom: 2,
                              child: GestureDetector(
                                onTap: () {
                                  uploadImage();
                                },
                                child: Container(
                                  height: _fontSizeHeight * .06,
                                  width: _fontSizeQuery * .10,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.orangeAccent),
                                  child: TextButton(
                                    onPressed: ()  =>
                                        uploadImage(),
                                    child: Icon(
                                      Icons.edit,
                                      color: Color(0xFF47474E),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Center(
                    child: Text(user.displayName,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: textSize * 19,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _fontSizeHeight / 100,
                  ),
                  Center(
                    child: Text(user.email,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: textSize * 13,
                      ),
                    ),
                  ),
                  Center(
                    child:  Padding(
                      padding: EdgeInsets.all(11.0),
                      child: TextFormField(
                        controller: _displayname,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "Ad Soyad",
                        ),
                        onChanged: (text){
                          String randomtext = _displayname.text;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(11.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: isPassVisibley,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: isPassVisibley
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () =>
                                setState(() =>
                                isPassVisibley = !isPassVisibley),
                          ),
                          icon: Icon(Icons.lock_outline_rounded),
                          hintText: "Yeni şifre"
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(11.0),
                    child: TextFormField(
                      controller: _passwordControllerx,
                      obscureText: isPassVisiblex,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: isPassVisiblex
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () =>
                                setState(() =>
                                isPassVisiblex = !isPassVisiblex),
                          ),
                          icon: Icon(Icons.lock_outline_rounded),
                          hintText: "Yeni şifreyi tekrar giriniz"
                      ),
                    ),
                  ),
                  SizedBox(height: _fontSizeHeight/25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: _fontSizeHeight/18,
                          width: _fontSizeQuery/2.75,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                            color:Color(0xFAB9B9BB),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Center( child: Text("İptal",style: TextStyle(
                            color: Colors.black87,
                            fontSize: textSize*15,
                          ),)
                          ),
                        ),
                      ),
                      SizedBox(width: _fontSizeQuery/15,),
                      GestureDetector(
                        onTap: () async{
                          FirebaseAuth auth = await FirebaseAuth.instance;
                          String uid = auth.currentUser.uid.toString();
                          setState(() {
                            setState(() {
                              progressDurumu =true;
                            });
                            try{
                              if(_passwordController.text.length>=3 && _passwordControllerx.text.length>=3){
                                if(_passwordController.text == _passwordControllerx.text){
                                  user.updatePassword(_passwordControllerx.text);
                                }
                                setState(() {
                                  progressDurumu =false;
                                });
                              }
                              if(_displayname.text.length>=3){
                                 user.updateProfile(displayName: _displayname.text,);
                                  DBService.instance.NameUpload(uid, _displayname.text);
                                setState(() {
                                 progressDurumu=false;
                                });
                              }
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                return AlertDialog(
                                  title: Center(child: Text("Güncellendi",style: TextStyle(
                                    color: Colors.green,
                                    fontSize: textSize*22,
                                    fontWeight: FontWeight.w500,
                                  ),)),
                                  actions: [
                                    Column(
                                      children: [
                                        Center(
                                          child: Text("Hesap bilgileriniz güncellendi", style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: textSize*18,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                        ),
                                        SizedBox(height: 20,),
                                        Center(
                                          child: Container(
                                            height:1,
                                            width: _fontSizeQuery/1.5,
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
                                           setState(() {
                                             Navigator.pop(context);
                                           });
                                           setState(() {

                                           });
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
                            }catch(e){
                            }
                            setState(() {
                              progressDurumu =false;
                            });
                          });
                        },
                        child: Container(
                          height: _fontSizeHeight/18,
                          width: _fontSizeQuery/2.75,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                            color:Color(0xFA08101C),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Center( child:
                          progressDurumu ?
                          CircularProgressIndicator(strokeWidth: 2,):
                          Text("Kaydet",style: TextStyle(
                            color: Colors.white,
                            fontSize: textSize*15,
                          ),)
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  uploadImage() async {
    final snackBar = SnackBar(
      content: Text('Profil güncellendi!'),
      action: SnackBarAction(
        label: 'Sayfayı yenile', textColor: Colors.white,
        onPressed: () {
          setState(() {

          });
        },
      ),
      backgroundColor: Colors.green,
    );
    setState(() async {
      final _storage = FirebaseStorage.instance;
      final _picker = ImagePicker();
      PickedFile image;
      final user = FirebaseAuth.instance.currentUser;

      //Check Permissions
      await Permission.photos.request();

      var permissionStatus = await Permission.photos.status;

      if (permissionStatus.isGranted){
        //Select Image
        image = await _picker.getImage(source: ImageSource.gallery,
        imageQuality: 20);
        setState(() {
          isPhotoUploaded = true;
        });
        var file = File(image.path);

        if (image != null){
          //Upload to Firebase
          var snapshot = await _storage.ref()
              .child("ProfilFoto/"+user.email+"/"+user.uid)
              .putFile(file);

          var downloadUrl = await snapshot.ref.getDownloadURL();
          FirebaseAuth auth = await FirebaseAuth.instance;
          String uid = auth.currentUser.uid.toString();
          setState(() async {
            imageUrl = downloadUrl;
            user.updateProfile(photoURL: imageUrl);
            await DBService.instance.ImageUploadProfile(uid, imageUrl);
            setState(() {
              isPhotoUploaded = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        } else {
          print('No Path Received');
        }
      } else {
        print('Grant Permissions and try again');
      }
    });
    setState(() {
    });
  }
  void _push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
