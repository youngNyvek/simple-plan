// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_transaction_entry_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFixedTransactionEntryModelCollection on Isar {
  IsarCollection<FixedTransactionEntryModel> get fixedTransactionEntryModels =>
      this.collection();
}

const FixedTransactionEntryModelSchema = CollectionSchema(
  name: r'FixedTransactionEntryModel',
  id: 2778258498720986462,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'categories': PropertySchema(
      id: 1,
      name: r'categories',
      type: IsarType.stringList,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'finishDate': PropertySchema(
      id: 3,
      name: r'finishDate',
      type: IsarType.dateTime,
    ),
    r'occurrenceType': PropertySchema(
      id: 4,
      name: r'occurrenceType',
      type: IsarType.long,
    ),
    r'recurrenceType': PropertySchema(
      id: 5,
      name: r'recurrenceType',
      type: IsarType.long,
    ),
    r'startDate': PropertySchema(
      id: 6,
      name: r'startDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _fixedTransactionEntryModelEstimateSize,
  serialize: _fixedTransactionEntryModelSerialize,
  deserialize: _fixedTransactionEntryModelDeserialize,
  deserializeProp: _fixedTransactionEntryModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _fixedTransactionEntryModelGetId,
  getLinks: _fixedTransactionEntryModelGetLinks,
  attach: _fixedTransactionEntryModelAttach,
  version: '3.1.0+1',
);

int _fixedTransactionEntryModelEstimateSize(
  FixedTransactionEntryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categories.length * 3;
  {
    for (var i = 0; i < object.categories.length; i++) {
      final value = object.categories[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.description.length * 3;
  return bytesCount;
}

void _fixedTransactionEntryModelSerialize(
  FixedTransactionEntryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeStringList(offsets[1], object.categories);
  writer.writeString(offsets[2], object.description);
  writer.writeDateTime(offsets[3], object.finishDate);
  writer.writeLong(offsets[4], object.occurrenceType);
  writer.writeLong(offsets[5], object.recurrenceType);
  writer.writeDateTime(offsets[6], object.startDate);
}

FixedTransactionEntryModel _fixedTransactionEntryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FixedTransactionEntryModel(
    amount: reader.readDouble(offsets[0]),
    categories: reader.readStringList(offsets[1]) ?? [],
    description: reader.readString(offsets[2]),
    finishDate: reader.readDateTimeOrNull(offsets[3]),
    occurrenceType: reader.readLong(offsets[4]),
    recurrenceType: reader.readLong(offsets[5]),
    startDate: reader.readDateTime(offsets[6]),
  );
  object.id = id;
  return object;
}

P _fixedTransactionEntryModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fixedTransactionEntryModelGetId(FixedTransactionEntryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fixedTransactionEntryModelGetLinks(
    FixedTransactionEntryModel object) {
  return [];
}

void _fixedTransactionEntryModelAttach(
    IsarCollection<dynamic> col, Id id, FixedTransactionEntryModel object) {
  object.id = id;
}

extension FixedTransactionEntryModelQueryWhereSort on QueryBuilder<
    FixedTransactionEntryModel, FixedTransactionEntryModel, QWhere> {
  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FixedTransactionEntryModelQueryWhere on QueryBuilder<
    FixedTransactionEntryModel, FixedTransactionEntryModel, QWhereClause> {
  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
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

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
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

extension FixedTransactionEntryModelQueryFilter on QueryBuilder<
    FixedTransactionEntryModel, FixedTransactionEntryModel, QFilterCondition> {
  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
          QAfterFilterCondition>
      categoriesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
          QAfterFilterCondition>
      categoriesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> finishDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finishDate',
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> finishDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finishDate',
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> finishDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> finishDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> finishDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> finishDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finishDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
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

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
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

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
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

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> occurrenceTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> occurrenceTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'occurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> occurrenceTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'occurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> occurrenceTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'occurrenceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> recurrenceTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> recurrenceTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> recurrenceTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> recurrenceTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrenceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> startDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> startDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterFilterCondition> startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FixedTransactionEntryModelQueryObject on QueryBuilder<
    FixedTransactionEntryModel, FixedTransactionEntryModel, QFilterCondition> {}

extension FixedTransactionEntryModelQueryLinks on QueryBuilder<
    FixedTransactionEntryModel, FixedTransactionEntryModel, QFilterCondition> {}

extension FixedTransactionEntryModelQuerySortBy on QueryBuilder<
    FixedTransactionEntryModel, FixedTransactionEntryModel, QSortBy> {
  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByFinishDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByFinishDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByOccurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByOccurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByRecurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension FixedTransactionEntryModelQuerySortThenBy on QueryBuilder<
    FixedTransactionEntryModel, FixedTransactionEntryModel, QSortThenBy> {
  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByFinishDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByFinishDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByOccurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByOccurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByRecurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.desc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension FixedTransactionEntryModelQueryWhereDistinct on QueryBuilder<
    FixedTransactionEntryModel, FixedTransactionEntryModel, QDistinct> {
  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QDistinct> distinctByCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categories');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QDistinct> distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QDistinct> distinctByFinishDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finishDate');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QDistinct> distinctByOccurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occurrenceType');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QDistinct> distinctByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceType');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, FixedTransactionEntryModel,
      QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }
}

extension FixedTransactionEntryModelQueryProperty on QueryBuilder<
    FixedTransactionEntryModel, FixedTransactionEntryModel, QQueryProperty> {
  QueryBuilder<FixedTransactionEntryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, double, QQueryOperations>
      amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, List<String>, QQueryOperations>
      categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categories');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, DateTime?, QQueryOperations>
      finishDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finishDate');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, int, QQueryOperations>
      occurrenceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occurrenceType');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, int, QQueryOperations>
      recurrenceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceType');
    });
  }

  QueryBuilder<FixedTransactionEntryModel, DateTime, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }
}
