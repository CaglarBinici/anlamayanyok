import 'package:anlamayanyok/Conversations/Conversation_Page.dart';
import 'package:anlamayanyok/Provider/auth_provider.dart';
import 'package:anlamayanyok/Services/DBService.dart';
import 'package:anlamayanyok/Services/NavigatonService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anlamayanyok/Services/Contacts.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'message.dart';
class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  String _searchText;
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    DBService.instance.updateUserLastSeenTime(user.uid);
  }
  _SearchPageState(){
    _searchText ="";
  }
  FirebaseAuth auth;

  Future<Null>RefreshList() async{
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _usersListView();
    });
  }
  @override
  Widget build(BuildContext context){
    return Container(
      child: ChangeNotifierProvider<AuthProvider>.value(
        value: AuthProvider.instance,
        child: _searchPageUI(),
      ),
    );
  }
  Widget _searchPageUI(){
    final snackBar = SnackBar(
      content: Text('Kullanıcılar yüklenirken bir hata oluştu!'),
      action: SnackBarAction(
        label: 'Tekrar dene',textColor: Colors.white,
        onPressed: () {
          setState(() {});
        },
      ),
      backgroundColor: Colors.red,
    );
    try{
      return Builder(builder: (BuildContext _context){
        auth = FirebaseAuth.instance;
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
                      Color(0xFAE7F3F3),
                      Color(0xFAD5DBDB),
                      Color(0xFABABDBD),
                      Color(0xFABBC1C1),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height:MediaQuery.of(context).size.height*0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width *0.03),
                      child: _userSearchField(),
                    ),
                    _usersListView(),
                  ],
                ),
              ),
            ],
          ),
        );
      });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  Widget _userSearchField(){
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.02),
        decoration: BoxDecoration(
          color: Colors.black38.withAlpha(10),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child:TextField(
          autocorrect: false,
          style: TextStyle(
            color: Colors.black,
          ),
          onSubmitted: (_input){
            setState(() {
              _searchText = _input;
            });
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            labelStyle: TextStyle(
              color: Colors.black.withAlpha(120),
            ),
            labelText: "Arama",
            border: OutlineInputBorder(
              borderSide: BorderSide.none
            ),
          ),
        ) ,
      ),
    );
  }
  Widget _usersListView(){
    return RefreshIndicator(
      child: StreamBuilder<List<Contact>>(
        stream:DBService.instance.getUsersInDB(_searchText) ,
          builder: (context, _snapshot){
          var _usersData = _snapshot.data;
          if(_usersData != null){
            _usersData.removeWhere((_contact) => _contact.id == auth.currentUser.uid);
          }
        return _snapshot.hasData
            ? Container(
              height :MediaQuery.of(context).size.height * 0.80,
               child: ListView.builder(
                 itemCount: _usersData.length,
                  itemBuilder: (BuildContext _context,
                int _index){
                  var _userData = _usersData[_index];
                var _currentTime = DateTime.now();
                var _recepientID = _usersData[_index].id;
                  timeago.setLocaleMessages('tr', timeago.TrMessages());
                  var _isUserActive = !_userData.lastseen.toDate().isBefore(
                _currentTime.subtract(Duration(minutes: 1),
                ),
              );
              return ListTile(
                onTap: (){
                  DBService.instance.createOrGetConversartion(
                      auth.currentUser.uid, _recepientID,
                          (String _conversationID) async{
                        _push(context, ConversationPage(_conversationID,
                            _recepientID,
                            _userData.name,
                            _userData.image,
                        ));
                      });
                },
                title: Text(_userData.name),
                leading: Container(
                  height: MediaQuery.of(context).size.height * .075,
                  width: MediaQuery.of(context).size.width * .14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_userData.image),
                    backgroundColor: Colors.transparent,),
                ),
                trailing:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:<Widget> [
                    _isUserActive ?
                    Text("Çevrimiçi",
                      style: TextStyle(
                          fontSize: 14
                      ),) :  Text("Son Görülme",
                      style: TextStyle(
                          fontSize: 14.5
                      ),),
                    _isUserActive ? Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ):Text(
                      timeago.format(_userData.lastseen.toDate(), locale: 'tr'
                      ),
                      style: TextStyle(
                          fontSize: 13.5
                      ),)
                  ],
                ) ,
              );
            },
          ),
        ): Center(
          child: SpinKitFadingCircle(
            color: Colors.blue,
            size: 50.0,
          ),
        );
      }),
      onRefresh: RefreshList,
    );
  }
  void _push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
