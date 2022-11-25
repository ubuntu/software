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

import 'dart:async';

import 'package:packagekit/packagekit.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:snapd/snapd.dart';

import '../../services/package_service.dart';
import '../../services/snap_service.dart';
import '../../updates_state.dart';
import '../common/app_format.dart';
import '../common/snap/snap_section.dart';
import '../common/snap/snap_sort.dart';

class ExploreModel extends SafeChangeNotifier {

  ExploreModel(
    this._snapService,
    this._packageService,
  )   : _searchQuery = '',
        sectionNameToSnapsMap = {},
        _errorMessage = '';
  final SnapService _snapService;
  final PackageService _packageService;
  StreamSubscription<UpdatesState>? _updatesStateSub;

  Future<void> init() async {
    _updatesState = _packageService.lastUpdatesState;
    _updatesStateSub = _packageService.updatesState.listen((event) {
      updatesState = event;
    });
  }

  @override
  void dispose() {
    _updatesStateSub?.cancel();
    super.dispose();
  }

  bool get packageKitReady =>
      updatesState != null &&
      updatesState != UpdatesState.updating &&
      updatesState != UpdatesState.checkingForUpdates;

  UpdatesState? _updatesState;
  UpdatesState? get updatesState => _updatesState;
  set updatesState(UpdatesState? value) {
    if (value == _updatesState) return;
    _updatesState = value;
    notifyListeners();
  }

  String _errorMessage;
  String get errorMessage => _errorMessage;

  bool get showSectionBannerGrid =>
      searchQuery.isEmpty && sectionNameToSnapsMap.isNotEmpty;

  bool get showStartPage => selectedSection == SnapSection.all;

  bool get showErrorPage => errorMessage.isNotEmpty;

  bool get showSearchPage => searchQuery.isNotEmpty;

  bool showTwoCarousels({required double width}) => width > 800;
  bool showThreeCarousels({required double width}) => width > 1500;

  set errorMessage(String value) {
    if (value == _errorMessage) return;
    _errorMessage = value;
    notifyListeners();
  }

  String _searchQuery;
  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    errorMessage = '';
    if (value == _searchQuery) return;
    _searchQuery = value;
    notifyListeners();
  }

  SnapSection _selectedSection = SnapSection.all;
  SnapSection get selectedSection => _selectedSection;
  set selectedSection(SnapSection value) {
    if (value == _selectedSection) return;
    _selectedSection = value;
    notifyListeners();
  }

  Future<List<Snap>> findSnapsByQuery() async {
    if (searchQuery.isEmpty) {
      return [];
    } else {
      try {
        return await _snapService.findSnapsByQuery(
          searchQuery: searchQuery,
          sectionName:
              selectedSection == SnapSection.all ? null : selectedSection.title,
        );
      } on SnapdException catch (e) {
        errorMessage = e.message.toString();
        return [];
      }
    }
  }

  Future<List<Snap>> findSnapsBySection({SnapSection? section}) async {
    if (section == null) return [];
    try {
      return await _snapService.findSnapsBySection(
        sectionName: section == SnapSection.all
            ? SnapSection.featured.title
            : section.title,
      );
    } on SnapdException catch (e) {
      errorMessage = e.toString();
      return [];
    }
  }

  Map<SnapSection, List<Snap>> sectionNameToSnapsMap;
  Future<void> loadSection(SnapSection section) async {
    final sectionList = <Snap>[];
    for (final snap in await findSnapsBySection(
      section: section,
    )) {
      sectionList.add(snap);
    }
    sectionNameToSnapsMap.putIfAbsent(section, () => sectionList);
    notifyListeners();
  }

  Future<List<PackageKitPackageId>> findPackageKitPackageIds() async =>
      _packageService.findPackageKitPackageIds(
        searchQuery: [
          searchQuery,
          if (packageKitGroup != null) packageKitGroup!.name
        ],
        filter: packageKitFilters,
      );

  AppFormat _appFormat = AppFormat.snap;
  AppFormat get appFormat => _appFormat;
  void setAppFormat(AppFormat value) {
    if (value == _appFormat) return;
    _appFormat = value;
    notifyListeners();
  }

  SnapSort _snapSort = SnapSort.updateAvailable;
  SnapSort get snapSort => _snapSort;
  void setSnapSort(SnapSort value) {
    if (value == _snapSort) return;
    _snapSort = value;
    notifyListeners();
  }

  PackageKitGroup? _packageKitGroup;
  PackageKitGroup? get packageKitGroup => _packageKitGroup;
  void setPackageKitGroup(PackageKitGroup? value) {
    if (value == _packageKitGroup) return;
    _packageKitGroup = value;
    notifyListeners();
  }

  final Set<PackageKitFilter> _packageKitFilters = {};
  Set<PackageKitFilter> get packageKitFilters => _packageKitFilters;
  void handleFilter(bool value, PackageKitFilter filter) {
    if (value) {
      _packageKitFilters.add(filter);
    } else {
      _packageKitFilters.remove(filter);
    }
    notifyListeners();
  }

  final Set<AppFormat> _appFormats = {AppFormat.snap, AppFormat.packageKit};
  Set<AppFormat> get appFormats => _appFormats;
  void handleAppFormat(bool value, AppFormat appFormat) {
    if (value) {
      _appFormats.add(appFormat);
    } else {
      _appFormats.remove(appFormat);
    }
    notifyListeners();
  }

  Future<Map<String, AppFinding>> search() async {
    final appFindings = <String, AppFinding>{};

    final snaps = await findSnapsByQuery();
    for (final snap in snaps) {
      appFindings.putIfAbsent(snap.name, () => AppFinding(snap: snap));
    }

    final packages = await findPackageKitPackageIds();
    for (final package in packages) {
      Snap? foundSnap;
      for (final snap in snaps) {
        if (snap.name == package.name) {
          foundSnap = snap;
        }
      }
      if (foundSnap != null) {
        appFindings.update(
          foundSnap.name,
          (value) => AppFinding(
            snap: foundSnap,
            packageId: package,
          ),
        );
      } else {
        appFindings.putIfAbsent(
          package.name,
          () => AppFinding(packageId: package),
        );
      }
    }

    return appFindings;
  }
}

class AppFinding {

  AppFinding({
    this.snap,
    this.packageId,
    this.rating,
  });
  final Snap? snap;
  final PackageKitPackageId? packageId;
  final double? rating;
}
