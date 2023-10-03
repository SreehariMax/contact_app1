class Api_Response {
  final bool Status;
  final dynamic? data;
  final String? token;
  final String? error;
  final String? msg;

  Api_Response(
      {required this.Status,
       this.data,
       this.token,
       this.error,
       this.msg});

  factory Api_Response.fromJSON(Map<String, dynamic> json) {
    return Api_Response(
        Status: json['Status'],
        data: json['data'],
        token: json['token'],
        error: json['error'],
        msg: json['msg']);
  }
}
