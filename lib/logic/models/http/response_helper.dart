//After interview, i read about generics in flutter
// and try to use it.
// I will be happy, if you will feedback about it
class ResponseData<T> {
  final T? data;
  String? error;

  ResponseData({required this.data, required this.error});
}
