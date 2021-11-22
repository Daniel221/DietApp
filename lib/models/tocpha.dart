import 'package:equatable/equatable.dart';

class Tocpha extends Equatable {
	final String? label;
	final double? quantity;
	final String? unit;

	const Tocpha({this.label, this.quantity, this.unit});

	factory Tocpha.fromJson(Map<String, dynamic> json) => Tocpha(
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