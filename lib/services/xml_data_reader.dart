library moteplatsen.services.xml_data_reader;

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:moteplatsen/constants.dart';
import 'package:moteplatsen/models/user.dart';
import 'package:logger/logger.dart';

/// Represents the XML data reader to fetch user data from the motesplatsen API.
/// 
/// Author: Shradha Shinde
class XmlDataReader {
  final Logger _logger = Logger();

  /// Fetches user data from the motesplatsen API.
  Future<List<User>> fetchUsers() async {
    final userList = <User>[];

    try {
      final response = await http.get(Uri.parse(ApiConstants.apiUrl));

      if (response.statusCode == 200) {
        final document = xml.XmlDocument.parse(response.body);
        final users = document.findAllElements('user');

        userList.addAll(users.map((user) {
          final username = user.getAttribute('username') ?? '';
          final sex = user.getAttribute('sex') ?? '';
          final age = int.tryParse(user.getAttribute('age') ?? '0') ?? 0;
          final municipality = user.getAttribute('municipality') ?? '';
          final provinceName = user.getAttribute('provinceName') ?? '';

          String pictureUrl = '';
          final pictureElements = user.findElements('pictureUrl');
          if (pictureElements.isNotEmpty) {
            pictureUrl = pictureElements.first.text;
          }

          return User(
            username: username,
            sex: sex,
            age: age,
            municipality: municipality,
            provinceName: provinceName,
            pictureUrl: pictureUrl,
          );
        }));

        userList.sort((a, b) => a.username.compareTo(b.username));
      } else {
        _logger.e('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      _logger.e('An error occurred: $e');
    }

    return userList;
  }
}
