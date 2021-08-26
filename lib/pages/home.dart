import 'package:demo/models/gst-info.dart';
import 'package:demo/services/api_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Welcome>> _gstinfo;
  Widget appBarTitle = new Text(
    "Search Sample",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  bool _IsSearching;
  String _searchText = "";
  TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    _gstinfo = ApiManager().getNews();

    super.initState();
  }

  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = new Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = new TextField(
                    controller: _searchQuery,
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)),
                  );
                  //  _handleSearchStart();
                } else {
                  //_handleSearchEnd();
                }
              });
            },
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: FutureBuilder<List<Welcome>>(
          future: _gstinfo,
          builder: (context, snapshot) {
            print(snapshot.data.toString());
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Welcome welcome = snapshot.data[index];

                    return ListTile(
                      onTap: () {},
                      title: Text(
                        "${welcome.name} ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      subtitle: Text(
                        '${welcome.address} \n Status : ${welcome.status}\nBusiness Type : ${welcome.bussinesstype}\n',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        //textAlign: TextAlign.center,
                      ),
                      trailing: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xfffc0b7b),
                                const Color(0xff7820ad)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            ' date of Registration\n${welcome.dateOfRegistration}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  });
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
