import 'package:just_do/app_const/app_exports.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('Tasks');
  SharedPreferences preferences = await SharedPreferences.getInstance();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await pathProvider.getApplicationSupportDirectory());
  final locale = preferences.getString('locale') ?? 'en';
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Future.delayed(const Duration(seconds: 3))
      .then((value) => {FlutterNativeSplash.remove()});
  runApp(MyApp(
    localeCode: locale,
  ));
}
