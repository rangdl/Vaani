import 'package:hive/hive.dart';
import 'package:vaani/globals.dart';

import 'register_models.dart';

// does the initial setup of the storage
Future initStorage() async {
  // final dir = await getApplicationDocumentsDirectory();

  // // use vaani as the directory for hive
  // final storageDir = Directory(
  //   p.join(dir.path, appName),
  // );
  // await storageDir.create(recursive: true);

  Hive.defaultDirectory = appDocumentsDir.path;
  appLogger.config('Hive storage directory init: ${Hive.defaultDirectory}');

  await registerModels();
}
