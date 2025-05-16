class Validator {

  static bool isValidEmail(String email) {
    String emailPattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regExp = RegExp(emailPattern);

    return regExp.hasMatch(email);
  }

  static bool isEmptyOrNull(String value) {
    if(value =="" || value.isEmpty){
      return true;
    }else{
      return false;
    }
  }


  static bool validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value.length < 7) {
      return false;
    } else if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool validateConfirmPassword({required String newPassword, required String confirmPassword}) {
    return newPassword == confirmPassword;
  }

  static validateName(String value) {
    if (value.isEmpty && value.length < 2) {
      return false;
    }
    return true;
  }

}
