import 'dart:math';
import 'package:flutter/material.dart';
import 'package:chatapp/models/call.dart';
import 'package:chatapp/models/users.dart';
import 'package:chatapp/resources/call_methods.dart';
import 'package:chatapp/screens/callscreens/videocall_screen.dart';
import 'package:chatapp/screens/callscreens/voicecall_screen.dart';
// import 'package:chatapp/utils/utilities.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dialVideo({Users from, Users to, context, String callis}) async {
    Call call = Call(
      callerId: from.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callMethods.makeVideoCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoCallScreen(call: call),
          ));
    }
  }

  static dialVoice({Users from, Users to, context, String callis}) async {
    Call call = Call(
      callerId: from.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callMethods.makeVoiceCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VoiceCallScreen(call: call),
          ));
    }
  }
}
