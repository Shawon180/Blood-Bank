class StudentInformationModel {

  String? studentName;
  String? fathersName;
  String? mothersName;
  String? dateOfBirth;
  dynamic rollNumber;
  String? studentId;
  String? instituteName;
  String? pictureUrl;
  String? studentGroup;

  String? className;
  String? Blood;
  String? emergencyContactNumber;



  StudentInformationModel({
    this.studentName,
    this.fathersName,
    this.mothersName,
    this.dateOfBirth,
    this.rollNumber,
    this.studentId,
    this.instituteName,
    this.pictureUrl,
    this.studentGroup,

    this.className,
    this.Blood,
    this.emergencyContactNumber
  });

  StudentInformationModel.fromJson(dynamic json) {
    studentName = json['studentName'];
    fathersName = json['fathersName'];
    mothersName = json['mothersName'];
    dateOfBirth = json['dateOfBirth'];
    rollNumber = json['rollNumber'];
    studentId = json['studentId'];
    instituteName = json['instituteName'];
    pictureUrl = json['pictureUrl'];
    studentGroup = json['studentGroup'];

    className = json['className'];
    Blood = json['Blood'];
    emergencyContactNumber = json['emergencyContactNumber'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['studentName'] = studentName;
    map['fathersName'] = fathersName;
    map['mothersName'] = mothersName;
    map['dateOfBirth'] = dateOfBirth;
    map['rollNumber'] = rollNumber;
    map['studentId'] = studentId;
    map['instituteName'] = instituteName;
    map['pictureUrl'] = pictureUrl;
    map['studentGroup'] = studentGroup;

    map['className'] = className;
    map['Blood'] = Blood;
    map['emergencyContactNumber'] = emergencyContactNumber;
    return map;
  }
}