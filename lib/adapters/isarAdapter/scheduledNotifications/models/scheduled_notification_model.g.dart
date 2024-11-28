// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_notification_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScheduledNotificationModelCollection on Isar {
  IsarCollection<ScheduledNotificationModel> get scheduledNotificationModels =>
      this.collection();
}

const ScheduledNotificationModelSchema = CollectionSchema(
  name: r'ScheduledNotificationModel',
  id: 5779131281040215111,
  properties: {
    r'notificationDay': PropertySchema(
      id: 0,
      name: r'notificationDay',
      type: IsarType.long,
    )
  },
  estimateSize: _scheduledNotificationModelEstimateSize,
  serialize: _scheduledNotificationModelSerialize,
  deserialize: _scheduledNotificationModelDeserialize,
  deserializeProp: _scheduledNotificationModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _scheduledNotificationModelGetId,
  getLinks: _scheduledNotificationModelGetLinks,
  attach: _scheduledNotificationModelAttach,
  version: '3.1.0+1',
);

int _scheduledNotificationModelEstimateSize(
  ScheduledNotificationModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _scheduledNotificationModelSerialize(
  ScheduledNotificationModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.notificationDay);
}

ScheduledNotificationModel _scheduledNotificationModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScheduledNotificationModel(
    reader.readLong(offsets[0]),
  );
  object.id = id;
  return object;
}

P _scheduledNotificationModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scheduledNotificationModelGetId(ScheduledNotificationModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scheduledNotificationModelGetLinks(
    ScheduledNotificationModel object) {
  return [];
}

void _scheduledNotificationModelAttach(
    IsarCollection<dynamic> col, Id id, ScheduledNotificationModel object) {
  object.id = id;
}

extension ScheduledNotificationModelQueryWhereSort on QueryBuilder<
    ScheduledNotificationModel, ScheduledNotificationModel, QWhere> {
  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScheduledNotificationModelQueryWhere on QueryBuilder<
    ScheduledNotificationModel, ScheduledNotificationModel, QWhereClause> {
  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScheduledNotificationModelQueryFilter on QueryBuilder<
    ScheduledNotificationModel, ScheduledNotificationModel, QFilterCondition> {
  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterFilterCondition> notificationDayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationDay',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterFilterCondition> notificationDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificationDay',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterFilterCondition> notificationDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificationDay',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterFilterCondition> notificationDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificationDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScheduledNotificationModelQueryObject on QueryBuilder<
    ScheduledNotificationModel, ScheduledNotificationModel, QFilterCondition> {}

extension ScheduledNotificationModelQueryLinks on QueryBuilder<
    ScheduledNotificationModel, ScheduledNotificationModel, QFilterCondition> {}

extension ScheduledNotificationModelQuerySortBy on QueryBuilder<
    ScheduledNotificationModel, ScheduledNotificationModel, QSortBy> {
  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterSortBy> sortByNotificationDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationDay', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterSortBy> sortByNotificationDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationDay', Sort.desc);
    });
  }
}

extension ScheduledNotificationModelQuerySortThenBy on QueryBuilder<
    ScheduledNotificationModel, ScheduledNotificationModel, QSortThenBy> {
  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterSortBy> thenByNotificationDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationDay', Sort.asc);
    });
  }

  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QAfterSortBy> thenByNotificationDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationDay', Sort.desc);
    });
  }
}

extension ScheduledNotificationModelQueryWhereDistinct on QueryBuilder<
    ScheduledNotificationModel, ScheduledNotificationModel, QDistinct> {
  QueryBuilder<ScheduledNotificationModel, ScheduledNotificationModel,
      QDistinct> distinctByNotificationDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationDay');
    });
  }
}

extension ScheduledNotificationModelQueryProperty on QueryBuilder<
    ScheduledNotificationModel, ScheduledNotificationModel, QQueryProperty> {
  QueryBuilder<ScheduledNotificationModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ScheduledNotificationModel, int, QQueryOperations>
      notificationDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationDay');
    });
  }
}
