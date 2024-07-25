class AutoGenerate {
  AutoGenerate({
    required this.data,
    required this.source,
  });
  late final List<Data> data;
  late final List<Source> source;
  
  AutoGenerate.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    source = List.from(json['source']).map((e)=>Source.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['source'] = source.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.ID_Nation,
    required this.Nation,
    required this.ID_Year,
    required this.Year,
    required this.Population,
    required this.SlugNation,
  });
  late final String ID_Nation;
  late final String Nation;
  late final int ID_Year;
  late final String Year;
  late final int Population;
  late final String SlugNation;
  
  Data.fromJson(Map<String, dynamic> json){
    ID_Nation = json['ID Nation'];
    Nation = json['Nation'];
    ID_Year = json['ID Year'];
    Year = json['Year'];
    Population = json['Population'];
    SlugNation = json['Slug Nation'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID Nation'] = ID_Nation;
    _data['Nation'] = Nation;
    _data['ID Year'] = ID_Year;
    _data['Year'] = Year;
    _data['Population'] = Population;
    _data['Slug Nation'] = SlugNation;
    return _data;
  }
}

class Source {
  Source({
    required this.measures,
    required this.annotations,
    required this.name,
    required this.substitutions,
  });
  late final List<String> measures;
  late final Annotations annotations;
  late final String name;
  late final List<dynamic> substitutions;
  
  Source.fromJson(Map<String, dynamic> json){
    measures = List.castFrom<dynamic, String>(json['measures']);
    annotations = Annotations.fromJson(json['annotations']);
    name = json['name'];
    substitutions = List.castFrom<dynamic, dynamic>(json['substitutions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['measures'] = measures;
    _data['annotations'] = annotations.toJson();
    _data['name'] = name;
    _data['substitutions'] = substitutions;
    return _data;
  }
}

class Annotations {
  Annotations({
    required this.sourceName,
    required this.sourceDescription,
    required this.datasetName,
    required this.datasetLink,
    required this.tableId,
    required this.topic,
    required this.subtopic,
  });
  late final String sourceName;
  late final String sourceDescription;
  late final String datasetName;
  late final String datasetLink;
  late final String tableId;
  late final String topic;
  late final String subtopic;
  
  Annotations.fromJson(Map<String, dynamic> json){
    sourceName = json['source_name'];
    sourceDescription = json['source_description'];
    datasetName = json['dataset_name'];
    datasetLink = json['dataset_link'];
    tableId = json['table_id'];
    topic = json['topic'];
    subtopic = json['subtopic'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['source_name'] = sourceName;
    _data['source_description'] = sourceDescription;
    _data['dataset_name'] = datasetName;
    _data['dataset_link'] = datasetLink;
    _data['table_id'] = tableId;
    _data['topic'] = topic;
    _data['subtopic'] = subtopic;
    return _data;
  }
}