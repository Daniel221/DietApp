import 'package:equatable/equatable.dart';

class Chole extends Equatable {
  final String? label;
  final double? quantity;
  final String? unit;

  const Chole({this.label, this.quantity, this.unit});

  factory Chole.fromJson(Map<String, dynamic> json) => Chole(
        label: json['label'] as String?,
        quantity: json['quantity'] as double?,
        unit: json['unit'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'quantity': quantity,
        'unit': unit,
      };

  @override
  List<Object?> get props => [label, quantity, unit];
}
