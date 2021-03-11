import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_fb_snitch.dart';

abstract class FbSnitchPlatform extends PlatformInterface {
  FbSnitchPlatform() : super(token: _token);
  static final _token = Object();
  static FbSnitchPlatform _instance = MethodChannelFbSnitch();
  static FbSnitchPlatform get instance => _instance;
  static set instance(FbSnitchPlatform impl) {
    PlatformInterface.verifyToken(impl, _token);
    _instance = impl;
  }

  void initPixel(String pixelId);

  // true for granted and false for revoked.
  void consent(bool granted);

  void dataProcessingOptions(
    // use ['LDU'] for Limited Data Use in accordance with CCPA.
    List<String> options,
    // 0 to geolocate prior setting LDU, 1 to set region to USA.
    int country,
    // 0 to geolocate prior setting LDU, 1000 to set region to California (enabling CCPA LDU).
    int state,
  );

  void track(
    String eventName,
    Map<String, dynamic> parameters,
  );

  void trackCustom(
    String eventName,
    Map<String, dynamic> parameters,
  );
}
