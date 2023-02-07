import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:packagekit/packagekit.dart';
import 'package:provider/provider.dart';
import 'package:snapd/snapd.dart';
import 'package:software/app/collection/collection_model.dart';
import 'package:software/app/collection/collection_packages_page.dart';
import 'package:software/app/collection/simple_snap_controls.dart';
import 'package:software/app/common/app_format.dart';
import 'package:software/app/common/app_format_popup.dart';
import 'package:software/app/common/app_icon.dart';
import 'package:software/app/common/border_container.dart';
import 'package:software/app/common/constants.dart';
import 'package:software/app/common/indeterminate_circular_progress_icon.dart';
import 'package:software/app/common/packagekit/package_controls.dart';
import 'package:software/app/common/packagekit/package_model.dart';
import 'package:software/app/common/packagekit/package_page.dart';
import 'package:software/app/common/packagekit/packagekit_filter_button.dart';
import 'package:software/app/common/search_field.dart';
import 'package:software/app/common/snap/snap_page.dart';
import 'package:software/app/common/snap/snap_sort_popup.dart';
import 'package:software/l10n/l10n.dart';
import 'package:software/services/packagekit/package_service.dart';
import 'package:software/services/snap_service.dart';
import 'package:software/snapx.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CollectionModel(
        getService<SnapService>(),
        getService<PackageService>(),
      )..init(),
      child: const CollectionPage(),
    );
  }

  static Widget createIcon({
    required BuildContext context,
    required bool selected,
    int? badgeCount,
    bool? processing,
    int? updateCount,
    bool? updateProcessing,
  }) {
    return _CollectionIcon(
      count: (badgeCount ?? 0) + (updateCount ?? 0),
      processing: (processing ?? false) || (updateProcessing ?? false),
    );
  }

  static Widget createTitle(BuildContext context) =>
      Text(context.l10n.collection);

  @override
  Widget build(BuildContext context) {
    final searchQuery = context.select((CollectionModel m) => m.searchQuery);

    final setSearchQuery =
        context.select((CollectionModel m) => m.setSearchQuery);

    final checkForSnapUpdates =
        context.select((CollectionModel m) => m.checkForSnapUpdates);
    final snapUpdatesAvailable =
        context.select((CollectionModel m) => m.snapUpdatesAvailable);
    final checkingForSnapUpdates =
        context.select((CollectionModel m) => m.checkingForSnapUpdates);
    final snapServiceIsBusy =
        context.select((CollectionModel m) => m.snapServiceIsBusy);

    final refreshAllSnapsWithUpdates =
        context.select((CollectionModel m) => m.refreshAllSnapsWithUpdates);

    final appFormat = context.select((CollectionModel m) => m.appFormat);
    final setAppFormat = context.select((CollectionModel m) => m.setAppFormat);
    final enabledAppFormats =
        context.select((CollectionModel m) => m.enabledAppFormats);

    final loadPackagesWithUpdates =
        context.select((CollectionModel m) => m.loadPackagesWithUpdates);
    final setLoadPackagesWithUpdates =
        context.select((CollectionModel m) => m.setLoadPackagesWithUpdates);

    final packageKitFilters =
        context.select((CollectionModel m) => m.packageKitFilters);
    final handleFilter = context.select((CollectionModel m) => m.handleFilter);

    final snapSort = context.select((CollectionModel m) => m.snapSort);
    final setSnapSort = context.select((CollectionModel m) => m.setSnapSort);

    final content = Center(
      child: SizedBox(
        width: 700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 20,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  AppFormatPopup(
                    onSelected: (appFormat) => setAppFormat(appFormat),
                    appFormat: appFormat ?? AppFormat.snap,
                    enabledAppFormats: enabledAppFormats,
                  ),
                  if (appFormat == AppFormat.snap)
                    SnapSortPopup(
                      value: snapSort,
                      onSelected: (value) => setSnapSort(value),
                    ),
                  if (appFormat == AppFormat.snap)
                    OutlinedButton(
                      onPressed: checkingForSnapUpdates == true ||
                              snapServiceIsBusy == true
                          ? null
                          : () => checkForSnapUpdates(),
                      child: Text(context.l10n.refreshButton),
                    ),
                  if (checkingForSnapUpdates == true &&
                      appFormat == AppFormat.snap)
                    const SizedBox(
                      height: 25,
                      width: 25,
                      child: Center(
                        child: YaruCircularProgressIndicator(strokeWidth: 3),
                      ),
                    )
                  else if (snapUpdatesAvailable && appFormat == AppFormat.snap)
                    ElevatedButton(
                      onPressed: snapServiceIsBusy == true
                          ? null
                          : () => refreshAllSnapsWithUpdates(
                                doneMessage: context.l10n.done,
                              ),
                      child: Text(context.l10n.multiUpdateButton),
                    ),
                  if (appFormat == AppFormat.packageKit)
                    PackageKitFilterButton(
                      onTap: handleFilter,
                      filters: packageKitFilters,
                      lockInstalled: true,
                    ),
                  if (appFormat == AppFormat.packageKit)
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          YaruCheckbox(
                            value: loadPackagesWithUpdates == true,
                            onChanged: setLoadPackagesWithUpdates,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            context.l10n.updateAvailable,
                          ),
                        ],
                      ),
                    ),
                  // if (appFormat == AppFormat.packageKit)
                  //   CollectionPackageUpdatesHeader(),
                ],
              ),
            ),
            if (appFormat == AppFormat.snap)
              const Expanded(
                child: _SnapList(),
              )
            else if (appFormat == AppFormat.packageKit)
              Expanded(
                child: loadPackagesWithUpdates == true
                    ? CollectionPackagesPage.create(context: context)
                    : const _PackagesList(),
              )
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: YaruWindowTitleBar(
        title:
            loadPackagesWithUpdates == true && appFormat == AppFormat.packageKit
                ? Text(context.l10n.updates)
                : SearchField(
                    searchQuery: searchQuery ?? '',
                    onChanged: setSearchQuery,
                    hintText: context.l10n.searchHintInstalled,
                  ),
      ),
      body: content,
    );
  }
}

