// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entry_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTransactionEntryModelCollection on Isar {
  IsarCollection<TransactionEntryModel> get transactionEntryModels =>
      this.collection();
}

const TransactionEntryModelSchema = CollectionSchema(
  name: r'TransactionEntryModel',
  id: 3419746359470319628,
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
    r'monthlyPlanId': PropertySchema(
      id: 7,
      name: r'monthlyPlanId',
      type: IsarType.string,
    ),
    r'occurrenceType': PropertySchema(
      id: 8,
      name: r'occurrenceType',
      type: IsarType.long,
    ),
    r'startDate': PropertySchema(
      id: 9,
      name: r'startDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _transactionEntryModelEstimateSize,
  serialize: _transactionEntryModelSerialize,
  deserialize: _transactionEntryModelDeserialize,
  deserializeProp: _transactionEntryModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _transactionEntryModelGetId,
  getLinks: _transactionEntryModelGetLinks,
  attach: _transactionEntryModelAttach,
  version: '3.1.0+1',
);

int _transactionEntryModelEstimateSize(
  TransactionEntryModel object,
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
  bytesCount += 3 + object.monthlyPlanId.length * 3;
  return bytesCount;
}

void _transactionEntryModelSerialize(
  TransactionEntryModel object,
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
  writer.writeString(offsets[7], object.monthlyPlanId);
  writer.writeLong(offsets[8], object.occurrenceType);
  writer.writeDateTime(offsets[9], object.startDate);
}

TransactionEntryModel _transactionEntryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionEntryModel(
    amount: reader.readDouble(offsets[0]),
    categories: reader.readStringList(offsets[1]) ?? [],
    currentInstallment: reader.readLongOrNull(offsets[2]),
    description: reader.readString(offsets[3]),
    done: reader.readBool(offsets[4]),
    finalInstallment: reader.readLongOrNull(offsets[5]),
    finishDate: reader.readDateTimeOrNull(offsets[6]),
    monthlyPlanId: reader.readString(offsets[7]),
    occurrenceType: reader.readLong(offsets[8]),
    startDate: reader.readDateTime(offsets[9]),
  );
  object.id = id;
  return object;
}

P _transactionEntryModelDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _transactionEntryModelGetId(TransactionEntryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transactionEntryModelGetLinks(
    TransactionEntryModel object) {
  return [];
}

void _transactionEntryModelAttach(
    IsarCollection<dynamic> col, Id id, TransactionEntryModel object) {
  object.id = id;
}

extension TransactionEntryModelQueryWhereSort
    on QueryBuilder<TransactionEntryModel, TransactionEntryModel, QWhere> {
  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TransactionEntryModelQueryWhere on QueryBuilder<TransactionEntryModel,
    TransactionEntryModel, QWhereClause> {
  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterWhereClause>
      idBetween(
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

extension TransactionEntryModelQueryFilter on QueryBuilder<
    TransactionEntryModel, TransactionEntryModel, QFilterCondition> {
  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> categoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> categoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> currentInstallmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentInstallment',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> currentInstallmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentInstallment',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> currentInstallmentEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentInstallment',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> doneEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'done',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finalInstallmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalInstallment',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finalInstallmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalInstallment',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finalInstallmentEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalInstallment',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finishDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finishDate',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finishDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finishDate',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finishDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> monthlyPlanIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> monthlyPlanIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthlyPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> monthlyPlanIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthlyPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> monthlyPlanIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthlyPlanId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> monthlyPlanIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'monthlyPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> monthlyPlanIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'monthlyPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
          QAfterFilterCondition>
      monthlyPlanIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'monthlyPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
          QAfterFilterCondition>
      monthlyPlanIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'monthlyPlanId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> monthlyPlanIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyPlanId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> monthlyPlanIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'monthlyPlanId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> occurrenceTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

extension TransactionEntryModelQueryObject on QueryBuilder<
    TransactionEntryModel, TransactionEntryModel, QFilterCondition> {}

extension TransactionEntryModelQueryLinks on QueryBuilder<TransactionEntryModel,
    TransactionEntryModel, QFilterCondition> {}

extension TransactionEntryModelQuerySortBy
    on QueryBuilder<TransactionEntryModel, TransactionEntryModel, QSortBy> {
  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByCurrentInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentInstallment', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByCurrentInstallmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentInstallment', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByFinalInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalInstallment', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByFinalInstallmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalInstallment', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByFinishDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByFinishDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByMonthlyPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyPlanId', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByMonthlyPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyPlanId', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByOccurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByOccurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension TransactionEntryModelQuerySortThenBy
    on QueryBuilder<TransactionEntryModel, TransactionEntryModel, QSortThenBy> {
  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByCurrentInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentInstallment', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByCurrentInstallmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentInstallment', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByFinalInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalInstallment', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByFinalInstallmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalInstallment', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByFinishDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByFinishDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByMonthlyPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyPlanId', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByMonthlyPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyPlanId', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByOccurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByOccurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrenceType', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension TransactionEntryModelQueryWhereDistinct
    on QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct> {
  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categories');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByCurrentInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentInstallment');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'done');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByFinalInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalInstallment');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByFinishDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finishDate');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByMonthlyPlanId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyPlanId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByOccurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occurrenceType');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }
}

extension TransactionEntryModelQueryProperty on QueryBuilder<
    TransactionEntryModel, TransactionEntryModel, QQueryProperty> {
  QueryBuilder<TransactionEntryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TransactionEntryModel, double, QQueryOperations>
      amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<TransactionEntryModel, List<String>, QQueryOperations>
      categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categories');
    });
  }

  QueryBuilder<TransactionEntryModel, int?, QQueryOperations>
      currentInstallmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentInstallment');
    });
  }

  QueryBuilder<TransactionEntryModel, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TransactionEntryModel, bool, QQueryOperations> doneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'done');
    });
  }

  QueryBuilder<TransactionEntryModel, int?, QQueryOperations>
      finalInstallmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalInstallment');
    });
  }

  QueryBuilder<TransactionEntryModel, DateTime?, QQueryOperations>
      finishDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finishDate');
    });
  }

  QueryBuilder<TransactionEntryModel, String, QQueryOperations>
      monthlyPlanIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyPlanId');
    });
  }

  QueryBuilder<TransactionEntryModel, int, QQueryOperations>
      occurrenceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occurrenceType');
    });
  }

  QueryBuilder<TransactionEntryModel, DateTime, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }
}
