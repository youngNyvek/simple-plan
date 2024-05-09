// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_transaction_entry_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDynamicTransactionEntryModelCollection on Isar {
  IsarCollection<DynamicTransactionEntryModel>
      get dynamicTransactionEntryModels => this.collection();
}

const DynamicTransactionEntryModelSchema = CollectionSchema(
  name: r'DynamicTransactionEntryModel',
  id: -8314521216649533984,
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
    r'currentInstallment': PropertySchema(
      id: 2,
      name: r'currentInstallment',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'done': PropertySchema(
      id: 4,
      name: r'done',
      type: IsarType.bool,
    ),
    r'finalInstallment': PropertySchema(
      id: 5,
      name: r'finalInstallment',
      type: IsarType.long,
    ),
    r'finishDate': PropertySchema(
      id: 6,
      name: r'finishDate',
      type: IsarType.dateTime,
    ),
    r'fixedTransactionId': PropertySchema(
      id: 7,
      name: r'fixedTransactionId',
      type: IsarType.long,
    ),
    r'occurrenceType': PropertySchema(
      id: 8,
      name: r'occurrenceType',
      type: IsarType.long,
    ),
    r'recurrenceType': PropertySchema(
      id: 9,
      name: r'recurrenceType',
      type: IsarType.long,
    ),
    r'startDate': PropertySchema(
      id: 10,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'transactionBaseId': PropertySchema(
      id: 11,
      name: r'transactionBaseId',
      type: IsarType.long,
    )
  },
  estimateSize: _dynamicTransactionEntryModelEstimateSize,
  serialize: _dynamicTransactionEntryModelSerialize,
  deserialize: _dynamicTransactionEntryModelDeserialize,
  deserializeProp: _dynamicTransactionEntryModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dynamicTransactionEntryModelGetId,
  getLinks: _dynamicTransactionEntryModelGetLinks,
  attach: _dynamicTransactionEntryModelAttach,
  version: '3.1.0+1',
);

int _dynamicTransactionEntryModelEstimateSize(
  DynamicTransactionEntryModel object,
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

void _dynamicTransactionEntryModelSerialize(
  DynamicTransactionEntryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeStringList(offsets[1], object.categories);
  writer.writeLong(offsets[2], object.currentInstallment);
  writer.writeString(offsets[3], object.description);
  writer.writeBool(offsets[4], object.done);
  writer.writeLong(offsets[5], object.finalInstallment);
  writer.writeDateTime(offsets[6], object.finishDate);
  writer.writeLong(offsets[7], object.fixedTransactionId);
  writer.writeLong(offsets[8], object.occurrenceType);
  writer.writeLong(offsets[9], object.recurrenceType);
  writer.writeDateTime(offsets[10], object.startDate);
  writer.writeLong(offsets[11], object.transactionBaseId);
}

DynamicTransactionEntryModel _dynamicTransactionEntryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DynamicTransactionEntryModel(
    amount: reader.readDouble(offsets[0]),
    categories: reader.readStringList(offsets[1]) ?? [],
    currentInstallment: reader.readLongOrNull(offsets[2]),
    description: reader.readString(offsets[3]),
    done: reader.readBool(offsets[4]),
    finalInstallment: reader.readLongOrNull(offsets[5]),
    finishDate: reader.readDateTimeOrNull(offsets[6]),
    fixedTransactionId: reader.readLongOrNull(offsets[7]),
    occurrenceType: reader.readLong(offsets[8]),
    recurrenceType: reader.readLong(offsets[9]),
    startDate: reader.readDateTime(offsets[10]),
    transactionBaseId: reader.readLongOrNull(offsets[11]),
  );
  object.id = id;
  return object;
}

P _dynamicTransactionEntryModelDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dynamicTransactionEntryModelGetId(DynamicTransactionEntryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dynamicTransactionEntryModelGetLinks(
    DynamicTransactionEntryModel object) {
  return [];
}

void _dynamicTransactionEntryModelAttach(
    IsarCollection<dynamic> col, Id id, DynamicTransactionEntryModel object) {
  object.id = id;
}

extension DynamicTransactionEntryModelQueryWhereSort on QueryBuilder<
    DynamicTransactionEntryModel, DynamicTransactionEntryModel, QWhere> {
  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DynamicTransactionEntryModelQueryWhere on QueryBuilder<
    DynamicTransactionEntryModel, DynamicTransactionEntryModel, QWhereClause> {
  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

extension DynamicTransactionEntryModelQueryFilter on QueryBuilder<
    DynamicTransactionEntryModel,
    DynamicTransactionEntryModel,
    QFilterCondition> {
  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> categoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> categoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> currentInstallmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentInstallment',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> currentInstallmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentInstallment',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> currentInstallmentEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentInstallment',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> currentInstallmentGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentInstallment',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> currentInstallmentLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentInstallment',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> currentInstallmentBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentInstallment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> doneEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'done',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> finalInstallmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalInstallment',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> finalInstallmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalInstallment',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> finalInstallmentEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalInstallment',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> finalInstallmentGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalInstallment',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> finalInstallmentLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalInstallment',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> finalInstallmentBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalInstallment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> finishDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finishDate',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> finishDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finishDate',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> finishDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> fixedTransactionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fixedTransactionId',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> fixedTransactionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fixedTransactionId',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> fixedTransactionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fixedTransactionId',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> fixedTransactionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fixedTransactionId',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> fixedTransactionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fixedTransactionId',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> fixedTransactionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fixedTransactionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> occurrenceTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> recurrenceTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
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

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> transactionBaseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionBaseId',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> transactionBaseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionBaseId',
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> transactionBaseIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionBaseId',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> transactionBaseIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionBaseId',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> transactionBaseIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionBaseId',
        value: value,
      ));
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterFilterCondition> transactionBaseIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionBaseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DynamicTransactionEntryModelQueryObject on QueryBuilder<
    DynamicTransactionEntryModel,
    DynamicTransactionEntryModel,
    QFilterCondition> {}

extension DynamicTransactionEntryModelQueryLinks on QueryBuilder<
    DynamicTransactionEntryModel,
    DynamicTransactionEntryModel,
    QFilterCondition> {}

extension DynamicTransactionEntryModelQuerySortBy on QueryBuilder<
    DynamicTransactionEntryModel, DynamicTransactionEntryModel, QSortBy> {
  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByCurrentInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentInstallment', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByCurrentInstallmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentInstallment', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByFinalInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalInstallment', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByFinalInstallmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalInstallment', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByFinishDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByFinishDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByFixedTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixedTransactionId', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByFixedTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixedTransactionId', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByOccurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByOccurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByRecurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByTransactionBaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBaseId', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> sortByTransactionBaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBaseId', Sort.desc);
    });
  }
}

