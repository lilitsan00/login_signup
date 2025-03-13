extension StringAddition on String? {
  String? passwordValidator() {
    final value = this;
    return (value == null || value.length < 6)
        ? 'Password must be at least 6 characters'
        : null;
  }

  String? usernameValidator() {
    final value = this;
    return (value == null || value.isEmpty) ? 'Enter username' : null;
  }

  String? emailValidator() {
    final value = this;
    return (value == null || !value.contains("@"))
        ? 'Enter a valid email'
        : null;
  }
}
