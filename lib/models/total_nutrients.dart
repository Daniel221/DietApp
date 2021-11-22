import 'package:equatable/equatable.dart';

import 'added.dart';
import 'ca.dart';
import 'chocdf.dart';
import 'chole.dart';
import 'enerc_kcal.dart';
import 'fams.dart';
import 'fapu.dart';
import 'fasat.dart';
import 'fat.dart';
import 'fatrn.dart';
import 'fe.dart';
import 'fibtg.dart';
import 'folac.dart';
import 'foldfe.dart';
import 'folfd.dart';
import 'k.dart';
import 'mg.dart';
import 'na.dart';
import 'nia.dart';
import 'p.dart';
import 'procnt.dart';
import 'ribf.dart';
import 'sugar.dart';
import 'thia.dart';
import 'tocpha.dart';
import 'vita_rae.dart';
import 'vitb12.dart';
import 'vitb6_a.dart';
import 'vitc.dart';
import 'vitd.dart';
import 'vitk1.dart';
import 'water.dart';
import 'zn.dart';

class TotalNutrients extends Equatable {
  final EnercKcal? enercKcal;
  final Fat? fat;
  final Fasat? fasat;
  final Fatrn? fatrn;
  final Fams? fams;
  final Fapu? fapu;
  final Chocdf? chocdf;
  final Fibtg? fibtg;
  final Sugar? sugar;
  final Added? added;
  final Procnt? procnt;
  final Chole? chole;
  final Na? na;
  final Ca? ca;
  final Mg? mg;
  final K? k;
  final Fe? fe;
  final Zn? zn;
  final P? p;
  final VitaRae? vitaRae;
  final Vitc? vitc;
  final Thia? thia;
  final Ribf? ribf;
  final Nia? nia;
  final Vitb6A? vitb6A;
  final Foldfe? foldfe;
  final Folfd? folfd;
  final Folac? folac;
  final Vitb12? vitb12;
  final Vitd? vitd;
  final Tocpha? tocpha;
  final Vitk1? vitk1;
  final Water? water;

  const TotalNutrients({
    this.enercKcal,
    this.fat,
    this.fasat,
    this.fatrn,
    this.fams,
    this.fapu,
    this.chocdf,
    this.fibtg,
    this.sugar,
    this.added,
    this.procnt,
    this.chole,
    this.na,
    this.ca,
    this.mg,
    this.k,
    this.fe,
    this.zn,
    this.p,
    this.vitaRae,
    this.vitc,
    this.thia,
    this.ribf,
    this.nia,
    this.vitb6A,
    this.foldfe,
    this.folfd,
    this.folac,
    this.vitb12,
    this.vitd,
    this.tocpha,
    this.vitk1,
    this.water,
  });

