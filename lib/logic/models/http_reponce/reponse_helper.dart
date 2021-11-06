class ResponseData<T> {
  final T? data;
  String? error;

  ResponseData({required this.data, required this.error});
}
