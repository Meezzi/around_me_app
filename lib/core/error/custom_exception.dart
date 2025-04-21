class CustomException implements Exception {
  final int? errorCode;
  final String errorMessage;

  CustomException({
    required this.errorCode,
    required this.errorMessage,
  });
}
