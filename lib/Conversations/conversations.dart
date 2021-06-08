import 'package:cloud_firestore/cloud_firestore.dart';

import '../Conversations/message.dart';


class ConversationSnippet {
  final String id;
  final String conversationID;
  final String lastMessage;
  final String name;
  final String image;
  final MessageType type;
  final int unseenCount;
  final Timestamp timestamp;

  ConversationSnippet(
      {this.conversationID,
        this.id,
        this.lastMessage,
        this.unseenCount,
        this.timestamp,
        this.name,
        this.image,
      this.type});

  factory ConversationSnippet.fromFirestore(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data();
    var _messageType = MessageType.Text;
    if(_data["type"] != null){
      switch (_data["type"]) {
        case "text":
          break;
        case "image":
          _messageType = MessageType.Image;
          break;
        default:
      }
    }
    return ConversationSnippet(
      id: _snapshot.id != null ? _snapshot.id : 1,
      conversationID: _data['conversationID'], //noWorries
      lastMessage: _data["lastMessage"] != null ? _data["lastMessage"] : " ",
      unseenCount: _data["unseenCount"], //noWorries
      timestamp: _data["timestamp"] != null ? _data["timestamp"] : "null",
      name: _data["name"], //noWorries
      image: _data["image"], //noWorries
      type: _messageType !=null ? _messageType : "text" ,
    );
  }
}

class Conversation {
  final String id;
  final List members;
  final List<Message> messages;
  final String ownerID;

  Conversation({this.id, this.members, this.ownerID, this.messages});

  factory Conversation.fromFirestore(DocumentSnapshot _snapshot) {

    var _data = _snapshot.data();

    List _messages = _data["messages"];


    if (_messages != null) {
      _messages = _messages.map(
            (_m) {
              var _messageType = _m["type"] == "text" ? MessageType.Text : MessageType.Image;
          return Message(
            senderID: _m["senderID"] != null ?_m["senderID"]: " " ,
            content: _m["message"] != null ? _m["message"] : " ",
            timestamp: _m["timestamp"] != null ?_m["timestamp"] : "null" ,
              type: _messageType != null ? _messageType : "text",
          );
        },
      ).toList();
    } else {
      _messages = null;
    }

    return Conversation(
        id: _snapshot.id,
        members: _data["members"],
        ownerID: _data["ownerID"],
        messages: _messages);

  }
}
