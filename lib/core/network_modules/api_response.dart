part of 'network_modules.dart';

// class untuk menentukan state dalam pemrosessan data internet
// menampung data respon dari API apabila prosesnya berhasil
// menampung pesan dalam proses pengambilan data
class ApiResponse<T> {

  // variabel ini nanti akan dipanggil untuk menentukan state aplikasi dalam
  // pemrosesan data API
  Status status;

  // variabel ini nanti akan dipanggil untuk mengambil data respon
  T data;

  String message;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

// state pemrosesan data API
enum Status { LOADING, COMPLETED, ERROR }
