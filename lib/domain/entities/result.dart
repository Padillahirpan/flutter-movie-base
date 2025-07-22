sealed class Result<T> {
  const Result();

  factory Result.success(T value) = Success<T>;

  factory Result.failure(String message) = Failure<T>;

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is Failure<T>;

  T? get resultValue => this is Success<T> ? (this as Success<T>).value : null;
  String? get errorMessage => isFailure ? (this as Failure<T>).message : null;
}

class Success<T> extends Result<T> {
  final T value;

  const Success(this.value);

  @override
  String toString() => 'Success(data: $value)';
}

class Failure<T> extends Result<T> {
  final String message;

  const Failure(this.message);

  @override
  String toString() => 'Failure(message: $message)';
}
