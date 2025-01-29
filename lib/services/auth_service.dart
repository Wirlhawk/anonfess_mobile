import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUpwithEmailPassword(
    String username,
    String email,
    String password,
  ) async {
    // check if username already exist
    final usernameExist = await _supabase
        .from('profiles')
        .select('username')
        .ilike('username', username);

    if (usernameExist.isNotEmpty) {
      throw Exception("Username already exist");
    }

    final userData = await _supabase.auth.signUp(
      email: email,
      password: password,
    );

    final userID = userData.user?.id;

    await _supabase
        .from('profiles')
        .upsert({'id': userID, 'username': username});

  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  String? getCurrentUser() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
