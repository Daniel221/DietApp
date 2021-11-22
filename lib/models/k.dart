import 'package:equatable/equatable.dart';

class K extends Equatable {
	final String? label;
	final double? quantity;
	final String? unit;

	const K({this.label, this.quantity, this.unit});

	factory K.fromJson(Map<String, dynamic> json) => K(
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