  factory TotalNutrients.fromJson(Map<String, dynamic> json) => TotalNutrients(
        enercKcal: json['ENERC_KCAL'] == null
            ? null
            : EnercKcal.fromJson(json['ENERC_KCAL'] as Map<String, dynamic>),
        fat: json['FAT'] == null
            ? null
            : Fat.fromJson(json['FAT'] as Map<String, dynamic>),
        fasat: json['FASAT'] == null
            ? null
            : Fasat.fromJson(json['FASAT'] as Map<String, dynamic>),
        fatrn: json['FATRN'] == null
            ? null
            : Fatrn.fromJson(json['FATRN'] as Map<String, dynamic>),
        fams: json['FAMS'] == null
            ? null
            : Fams.fromJson(json['FAMS'] as Map<String, dynamic>),
        fapu: json['FAPU'] == null
            ? null
            : Fapu.fromJson(json['FAPU'] as Map<String, dynamic>),
        chocdf: json['CHOCDF'] == null
            ? null
            : Chocdf.fromJson(json['CHOCDF'] as Map<String, dynamic>),
        fibtg: json['FIBTG'] == null
            ? null
            : Fibtg.fromJson(json['FIBTG'] as Map<String, dynamic>),
        sugar: json['SUGAR'] == null
            ? null
            : Sugar.fromJson(json['SUGAR'] as Map<String, dynamic>),
        added: json['SUGAR'] == null
            ? null
            : Added.fromJson(json['SUGAR'] as Map<String, dynamic>),
        procnt: json['PROCNT'] == null
            ? null
            : Procnt.fromJson(json['PROCNT'] as Map<String, dynamic>),
        chole: json['CHOLE'] == null
            ? null
            : Chole.fromJson(json['CHOLE'] as Map<String, dynamic>),
        na: json['NA'] == null
            ? null
            : Na.fromJson(json['NA'] as Map<String, dynamic>),
        ca: json['CA'] == null
            ? null
            : Ca.fromJson(json['CA'] as Map<String, dynamic>),
        mg: json['MG'] == null
            ? null
            : Mg.fromJson(json['MG'] as Map<String, dynamic>),
        k: json['K'] == null
            ? null
            : K.fromJson(json['K'] as Map<String, dynamic>),
        fe: json['FE'] == null
            ? null
            : Fe.fromJson(json['FE'] as Map<String, dynamic>),
        zn: json['ZN'] == null
            ? null
            : Zn.fromJson(json['ZN'] as Map<String, dynamic>),
        p: json['P'] == null
            ? null
            : P.fromJson(json['P'] as Map<String, dynamic>),
        vitaRae: json['VITA_RAE'] == null
            ? null
            : VitaRae.fromJson(json['VITA_RAE'] as Map<String, dynamic>),
        vitc: json['VITC'] == null
            ? null
            : Vitc.fromJson(json['VITC'] as Map<String, dynamic>),
        thia: json['THIA'] == null
            ? null
            : Thia.fromJson(json['THIA'] as Map<String, dynamic>),
        ribf: json['RIBF'] == null
            ? null
            : Ribf.fromJson(json['RIBF'] as Map<String, dynamic>),
        nia: json['NIA'] == null
            ? null
            : Nia.fromJson(json['NIA'] as Map<String, dynamic>),
        vitb6A: json['VITB6A'] == null
            ? null
            : Vitb6A.fromJson(json['VITB6A'] as Map<String, dynamic>),
        foldfe: json['FOLDFE'] == null
            ? null
            : Foldfe.fromJson(json['FOLDFE'] as Map<String, dynamic>),
        folfd: json['FOLFD'] == null
            ? null
            : Folfd.fromJson(json['FOLFD'] as Map<String, dynamic>),
        folac: json['FOLAC'] == null
            ? null
            : Folac.fromJson(json['FOLAC'] as Map<String, dynamic>),
        vitb12: json['VITB12'] == null
            ? null
            : Vitb12.fromJson(json['VITB12'] as Map<String, dynamic>),
        vitd: json['VITD'] == null
            ? null
            : Vitd.fromJson(json['VITD'] as Map<String, dynamic>),
        tocpha: json['TOCPHA'] == null
            ? null
            : Tocpha.fromJson(json['TOCPHA'] as Map<String, dynamic>),
        vitk1: json['VITK1'] == null
            ? null
            : Vitk1.fromJson(json['VITK1'] as Map<String, dynamic>),
        water: json['WATER'] == null
            ? null
            : Water.fromJson(json['WATER'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'ENERC_KCAL': enercKcal?.toJson(),
        'FAT': fat?.toJson(),
        'FASAT': fasat?.toJson(),
        'FATRN': fatrn?.toJson(),
        'FAMS': fams?.toJson(),
        'FAPU': fapu?.toJson(),
        'CHOCDF': chocdf?.toJson(),
        'FIBTG': fibtg?.toJson(),
        'SUGAR': sugar?.toJson(),
        'SUGAR': sugar?.toJson(),
        'PROCNT': procnt?.toJson(),
        'CHOLE': chole?.toJson(),
        'NA': na?.toJson(),
        'CA': ca?.toJson(),
        'MG': mg?.toJson(),
        'K': k?.toJson(),
        'FE': fe?.toJson(),
        'ZN': zn?.toJson(),
        'P': p?.toJson(),
        'VITA_RAE': vitaRae?.toJson(),
        'VITC': vitc?.toJson(),
        'THIA': thia?.toJson(),
        'RIBF': ribf?.toJson(),
        'NIA': nia?.toJson(),
        'VITB6A': vitb6A?.toJson(),
        'FOLDFE': foldfe?.toJson(),
        'FOLFD': folfd?.toJson(),
        'FOLAC': folac?.toJson(),
        'VITB12': vitb12?.toJson(),
        'VITD': vitd?.toJson(),
        'TOCPHA': tocpha?.toJson(),
        'VITK1': vitk1?.toJson(),
        'WATER': water?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      enercKcal,
      fat,
      fasat,
      fatrn,
      fams,
      fapu,
      chocdf,
      fibtg,
      sugar,
      sugar,
      procnt,
      chole,
      na,
      ca,
      mg,
      k,
      fe,
      zn,
      p,
      vitaRae,
      vitc,
      thia,
      ribf,
      nia,
      vitb6A,
      foldfe,
      folfd,
      folac,
      vitb12,
      vitd,
      tocpha,
      vitk1,
      water,
    ];
  }
}
