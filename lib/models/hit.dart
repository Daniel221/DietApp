import 'package:equatable/equatable.dart';

import 'links.dart';
import 'recipe.dart';

class Hit extends Equatable {
	final Recipe? recipe;
	final Links? links;

	const Hit({this.recipe, this.links});

	factory Hit.fromJson(Map<String, dynamic> json) => Hit(
				recipe: json['recipe'] == null
						? null
						: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
				links: json['_links'] == null
						? null
						: Links.fromJson(json['_links'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'recipe': recipe?.toJson(),
				'_links': links?.toJson(),
			};

	@override
	List<Object?> get props => [recipe, links];
}
