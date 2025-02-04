import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mother_ai/pages/onboarding_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mother_ai/model/milestone.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(MilestoneAdapter());
  await Hive.openBox<Milestone>('milestones');
  await Hive.openBox<Milestone>('fixed_milestones');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:OnboardingPage(),
    );
  }
}


