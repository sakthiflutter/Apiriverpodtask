import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/listrepomodels.dart';
import '../service/apiservice.dart';

final repoDataProvider = FutureProvider<Repomodeldata>((ref) async {
  return ref.watch(repoprovider).getRepo();
});