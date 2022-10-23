class TicektModel {
  bool? error;
  List<Ticket>? tickett;
  TicektModel.withError1(bool errorMessage) {
    error = errorMessage;
  }

  TicektModel({this.error, this.tickett});

  TicektModel.fromJson(Map<String, dynamic> json) {
    error = json['Error'];
    if (json['Ticket'] != null) {
      tickett = <Ticket>[];
      json['Ticket'].forEach((v) {
        tickett!.add(new Ticket.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Error'] = this.error;
    if (this.tickett != null) {
      data['Ticket'] = this.tickett!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Ticket {
  String? tkId;
  String? tkServcieName;
  String? tkState;
  String? tkLocation;
  String? tkDate;
  String? tkDescription;
  String? usuId;
  String? tkCreated;

  Ticket(
      {this.tkId,
      this.tkServcieName,
      this.tkState,
      this.tkLocation,
      this.tkDate,
      this.tkDescription,
      this.usuId,
      this.tkCreated});

  Ticket.fromJson(Map<String, dynamic> json) {
    tkId = json['tk_id'];
    tkServcieName = json['tk_service_name'];
    tkState = json['tk_state'];
    tkLocation = json['tk_location'];
    tkDate = json['tk_date'];
    tkDescription = json['tk_description'];
    usuId = json['usu_id'];
    tkCreated = json['tk_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tk_id'] = this.tkId;
    data['tk_service_name'] = this.tkServcieName;
    data['tk_state'] = this.tkState;
    data['tk_location'] = this.tkLocation;
    data['tk_date'] = this.tkDate;
    data['tk_description'] = this.tkDescription;
    data['usu_id'] = this.usuId;
    data['tk_created'] = this.tkCreated;
    return data;
  }
}
