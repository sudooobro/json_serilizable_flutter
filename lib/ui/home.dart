import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_serializable_guide/modals/user.dart';

const NESTED_JSON =
    '[{"name":"User One","phone":"77777777","subscription":true,"address":{"street":"some street","landmark":"some landmark","city":"some city","state":"some state"}},{"name":"User One","phone":"77777777","subscription":true,"address":{"street":"some street","landmark":"some landmark","city":"some city","state":"some state"}},{"name":"User One","phone":"77777777","subscription":true,"address":{"street":"some street","landmark":"some landmark","city":"some city","state":"some state"}},{"name":"User One","phone":"77777777","subscription":true,"address":{"street":"some street","landmark":"some landmark","city":"some city","state":"some state"}},{"name":"User One","phone":"77777777","subscription":true,"address":{"street":"some street","landmark":"some landmark","city":"some city","state":"some state"}},{"name":"User One","phone":"77777777","subscription":true,"address":{"street":"some street","landmark":"some landmark","city":"some city","state":"some state"}}]';

class MyHomeClass extends StatelessWidget {
  Future<List<User>> getDataFromFakeUser() async {
    return await Future.delayed(Duration(seconds: 2), () {
      List<dynamic> data = jsonDecode(NESTED_JSON);
      List<User> users = data.map((data) => User.fromJson(data)).toList();
      return users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder<List<User>>(
          future: getDataFromFakeUser(),
          builder: (context, data) {
            if (data.connectionState != ConnectionState.waiting &&
                data.hasData) {
              var userList = data.data;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  var userData = userList[index];
                  return ExpansionTile(
                    key: Key("$index"),
                    title: Text(userData.name ?? ""),
                    subtitle: Text(userData.phone ?? ""),
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text("Street: ${userData.address.street}"),
                              Text("Street: ${userData.address.landmark}"),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
