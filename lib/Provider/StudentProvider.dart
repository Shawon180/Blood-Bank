import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/Ui/Add%20Person.dart';

import '../Model/Student_Information_Model.dart';
import '../Repositories/StudentRepo/StudentRepo.dart';

final studentProvider= FutureProvider<List<StudentInformationModel>>((ref) => StudentRepo().getAllStudents());