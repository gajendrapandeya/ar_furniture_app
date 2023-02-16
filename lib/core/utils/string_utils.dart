/// Extension for String
extension StringUtils on String {
  /// Captializes first letter of String
  /// Eg: 'hello' -> 'Hello'
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  ///Capitalized the given string
  ///Eg: 'hello world' -> 'HelloWorld'
  String toTitleCase() {
    final title = replaceAllMapped(RegExp('[_ -]'), (match) => ' ');
    return title.split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Returns initial letter from given string
  /// Eg: 'Narendra Bhatta' -> 'NB'
  String initials() {
    return split(' ').map((e) => e[0].toUpperCase()).join();
  }
}
