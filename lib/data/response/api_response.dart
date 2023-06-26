import 'package:sporter_turf_booking/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  T? data;
  Status? status;

  ApiResponse(this.data, this.message, this.status);

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n message : $message \n Data: $data";
  }
}
