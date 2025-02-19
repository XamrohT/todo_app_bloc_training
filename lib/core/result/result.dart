class Result<T> {
  final T? data;
  final String? error;

  const Result._({this.data, this.error});

  factory Result.success(T data) => Result._(data: data);
  factory Result.failure(String error) => Result._(error: error);

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
  
  R fold<R>(R Function(String error) onFailure, R Function(T data) onSuccess) {
    return isSuccess ? onSuccess(data as T) : onFailure(error!);
  }
}