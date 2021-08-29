import 'package:demo/pages/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key key}) : super(key: key);

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  bool search = true;

  String val;

  void initState() {
    context.read<HomeBloc>().add(LoadHomeEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is NotFoundState) {}
        if (state is HomeSearchLoadedState) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                    height: MediaQuery.of(context).size.height * .32,
                    width: MediaQuery.of(context).size.height * .9,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 55, left: 25),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<HomeBloc>().add(LoadHomeEvent());
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 55.0, left: 23),
                              child: Text(
                                "GST Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 52.0, left: 26),
                          child: Text.rich(TextSpan(
                              style: TextStyle(color: Colors.white),
                              text: 'GSTIN of the Tax Payer \n\n ',
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '${state.welcome.GSTINNumber}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 16),
                          child: Container(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "${state.welcome.status}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28))),
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                  child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 28, bottom: 20),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 22.0, left: 24, bottom: 20),
                    child: Text.rich(TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: 'Address : \n ',
                        children: <InlineSpan>[
                          TextSpan(
                            text: '${state.welcome.address}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800),
                          ),
                        ])),
                  ),
                ],
              )),
              Container(
                  child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 30, bottom: 20),
                    child: Icon(
                      Icons.account_balance,
                      color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 22.0, left: 24, bottom: 20),
                    child: Text.rich(TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: 'Floor : \n ',
                        children: <InlineSpan>[
                          TextSpan(
                            text: '${state.welcome.Floor}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800),
                          ),
                        ])),
                  ),
                ],
              )),
              SizedBox(
                height: 33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 67,
                    width: 84,
                    child: Text.rich(TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: 'state  \n\n ',
                        children: <InlineSpan>[
                          TextSpan(
                            text: '${state.welcome.StateJurisdiction}',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ])),
                  ),
                  Container(
                    height: 67,
                    width: 97,
                    child: Text.rich(TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: 'Court  \n\n ',
                        children: <InlineSpan>[
                          TextSpan(
                            text: '${state.welcome.CourtJusritiction}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ])),
                  ),
                  Container(
                    height: 67,
                    width: 104,
                    child: Text.rich(TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: 'Tax Payer Type  \n\n ',
                        children: <InlineSpan>[
                          TextSpan(
                            text: '${state.welcome.taxpayertype}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ])),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, left: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.height * .9,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: 'Contribution of business  \n\n ',
                        children: <InlineSpan>[
                          TextSpan(
                            text: '${state.welcome.bussinesstype}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ])),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 26, left: 10, right: 10, bottom: 15),
                child: Container(
                  width: MediaQuery.of(context).size.height * .9,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 67,
                        width: 200,
                        child: Text.rich(TextSpan(
                            style: TextStyle(color: Colors.black),
                            text: 'Date of registration  \n\n ',
                            children: <InlineSpan>[
                              TextSpan(
                                text: '${state.welcome.dateOfRegistration}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ])),
                      ),
                      Container(
                        height: 67,
                        width: 144,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 78.0, top: 10),
                          child: Text.rich(TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: 'Date  \n\n ',
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '  --',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17.0),
                child: Container(
                  //color: Colors.amber,
                  height: MediaQuery.of(context).size.height * .12,
                  width: MediaQuery.of(context).size.height * .9,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              "Get Return Filing Status",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          height: 50,
                          width: MediaQuery.of(context).size.height * .9,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * .35,
                  width: MediaQuery.of(context).size.height * .9,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 45, left: 350),
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 52.0, left: 26),
                        child: Text.rich(TextSpan(
                            style: TextStyle(color: Colors.white),
                            text: 'Select the type for \n\n ',
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'GST Search Tool',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 46.0, right: 14, left: 14),
                        child: Container(
                          child: Padding(
                              padding: const EdgeInsets.all(2.7),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          search = true;
                                        });
                                      },
                                      child: Container(
                                        width: 176,
                                        height: 70,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Seach GST Number",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: (search)
                                                ? Colors.white
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(28))),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          search = false;
                                        });
                                      },
                                      child: Container(
                                        width: 177,
                                        height: 70,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Seach Return Status",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: (!search)
                                                ? Colors.white
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(28))),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28))),
                          height: 50,
                          width: MediaQuery.of(context).size.height * .9,
                        ),
                      )
                    ],
                  )),
            ),
            Container(
//color: Colors.amber,
              height: MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.height * .9,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60.0, left: 20, right: 200),
                    child: Text(
                      "Enter GST Number ",
                      style: TextStyle(color: Colors.black26, fontSize: 17),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Ex: 07AACCM9910C1ZP'),
                            onChanged: (value) {
                              val = value;
                            }),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      height: 50,
                      width: MediaQuery.of(context).size.height * .9,
                    ),
                  ),
                  if (state is NotFoundState)
                    Text(
                      "Enter Valid GSTIN Number",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                      // textAlign: TextAlign.center,
                    ),
                  Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: GestureDetector(
                        onTap: () {
                          context.read<HomeBloc>().add(SearchWelcomeEvent(val));
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              "Search",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          height: 50,
                          width: MediaQuery.of(context).size.height * .9,
                        ),
                      )),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
