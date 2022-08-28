// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template app_localization_x}
/// A short hand for the localization of a string.
/// {@endtemplate}
extension AppLocalizationsX on BuildContext {
  /// {@macro app_localization_x}

  AppLocalizations get l10n => AppLocalizations.of(this);
}
