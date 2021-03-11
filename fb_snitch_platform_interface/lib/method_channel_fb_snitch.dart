import 'fb_snitch_platform_interface.dart';

// No-Op by design.
class MethodChannelFbSnitch extends FbSnitchPlatform {
  @override
  void initPixel(String pixelId) {}

  @override
  void consent(bool granted) {}

  @override
  void dataProcessingOptions(
    List<String> options,
    int country,
    int state,
  ) {}

  @override
  void track(
    String eventName,
    Map<String, dynamic> parameters,
  ) {}

  @override
  void trackCustom(
    String eventName,
    Map<String, dynamic> parameters,
  ) {}
}
