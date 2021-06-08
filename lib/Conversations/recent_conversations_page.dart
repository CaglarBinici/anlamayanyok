import 'dart:async';

import 'package:anlamayanyok/Conversations/Conversation_Page.dart';
import 'package:anlamayanyok/Conversations/SearchPage.dart';
import 'package:anlamayanyok/Provider/auth_provider.dart';
import 'package:anlamayanyok/Services/DBService.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Conversations/message.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../Conversations/conversations.dart';


class RecentConversationsPage extends StatefulWidget {
  @override
  _RecentConversationsPageState createState() => _RecentConversationsPageState();
}

class _RecentConversationsPageState extends State<RecentConversationsPage> {
   double _height;
   double _width;
   Future<Null>_refreshList() async{
     await Future.delayed(Duration(seconds: 1));
     setState(() {
       _conversationsListViewWidget(context);
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          child: Center(child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/30),
            child: Text("Mesajlarım",style:
            GoogleFonts.anticSlab(fontStyle: FontStyle.normal,fontSize: MediaQuery.of(context).textScaleFactor*23, color: Color(
                0xFA1C2F40),fontWeight:
            FontWeight.bold),),
          )),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors:
            [Color(0xFAE7F3F3),Color(0xFAE7F3F3)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0,0.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: GestureDetector(
          onLongPress: (){
            Text("Sohbet başlat");
          },
            child: Icon(Icons.add,color: Colors.white,)),
        onPressed: (){
          _push(context, SearchPage());
        },

      ),
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
                    Color(0xFAE7F3F3),
                    Color(0xFAD5DBDB),
                    Color(0xFABABDBD),
                    Color(0xFABBC1C1),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Container(
              height: _height,
              width: _width,
              child: ChangeNotifierProvider<AuthProvider>.value(
                value: AuthProvider.instance,
                child: _conversationsListViewWidget(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _conversationsListViewWidget(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Mesajlar yüklenirken bir hata oluştu!'),
      action: SnackBarAction(
        label: 'Tekrar dene', textColor: Colors.white,
        onPressed: () {
         setState(() {});
        },
      ),
      backgroundColor: Colors.red,
    );
    try{
      return RefreshIndicator(
        child: Builder(builder: (BuildContext _context){
          var auth = FirebaseAuth.instance.currentUser;
          return Container(
            height: _height,
            width: _width,
            child: StreamBuilder<List<ConversationSnippet>>(
              stream: DBService.instance.getUserConversations(auth.uid),
              builder: (_context, _snapshot){
                var _data = _snapshot.data;
                if(_data !=null){
                  return _data.length !=0
                      ? ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (_context, _index){
                      return ListTile(
                        onTap: (){
                          _push(context, ConversationPage(_data[_index].conversationID,
                              _data[_index].id,
                              _data[_index].name,
                              _data[_index].image,)
                          );
                        },
                        title: Text(_data[_index].name),
                        subtitle: Text(_data[_index].type == MessageType.Text ? _data[_index].lastMessage : "Dosya: Fotoğraf"),
                        leading: Container(
                          height: MediaQuery.of(context).size.height * .95,
                          width: MediaQuery.of(context).size.width * .15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(_data[_index].image),
                            ),
                          ),
                        ),

                        trailing: _listTileTrailingWidgets(_data[_index].timestamp),
                      );
                    },
                  ): Align(child: Text("Şimdilik mesajınız yok!",style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15
                  ),),
                  );
                }else{
                  return SpinKitFadingCircle(
                    color: Colors.blue,
                    size: 50.0,
                  );
                }
              },
            ),
          );
        },
        ),
        onRefresh: _refreshList,
      );
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  Widget _listTileTrailingWidgets(Timestamp _lastMessageTimestamp) {
    timeago.setLocaleMessages('tr', timeago.TrMessages());
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "Son Mesaj",
          style: TextStyle(fontSize: 15),
        ),
        Text(
          timeago.format(_lastMessageTimestamp.toDate(),locale: 'tr'),
          style: TextStyle(fontSize: 14),
        ),

      ],
    );
  }
   void _push(BuildContext context, Widget page) {
     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
       return page;
     }));
   }
}
