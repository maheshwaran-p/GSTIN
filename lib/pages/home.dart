import 'dart:async';

import 'package:appbar_textfield/appbar_textfield.dart';
import 'package:demo/models/gst-info.dart';
import 'package:demo/pages/bloc/home_bloc.dart';
import 'package:demo/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // _gstinfo = ApiManager().getNews();
    context.read<HomeBloc>().add(LoadHomeEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTextField(
          title: Text("GST finder"),
          onBackPressed: _buildBody,
          onClearPressed: _buildBody,
          onChanged: (value) =>
              context.read<HomeBloc>().add(SearchWelcomeEvent(value)),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadedState) {
              return ListView.builder(
                itemCount: state.welcomeList.length,
                itemBuilder: (context, index) {
                  var contact = state.welcomeList[index];
                  return ListTile(
                    title: Expanded(
                      child: Text(
                        contact.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    subtitle: Text(
                        " \n GSTIN: ${contact.GSTINNumber.toString()}\n Address: ${contact.address.toString()}\n Business Type: ${contact.bussinesstype.toString()}\n Tax Payer Type: ${contact.taxpayertype.toString()}\n Date of Registration: ${contact.dateOfRegistration.toString()}\n",
                        style: TextStyle(color: Colors.black54, fontSize: 16)),
                  );
                },
              );
            }
            if (state is NotFoundState)
              return Container(
                child: Center(
                    child: Text("Enter Valid GSTIN Number!",
                        style: TextStyle(color: Colors.red))),
              );
            if (state is HomeSearchLoadedState) {
              print('hiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
              print(state.welcome.GSTINNumber.toString());
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      "${state.welcome.name}",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                          " GSTIN: ${state.welcome.GSTINNumber}\n Address: ${state.welcome.address}\n Business Type: ${state.welcome.bussinesstype}\n Tax Payer Type: ${state.welcome.taxpayertype}\n Date of Registration: ${state.welcome.dateOfRegistration}\n",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 16)),
                    ),
                  ),
                ],
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  void _onSearchChanged(String value) {}

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
                title: Expanded(
                  child: Text(
                    contact.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                subtitle: Text(
                    " \n GSTIN: ${contact.GSTINNumber.toString()}\n Address: ${contact.address.toString()}\n Business Type: ${contact.bussinesstype.toString()}\n Tax Payer Type: ${contact.taxpayertype.toString()}\n Date of Registration: ${contact.dateOfRegistration.toString()}\n",
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
