import 'package:dart_mappable/dart_mappable.dart';
import 'package:objectbox/objectbox.dart';

part 'configuration.mapper.dart';

@MappableClass()
@Entity()
class Configuration with ConfigurationMappable {
  @Id()
  int id;
  final String apiKey;
  final String? baseUrl; // Optional for custom API endpoints
  final String modelName;

  Configuration({
    this.id = 0,
    this.apiKey = '',
    this.baseUrl,
    required this.modelName,
  });
}
