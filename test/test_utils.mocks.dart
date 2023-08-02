// Mocks generated by Mockito 5.4.2 from annotations
// in app_store/test/test_utils.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i7;

import 'package:app_store/snapd.dart' as _i4;
import 'package:app_store/src/manage/manage_model.dart' as _i8;
import 'package:file/file.dart' as _i9;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:snapcraft_launcher/snapcraft_launcher.dart' as _i3;
import 'package:snapd/snapd.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSnap_0 extends _i1.SmartFake implements _i2.Snap {
  _FakeSnap_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePrivilegedDesktopLauncher_1 extends _i1.SmartFake
    implements _i3.PrivilegedDesktopLauncher {
  _FakePrivilegedDesktopLauncher_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSnapdService_2 extends _i1.SmartFake implements _i4.SnapdService {
  _FakeSnapdService_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAsyncValue_3<T> extends _i1.SmartFake implements _i5.AsyncValue<T> {
  _FakeAsyncValue_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSnapdSystemInfoResponse_4 extends _i1.SmartFake
    implements _i2.SnapdSystemInfoResponse {
  _FakeSnapdSystemInfoResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSnapdConnectionsResponse_5 extends _i1.SmartFake
    implements _i2.SnapdConnectionsResponse {
  _FakeSnapdConnectionsResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSnapdLoginResponse_6 extends _i1.SmartFake
    implements _i2.SnapdLoginResponse {
  _FakeSnapdLoginResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSnapdChange_7 extends _i1.SmartFake implements _i2.SnapdChange {
  _FakeSnapdChange_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SnapLauncher].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnapLauncher extends _i1.Mock implements _i4.SnapLauncher {
  MockSnapLauncher() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Snap get snap => (super.noSuchMethod(
        Invocation.getter(#snap),
        returnValue: _FakeSnap_0(
          this,
          Invocation.getter(#snap),
        ),
      ) as _i2.Snap);
  @override
  _i3.PrivilegedDesktopLauncher get launcher => (super.noSuchMethod(
        Invocation.getter(#launcher),
        returnValue: _FakePrivilegedDesktopLauncher_1(
          this,
          Invocation.getter(#launcher),
        ),
      ) as _i3.PrivilegedDesktopLauncher);
  @override
  bool get isLaunchable => (super.noSuchMethod(
        Invocation.getter(#isLaunchable),
        returnValue: false,
      ) as bool);
  @override
  void open() => super.noSuchMethod(
        Invocation.method(
          #open,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SnapModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnapModel extends _i1.Mock implements _i4.SnapModel {
  MockSnapModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.SnapdService get snapd => (super.noSuchMethod(
        Invocation.getter(#snapd),
        returnValue: _FakeSnapdService_2(
          this,
          Invocation.getter(#snapd),
        ),
      ) as _i4.SnapdService);
  @override
  String get snapName => (super.noSuchMethod(
        Invocation.getter(#snapName),
        returnValue: '',
      ) as String);
  @override
  set localSnap(_i2.Snap? _localSnap) => super.noSuchMethod(
        Invocation.setter(
          #localSnap,
          _localSnap,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set storeSnap(_i2.Snap? _storeSnap) => super.noSuchMethod(
        Invocation.setter(
          #storeSnap,
          _storeSnap,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set storeSnapSubscription(
          _i6.StreamSubscription<dynamic>? _storeSnapSubscription) =>
      super.noSuchMethod(
        Invocation.setter(
          #storeSnapSubscription,
          _storeSnapSubscription,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.AsyncValue<void> get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAsyncValue_3<void>(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.AsyncValue<void>);
  @override
  _i2.Snap get snap => (super.noSuchMethod(
        Invocation.getter(#snap),
        returnValue: _FakeSnap_0(
          this,
          Invocation.getter(#snap),
        ),
      ) as _i2.Snap);
  @override
  bool get isInstalled => (super.noSuchMethod(
        Invocation.getter(#isInstalled),
        returnValue: false,
      ) as bool);
  @override
  bool get hasGallery => (super.noSuchMethod(
        Invocation.getter(#hasGallery),
        returnValue: false,
      ) as bool);
  @override
  set selectedChannel(String? channel) => super.noSuchMethod(
        Invocation.setter(
          #selectedChannel,
          channel,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i6.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> dispose() => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> cancel() => (super.noSuchMethod(
        Invocation.method(
          #cancel,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> install() => (super.noSuchMethod(
        Invocation.method(
          #install,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> refresh() => (super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> remove() => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void addListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ManageModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockManageModel extends _i1.Mock implements _i8.ManageModel {
  MockManageModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.SnapdService get snapd => (super.noSuchMethod(
        Invocation.getter(#snapd),
        returnValue: _FakeSnapdService_2(
          this,
          Invocation.getter(#snapd),
        ),
      ) as _i4.SnapdService);
  @override
  _i5.AsyncValue<void> get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAsyncValue_3<void>(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.AsyncValue<void>);
  @override
  Iterable<_i2.Snap> get refreshableSnaps => (super.noSuchMethod(
        Invocation.getter(#refreshableSnaps),
        returnValue: <_i2.Snap>[],
      ) as Iterable<_i2.Snap>);
  @override
  Iterable<_i2.Snap> get nonRefreshableSnaps => (super.noSuchMethod(
        Invocation.getter(#nonRefreshableSnaps),
        returnValue: <_i2.Snap>[],
      ) as Iterable<_i2.Snap>);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i6.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> updateAll() => (super.noSuchMethod(
        Invocation.method(
          #updateAll,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void addListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SnapdService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnapdService extends _i1.Mock implements _i4.SnapdService {
  MockSnapdService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get allowInteraction => (super.noSuchMethod(
        Invocation.getter(#allowInteraction),
        returnValue: false,
      ) as bool);
  @override
  set allowInteraction(bool? _allowInteraction) => super.noSuchMethod(
        Invocation.setter(
          #allowInteraction,
          _allowInteraction,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set userAgent(String? value) => super.noSuchMethod(
        Invocation.setter(
          #userAgent,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> waitChange(String? changeId) => (super.noSuchMethod(
        Invocation.method(
          #waitChange,
          [changeId],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> loadAuthorization({String? path}) => (super.noSuchMethod(
        Invocation.method(
          #loadAuthorization,
          [],
          {#path: path},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void setAuthorization(
    String? macaroon,
    List<String>? discharges,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #setAuthorization,
          [
            macaroon,
            discharges,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<_i2.SnapdSystemInfoResponse> systemInfo() => (super.noSuchMethod(
        Invocation.method(
          #systemInfo,
          [],
        ),
        returnValue: _i6.Future<_i2.SnapdSystemInfoResponse>.value(
            _FakeSnapdSystemInfoResponse_4(
          this,
          Invocation.method(
            #systemInfo,
            [],
          ),
        )),
      ) as _i6.Future<_i2.SnapdSystemInfoResponse>);
  @override
  _i6.Future<List<_i2.Snap>> getSnaps() => (super.noSuchMethod(
        Invocation.method(
          #getSnaps,
          [],
        ),
        returnValue: _i6.Future<List<_i2.Snap>>.value(<_i2.Snap>[]),
      ) as _i6.Future<List<_i2.Snap>>);
  @override
  _i6.Future<_i2.Snap> getSnap(String? name) => (super.noSuchMethod(
        Invocation.method(
          #getSnap,
          [name],
        ),
        returnValue: _i6.Future<_i2.Snap>.value(_FakeSnap_0(
          this,
          Invocation.method(
            #getSnap,
            [name],
          ),
        )),
      ) as _i6.Future<_i2.Snap>);
  @override
  _i6.Future<List<_i2.SnapApp>> getApps({
    List<String>? names,
    _i2.SnapdAppFilter? filter,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getApps,
          [],
          {
            #names: names,
            #filter: filter,
          },
        ),
        returnValue: _i6.Future<List<_i2.SnapApp>>.value(<_i2.SnapApp>[]),
      ) as _i6.Future<List<_i2.SnapApp>>);
  @override
  _i6.Future<List<_i2.SnapdCategoryDetails>> getCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCategories,
          [],
        ),
        returnValue: _i6.Future<List<_i2.SnapdCategoryDetails>>.value(
            <_i2.SnapdCategoryDetails>[]),
      ) as _i6.Future<List<_i2.SnapdCategoryDetails>>);
  @override
  _i6.Future<_i2.SnapdConnectionsResponse> getConnections({
    String? snap,
    String? interface,
    _i2.SnapdConnectionFilter? filter,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getConnections,
          [],
          {
            #snap: snap,
            #interface: interface,
            #filter: filter,
          },
        ),
        returnValue: _i6.Future<_i2.SnapdConnectionsResponse>.value(
            _FakeSnapdConnectionsResponse_5(
          this,
          Invocation.method(
            #getConnections,
            [],
            {
              #snap: snap,
              #interface: interface,
              #filter: filter,
            },
          ),
        )),
      ) as _i6.Future<_i2.SnapdConnectionsResponse>);
  @override
  _i6.Future<String> refreshMany(List<String>? names) => (super.noSuchMethod(
        Invocation.method(
          #refreshMany,
          [names],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> connect(
    String? snap,
    String? plug,
    String? slotSnap,
    String? slot,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #connect,
          [
            snap,
            plug,
            slotSnap,
            slot,
          ],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> disconnect(
    String? plugSnap,
    String? plug,
    String? slotSnap,
    String? slot,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #disconnect,
          [
            plugSnap,
            plug,
            slotSnap,
            slot,
          ],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<List<_i2.Snap>> find({
    String? query,
    String? name,
    String? category,
    String? section,
    _i2.SnapFindFilter? filter,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #find,
          [],
          {
            #query: query,
            #name: name,
            #category: category,
            #section: section,
            #filter: filter,
          },
        ),
        returnValue: _i6.Future<List<_i2.Snap>>.value(<_i2.Snap>[]),
      ) as _i6.Future<List<_i2.Snap>>);
  @override
  _i6.Future<_i2.SnapdLoginResponse> login(
    String? email,
    String? password, {
    String? otp,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
          {#otp: otp},
        ),
        returnValue:
            _i6.Future<_i2.SnapdLoginResponse>.value(_FakeSnapdLoginResponse_6(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
            {#otp: otp},
          ),
        )),
      ) as _i6.Future<_i2.SnapdLoginResponse>);
  @override
  _i6.Future<dynamic> logout(int? id) => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [id],
        ),
        returnValue: _i6.Future<dynamic>.value(),
      ) as _i6.Future<dynamic>);
  @override
  _i6.Future<String> install(
    String? name, {
    String? channel,
    String? revision,
    bool? classic = false,
    bool? dangerous = false,
    bool? devmode = false,
    bool? jailmode = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #install,
          [name],
          {
            #channel: channel,
            #revision: revision,
            #classic: classic,
            #dangerous: dangerous,
            #devmode: devmode,
            #jailmode: jailmode,
          },
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> refresh(
    String? name, {
    String? channel,
    bool? classic = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #refresh,
          [name],
          {
            #channel: channel,
            #classic: classic,
          },
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> remove(
    String? name, {
    bool? purge = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #remove,
          [name],
          {#purge: purge},
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> enable(String? name) => (super.noSuchMethod(
        Invocation.method(
          #enable,
          [name],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> disable(String? name) => (super.noSuchMethod(
        Invocation.method(
          #disable,
          [name],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i2.SnapdChange> getChange(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getChange,
          [id],
        ),
        returnValue: _i6.Future<_i2.SnapdChange>.value(_FakeSnapdChange_7(
          this,
          Invocation.method(
            #getChange,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.SnapdChange>);
  @override
  _i6.Future<List<_i2.SnapdChange>> getChanges({
    _i2.SnapdChangeFilter? filter,
    String? name,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getChanges,
          [],
          {
            #filter: filter,
            #name: name,
          },
        ),
        returnValue:
            _i6.Future<List<_i2.SnapdChange>>.value(<_i2.SnapdChange>[]),
      ) as _i6.Future<List<_i2.SnapdChange>>);
  @override
  _i6.Future<_i2.SnapdChange> abortChange(String? id) => (super.noSuchMethod(
        Invocation.method(
          #abortChange,
          [id],
        ),
        returnValue: _i6.Future<_i2.SnapdChange>.value(_FakeSnapdChange_7(
          this,
          Invocation.method(
            #abortChange,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.SnapdChange>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Stream<List<_i2.Snap>> getCategory(
    String? name, {
    Duration? expiry = const Duration(days: 1),
    _i9.FileSystem? fs,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCategory,
          [name],
          {
            #expiry: expiry,
            #fs: fs,
          },
        ),
        returnValue: _i6.Stream<List<_i2.Snap>>.empty(),
      ) as _i6.Stream<List<_i2.Snap>>);
  @override
  _i6.Stream<_i2.Snap?> getStoreSnap(
    String? name, {
    Duration? expiry = const Duration(minutes: 1),
    _i9.FileSystem? fs,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStoreSnap,
          [name],
          {
            #expiry: expiry,
            #fs: fs,
          },
        ),
        returnValue: _i6.Stream<_i2.Snap?>.empty(),
      ) as _i6.Stream<_i2.Snap?>);
  @override
  _i6.Stream<_i2.SnapdChange> watchChange(
    String? id, {
    Duration? interval = const Duration(milliseconds: 100),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #watchChange,
          [id],
          {#interval: interval},
        ),
        returnValue: _i6.Stream<_i2.SnapdChange>.empty(),
      ) as _i6.Stream<_i2.SnapdChange>);
  @override
  _i6.Stream<List<String>> watchChanges({
    String? name,
    Duration? interval = const Duration(milliseconds: 100),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #watchChanges,
          [],
          {
            #name: name,
            #interval: interval,
          },
        ),
        returnValue: _i6.Stream<List<String>>.empty(),
      ) as _i6.Stream<List<String>>);
}