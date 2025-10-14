class Logger {
  void log(String message, {String level = 'INFO'}) {
    final timestamp = DateTime.now().toIso8601String();
    print('[$level] $timestamp: $message');
  }
}
