class ErrorMiddleware {
  void handleError(Exception error) {
    // Enhanced error handling logic
    print('Error occurred: ${error.toString()}');
  }
}
