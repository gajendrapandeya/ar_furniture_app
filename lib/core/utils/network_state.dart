import 'package:ar_furniture_app/core/utils/enums.dart';

class NetworkState<T> {
  final NetworkStateEnum networkStateEnum;
  final T? data;
  final String? message;

  NetworkState({
    required this.networkStateEnum,
    required this.data,
    this.message,
  });

  factory NetworkState.initial() {
    return NetworkState(networkStateEnum: NetworkStateEnum.initial, data: null);
  }

  factory NetworkState.loading() {
    return NetworkState(networkStateEnum: NetworkStateEnum.loading, data: null);
  }

  factory NetworkState.success(T data) {
    return NetworkState(
      networkStateEnum: NetworkStateEnum.success,
      data: data,
    );
  }

  factory NetworkState.failure(String message) {
    return NetworkState(
      networkStateEnum: NetworkStateEnum.failure,
      data: null,
      message: message,
    );
  }

  bool get isLoaded => networkStateEnum == NetworkStateEnum.success;
  bool get isNotLoaded => networkStateEnum != NetworkStateEnum.success;
  bool get isLoading => networkStateEnum == NetworkStateEnum.loading;
}
