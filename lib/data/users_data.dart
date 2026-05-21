import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UsersData {
  static const String _key =
      'users_list';

  // ✅ اليوزرات الافتراضية
  static final List<
    Map<
      String,
      dynamic
    >
  >
  _defaultUsers = [
    {
      'email':
          'admin@fodtrack.com',
      'password':
          '123456',
      'name':
          'Admin',
      'isAdmin':
          true,
    },
    {
      'email':
          'user1@fodtrack.com',
      'password':
          '123456',
      'name':
          'User 1',
      'isAdmin':
          false,
    },
    {
      'email':
          'user2@fodtrack.com',
      'password':
          '123456',
      'name':
          'User 2',
      'isAdmin':
          false,
    },
    {
      'email':
          'youssif@fod.com',
      'password':
          '123456',
      'name':
          'Youssif',
      'isAdmin':
          false,
    },
    {
      'email':
          'youssif1@fod.com',
      'password':
          '123456',
      'name':
          'Youssif',
      'isAdmin':
          false,
    },
  ];

  static List<
    Map<
      String,
      dynamic
    >
  >
  _users =
      [];

  // ✅ تحميل اليوزرات من الذاكرة
  static Future<
    void
  >
  loadUsers() async {
    final prefs =
        await SharedPreferences.getInstance();
    final String? data = prefs.getString(
      _key,
    );

    if (data ==
        null) {
      // أول مرة — احفظ الافتراضيين
      _users = List.from(
        _defaultUsers,
      );
      await _saveUsers();
    } else {
      final List<
        dynamic
      >
      decoded = jsonDecode(
        data,
      );
      _users =
          decoded
              .map(
                (
                  e,
                ) => Map<
                  String,
                  dynamic
                >.from(
                  e,
                ),
              )
              .toList();
    }
  }

  // ✅ حفظ اليوزرات في الذاكرة
  static Future<
    void
  >
  _saveUsers() async {
    final prefs =
        await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(
        _users,
      ),
    );
  }

  // ✅ جيب اليوزرات
  static List<
    Map<
      String,
      dynamic
    >
  >
  get users =>
      _users;

  // ✅ Login
  static Map<
    String,
    dynamic
  >?
  login(
    String email,
    String password,
  ) {
    try {
      return _users.firstWhere(
        (
          user,
        ) =>
            user['email'] ==
                email.trim().toLowerCase() &&
            user['password'] ==
                password.trim(),
      );
    } catch (
      e
    ) {
      return null;
    }
  }

  // ✅ إضافة يوزر
  static Future<
    void
  >
  addUser(
    Map<
      String,
      dynamic
    >
    user,
  ) async {
    _users.add(
      user,
    );
    await _saveUsers();
  }

  // ✅ تعديل يوزر
  static Future<
    void
  >
  updateUser(
    int index,
    Map<
      String,
      dynamic
    >
    user,
  ) async {
    _users[index] =
        user;
    await _saveUsers();
  }

  // ✅ مسح يوزر
  static Future<
    void
  >
  deleteUser(
    int index,
  ) async {
    _users.removeAt(
      index,
    );
    await _saveUsers();
  }
}
