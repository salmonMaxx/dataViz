import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:permission_handler/permission_handler.dart';

import '../PermissionTemplate.dart';

class Mic extends StatefulWidget {
  Mic(this.whoHasMic);
  List<String> whoHasMic;
  @override
  _MicState createState() => _MicState();
}

class _MicState extends State<Mic> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  PermissionTemplate temp = new PermissionTemplate();

  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
    _getMicPermission();
  }

  _getMicPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.microphone);
    //if(permission != PermissionStatus.granted) {
    Map<PermissionGroup, PermissionStatus> requestMicrophonePermission =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.microphone]);
    //}
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('MICROPHONE'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.86,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                temp.textBoxWithPic(
                  null,
                  "assets/audiofile2.jpg",
                  'Microphone',
                  null,
                  'The microphone permission....',
                  null,
                  null,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.36,
                  child: temp.textBox(null, "", null, resultText, null, null),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: null,
                      child: Icon(Icons.cancel),
                      mini: true,
                      backgroundColor: Colors.red,
                      onPressed: () {
                        if (_isListening)
                          _speechRecognition.cancel().then(
                                (result) => setState(() {
                                      _isListening = result;
                                      resultText = "";
                                    }),
                              );
                      },
                    ),
                    FloatingActionButton(
                      heroTag: null,
                      child: Icon(Icons.mic),
                      onPressed: () {
                        if (_isAvailable && !_isListening)
                          _speechRecognition
                              .listen(locale: "en_US")
                              .then((result) => print('$result'));
                      },
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    FloatingActionButton(
                      heroTag: null,
                      child: Icon(Icons.stop),
                      mini: true,
                      backgroundColor: Colors.lightBlueAccent,
                      onPressed: () {
                        if (_isListening)
                          _speechRecognition.stop().then(
                                (result) =>
                                    setState(() => _isListening = result),
                              );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          temp.otherPermissionBox(null, null, widget.whoHasMic),
        ],
      ),
    );
  }
}

/*
// BOX 1
  String myImage = "assets/audiofile2.jpg";
  String myHeader = "MIC";
  String myText = "sing, speak and more ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('MICROPHONE'),
      ),
      body: ListView(
        children: <Widget>[
          template.textBoxWithPic(
                null, myImage, myHeader, null, myText, null, 80),
          template.otherPermissionBox(null, null, widget.whoHasMic),
        ],
      ),
    );
  }
 */
