import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequests {


    static Future<List<Classes>> getClasses() async {
        List<Classes> classes;

        var response = await http.get("https://mbdev.umea-ntig.se/api/classes/get");

        classes = (json.decode(response.body) as List)
            .map((data) => new Classes.fromJson(data))
            .toList();

        print("test ${classes[0].className}");

        return classes;
    }

    static sendDataRequest(String data) async {
        //Map<String, String> headers = {"Content-type": "application/json"};

        var response = await http.post("https://mbdev.umea-ntig.se/api/feedback/store", body: data);

        int statusCode = response.statusCode;

        String body = response.body;

        print ("Code: $statusCode, Body: $body");

    }

    static String formatData(int classId, String userId, String diet, int rating,
        [bool staffInformed, String cause, String extraFeedback]) {
        String json =
            '{"class": "$classId",'
            ' "user": "$userId",'
            ' "diet": "$diet",'
            ' "rating": "$rating",'
            ' "staff_informed": "$staffInformed",'
            ' "cause": "$cause",'
            ' "additional_feedback": "$extraFeedback"}';
        return json;
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
