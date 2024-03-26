class KontakService {
  final String baseUrl = "";
  final String endpoint = "people";

  Uri getUri(String path) {
    return Uri.parse("$baseUrl$path");
  }
}