class _SnapList extends StatelessWidget {
  const _SnapList();

  @override
  Widget build(BuildContext context) {
    final installedSnaps =
        context.select((CollectionModel m) => m.installedSnaps);
    final snapUpdates =
        context.select((CollectionModel m) => m.installedSnapsWithUpdates);

    final checkingForSnapUpdates =
        context.select((CollectionModel m) => m.checkingForSnapUpdates);

    return ListView(
      children: [
        if (snapUpdates.isNotEmpty)
          BorderContainer(
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(
              left: kYaruPagePadding,
              right: kYaruPagePadding,
              bottom: kYaruPagePadding,
            ),
            child: Column(
              children: [
                for (var i = 0; i < snapUpdates.length; i++)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _SnapTile(
                        tileShape: snapUpdates.length == 1
                            ? _RoundedListPosition.only
                            : (i == 0
                                ? _RoundedListPosition.top
                                : (i == snapUpdates.length - 1
                                    ? _RoundedListPosition.bottom
                                    : _RoundedListPosition.middle)),
                        snap: snapUpdates[i],
                        hasUpdate: true,
                        enabled: checkingForSnapUpdates,
                      ),
                      if ((i == 0 && snapUpdates.length > 1) ||
                          (i != snapUpdates.length - 1))
                        const Divider(
                          thickness: 0.0,
                          height: 0,
                        )
                    ],
                  )
              ],
            ),
          ),
        if (installedSnaps.isNotEmpty)
          BorderContainer(
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(
              left: kYaruPagePadding,
              right: kYaruPagePadding,
              bottom: kYaruPagePadding,
            ),
            child: Column(
              children: [
                for (var i = 0; i < installedSnaps.length; i++)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _SnapTile(
                        tileShape: installedSnaps.length == 1
                            ? _RoundedListPosition.only
                            : (i == 0
                                ? _RoundedListPosition.top
                                : (i == installedSnaps.length - 1
                                    ? _RoundedListPosition.bottom
                                    : _RoundedListPosition.middle)),
                        snap: installedSnaps[i],
                        enabled: checkingForSnapUpdates,
                      ),
                      if ((i == 0 && installedSnaps.length > 1) ||
                          (i != installedSnaps.length - 1))
                        const Divider(
                          thickness: 0.0,
                          height: 0,
                        )
                    ],
                  )
              ],
            ),
          ),
        if (snapUpdates.isEmpty && installedSnaps.isEmpty)
          Center(
            child: Text(context.l10n.noSnapsInstalled),
          )
      ],
    );
  }
}

class _SnapTile extends StatelessWidget {
  const _SnapTile({
    required this.snap,
    required this.enabled,
    this.hasUpdate = false,
    this.tileShape = _RoundedListPosition.middle,
  });

  final Snap snap;
  final bool hasUpdate;
  final bool? enabled;
  final _RoundedListPosition tileShape;

