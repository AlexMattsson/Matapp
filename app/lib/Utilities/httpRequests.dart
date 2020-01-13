import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequest {

    static Future<List<Classes>> getClasses() async {
        List<Classes> classes;

        var response = await http.get("https://mbdev.umea-ntig.se/api/classes/get?access_key=OXZHmKDD1lpdW2A89BtT81ZirL1OFZDeLYChPm1YjYNpzT7acMi3oHgPkl5cShDs");
        print(response.body);
        classes = (json.decode(response.body) as List)
            .map((data) => new Classes.fromJson(data))
            .toList();

        print("Big test $classes");
        return classes;
    }

    static sendFeedback(Map<String, dynamic> data) async {


        Map<String, String> headers = {"Content-type": "application/json"};

        print(data);
        var response = await http.post(
            "https://mbdev.umea-ntig.se/api/feedback/store?access_key=OXZHmKDD1lpdW2A89BtT81ZirL1OFZDeLYChPm1YjYNpzT7acMi3oHgPkl5cShDs",
            headers: headers,
            body: json.encode(data));

        int statusCode = response.statusCode;

        String body = response.body;

        print ("Code: $statusCode, Body: $body");
        return response;
    }
}

class Classes {
    final int id;
    final String className;

    Classes({this.id, this.className});

    factory Classes.fromJson(Map<String, dynamic> json) {
        return new Classes(
            id: json['id'],
            className: json['name'],
        );
    }
}
