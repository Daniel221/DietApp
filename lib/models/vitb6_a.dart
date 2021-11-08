import 'package:equatable/equatable.dart';

class Vitb6A extends Equatable {
	final String? label;
	final double? quantity;
	final String? unit;

	const Vitb6A({this.label, this.quantity, this.unit});

	factory Vitb6A.fromJson(Map<String, dynamic> json) => Vitb6A(
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
