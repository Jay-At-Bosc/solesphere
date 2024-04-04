// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomInternetException implements Exception {
  final String title;
  final String message;
  CustomInternetException({
    required this.title,
    required this.message,
  });
}

class CustomException implements Exception {
  final String title;
  final String message;
  CustomException({
    required this.title,
    required this.message,
  });
}
