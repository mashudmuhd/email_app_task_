

//method for getting first letter of email
String getEmailInitials(String email){
  List<String>parts = email.split("@");
  if(parts.isNotEmpty){
    String username = parts[0];
    String initial = username[0].toUpperCase();
    return initial;
  }
  return "?";
}
String splitNameFromEmail(String email) {
  return email.split('@')[0];
}

String splitNameEmail(String email) {
  List<String> parts= email.split("@");
  if(parts.length==2){
    List<String>domainParts = parts[1].split(".");
    if(domainParts.isNotEmpty){
      return domainParts[0];
    }
  }
  return "";
}