class ValidForm{

  bool isEmail(String email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }
  static Function req(String msj) {
    return (var value) {
      if (value == null ||
          value == false ||
          ((value is Iterable || value is String || value is Map) &&
              value.length == 0)) {
        return msj;
      }
      return null;
    };
  }
}