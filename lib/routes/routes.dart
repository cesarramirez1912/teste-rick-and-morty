import 'package:get/get.dart';
import 'package:teste_rick_morty/screens/episode_detail_screen.dart';
import 'package:teste_rick_morty/screens/home_screen.dart';

class RoutesManager {
  static const String HOME = '/home';
  static const String EPISODE_DETAIL = '/episode_detail';

  static List<GetPage> getRoutes() => [
    GetPage(name: HOME, page: () => HomeScreen()),
    GetPage(name: EPISODE_DETAIL, page: () => EpisodeDetailScreen()),
  ];
}
