import 'package:anlamayanyok/Fizik/FizikSayfa.dart';
import 'package:anlamayanyok/Geometri/GeometriSayfa.dart';
import 'package:anlamayanyok/Geometri/TYT/deltoid.dart';
import 'package:anlamayanyok/Geometri/TYT/ozel_ucgenler.dart';
import 'package:anlamayanyok/Matematik/AYT/TrigonometriMat.dart';
import 'package:anlamayanyok/Matematik/MatematikSayfa.dart';
import 'package:anlamayanyok/Matematik/TYT/FonksiyonlarMat.dart';
import 'package:anlamayanyok/Matematik/TYT/KokluSayilarMat.dart';
import 'package:anlamayanyok/Matematik/TYT/PolinomlarMat.dart';
import 'package:anlamayanyok/PhotoView/PhotoView2.dart';
import 'package:anlamayanyok/Services/DBService.dart';
import 'package:anlamayanyok/Videolar/VideolarSayfa.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'KonularClassOOP.dart';

class AnaEkran extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User> get authStateChanges => _auth.authStateChanges();
  final User user;
  AnaEkran({Key key, this.user}) : super(key: key);
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {

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
      backgroundColor: Color(0xFFEAE9E9),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: _fontSizeHeight/5.4,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(10)
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFABEECEC),
                    Color(0xFA8BC1C1),
                    Color(0xFA91BFE0),
                    Color(0xFA96A9BA),
                  ],
                  stops: [0.1, 0.5, 0.7, 1],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: _fontSizeHeight/45),
                    child: Container(
                      height: _fontSizeHeight/11,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: _fontSizeQuery/16),
                            child: Text("Anlamayan Yok", style: GoogleFonts.cinzel(
                              fontStyle: FontStyle.normal,
                              fontSize: _fontSizeQuery / 16,
                            ),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: _fontSizeQuery/20),
                            child: GestureDetector(
                              onTap: (){
                                _push(context, PhotoView2x(user.photoURL));
                              },
                              child: SizedBox(
                                height: _fontSizeHeight * .11,
                                width: _fontSizeQuery * .15,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
               Padding(
                 padding: EdgeInsets.only(
                     top: _fontSizeHeight/75,
                     bottom: _fontSizeHeight/34,),
                 child: SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Padding(
                     padding: EdgeInsets.only(left: _fontSizeQuery/16,right:_fontSizeQuery/13 ),
                     child: Container(
                       height: _fontSizeHeight/8.7,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           GestureDetector(
                             onTap: (){
                              _push(context, PolinomlarMat());
                             },
                             child: Container(
                               height: _fontSizeHeight/9,
                               width: _fontSizeQuery/3.5,
                               decoration: BoxDecoration(
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 1,
                                     blurRadius: 3,
                                   )
                                 ],
                                 color: Color(0xFFF6F3F3),
                                 borderRadius: BorderRadius.circular(10.0),
                               ),
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(top: _fontSizeHeight/45),
                                     child: Text("Polinomlar",style: TextStyle(
                                       color: Colors.black,
                                       fontSize: textSize *14
                                     ),),
                                   ),
                                   SizedBox(height: _fontSizeHeight/99,),
                                   Icon(Icons.school_outlined)
                                 ],
                               ),
                             ),
                           ),
                           SizedBox(width: 15,),
                           GestureDetector(
                             onTap: (){
                               _push(context, Deltoid());
                             },
                             child: Container(
                               height: _fontSizeHeight/9,
                               width: _fontSizeQuery/3.5,
                               decoration: BoxDecoration(
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 1,
                                     blurRadius: 3,
                                   )
                                 ],
                                 color: Color(0xFFF6F3F3),
                                 borderRadius: BorderRadius.circular(10.0),
                               ),
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(top: _fontSizeHeight/45),
                                     child: Text("Deltoid",style: TextStyle(
                                         color: Colors.black,
                                         fontSize: textSize *14
                                     ),),
                                   ),
                                   SizedBox(height: _fontSizeHeight/99,),
                                   Icon(Icons.school_outlined)
                                 ],
                               ),
                             ),
                           ),
                           SizedBox(width: 15,),
                           GestureDetector(
                             onTap: (){
                               _push(context, Ozel_Ucgenler_Class());
                             },
                             child: Container(
                               height: _fontSizeHeight/9,
                               width: _fontSizeQuery/3.5,
                               decoration: BoxDecoration(
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 1,
                                     blurRadius: 3,
                                   )
                                 ],
                                 color: Color(0xFFF6F3F3),
                                 borderRadius: BorderRadius.circular(10.0),
                               ),
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(top: _fontSizeHeight/45),
                                     child: Text("Özel Üçgenler",style: TextStyle(
                                         color: Colors.black,
                                         fontSize: textSize *13.5
                                     ),),
                                   ),
                                   SizedBox(height: _fontSizeHeight/99,),
                                   Icon(Icons.school_outlined)
                                 ],
                               ),
                             ),
                           ),
                           SizedBox(width: 15,),
                           GestureDetector(
                             onTap: (){
                               _push(context, TrigonometriMat());
                             },
                             child: Container(
                               height: _fontSizeHeight/9,
                               width: _fontSizeQuery/3.5,
                               decoration: BoxDecoration(
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 1,
                                     blurRadius: 3,
                                   )
                                 ],
                                 color: Color(0xFFF6F3F3),
                                 borderRadius: BorderRadius.circular(10.0),
                               ),
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(top: _fontSizeHeight/45),
                                     child: Text("Trigonometri",style: TextStyle(
                                         color: Colors.black,
                                         fontSize: textSize *14
                                     ),),
                                   ),
                                   SizedBox(height: _fontSizeHeight/99,),
                                   Icon(Icons.school_outlined)
                                 ],
                               ),
                             ),
                           ),
                           SizedBox(width: 15,),
                           GestureDetector(
                             onTap: (){
                              _push(context, KokluSayilarMat());
                             },
                             child: Container(
                               height: _fontSizeHeight/9,
                               width: _fontSizeQuery/3.5,
                               decoration: BoxDecoration(
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 1,
                                     blurRadius: 3,
                                   )
                                 ],
                                 color: Color(0xFFF6F3F3),
                                 borderRadius: BorderRadius.circular(10.0),
                               ),
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(top: _fontSizeHeight/45),
                                     child: Text("Köklü Sayılar",style: TextStyle(
                                         color: Colors.black,
                                         fontSize: textSize *14
                                     ),),
                                   ),
                                   SizedBox(height: _fontSizeHeight/99,),
                                   Icon(Icons.school_outlined)
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:_fontSizeQuery/16),
                        child: Text(" Yeni Dersleri Keşfet", style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: _fontSizeQuery / 16,
                          fontWeight: FontWeight.w400
                        ),),
                      )
                    ],
                  ),
                  SizedBox(height: _fontSizeHeight/25,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: _fontSizeQuery/18),
                            child: GestureDetector(
                              onTap: (){
                                _push(context, MatematikSayfaClass());
                              },
                              child: Container(
                                height: _fontSizeHeight/4.5,
                                width: _fontSizeQuery/2.5,
                                decoration: BoxDecoration(
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 5,
                                     blurRadius: 7,
                                     offset: Offset(0, 3),
                                   )
                                 ],
                                  color: Color(0xFFF6F3F3),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: _fontSizeHeight/35,bottom: _fontSizeHeight/75),
                                      child: Text("Matematik",style: TextStyle(
                                        color: Color(0xFA012323),
                                        fontSize: textSize*21,
                                      ),),
                                    ),
                                    Icon(Icons.calculate, size: _fontSizeQuery/5.5,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: _fontSizeQuery/12,),
                          Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: GestureDetector(
                              onTap: (){
                                _push(context, GeometriSayfaClass());
                              },
                              child: Container(
                                height: _fontSizeHeight/4.5,
                                width: _fontSizeQuery/2.5,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  color: Color(0xFFF6F3F3),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: _fontSizeHeight/35,bottom: _fontSizeHeight/75),
                                      child: Text("Geometri",style: TextStyle(
                                        color: Color(0xFA012323),
                                        fontSize: textSize*21,
                                      ),),
                                    ),
                                    Icon(Icons.square_foot_outlined, size: _fontSizeQuery/5.5,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: _fontSizeHeight/20,),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: _fontSizeQuery/18),
                            child: GestureDetector(
                              onTap: (){
                                _push(context, FizikSayfaClass());
                              },
                              child: Container(
                                height: _fontSizeHeight/4.5,
                                width: _fontSizeQuery/2.5,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  color: Color(0xFFF6F3F3),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: _fontSizeHeight/35,bottom: _fontSizeHeight/75),
                                      child: Text("Fizik",style: TextStyle(
                                        color: Color(0xFA012323),
                                        fontSize: textSize*21,
                                      ),),
                                    ),
                                    Icon(Icons.architecture_outlined, size: _fontSizeQuery/5.5,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: _fontSizeQuery/12,),
                          Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: GestureDetector(
                              onTap: (){
                                _push(context, VideolarClass());
                              },
                              child: Container(
                                height: _fontSizeHeight/4.5,
                                width: _fontSizeQuery/2.5,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  color: Color(0xFFF6F3F3),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: _fontSizeHeight/35,bottom: _fontSizeHeight/75),
                                      child: Text("Videolar",style: TextStyle(
                                        color: Color(0xFA012323),
                                        fontSize: textSize*21,
                                      ),),
                                    ),
                                    Icon(Icons.video_collection_outlined, size: _fontSizeQuery/5.5,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  void share(BuildContext context) {
    final String text = " Anlamayan Yok artık Google Play Store'de! "
        "https://play.google.com/store/apps/details?id=com.facebook.katana&hl=tr&gl=US";
    Share.share(text);
  }
}
class DersArama extends SearchDelegate<TumKonular> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty
        ? BosText()
        : konuBasliklari()
            .where((p) => p.KonuAdi.startsWith(query.toLowerCase()))
            .toList();
    return myList.isEmpty
        ? Container(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 35,
                  left: MediaQuery.of(context).size.width * .030),
              child: Text(
                "Sonuç bulunamadı!",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: MediaQuery.of(context).size.width * .045,
                ),
              ),
            ),
          )
        : ListView.builder(
            itemCount: myList.length,
            itemBuilder: (context, int index) {
              final TumKonular listitem = myList[index];
              return ListTile(
                  title: listitem.KonuAdi.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (listitem.KonuId == 1) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return FonksiyonlarMat();
                                  }));
                                } else if (listitem.KonuId == 2) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return FonksiyonlarMat();
                                  }));
                                }
                              },
                              child: Text(
                                listitem.KonuAdi,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              listitem.KonuKategori,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.032,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey,
                            )
                          ],
                        )
                      : Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 15),
                            child: Center(
                                child: Text(
                              "Arama Yapınız!",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .045,
                                  color: Colors.black87),
                            )),
                          ),
                        ));
            });
  }
}
