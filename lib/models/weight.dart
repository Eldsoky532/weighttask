class WeightModel
{
  String? weight;
  String? datetime;

  WeightModel({required this.weight,required this.datetime});

   factory WeightModel.fromJson(Map<String ,dynamic>json)
  {
    return WeightModel(weight: json['weight'], datetime: json['data']);
  }

  Map<String ,dynamic>toMap()
  {
    return {
      'weight':weight,
      'data':datetime
    };
  }
}