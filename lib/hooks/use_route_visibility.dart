import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

enum RouteVisibility {
  visible,
  obscured,
  backgroundHidden,
  disposed,
}

RouteVisibility useRouteVisibility(BuildContext context) {
  ValueNotifier<bool> isCurrentRouteState = useState<bool>(true);
  ValueNotifier<RouteVisibility> routeVisibilityState = useState<RouteVisibility>(RouteVisibility.visible);

  AppLifecycleState? appLifecycleState = useAppLifecycleState();

  ModalRoute<Object?>? route = ModalRoute.of(context);

  useEffect(() {
    if (route is! PageRoute<Object?>) {
      return null;
    }

    _RouteAwareCallbacks callbacks = _RouteAwareCallbacks(
      onDidPush: () {
        isCurrentRouteState.value = true;
      },
      onDidPopNext: () {
        isCurrentRouteState.value = true;
      },
      onDidPushNext: () {
        isCurrentRouteState.value = false;
      },
      onDidPop: () {
        isCurrentRouteState.value = false;
        routeVisibilityState.value = RouteVisibility.disposed;
      },
    );

    isCurrentRouteState.value = route.isCurrent;

    routeObserver.subscribe(callbacks, route);

    return () => routeObserver.unsubscribe(callbacks);
  }, <dynamic>[]);

  useEffect(() {
    if (routeVisibilityState.value == RouteVisibility.disposed) {
      return null;
    }

    Set<AppLifecycleState> backgroundStates = <AppLifecycleState>{
      AppLifecycleState.inactive,
      AppLifecycleState.hidden,
      AppLifecycleState.paused,
      AppLifecycleState.detached,
    };

    if (appLifecycleState == AppLifecycleState.resumed) {
      routeVisibilityState.value = isCurrentRouteState.value ? RouteVisibility.visible : RouteVisibility.obscured;
    } else if (appLifecycleState != null && backgroundStates.contains(appLifecycleState)) {
      routeVisibilityState.value = RouteVisibility.backgroundHidden;
    }
    return null;
  }, <Object?>[appLifecycleState, isCurrentRouteState.value]);

  return routeVisibilityState.value;
}

class _RouteAwareCallbacks with RouteAware {
  _RouteAwareCallbacks({
    this.onDidPush,
    this.onDidPushNext,
    this.onDidPopNext,
    this.onDidPop,
  });

  final VoidCallback? onDidPush;
  final VoidCallback? onDidPushNext;
  final VoidCallback? onDidPopNext;
  final VoidCallback? onDidPop;

  @override
  void didPush() => onDidPush?.call();

  @override
  void didPushNext() => onDidPushNext?.call();

  @override
  void didPopNext() => onDidPopNext?.call();

  @override
  void didPop() => onDidPop?.call();
}
