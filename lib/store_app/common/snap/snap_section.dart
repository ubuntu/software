/*
 * Copyright (C) 2022 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:software/l10n/l10n.dart';
import 'package:yaru_colors/yaru_colors.dart';
import 'package:yaru_icons/yaru_icons.dart';

enum SnapSection {
  all,
  art_and_design,
  books_and_reference,
  development,
  devices_and_iot,
  education,
  entertainment,
  featured,
  finance,
  games,
  health_and_fitness,
  music_and_audio,
  news_and_weather,
  personalisation,
  photo_and_video,
  productivity,
  science,
  security,
  server_and_cloud,
  social,
  utilities;

  String get title => name.replaceAll('_', '-');

  String localize(AppLocalizations l10n) {
    switch (this) {
      case SnapSection.art_and_design:
        return l10n.artAndDesign;
      case SnapSection.books_and_reference:
        return l10n.booksAndReference;
      case SnapSection.development:
        return l10n.development;
      case SnapSection.devices_and_iot:
        return l10n.devicesAndIot;
      case SnapSection.education:
        return l10n.education;
      case SnapSection.entertainment:
        return l10n.entertainment;
      case SnapSection.featured:
        return l10n.featured;
      case SnapSection.finance:
        return l10n.finance;
      case SnapSection.games:
        return l10n.games;
      case SnapSection.health_and_fitness:
        return l10n.healthAndFitness;
      case SnapSection.music_and_audio:
        return l10n.musicAndAudio;
      case SnapSection.news_and_weather:
        return l10n.newsAndWeather;
      case SnapSection.personalisation:
        return l10n.personalisation;
      case SnapSection.photo_and_video:
        return l10n.photoAndVideo;
      case SnapSection.productivity:
        return l10n.productivity;
      case SnapSection.science:
        return l10n.science;
      case SnapSection.security:
        return l10n.security;
      case SnapSection.server_and_cloud:
        return l10n.serverAndCloud;
      case SnapSection.social:
        return l10n.social;
      case SnapSection.utilities:
        return l10n.utilities;
      case SnapSection.all:
        return l10n.all;
      default:
        return title;
    }
  }

  String slogan(AppLocalizations l10n) {
    switch (this) {
      case SnapSection.art_and_design:
        return l10n.artAndDesign;
      case SnapSection.books_and_reference:
        return l10n.booksAndReference;
      case SnapSection.development:
        return l10n.development;
      case SnapSection.devices_and_iot:
        return l10n.devicesAndIot;
      case SnapSection.education:
        return l10n.education;
      case SnapSection.entertainment:
        return l10n.entertainment;
      case SnapSection.featured:
        return l10n.featured;
      case SnapSection.finance:
        return l10n.finance;
      case SnapSection.games:
        return l10n.games;
      case SnapSection.health_and_fitness:
        return l10n.healthAndFitness;
      case SnapSection.music_and_audio:
        return l10n.musicAndAudio;
      case SnapSection.news_and_weather:
        return l10n.newsAndWeather;
      case SnapSection.personalisation:
        return l10n.personalisation;
      case SnapSection.photo_and_video:
        return l10n.photoAndVideo;
      case SnapSection.productivity:
        return l10n.productivity;
      case SnapSection.science:
        return l10n.science;
      case SnapSection.security:
        return l10n.security;
      case SnapSection.server_and_cloud:
        return l10n.serverAndCloud;
      case SnapSection.social:
        return l10n.social;
      case SnapSection.utilities:
        return l10n.utilities;
      case SnapSection.all:
        return l10n.all;
    }
  }

  // TODO: @madsrh please add colors
  // Those are normal hex plus the leading FF for alpha, just leave FF
  // or take colors from YaruColors
  List<int> get colors {
    switch (this) {
      case SnapSection.art_and_design:
        return [0xFF12c2e9, 0xFFf64f59];
      case SnapSection.books_and_reference:
        return [YaruColors.coolGrey.value, YaruColors.blue.value];
      case SnapSection.development:
        return [YaruColors.coolGrey.value, YaruColors.bark.value];
      case SnapSection.devices_and_iot:
        return [YaruColors.coolGrey.value, YaruColors.red.value];
      case SnapSection.education:
        return [YaruColors.coolGrey.value, YaruColors.magenta.value];
      case SnapSection.entertainment:
        return [YaruColors.coolGrey.value, YaruColors.prussianGreen.value];
      case SnapSection.featured:
        return [YaruColors.coolGrey.value, YaruColors.olive.value];
      case SnapSection.finance:
        return [YaruColors.coolGrey.value, YaruColors.purple.value];
      case SnapSection.games:
        return [YaruColors.coolGrey.value, YaruColors.viridian.value];
      case SnapSection.health_and_fitness:
        return [YaruColors.coolGrey.value, YaruColors.warning.value];
      case SnapSection.music_and_audio:
        return [YaruColors.coolGrey.value, YaruColors.sage.value];
      case SnapSection.news_and_weather:
        return [YaruColors.coolGrey.value, YaruColors.orange.value];
      case SnapSection.personalisation:
        return [YaruColors.coolGrey.value, YaruColors.orange.value];
      case SnapSection.photo_and_video:
        return [YaruColors.coolGrey.value, YaruColors.orange.value];
      case SnapSection.productivity:
        return [YaruColors.coolGrey.value, YaruColors.orange.value];
      case SnapSection.science:
        return [YaruColors.coolGrey.value, YaruColors.orange.value];
      case SnapSection.security:
        return [YaruColors.coolGrey.value, YaruColors.orange.value];
      case SnapSection.server_and_cloud:
        return [YaruColors.coolGrey.value, YaruColors.orange.value];
      case SnapSection.social:
        return [YaruColors.coolGrey.value, YaruColors.orange.value];
      case SnapSection.utilities:
        return [YaruColors.coolGrey.value, YaruColors.orange.value];
      case SnapSection.all:
        return [YaruColors.coolGrey.value, YaruColors.orange.value];
    }
  }
}

Map<SnapSection, IconData> snapSectionToIcon = {
  SnapSection.art_and_design: YaruIcons.template,
  SnapSection.books_and_reference: YaruIcons.book,
  SnapSection.development: YaruIcons.wrench,
  SnapSection.devices_and_iot: YaruIcons.chip,
  SnapSection.education: YaruIcons.education,
  SnapSection.entertainment: YaruIcons.television,
  SnapSection.featured: YaruIcons.star,
  SnapSection.finance: YaruIcons.calculator,
  SnapSection.games: YaruIcons.games,
  SnapSection.health_and_fitness: YaruIcons.health,
  SnapSection.music_and_audio: YaruIcons.headphones,
  SnapSection.news_and_weather: YaruIcons.weather_storm,
  SnapSection.personalisation: YaruIcons.desktop_appearance,
  SnapSection.photo_and_video: YaruIcons.camera_photo,
  SnapSection.productivity: YaruIcons.clock,
  SnapSection.science: YaruIcons.beaker,
  SnapSection.security: YaruIcons.shield,
  SnapSection.server_and_cloud: YaruIcons.weather_cloudy,
  SnapSection.social: YaruIcons.subtitles,
  SnapSection.utilities: YaruIcons.utilities,
  SnapSection.all: YaruIcons.app_grid
};
