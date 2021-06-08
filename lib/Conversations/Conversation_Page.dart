import 'dart:async';

import 'package:anlamayanyok/PhotoView/PhotoView.dart';
import 'package:anlamayanyok/PhotoView/PhotoView3.dart';
import 'package:anlamayanyok/Services/cloud_storage_service.dart';
import 'package:anlamayanyok/Services/media_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Services/DBService.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'conversations.dart';
import 'message.dart';
class ConversationPage extends StatefulWidget {

  String _conversationID;
  String _receiverID;
  String _receiverImage;
  String _receiverName;

  ConversationPage(
      this._conversationID,
      this._receiverID,
      this._receiverName,
      this._receiverImage,
      );
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  double _deviceHeight;
  double _deviceWidth;
  FirebaseAuth auth;
  GlobalKey<FormState>_formKey;
  ScrollController _listViewController;
  String _messageText;
  _ConversationPageState(){
    _formKey = GlobalKey<FormState>();
    _listViewController = ScrollController();
    _messageText = "";
  }

  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 31, 31, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1.0),
        title: Row(
          children: [
            Container(
              width:  MediaQuery.of(context).size.width*0.58,
                //color: Colors.white54,
                child: Column(
                  children: [
                    Center(child: Text(this.widget._receiverName),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.02 ),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: _userImageWidget2()),
            ),
          ],
        ),
      ),
      body: _conversationPageUI(),
    );
  }
  Widget _conversationPageUI(){
    auth = FirebaseAuth.instance;
    return Builder(builder: (BuildContext _context){
      return Stack(
        overflow: Overflow.visible,
        children:<Widget> [
          _messageListView(),
          Align(
            alignment: Alignment.bottomCenter,
              child: _messageField(_context)
          ),
        ],
      );
    });
  }
  Widget _messageListView(){
    return Container(
      height: _deviceHeight* 0.75,
      width: _deviceWidth,
      decoration: BoxDecoration(
        color: Color.fromRGBO(31, 31, 31, 1.0)
      ),
      child:StreamBuilder<Conversation>(
        stream: DBService.instance.getConversation(this.widget._conversationID),
        builder:(BuildContext _cohntext, _snapshot){
          Timer(Duration(milliseconds: 50), () => {
            _listViewController.jumpTo(_listViewController.position.maxScrollExtent),
          });
          var _conversationData = _snapshot.data;
          if(_conversationData != null){
            if(_conversationData.messages.length != 0 ){
              return ListView.builder(
                  controller: _listViewController,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  itemCount: _conversationData.messages.length,
                  itemBuilder: (BuildContext _context, int _index){
                    var _message = _conversationData.messages[_index];
                    bool _isOwnMessage = _message.senderID == auth.currentUser.uid;
                    return _messageListViewChild(_isOwnMessage, _message);
                  }
              );
            }else{
              return Align(
                alignment: Alignment.center,
                child: Text("Sohbeti başlat",style: TextStyle(
                  color: Colors.white
                ),),
              );
            }
          }else{
            return SpinKitWanderingCubes(
              color: Colors.blue,
              size: 50.0,
            );
          }
        },
      ),
    );
  }
  Widget _messageListViewChild(bool _isOwnMessage, Message _message,){
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:_isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          !_isOwnMessage ? _userImageWidget() : Container(),
          SizedBox(width: _deviceWidth * 0.02),
          _message.type == MessageType.Text
              ? _textMessageBubble(
              _isOwnMessage, _message.content, _message.timestamp)
              : _imageMessageBubble(
              _isOwnMessage, _message.content, _message.timestamp),
        ],
      ),
    );
  }
  Widget _userImageWidget(){
    double _imageRadius = _deviceHeight * 0.05;
    return Container(
      height: _imageRadius,
      width: _imageRadius,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(this.widget._receiverImage),
        )
      ),
    );
  }
  Widget _userImageWidget2(){
    double _imageRadius = _deviceHeight * 0.065;
    return GestureDetector(
      onTap: (){
        _push(context, PhotoView3(this.widget._receiverImage));
      },
      child: Container(
        height: _imageRadius,
        width: _imageRadius,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(this.widget._receiverImage),
            )
        ),
      ),
    );
  }
  Widget _textMessageBubble(bool _isOwnMessage, String _message, Timestamp _timestamp){
    timeago.setLocaleMessages('tr', timeago.TrMessages());
    List<Color> _colorScheme = _isOwnMessage
    ? [Colors.blue, Color.fromRGBO(42, 117, 188, 1)]
        : [Color.fromRGBO(69, 69, 69, 1), Color.fromRGBO(43, 43, 43, 1)];
    return Container(
      height: _deviceHeight*0.08 + (_message.length / 20 * 5.0),
      width: _deviceWidth *0.75,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
        colors: _colorScheme,
        stops: [0.30, 0.70,],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
         ),
         ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_message,style: TextStyle(
          color: Colors.white
          ),),
          Text(timeago.format(_timestamp.toDate(),locale: 'tr'), style: TextStyle(
            color: Colors.white54
          ),),

        ],
      ),
    );
  }
  Widget _imageMessageBubble(bool _isOwnMessage, String _imageURL, Timestamp _timestamp){
    timeago.setLocaleMessages('tr', timeago.TrMessages());
    List<Color> _colorScheme = _isOwnMessage
    ? [Colors.blue, Color.fromRGBO(42, 117, 188, 1)]
        : [Color.fromRGBO(69, 69, 69, 1), Color.fromRGBO(43, 43, 43, 1)];
    DecorationImage _image = DecorationImage(image: NetworkImage(_imageURL), fit: BoxFit.cover);
    return GestureDetector(
    onTap: (){
      _push(context, PhotoViewPage(_imageURL));
    },
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
      colors: _colorScheme,
      stops: [0.30, 0.70,],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      ),
      ),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Container(
      height: _deviceHeight * 0.30,
      width:  _deviceWidth * 0.40,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
       image: _image,
      ),
      ),
      SizedBox(height: 3,),
      Text(timeago.format(_timestamp.toDate(),locale: 'tr'), style: TextStyle(
      color: Colors.white54
      ),),

      ],
      ),
      ),
    );
  }
  Widget _messageField(BuildContext _context){
    return Container(
      height: _deviceHeight*0.08,
      decoration: BoxDecoration(
        color: Color.fromRGBO(43, 43, 43, 1),
        borderRadius: BorderRadius.circular(100),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: _deviceWidth * 0.04,
        vertical: _deviceHeight * 0.03,
      ),
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _messageTextField(),
            _imageMessageButton(),
            _sendMessageButton(_context),
          ],
        ),
      ),
    );
  }

  Widget _messageTextField(){
    return Container(
      width: _deviceWidth * 0.55,
      decoration: BoxDecoration(
        color: Color.fromRGBO(43, 43, 43, 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextFormField(
          inputFormatters:[
            LengthLimitingTextInputFormatter(70),
          ],
        style: TextStyle(color: Colors.white),
      validator: (_input){
        if(_input.length ==0){
          return "Lütfen bir mesaj giriniz";
        }else{
          return null;
         }
        },
        onChanged: (_input){
        _formKey.currentState.save();
        },
        onSaved: (_input){
        setState(() {
          _messageText = _input;
        });
        },
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Mesaj yazın",hintStyle: TextStyle(
          color: Colors.white
        )
        ),
        autocorrect: false,
      ),
    );
  }
  Widget _sendMessageButton(BuildContext _context){
    return Container(
      height: _deviceHeight* 0.05,
      width: _deviceWidth * 0.05,
      child: IconButton(
        icon: Icon(Icons.send,color: Colors.white,),
        onPressed: (){
          if(_formKey.currentState.validate()){
            DBService.instance.sendMessage(
                this.widget._conversationID, Message(
                content: _messageText,
                timestamp: Timestamp.now(),
                senderID: auth.currentUser.uid,
                type: MessageType.Text),
            );
          }
          _formKey.currentState.reset();
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
  Widget _imageMessageButton(){
    return Container(
      height: _deviceHeight* 0.05,
      width: _deviceWidth * 0.05,
      child: FloatingActionButton(
        onPressed: () async{
          var _image = await MediaService.instance.getImageFromLibrary();
          if(_image != null){
            var _result = await CloudStorageService.instance.uploadMediaMessage(auth.currentUser.uid, _image);
            var _imageURL = await _result.ref.getDownloadURL();
             await DBService.instance.sendMessage(
                this.widget._conversationID,
                Message(content: _imageURL,
                  senderID: auth.currentUser.uid,
                timestamp: Timestamp.now(),
                type: MessageType.Image));
          }
        },
        child: Icon(Icons.camera_enhance),
      ),
    );
  }
  void _push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
