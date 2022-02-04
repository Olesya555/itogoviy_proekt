import 'dart:async';
import 'package:itogoviy_proekt/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:itogoviy_proekt/user_class.dart';


class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<UserList> futureUserList;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    futureUserList = fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: appBar(),
        drawer: navDrawer(context),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: FutureBuilder<UserList>(
              future: futureUserList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data!.items.length,
                      itemBuilder:(BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: (_selectedIndex == index ?
                                  Theme.of(context).primaryColor
                                  :(index % 2 == 1 ?
                                    Theme.of(context).primaryColor.withOpacity(0.30):
                                    Theme.of(context).primaryColor.withOpacity(0.10))),
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                    child: Text(snapshot.data!.items[index].id.toString(),
                                      style: Theme.of(context).textTheme.bodyText2,)
                                ),
                                Expanded(
                                  flex: 4,
                                    child: Text(snapshot.data!.items[index].name,
                                      style: Theme.of(context).textTheme.bodyText1,)
                                ),
                                Expanded(
                                  flex: 6,
                                    child: Text(snapshot.data!.items[index].email,
                                      style: Theme.of(context).textTheme.caption, textAlign: TextAlign.right,)
                                ),
                              ],
                            ),
                            selected: index == _selectedIndex,
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              Navigator.pushNamed(
                                  context, '/tasks',
                                arguments: snapshot.data!.items[index].id
                              );
                            },
                          ),
                        );
                      },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                return const CircularProgressIndicator();
              }
            ),
          ),
        ),
      );
  }
}

