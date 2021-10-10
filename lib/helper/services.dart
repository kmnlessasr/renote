import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'
as http; // add the http plugin in pubspec.yaml file.
import 'student.dart';

class Services {
  static const ROOT = 'http://kmnlessasr.atwebpages.com/connection.php';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_STU_ACTION = 'ADD_STU';
  static const _ADD_BOK_ACTION = 'ADD_BOK';
  static const _UPDATE_STU_ACTION = 'UPDATE_STU';
  static const _DELETE_STU_ACTION = 'DELETE_STU';

  // Method to create the table Students.
  static Future<String> createTable() async {
    try {
      // add the parameters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<Student>> getStudents() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getStudents Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Student> list = parseResponse(response.body);
        return list;
      } else {
        return List<Student>();
      }
    } catch (e) {
      return List<Student>(); // return an empty list on exception/error
    }
  }

  static List<Student> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Student>((json) => Student.fromJson(json)).toList();
  }

  // Method to add Student to the database...
  static Future<String> addStudent(
      String name, String city, String university, String year, int universityNumber
      )
  async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_STU_ACTION;
      map['name'] = name;
      map['city'] = city;
      map['year'] = year;
      map['university'] = university;
      map['universityNumber'] = universityNumber.toString();
      final response = await http.post(ROOT, body: map);
      print('addStudent Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error $e";
    }
  }

  // Method to add book to the database...
  static Future<String> addBook(
      universityNumber, bookName, doctorName, bookCase, pageNumber, rasoor, notes
      )
  async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_BOK_ACTION;
      map['universityNumber'] = universityNumber.toString();
      map['bookName'] = bookName;
      map['doctorName'] = doctorName;
      map['bookCase'] = bookCase;
      map['pageNumber'] = pageNumber.toString();
      map['rasoor'] = rasoor;
      map['notes'] = notes;
      final response = await http.post(ROOT, body: map);
      print('addBook Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error $e";
    }
  }

  // Method to update an Student in Database...
  static Future<String> updateStudent(
      String name, String city, String university, String year, int universityNumber
      ) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_STU_ACTION;
      map['name'] = name;
      map['city'] = city;
      map['year'] = city;
      map['university'] = city;
      map['univesrityNumber'] = universityNumber;
      final response = await http.post(ROOT, body: map);
      print('updateStudent Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to Delete an Student from Database...
  static Future<String> deleteStudent(String universityNumber) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_STU_ACTION;
      map['univesrityNumber'] = universityNumber;
      final response = await http.post(ROOT, body: map);
      print('deleteStudent Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }
}
