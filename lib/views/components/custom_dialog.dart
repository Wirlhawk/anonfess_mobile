import 'package:anonfess_mobile/models/settings.dart';
import 'package:anonfess_mobile/services/profile_service.dart';
import 'package:anonfess_mobile/views/components/neu_card.dart';
import 'package:flutter/material.dart';

class TodoFormWidget extends StatefulWidget {
  TodoFormWidget({super.key});

  @override
  _TodoFormWidgetState createState() => _TodoFormWidgetState();
}

class _TodoFormWidgetState extends State<TodoFormWidget> {
  final _profileService = ProfileService();

  late Settings _settings;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: NeuCard(child: _buildSettingForm()),
      ),
    );
  }

  Widget _buildSettingForm() {
    return FutureBuilder(
      future: _profileService.getProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        // Error
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        final profile = snapshot.data!;
        _settings = Settings.fromJson(profile['settings']);

        debugPrint(_settings.toString());

        return Column(
          children: [
            _buildSettingItem(_settings.from, "from", (value) {
              setState(() {
                _settings.from = value;
              });
              _updateSetting("from", value);
            }),
            _buildSettingItem(_settings.to, "to", (value) {
              setState(() {
                _settings.to = value;
              });
              _updateSetting("to", value);
            }),
            _buildSettingItem(_settings.message, "message", (value) {
              setState(() {
                _settings.message = value;
              });
              _updateSetting("message", value);
            }),
            _buildSettingItem(_settings.music, "music", (value) {
              setState(() {
                _settings.music = value;
              });
              _updateSetting("music", value);
            }),
          ],
        );
      },
    );
  }

  Widget _buildSettingItem(
      bool settingItem, String label, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      value: settingItem,
      onChanged: onChanged,
      title: Text(label),
    );
  }

  // Update the setting in Supabase
  void _updateSetting(String key, bool value) async {
    await _profileService.updateSetting(key, value);
  }
}
