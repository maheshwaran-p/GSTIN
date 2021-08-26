import 'dart:async';

import 'package:appbar_textfield/appbar_textfield.dart';
import 'package:demo/models/gst-info.dart';
import 'package:demo/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GSTIN Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future<List<Welcome>> _gstinfo;
  List<Welcome> _allContacts = List<Welcome>();
  StreamController<List<Welcome>> _contactStream =
      StreamController<List<Welcome>>();

  @override
  void initState() {
    _gstinfo = ApiManager().getNews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTextField(
          title: Text("Contacts"),
          onBackPressed: _onRestoreAllData,
          onClearPressed: _onRestoreAllData,
          onChanged: _onSearchChanged,
        ),
        body: _buildBody());
  }

  void _onSearchChanged(String value) {
    List<Welcome> foundContacts = _allContacts
        .where((Welcome contact) =>
            contact.name.toLowerCase().indexOf(value.toLowerCase()) > -1)
        .toList();

    this._contactStream.add(foundContacts);
  }

  void _onRestoreAllData() {
    this._contactStream.add(this._allContacts);
  }

  Widget _buildBody() {
    return FutureBuilder<List<Welcome>>(
        future: _gstinfo,
        // stream: _contactStream.stream,
        builder: (context, snapshot) {
          List<Welcome> contacts = snapshot.hasData ? snapshot.data : [];
          print("hiiiiiiiiiiiiiiiii");
          print(snapshot.data);
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              var contact = contacts[index];
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Text(
                      contact.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                subtitle: Text(
                    " Address: ${contact.address.toString()}\n Business Type: ${contact.bussinesstype.toString()}\n Tax Payer Type: ${contact.taxpayertype.toString()}\n Date of Registration: ${contact.dateOfRegistration.toString()}\n",
                    style: TextStyle(color: Colors.black54, fontSize: 16)),
              );
            },
          );
        });
  }

  @override
  void dispose() {
    _contactStream.close();
    super.dispose();
  }
}
