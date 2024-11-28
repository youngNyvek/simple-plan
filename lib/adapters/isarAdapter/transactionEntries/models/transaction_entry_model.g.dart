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
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'done': PropertySchema(
      id: 3,
      name: r'done',
      type: IsarType.bool,
    ),
    r'dueDate': PropertySchema(
      id: 4,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'excludedMonths': PropertySchema(
      id: 5,
      name: r'excludedMonths',
      type: IsarType.stringList,
    ),
    r'finalDate': PropertySchema(
      id: 6,
      name: r'finalDate',
      type: IsarType.dateTime,
    ),
    r'installment': PropertySchema(
      id: 7,
      name: r'installment',
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
  {
    final list = object.excludedMonths;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
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
  writer.writeString(offsets[2], object.description);
  writer.writeBool(offsets[3], object.done);
  writer.writeDateTime(offsets[4], object.dueDate);
  writer.writeStringList(offsets[5], object.excludedMonths);
  writer.writeDateTime(offsets[6], object.finalDate);
  writer.writeLong(offsets[7], object.installment);
  writer.writeLong(offsets[8], object.occurrenceType);
  writer.writeLong(offsets[9], object.recurrenceType);
}

TransactionEntryModel _transactionEntryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionEntryModel(
    reader.readLongOrNull(offsets[7]),
    reader.readString(offsets[2]),
    reader.readDouble(offsets[0]),
    reader.readDateTime(offsets[4]),
    reader.readLong(offsets[8]),
    reader.readBool(offsets[3]),
    reader.readStringList(offsets[1]) ?? [],
    reader.readLong(offsets[9]),
    reader.readDateTimeOrNull(offsets[6]),
    reader.readStringList(offsets[5]),
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readStringList(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
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
      QAfterFilterCondition> dueDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> dueDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> dueDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> dueDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'excludedMonths',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'excludedMonths',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'excludedMonths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'excludedMonths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'excludedMonths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'excludedMonths',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'excludedMonths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'excludedMonths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
          QAfterFilterCondition>
      excludedMonthsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'excludedMonths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
          QAfterFilterCondition>
      excludedMonthsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'excludedMonths',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'excludedMonths',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'excludedMonths',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedMonths',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedMonths',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedMonths',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedMonths',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedMonths',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> excludedMonthsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedMonths',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finalDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finalDate',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finalDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finalDate',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finalDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finalDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finalDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> finalDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalDate',
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
      QAfterFilterCondition> installmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'installment',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> installmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'installment',
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> installmentEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'installment',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> installmentGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'installment',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> installmentLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'installment',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
      QAfterFilterCondition> installmentBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'installment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
      QAfterFilterCondition> recurrenceTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrenceType',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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

  QueryBuilder<TransactionEntryModel, TransactionEntryModel,
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
      sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByFinalDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByFinalDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installment', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByInstallmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installment', Sort.desc);
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
      sortByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      sortByRecurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.desc);
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
      thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByFinalDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByFinalDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalDate', Sort.desc);
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
      thenByInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installment', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByInstallmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installment', Sort.desc);
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
      thenByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.asc);
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QAfterSortBy>
      thenByRecurrenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceType', Sort.desc);
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
      distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByExcludedMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'excludedMonths');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByFinalDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalDate');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByInstallment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'installment');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByOccurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occurrenceType');
    });
  }

  QueryBuilder<TransactionEntryModel, TransactionEntryModel, QDistinct>
      distinctByRecurrenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceType');
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

  QueryBuilder<TransactionEntryModel, DateTime, QQueryOperations>
      dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<TransactionEntryModel, List<String>?, QQueryOperations>
      excludedMonthsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'excludedMonths');
    });
  }

  QueryBuilder<TransactionEntryModel, DateTime?, QQueryOperations>
      finalDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalDate');
    });
  }

  QueryBuilder<TransactionEntryModel, int?, QQueryOperations>
      installmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'installment');
    });
  }

  QueryBuilder<TransactionEntryModel, int, QQueryOperations>
      occurrenceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occurrenceType');
    });
  }

  QueryBuilder<TransactionEntryModel, int, QQueryOperations>
      recurrenceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceType');
    });
  }
}
