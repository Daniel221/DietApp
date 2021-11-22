import 'package:equatable/equatable.dart';

class Vitb12 extends Equatable {
	final String? label;
	final double? quantity;
	final String? unit;

	const Vitb12({this.label, this.quantity, this.unit});

	factory Vitb12.fromJson(Map<String, dynamic> json) => Vitb12(
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
