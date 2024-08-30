import 'package:app_center/appstream/appstream.dart';
import 'package:app_center/games/games.dart';
import 'package:app_center/l10n.dart';
import 'package:app_center/layout.dart';
import 'package:app_center/ratings/ratings.dart';
import 'package:app_center/snapd/snapd.dart';
import 'package:app_center/widgets/small_banner.dart';
import 'package:app_center/widgets/widgets.dart';
import 'package:appstream/appstream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapd/snapd.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.title,
    required this.summary,
    super.key,
    this.onTap,
    this.compact = false,
    this.iconUrl,
    this.footer,
    this.rating = 0,
  });

  AppCard.fromSnap({
    required Snap snap,
    VoidCallback? onTap,
  }) : this(
          key: ValueKey(snap.id),
          title: AppTitle.fromSnap(snap),
          summary: snap.summary,
          iconUrl: snap.iconUrl,
          footer: _RatingsInfo(snap: snap),
          onTap: onTap,
        );

  AppCard.fromRatedSnap({
    required Snap snap,
    required int rating,
    VoidCallback? onTap,
  }) : this(
          key: ValueKey(snap.id),
          title: AppTitle.fromSnap(snap),
          summary: snap.summary,
          iconUrl: snap.iconUrl,
          footer: _RatingsInfo(snap: snap),
          onTap: onTap,
          rating: rating,
        );

  AppCard.fromDeb({
    required AppstreamComponent component,
    VoidCallback? onTap,
  }) : this(
          key: ValueKey(component.id),
          title: AppTitle.fromDeb(component),
          summary: component.getLocalizedSummary(),
          iconUrl: component.icon,
          onTap: onTap,
        );

  AppCard.fromTool({
    required Tool tool,
    Key? key,
  }) : this(
          key: key,
          title: AppTitle.fromTool(tool),
          summary: tool.summary,
          iconUrl: tool.iconUrl,
          footer: OutlinedButton(
            onPressed: () async {
              await launchUrl(Uri.parse(tool.url));
            },
            child: Builder(
              builder: (context) {
                final l10n = AppLocalizations.of(context);
                return Text(l10n.openInBrowser);
              },
            ),
          ),
        );

  final AppTitle title;
  final String summary;
  final VoidCallback? onTap;
  final bool compact;
  final String? iconUrl;
  final Widget? footer;
  final int rating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appContent = [
      AppIcon(iconUrl: iconUrl),
      const SizedBox(width: kCardSpacing, height: kCardSpacing),
      Expanded(
        child: _AppCardBody(
          title: title,
          summary: rating > 0 ? '' : summary,
          footer: footer,
        ),
      ),
    ];

    return rating > 0
        ? Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  rating.toString(),
                  style: theme.textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: SmallBanner(
                  onTap: onTap,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: appContent,
                  ),
                ),
              ),
            ],
          )
        : YaruBanner(
            padding: const EdgeInsets.all(kCardSpacing),
            onTap: onTap,
            color: Theme.of(context).cardColor,
            child: Flex(
              direction: compact ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: appContent,
            ),
          );
  }
}

// TODO: generalize
class SnapImageCard extends StatelessWidget {
  const SnapImageCard({required this.snap, super.key, this.onTap});

  final Snap snap;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return YaruBanner(
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 160, // based on mockups
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(kYaruBannerRadius),
              ),
              child: SafeNetworkImage(
                url: snap.screenshotUrls.first,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 306 - 160, // based on mockups
            child: Padding(
              padding: const EdgeInsets.all(kCardSpacing),
              child: _AppCardBody(
                title: AppTitle.fromSnap(snap),
                summary: snap.summary,
                footer: _RatingsInfo(snap: snap),
                maxlines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppCardBody extends StatelessWidget {
  const _AppCardBody({
    required this.title,
    required this.summary,
    this.footer,
    this.maxlines = 2,
  });

  final Widget title;
  final String summary;
  final Widget? footer;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: kIconSize,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: title,
          ),
        ),
        if (summary.isNotEmpty) ...[
          const SizedBox(height: 12),
          Flexible(
            child: Text(
              summary,
              maxLines: maxlines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
        if (footer != null) ...[
          const SizedBox(height: 8),
          footer!,
        ],
      ],
    );
  }
}

class _RatingsInfo extends ConsumerWidget {
  const _RatingsInfo({required this.snap});

  final Snap snap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratingsModel = ref.watch(ratingsModelProvider(snap.name));
    final l10n = AppLocalizations.of(context);

    return ratingsModel.when(
      data: (ratingsData) {
        final rating = ratingsData.rating;
        return Wrap(
          children: [
            Text(
              rating?.ratingsBand.localize(l10n) ?? ' ',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: rating?.ratingsBand.getColor(context),
                    fontSize: 12,
                  ),
            ),
            const SizedBox(width: 2),
            if (rating?.totalVotes != null) ...[
              const SizedBox(width: 2),
              Text(
                ' | ${l10n.snapRatingsVotes(rating?.totalVotes ?? 0)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ],
        );
      },
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
