class ParkingSpotModel {
  String id;
  String matriculaCar;
  String referencia;
  String clienteName;
  String produto;

  ParkingSpotModel(this.id, this.clienteName, this.matriculaCar, this.produto,
      this.referencia);

  factory ParkingSpotModel.fromJson(dynamic json) {
    return ParkingSpotModel(
        json['id'] as String,
        json['matriculaCar'] as String,
        json['referencia'] as String,
        json['clienteName'] as String,
        json['produto'] as String);
  }

  Map<String, dynamic> toJson() => {
        if (id != 0) 'id': id,
        'matriculaCar': matriculaCar,
        'referencia': referencia,
        'clienteName': clienteName,
        'produto': produto
      };
}
