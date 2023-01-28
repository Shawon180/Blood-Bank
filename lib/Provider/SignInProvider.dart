
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Repositories/SignIn_repo/SignIn.dart';

final signInProvider = ChangeNotifierProvider((ref) => SignInRepo());