import 'package:flutter/material.dart';
import 'package:moteplatsen/services/xml_data_reader.dart';
import 'package:moteplatsen/models/user.dart';

/// Represents the user list page.
///
/// Author: Shradha Shinde
class UserListPage extends StatefulWidget {
  const UserListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final XmlDataReader _xmlDataReader = XmlDataReader();
  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  /// Fetches user data from the motesplatsen API.
  Future<void> fetchData() async {
    final users = await _xmlDataReader.fetchUsers();
    setState(() {
      userList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: userList.isNotEmpty
          ? ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];
                return ListTile(
                  leading: Image.network(user.pictureUrl),
                  title: Text(user.username),
                  subtitle: Text('${user.sex}, ${user.age} years'),
                  trailing: Text(user.municipality),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
