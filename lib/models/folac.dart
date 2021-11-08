import 'package:equatable/equatable.dart';

class Folac extends Equatable {
	final String? label;
	final int? quantity;
	final String? unit;

	const Folac({this.label, this.quantity, this.unit});

	factory Folac.fromJson(Map<String, dynamic> json) => Folac(
				label: json['label'] as String?,
				quantity: json['quantity'] as int?,
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
