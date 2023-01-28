import 'dart:convert';



import 'package:firebase_database/firebase_database.dart';

import '../../Model/Student_Information_Model.dart';

class StudentRepo {
  Future<List<StudentInformationModel>> getAllStudents() async {
    List<StudentInformationModel> studentList = [];
    await FirebaseDatabase.instance.ref('Student Information').orderByKey().get().then((value) {
      for (var element in value.children) {
        studentList.add(StudentInformationModel.fromJson(jsonDecode(jsonEncode(element.value))));
      }
    });
    return studentList;
  }
}