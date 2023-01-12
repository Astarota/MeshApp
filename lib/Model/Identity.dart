class Identity
{
  String guid;
  String displayName;
  String username;
  String password;  

  String get name 
  {
    return displayName ?? username;
  }

  Map toJson() => {
        'displayName': displayName,
        'guid': guid,
        'root': username,
        'admin': password,
      };
      
      static Identity fromJson(Map<String, dynamic> json){
         var i = Identity();
         i.guid = json['guid'].toString();
         i.username = json['root'].toString();
         i.displayName = json['displayName'].toString();
         i.password = json['admin'].toString();
         return i;         
       }
}