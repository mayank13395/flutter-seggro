class MyHttpException implements Exception {

   final String message;

  MyHttpException(this.message);


 @override
  String toString() {
    // if (message == null) return "Exception";
    print("wwwwwwwwwwwwwwwwwwww");
    print(message);
    return message;   
    // return "Exception: $message";
  }
}