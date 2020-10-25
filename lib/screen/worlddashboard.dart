import 'package:covid/worldcase.dart';
import 'package:flutter/material.dart';

class WorldDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "World COVID-19 tracker",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                      color: Color(0xffd9354f),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                ),
                Searchbox(),
                Header(),
                World(),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "By countries",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListbyCountries()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Country",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Center(
              child: Text("Confirmed",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child: Text("Recovered",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child: Text("Deaths",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}

class Searchbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[400]),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search by country name",
            border: InputBorder.none,
            icon: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Icon(Icons.subject),
            )),
      ),
    );
  }
}

class World extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: FutureBuilder(
        future: getGlobalcase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Card(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://png.pngtree.com/png-clipart/20200401/original/pngtree-globalized-bacteria-zoom-illustration-png-image_5339620.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          "World",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            snapshot.data.totalConfirmed.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "(+${(snapshot.data.newConfirmed.toString())})",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            snapshot.data.totalRecovered.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "(+${(snapshot.data.newRecovered.toString())})",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            snapshot.data.totalDeaths.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "(+${(snapshot.data.newDeaths.toString())})",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}

class ListbyCountries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FutureBuilder(
          future: getWorld(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: index % 2 == 0 ? Colors.grey : Colors.grey[200],
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Image.network(
                                "https://www.countryflags.io/${snapshot.data[index].countrycode}/flat/64.png",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                snapshot.data[index].country.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  snapshot.data[index].totalConfirmed
                                      .toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "(+${(snapshot.data[index].newConfirmed.toString())})",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  snapshot.data[index].totalRecovered
                                      .toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "(+${(snapshot.data[index].newRecovered.toString())})",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  snapshot.data[index].totalDeaths.toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "(+${(snapshot.data[index].newDeaths.toString())})",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return null;
          },
        ),
      ),
    );
  }
}
