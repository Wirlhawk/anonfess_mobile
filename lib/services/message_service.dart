import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessageService {
  final _supabase = Supabase.instance.client;

  Future<List<dynamic>> getAllMessage() async {
    final userID = _supabase.auth.currentSession?.user.id;
    debugPrint(userID);
    return await _supabase.from("messages").select('id').eq("user_id", userID!);
  }

  Future getMessage(id) async {
    return await _supabase.from('messages').select('*').eq('id', id).single();
  }
}
