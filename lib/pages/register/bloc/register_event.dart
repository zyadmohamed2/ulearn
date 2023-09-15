abstract class RegisterEvent{
  const RegisterEvent();
}
class userNameEvent extends RegisterEvent{
  final String userName;
  const userNameEvent(this.userName);
}
class emailEvends extends RegisterEvent{
  final String email;
  const emailEvends(this.email);
}
class passwordEvends extends RegisterEvent{
  final String password;
  const passwordEvends(this.password);
}
class repasswordEvent extends RegisterEvent{
  final String repassword;
  const repasswordEvent(this.repassword);
}