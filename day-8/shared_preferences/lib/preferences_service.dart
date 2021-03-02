import 'models.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class PreferecencesService {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getIntance();

    await preferences.setString('username', settings.username);
    await preferences.setBool('isEmployed', settings.isEmployed);
    await preferences.setInt('gender', settings.gender.index);
    await preferences.setString(
        'programmingLanguages',
        settings.programmingLanguages
            .map((lang) => lang.index.toString())
            .toList());

    print('Saved Settings');
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferecences.getInstance();

    final username = preferences.getString('username');
    final _isEmployed = preferences.getBool('_isEmployed');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];

    final programmingLanguagesIndicies =
        preferences.getStringList('programmingLanguages');

    final programmingLanguages = programmingLanguagesIndicies
        .map(
            (stringIndex) => ProgrammingLanguage.values[int.parse(stringIndex)])
        .toSet();

    return Settings(
        username: username,
        gender: gender,
        programmingLanguages: programmingLanguages,
        isEmployed: _isEmployed);
  }
}
