class AuthRepository{
  Future<bool> authenticate(String email, String password) async{
    if(email == 'aswin0484@gmail.com' && password == 'Aswin@123'){
      return true;
    }
    return false;
  }
}