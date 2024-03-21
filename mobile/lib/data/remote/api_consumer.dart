import 'package:http/http.dart' as http;

class ApiConsumer {
  factory ApiConsumer() {
    return _inst;
  }

  ApiConsumer._internal() : client = http.Client();

  static final ApiConsumer _inst = ApiConsumer._internal();

  final http.Client client;

  final String url = 'www.oubeid.com/login';

  final Map<String, String> headers = {
    "content-type": "application/json",
    "accept": "application/json",
    "language": "en"
  };

  Future<void> login(email, password) async {
    final _data = {'email': email, 'password': password};
    // get the result in result var
    http.Response response = await client.get(Uri.parse(url));

    response.headers;
    response.body;
    Map<String, dynamic>;  ==> LoginResponse

    // we must serialize the the result to from json to an adequat format get

    return;
  }

  Future<void> register(
      userName, contactNumber, email, password, profilePicture) async {
    final _data = {
      'user_name': userName,
      'mobile_number': contactNumber,
      'email': email,
      'password': password,
      'profile_picture': profilePicture
    };
    // nafs l chy lenna ame post method

    return;
  }
}


class LoginResponse {

}