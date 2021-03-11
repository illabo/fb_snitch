@JS()
library fb_snitch;

import 'package:js/js.dart';

@JS('fbq.apply')
external void callFacebookPixel(dynamic context, List<dynamic> parameters);
