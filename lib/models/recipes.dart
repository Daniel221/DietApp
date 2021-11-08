import 'package:equatable/equatable.dart';

import 'hit.dart';
import 'links.dart';

class Recipes extends Equatable {
	final int? from;
	final int? to;
	final int? count;
	final Links? links;
	final List<Hit>? hits;

	const Recipes({this.from, this.to, this.count, this.links, this.hits});

	factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
				from: json['from'] as int?,
				to: json['to'] as int?,
				count: json['count'] as int?,
				links: json['_links'] == null
						? null
						: Links.fromJson(json['_links'] as Map<String, dynamic>),
				hits: (json['hits'] as List<dynamic>?)
						?.map((e) => Hit.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'from': from,
				'to': to,
				'count': count,
				'_links': links?.toJson(),
				'hits': hits?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [from, to, count, links, hits];
}
