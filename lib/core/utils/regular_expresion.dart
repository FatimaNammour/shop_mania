class RegularExp {
  /// Username regex
  /// Requires minimum 3 character
  /// Allowing "_" and "." in middle of name
  static String username = r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$';
}