  @override
  Widget build(BuildContext context) {
    final shape = tileShape == _RoundedListPosition.middle
        ? null
        : (tileShape == _RoundedListPosition.top
            ? _topChildShape
            : (tileShape == _RoundedListPosition.bottom
                ? _bottomChildShape
                : _onlyChildShape));
    return ListTile(
      shape: shape,
      key: ValueKey(snap),
      enabled: enabled == false,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: kYaruPagePadding,
        vertical: 10,
      ),
      onTap: () => SnapPage.push(context: context, snap: snap),
      leading: AppIcon(
        iconUrl: snap.iconUrl,
        size: 25,
      ),
      title: Text(
        snap.name,
      ),
      trailing: SimpleSnapControls.create(
        context: context,
        snap: snap,
        hasUpdate: hasUpdate,
        enabled: enabled == false,
      ),
    );
  }
}

class _PackagesList extends StatelessWidget {
  const _PackagesList();

  @override
  Widget build(BuildContext context) {
    final installedPackages =
        context.select((CollectionModel m) => m.installedPackages);

    return installedPackages.isNotEmpty
        ? BorderContainer(
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(
              left: kYaruPagePadding,
              right: kYaruPagePadding,
              bottom: kYaruPagePadding,
            ),
            child: ListView.builder(
              itemCount: installedPackages.length,
              itemBuilder: (context, index) {
                final package = installedPackages[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _PackageTile.create(
                      context,
                      package,
                      installedPackages.length == 1
                          ? _RoundedListPosition.only
                          : (index == 0
                              ? _RoundedListPosition.top
                              : (index == installedPackages.length - 1
                                  ? _RoundedListPosition.bottom
                                  : _RoundedListPosition.middle)),
                    ),
                    if ((index == 0 && installedPackages.length > 1) ||
                        (index != installedPackages.length - 1))
                      const Divider(
                        thickness: 0.0,
                        height: 0,
                      )
                  ],
                );
              },
            ),
          )
        : const SizedBox();
  }
}

class _PackageTile extends StatelessWidget {
  const _PackageTile({super.key, required this.id, required this.tileShape});

  final PackageKitPackageId id;
  final _RoundedListPosition tileShape;

  static Widget create(
    BuildContext context,
    PackageKitPackageId id,
    _RoundedListPosition tileShape,
  ) {
    return ChangeNotifierProvider(
      create: (_) =>
          PackageModel(packageId: id, service: getService<PackageService>()),
      child: _PackageTile(
        id: id,
        key: ValueKey(id),
        tileShape: tileShape,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final packageState = context.select((PackageModel m) => m.packageState);
    final remove = context.select((PackageModel m) => m.remove);
    final install = context.select((PackageModel m) => m.install);

    final shape = tileShape == _RoundedListPosition.middle
        ? null
        : (tileShape == _RoundedListPosition.top
            ? _topChildShape
            : (tileShape == _RoundedListPosition.bottom
                ? _bottomChildShape
                : _onlyChildShape));

    return ListTile(
      shape: shape,
      key: ValueKey(id),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: kYaruPagePadding,
        vertical: 10,
      ),
      onTap: () => PackagePage.push(context, id: id),
      leading: const AppIcon(
        iconUrl: null,
        size: 25,
      ),
      title: Text(
        id.name,
      ),
      trailing: PackageControls(
        versionChanged: false,
        isInstalled: true,
        packageState: packageState,
        remove: () => remove(),
        install: install,
      ),
    );
  }
}

class _CollectionIcon extends StatelessWidget {
  const _CollectionIcon({
    // ignore: unused_element
    super.key,
    required this.count,
    required this.processing,
  });

  final int count;
  final bool processing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (processing && count > 0) {
      return badges.Badge(
        position: badges.BadgePosition.topEnd(),
        badgeColor: count > 0 ? theme.primaryColor : Colors.transparent,
        badgeContent: count > 0
            ? Text(
                count.toString(),
                style: badgeTextStyle,
              )
            : null,
        child: const IndeterminateCircularProgressIcon(),
      );
    } else if (processing && count == 0) {
      return const IndeterminateCircularProgressIcon();
    } else if (!processing && count > 0) {
      return badges.Badge(
        badgeColor: theme.primaryColor,
        badgeContent: Text(
          count.toString(),
          style: badgeTextStyle,
        ),
        child: const Icon(YaruIcons.unordered_list),
      );
    }
    return const Icon(YaruIcons.unordered_list);
  }
}

enum _RoundedListPosition {
  top,
  middle,
  bottom,
  only;
}

const _topChildShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  ),
);

const _bottomChildShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  ),
);

const _onlyChildShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  ),
);
