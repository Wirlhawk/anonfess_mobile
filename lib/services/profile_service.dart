import 'package:anonfess_mobile/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  final _supabase = Supabase.instance.client;
  final _authService = AuthService();

  // Fetch the user's profile from Supabase
  Future<Map<String, dynamic>> getProfile() async {
    final user = _authService.getCurrentUser();

    // Fetch profile based on user ID
    return await _supabase
        .from('profiles')
        .select('*')
        .eq('id', user.id)
        .single();

    // Return the profile data
  }

  // Update a specific setting in the profile
  Future<void> updateSetting(String key, dynamic value) async {
    final profile = await getProfile();

    final Map<String, dynamic> settings = profile['settings'] ?? {};

    settings[key] = value;

    await _supabase.from('profiles').update({
      'settings': settings,
    }).eq('id', profile['id']);
  }
}