extension DynamicTransactionEntryModelQuerySortThenBy on QueryBuilder<
    DynamicTransactionEntryModel, DynamicTransactionEntryModel, QSortThenBy> {
  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByCurrentInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentInstallment', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByCurrentInstallmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentInstallment', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByFinalInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalInstallment', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByFinalInstallmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalInstallment', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByFinishDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByFinishDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByFixedTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixedTransactionId', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByFixedTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixedTransactionId', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByOccurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByOccurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByRecurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByTransactionBaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBaseId', Sort.asc);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QAfterSortBy> thenByTransactionBaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBaseId', Sort.desc);
    });
  }
}

extension DynamicTransactionEntryModelQueryWhereDistinct on QueryBuilder<
    DynamicTransactionEntryModel, DynamicTransactionEntryModel, QDistinct> {
  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categories');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByCurrentInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentInstallment');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'done');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByFinalInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalInstallment');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByFinishDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finishDate');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByFixedTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fixedTransactionId');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByOccurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occurrenceType');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceType');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DynamicTransactionEntryModel,
      QDistinct> distinctByTransactionBaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionBaseId');
    });
  }
}

extension DynamicTransactionEntryModelQueryProperty on QueryBuilder<
    DynamicTransactionEntryModel,
    DynamicTransactionEntryModel,
    QQueryProperty> {
  QueryBuilder<DynamicTransactionEntryModel, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, double, QQueryOperations>
      amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, List<String>, QQueryOperations>
      categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categories');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, int?, QQueryOperations>
      currentInstallmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentInstallment');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, bool, QQueryOperations>
      doneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'done');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, int?, QQueryOperations>
      finalInstallmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalInstallment');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DateTime?, QQueryOperations>
      finishDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finishDate');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, int?, QQueryOperations>
      fixedTransactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fixedTransactionId');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, int, QQueryOperations>
      occurrenceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occurrenceType');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, int, QQueryOperations>
      recurrenceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceType');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, DateTime, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<DynamicTransactionEntryModel, int?, QQueryOperations>
      transactionBaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionBaseId');
    });
  }
}
