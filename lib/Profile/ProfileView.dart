import 'dart:io';
import 'package:anlamayanyok/Giris%20Ekrani/Authentication_Service.dart';
import 'package:anlamayanyok/Profile/Ayarlar.dart';
import 'package:anlamayanyok/Services/DBService.dart';
import 'package:anlamayanyok/Services/cloud_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';

class ProfileView extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User> get authStateChanges => _auth.authStateChanges();
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File _image;
  final AuthService authx = AuthService();
  bool isPhotoUploaded = false;
  String imageUrl;
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    DBService.instance.updateUserLastSeenTime(user.uid);
  }
  @override
  Widget build(BuildContext context) {
    double _fontSizeQuery = MediaQuery.of(context).size.width;
    double _fontSizeHeight = MediaQuery.of(context).size.height;
    double textSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: _fontSizeHeight / 35, bottom: _fontSizeHeight / 230),
                      child: Text(
                        "Hesabım",
                        style: GoogleFonts.cinzel(
                            fontStyle: FontStyle.normal,
                            fontSize: textSize * 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _fontSizeHeight * .23,
                      width: _fontSizeQuery * .35,
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

                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: _fontSizeHeight / 75),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(user.displayName,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: textSize * 19,
                        ),
                      ),
                      SizedBox(
                        height: _fontSizeHeight / 100,
                      ),
                      Text(user.email,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: textSize * 13,
                        ),
                      ),
                      SizedBox(
                        height: _fontSizeHeight / 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          share(context);
                        },
                        child: Container(
                          height: _fontSizeHeight / 11,
                          width: _fontSizeQuery / 1.20,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFAE0E2E2),
                                Color(0xFADDDEDE),
                                Color(0xFACBCDCD),
                                Color(0xFAC7C9C9),
                              ],
                              stops: [0.1, 0.4, 0.7, 0.9],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                          ),
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: _fontSizeQuery / 22),
                                child: Icon(Icons.share_sharp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: _fontSizeQuery / 18),
                                child: Text(
                                  "Arkadaşlarınla Paylaş",
                                  style: TextStyle(
                                    color: Color(0xFA012323),
                                    fontSize: textSize * 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ),
                      ),
                      SizedBox(
                        height: _fontSizeHeight / 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          _push(context, Ayarlar());
                        },
                        child: Container(
                          height: _fontSizeHeight / 11,
                          width: _fontSizeQuery / 1.20,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFAE0E2E2),
                                Color(0xFADDDEDE),
                                Color(0xFACBCDCD),
                                Color(0xFAC7C9C9),
                              ],
                              stops: [0.1, 0.4, 0.7, 0.9],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                          ),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: _fontSizeQuery / 22),
                                  child: Icon(Icons.settings),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: _fontSizeQuery / 18),
                                  child: Text(
                                    "Ayarlar",
                                    style: TextStyle(
                                      color: Color(0xFA012323),
                                      fontSize: textSize * 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _fontSizeHeight / 40,
                      ),
                      GestureDetector(
                        onTap: (){
                          _sendEmail();
                        },
                        child: Container(
                          height: _fontSizeHeight / 11,
                          width: _fontSizeQuery / 1.20,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFAE0E2E2),
                                Color(0xFADDDEDE),
                                Color(0xFACBCDCD),
                                Color(0xFAC7C9C9),
                              ],
                              stops: [0.1, 0.4, 0.7, 0.9],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                          ),
                         child: Container(
                           child: Row(
                             children: <Widget>[
                               Padding(
                                 padding: EdgeInsets.only(left: _fontSizeQuery / 22),
                                 child: Icon(Icons.contact_support_sharp),
                               ),
                               Padding(
                                 padding: EdgeInsets.only(left: _fontSizeQuery / 17),
                                 child: Text(
                                   "Yardım ve Destek",
                                   style: TextStyle(
                                     fontSize: textSize * 16,
                                     color: Color(0xFA012323),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                        ),
                      ),
                      SizedBox(
                        height: _fontSizeHeight / 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(
                                      child: Text(
                                    "Çıkış yap",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: _fontSizeQuery * .050,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                                  actions: [
                                    Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            "Çıkış yapmak istiyor musun?",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: _fontSizeQuery * .040,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: Container(
                                            height: 1,
                                            width: 265,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              child: Text(
                                                "Hayır",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: _fontSizeQuery * .047,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            SizedBox(
                                              width: _fontSizeQuery / 5.5,
                                            ),
                                            TextButton(
                                              child: Text(
                                                "Evet",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: _fontSizeQuery * .047,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              onPressed: () async {
                                                setState(() async {
                                                  try{
                                                    await authx.signOut();
                                                    Navigator.pop(context);
                                                  }catch(e){
                                                    print("error occured");
                                                  }
                                                });
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                );
                              });
                        },
                        child: Container(
                          height: _fontSizeHeight / 11,
                          width: _fontSizeQuery / 1.20,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFAE0E2E2),
                                Color(0xFADDDEDE),
                                Color(0xFACBCDCD),
                                Color(0xFAC7C9C9),
                              ],
                              stops: [0.1, 0.4, 0.7, 0.9],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: _fontSizeQuery / 22),
                                child: Icon(Icons.logout),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: _fontSizeQuery / 18),
                                child: Text(
                                  "Çıkış Yap",
                                  style: TextStyle(
                                    color: Color(0xFA012323),
                                    fontSize: textSize * 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  uploadImage() async {
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
      image = await _picker.getImage(source: ImageSource.gallery);
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

        setState(() async {
          imageUrl = downloadUrl;
         user.updateProfile(photoURL: imageUrl);
          isPhotoUploaded = false;
        });
        FirebaseAuth auth = await FirebaseAuth.instance;
        String uid = auth.currentUser.uid.toString();
        var _result = await CloudStorageService.instance.uploadUserImage(uid, _image);
        var _imageURL = await _result.ref.getDownloadURL();
        await DBService.instance.ImageUploadProfile(uid, _imageURL);
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  });
  }
  void share(BuildContext context) {
    final String text = " Anlamayan Yok artık Google Play Store'de! "
        "https://play.google.com/store/apps/details?id=com.anlamayanyok";
    Share.share(text);
  }

  void _push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
  _sendEmail() async{
    final snackBar = SnackBar(
      content: Text('Bir hata oluştu!'),
      action: SnackBarAction(
        label: 'Tekrar dene', textColor: Colors.white,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
      backgroundColor: Colors.red,
    );
    try{
      final Email email = Email(
        body: 'Anlamayan Yok Destek ekibi',
        subject: 'Yardım ve Destek',
        recipients: ['anlamayanyok@gmail.com'],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }
}
