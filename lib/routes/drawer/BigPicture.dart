import 'package:flutter/material.dart';
import '../PermissionTemplate.dart';
class BigPicture extends StatefulWidget {
  @override
  _BigPictureState createState() => _BigPictureState();
}

class _BigPictureState extends State<BigPicture> {
  var template = new PermissionTemplate();
  String header1 = 'Why data matters';
  String text1 = '\nIt all has happend very quickly. Just a couple of years ago IT companies made most of their money from selling software and hardware to customers, today many of them make money from selling information about you. The data traded by companies and even governments, often to be used to track your behaviour and use it against you. The most common reason for gathering user data is to use it for personlized advertisements where maybe your recent phone calls, your sudden new walking pattern and your high blood pressure may indicate that you are vulnerable to buy presents to a date.';
  String header2 = 'You are the fuel';
  String text2 = 'Several scientists and experienced debators argue that people have to understand that their main roles on social media are not as users but as products containing valuable data to companies. The famous Silicon Valley investor Roger McNamee, who used to work for Facebook as mentor for the founder and CEO Mark Zuckerberg, takes this one step further describing how the user data nowdays is more important as fuel for the machine learning algorithms that helps Facebook create Artificial Intelligience. Every click you do is recorded and used.';
  String header3 = "It's all about the money";
  String text3 = "“Free” plattforms are masters of making money out of their users’ data. They measure themselves by average revenue per user (ARPU) and most of them are steadily increasing their revenues. The revenues differ from country to country with higher revenues per user in for example Sweden. Here are some big plattforms annual global ARPU from 2019:\n Google: 40.9\$/year\nAmazon: 15\$/year\nTwitter: 9.48\$/year\nFacebook: 7.37\$/year\nPintrest: 2.80\$/year\nSnapchat: 2.09\$/year\nReddit: 0.30\$/year";
  String header4 = "How to protect your phone's data";
  String text4 = "\nWalk yourself through the different data permission categories to understand what types of personal data Android apps can extract from you. Before allowing an app permissions ask yourself the following questions:\n\n- Do you trust the company that developed the app? Try searching for them online if you have not heard of them.\n- Does the app explain why it needs the data? Trustworthy apps often explain why they need each permission on Google Play Store.\n- Is the app asking for several permissions? By combining several data types a company can much more accurately track the users which can be valuable when for example selling ads.\n- Could you download another app instead that needs less of your data? Sometimes you have to pay to get the same functionality; how much do you value your privacy?";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('THE BIG PICTURE', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            child: template.textBoxWithPic(null, 'assets/protest.jpg', header1, 20, text1, 15, 150)
          ),
          new Container(
            child: template.boxxLeft(null, "assets/socialmedia.jpg", header2, text2),
          ),
          new Container(
            child: template.boxRight(null, "assets/cash.jpg", header3, text3),
          ),
          new Container(
            child: template.textBox(null, header4, 20, text4, 14, null)
          )
        ],
      ),
    );
  }
}
