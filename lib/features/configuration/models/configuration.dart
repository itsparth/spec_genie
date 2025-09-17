import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'configuration.mapper.dart';
part 'configuration.g.dart';

@MappableClass()
@Collection()
class Configuration with ConfigurationMappable {
  final Id id;
  final String apiKey;
  final String? baseUrl; // Optional for custom API endpoints
  final String modelName;

  const Configuration({
    this.id = Isar.autoIncrement,
    this.apiKey = '',
    this.baseUrl,
    required this.modelName,
  });
}
