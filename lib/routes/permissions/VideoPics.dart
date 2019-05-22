import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import 'dart:typed_data';
import 'photos.dart';

import '../PermissionTemplate.dart';

class VideoPics extends StatefulWidget {
  VideoPics(this.whoHasVideoPics);
  List<String> whoHasVideoPics;
  @override
  _VideoPicsState createState() => _VideoPicsState();
}

var template = new PermissionTemplate();
var imageTemplate = new PhotoPageState();

const _cacheIosAssetId = "106E99A1-4F6A-45A2-B320-B0AD4A8E8473/L0/001";
const _cacheAndroidAssetId =
    "/storage/emulated/0/qqmusic/QQImage/1533629267497.jpg";

class _VideoPicsState extends State<VideoPics> {
  var pathList = <AssetPathEntity>[];

  @override
  void initState() {
    super.initState();
    PhotoManager.addChangeCallback(changeNotify);
    PhotoManager.startChangeNotify();
  }

  void changeNotify() {
    print("on gallery change");
  }

  @override
  void dispose() {
    PhotoManager.removeChangeCallback(changeNotify);
    PhotoManager.stopChangeNotify();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Radius borderRadius = const Radius.circular(10.0);
    return new Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('VIDEO & IMAGE'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
              child: template.textBoxWith3Pics(
                  null,
                  "assets/camera1.jpg",
                  "assets/camera2.jpeg",
                  "assets/camera3.jpg",
                  "Selfies for everyone?",
                  null,
                  "Pictures and videos on your mobile can be highly private. When you answer YES to the request for permission,"
                  " an app can easily see all the pictures and videos on your mobile. Remember what you accept!",
                  null,
                  100)),
          new Container(
            decoration: BoxDecoration(
                gradient: template.colorGradient(
                    Alignment.bottomLeft, Alignment.bottomRight),
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.photo),
                    iconSize: 80,
                    tooltip: "get image path list",
                    onPressed: _onlyImage,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.videocam),
                    iconSize: 80,
                    tooltip: "get video path list",
                    onPressed: _onlyVideo,
                  ),
                ),
              ],
            ),
          ),
          new Container(
            child: template.textBox(BoxDecoration(
                gradient: template.colorGradient(Alignment.centerLeft, Alignment.centerRight),
                borderRadius: new BorderRadius.all(Radius.circular(0.0)))
                , "We can se everything", null, "press on the icons above\nand see what we can see", null, EdgeInsets.only(left:10, right:10))
          ),
          new Container(
            decoration: BoxDecoration(
              gradient: template.colorGradient(
                  Alignment.topLeft, Alignment.topRight),
            borderRadius: new BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)) ),
            height: 100,
            margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5),
            child: new ListView.builder(
              itemBuilder: _buildItem,
              itemCount: pathList.length,
            ),
          ),
          new Container(
            child: template.otherPermissionBox(null, null, widget.whoHasVideoPics),
            ),
          ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    var data = pathList[index];
    return _buildWithData(data);
  }


  Widget _buildWithData(AssetPathEntity data) {
    return GestureDetector(
      child: ListTile(
        title: Text(data.name),
      ),
      onTap: () async {
        var list = await data.assetList;
        print(
            "open gallery is:${data.name} , count : ${list.length} , list = $list");
        var page = PhotoPage(
          pathEntity: data,
          photos: list,
        );
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => page));
      },
    );
  }

  // This is an example of how to build album preview.
  Widget _buildHasPreviewItem(BuildContext context, int index) {
    var data = pathList[index];
    Widget widget = FutureBuilder<List<AssetEntity>>(
      future: data.assetList,
      builder:
          (BuildContext context, AsyncSnapshot<List<AssetEntity>> snapshot) {
        var assetList = snapshot.data;
        if (assetList == null || assetList.isEmpty) {
          return Container(
            child: Text('loading'),
          );
        }
        AssetEntity asset = assetList[0];
        return _buildPreview(asset);
      },
    );
    return widget;
  }

  Widget _buildPreview(AssetEntity asset) {
    return FutureBuilder<Uint8List>(
      future: asset.thumbDataWithSize(200, 200),
      builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.data != null) {
          return Image.memory(snapshot.data);
        }
        return Container();
      },
    );
  }

  void getImages() async {
    var result = await PhotoManager.requestPermission();
    if (!(result == true)) {
      print("You have to grant album privileges");
      return;
    }

    print("wait scan");
    List<AssetPathEntity> list =
        await PhotoManager.getAssetPathList(hasVideo: true);

    pathList.clear();
    pathList.addAll(list);
    setState(() {});

    // var r = await ImagePicker.pickImages(source: ImageSource.gallery, numberOfItems: 10);
    // print(r);
  }

  void _onlyVideo() async {
    var result = await PhotoManager.requestPermission();
    if (!(result == true)) {
      print("You have to grant album privileges");
      return;
    }
    var pathList = await PhotoManager.getVideoAsset();
    updateDatas(pathList);
  }

  void _onlyImage() async {
    var result = await PhotoManager.requestPermission();
    if (!(result == true)) {
      print("You have to grant album privileges");
      return;
    }

    //Get the path, recent, downloads etc.
    var pathList = await PhotoManager.getImageAsset();
    updateDatas(pathList);
  }

  updateDatas(List<AssetPathEntity> list) {
    pathList.clear();
    pathList.addAll(list);
    setState(() {});
  }

  /*void showImageDialogWithAssetId() async {
    String id;

    if (Platform.isIOS) {
      id = _cacheIosAssetId;
    } else if (Platform.isAndroid) {
      id = _cacheAndroidAssetId;
    }

    if (id == null) {
      return;
    }

    var asset = await createAssetEntityWithId(id);

    showDialog(
      context: context,
      builder: (ctx) {
        return GestureDetector(
          child: _buildPreview(asset),
          onTap: () => Navigator.pop(ctx),
        );
      },
    );
  }*/
}

/*
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('PICTURE AND VIDEO',
            textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.indigo[900],
      ),
      body: new ListView(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}*/
