class ChatModel {
  bool? error;
  List<Chat>? chatt;
  ChatModel.withError1(bool errorMessage) {
    error = errorMessage;
  }

  ChatModel({this.error, this.chatt});

  ChatModel.fromJson(Map<String, dynamic> json) {
    error = json['Error'];
    if (json['Chat'] != null) {
      chatt = <Chat>[];
      json['Chat'].forEach((v) {
        chatt!.add(new Chat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Error'] = this.error;
    if (this.chatt != null) {
      data['Chat'] = this.chatt!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Chat {
  String? chId;
  String? usuId;
  String? usuFullname;
  String? chCreated;
  String? chServiceName;

  Chat({
    this.chId,
    this.usuId,
    this.usuFullname,
    this.chCreated,
    this.chServiceName,
  });

  Chat.fromJson(Map<String, dynamic> json) {
    chId = json['ch_id'];
    usuId = json['usu_id'];
    usuFullname = json['usu_fullname'];
    chCreated = json['ch_created'];
    chServiceName = json['ch_service_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ch_id'] = this.chId;
    data['usu_id'] = this.usuId;
    data['usu_fullname'] = this.usuFullname;
    data['ch_created'] = this.chCreated;
    data['ch_service_name'] = this.chServiceName;

    return data;
  }
}
