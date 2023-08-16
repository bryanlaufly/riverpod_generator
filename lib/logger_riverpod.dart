import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerRiverpod extends ProviderObserver{
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    print('$provider, $previousValue,$newValue, $container');
    // super.didUpdateProvider(provider, previousValue, newValue, container);
  }

}