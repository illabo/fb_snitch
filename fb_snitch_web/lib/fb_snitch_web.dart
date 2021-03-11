import 'dart:js_util';

import 'package:fb_snitch_platform_interface/fb_snitch_platform_interface.dart';
import 'package:fb_snitch_web/src/fb_wrapper.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the FbSnitchWeb plugin.
class FbSnitchWeb extends FbSnitchPlatform {
  static void registerWith(Registrar registrar) {
    FbSnitchPlatform.instance = FbSnitchWeb();
  }

  @override
  void initPixel(String pixelId) {
    callFacebookPixel(null, ['init', pixelId]);
  }

  @override
  void consent(bool granted) {
    final consentString = granted ? 'grant' : 'revoke';
    callFacebookPixel(null, ['consent', consentString]);
  }

  @override
  void dataProcessingOptions(List<String> options, int country, int state) {
    callFacebookPixel(
      null,
      [
        'dataProcessingOptions',
        jsify(options),
        country,
        state,
      ],
    );
  }

  @override
  void track(String eventName, Map<String, dynamic> parameters) {
    _trackCall('track', eventName, parameters);
  }

  @override
  void trackCustom(String eventName, Map<String, dynamic> parameters) {
    _trackCall('trackCustom', eventName, parameters);
  }

  void _trackCall(
    String trackType,
    String eventName,
    Map<String, dynamic> parameters,
  ) {
    List<dynamic> callParams = [trackType, eventName];
    if (parameters.isNotEmpty) {
      callParams.add(jsify(parameters));
    }
    callFacebookPixel(null, callParams);
  }
}
