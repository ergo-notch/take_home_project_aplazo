import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';

class IsarService {
  static Future<Isar> provideIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [RecipeEntitySchema],
      directory: dir.path,
    );
    return isar;
  }
}
