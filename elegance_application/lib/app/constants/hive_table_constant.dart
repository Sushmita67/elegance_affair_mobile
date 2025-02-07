class HiveTableConstant {
  HiveTableConstant._();

  // Login and Register Table Constants
  static const int loginTableId = 0;
  static const String loginBox = 'loginBox';

  static const int registerTableId = 1;
  static const String registerBox = 'registerBox';

  // For User Authentication or Session
  static const int userSessionTableId = 2;
  static const String userSessionBox = 'userSessionBox';

  // For storing user data after login/registration
  static const int userDataTableId = 3;
  static const String userDataBox = 'userDataBox';

  // Temporary data if needed (like pre-filled forms or session data)
  static const int tempDataTableId = 4;
  static const String tempDataBox = 'tempDataBox';

  // To store OTP or authentication tokens if necessary
  static const int otpTableId = 5;
  static const String otpBox = 'otpBox';

  static const int userTableId = 6;
  static const String userBox = 'userBox';

  // User
  static const int productTableId = 7;
  static const String productBox = 'productBox';

  static const int productModuleTableId = 8;
  static const String productModuleBox = 'productModuleBox';

  // static const int productTableId = 9;
  // static const String productBox = 'productBox';

  static const int paymentTableId = 10;
  static const String paymentBox = 'paymentBox';
}
