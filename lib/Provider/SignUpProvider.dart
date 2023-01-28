import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Repositories/SignUp_repo/signUp.dart';

final signUpProvider = ChangeNotifierProvider((ref) => SignUpRepo());