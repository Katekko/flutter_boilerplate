// HINT: Copy this file and create another one named config.dart, so you can use in the rest lib!

class ConfigEnvironments {
  // HINT: Change the current environments to change your current endPoint
  final String _currentEnvironments = 'dev';
  List<Map<String, String>> _availableEnvironments = [
    {'env': 'local', 'url': 'http://your.ip.here:5000/api/'},
    {'env': 'dev', 'url': 'https://reqres.in/api/'},
    {'env': 'hom', 'url': ''},
    {'env': 'prod', 'url': ''},
  ];

  Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
