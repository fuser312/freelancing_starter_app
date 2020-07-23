import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'loading_screen.dart';
import 'ad_manager.dart';
import 'package:firebase_admob/firebase_admob.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  BannerAd _bannerAd;

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.top);
  }

  String _selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      //we wait for the dialog to return
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (d != null) //if the user has selected a date
      setState(() {
        // we format the selected date and assign it to the state variable
        _selectedDate = DateFormat('yyyy-MM-dd').format(d);
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
    );

    // TODO: Load a Banner Ad
    _loadBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: Dispose BannerAd object
    _bannerAd?.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Sample App"),
//      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/callings-of-night.png'),
                colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Get Currency Rates', style: TextStyle(fontSize: 36, color: Colors.white),),
              SizedBox(height: 32,),
              RaisedButton(
                child: Text("Choose Date", style: TextStyle(fontSize: 18),),
                onPressed: _loadBannerAd
              )
            ],
          ),
        ),
      ),
    );
  }
}
