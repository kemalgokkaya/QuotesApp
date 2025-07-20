import 'package:flutter/foundation.dart';
import 'package:quotes/quotes.dart';

Logger logger = Logger(
    printer: kReleaseMode ? PrettyPrinter() : null, filter: ProductionFilter());
