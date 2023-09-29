class ValidationHelpers {
  static String? checkISNullOrEmpty(String? inputText) {
    if (inputText == null || inputText.isEmpty || inputText.trim().isEmpty) {
      return "Enter Valid Data";
    }
    return null;
  }

  static String? validateEmail(String? inputText) {
    String? nullableEmail = checkISNullOrEmpty(inputText);
    if (nullableEmail != null) {
      return nullableEmail;
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(inputText!);

    if (!emailValid) {
      return 'Invalid Email';
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    String? nullablePassword = checkISNullOrEmpty(password);
    if (nullablePassword != null) {
      return nullablePassword;
    }
    final bool validPassword =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password!);

    if (!validPassword) {
      return 'invalid Password';
    }

    return null;
  }
}
