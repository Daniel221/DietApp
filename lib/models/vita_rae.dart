import 'package:equatable/equatable.dart';

class VitaRae extends Equatable {
	final String? label;
	final double? quantity;
	final String? unit;

	const VitaRae({this.label, this.quantity, this.unit});

	factory VitaRae.fromJson(Map<String, dynamic> json) => VitaRae(
				label: json['label'] as String?,
				quantity: (json['quantity'] as num?)?.toDouble(),
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
