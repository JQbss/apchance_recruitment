// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/employees_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 1559454863827360489),
      name: 'Employee',
      lastPropertyId: const IdUid(6, 5148823018940306820),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7916774277888411471),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5164903436154885968),
            name: 'firstName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 806621257626099224),
            name: 'lastName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 728290452057568074),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4483954993123407252),
            name: 'avatar',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 5148823018940306820),
            name: 'cityName',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 1559454863827360489),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [7956764302115727281],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        6654732761830482985,
        4546657810616887297,
        4273629231193640390,
        2379871393855675577,
        6438148968062474679
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Employee: EntityDefinition<Employee>(
        model: _entities[0],
        toOneRelations: (Employee object) => [],
        toManyRelations: (Employee object) => {},
        getId: (Employee object) => object.id,
        setId: (Employee object, int id) {
          object.id = id;
        },
        objectToFB: (Employee object, fb.Builder fbb) {
          final firstNameOffset = fbb.writeString(object.firstName);
          final lastNameOffset = fbb.writeString(object.lastName);
          final descriptionOffset = fbb.writeString(object.description);
          final avatarOffset = fbb.writeString(object.avatar);
          final cityNameOffset = fbb.writeString(object.cityName);
          fbb.startTable(7);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, firstNameOffset);
          fbb.addOffset(2, lastNameOffset);
          fbb.addOffset(3, descriptionOffset);
          fbb.addOffset(4, avatarOffset);
          fbb.addOffset(5, cityNameOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Employee(
              id: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              firstName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              lastName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              description: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              avatar: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              cityName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Employee] entity fields to define ObjectBox queries.
class Employee_ {
  /// see [Employee.id]
  static final id = QueryIntegerProperty<Employee>(_entities[0].properties[0]);

  /// see [Employee.firstName]
  static final firstName =
      QueryStringProperty<Employee>(_entities[0].properties[1]);

  /// see [Employee.lastName]
  static final lastName =
      QueryStringProperty<Employee>(_entities[0].properties[2]);

  /// see [Employee.description]
  static final description =
      QueryStringProperty<Employee>(_entities[0].properties[3]);

  /// see [Employee.avatar]
  static final avatar =
      QueryStringProperty<Employee>(_entities[0].properties[4]);

  /// see [Employee.cityName]
  static final cityName =
      QueryStringProperty<Employee>(_entities[0].properties[5]);
}
