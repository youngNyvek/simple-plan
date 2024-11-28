// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'done_transaction_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDoneTransactionModelCollection on Isar {
  IsarCollection<DoneTransactionModel> get doneTransactionModels =>
      this.collection();
}

const DoneTransactionModelSchema = CollectionSchema(
  name: r'DoneTransactionModel',
  id: 3389531503241972123,
  properties: {
    r'monthKey': PropertySchema(
      id: 0,
      name: r'monthKey',
      type: IsarType.string,
    ),
    r'transactionId': PropertySchema(
      id: 1,
      name: r'transactionId',
      type: IsarType.long,
    ),
    r'value': PropertySchema(
      id: 2,
      name: r'value',
      type: IsarType.bool,
    )
  },
  estimateSize: _doneTransactionModelEstimateSize,
  serialize: _doneTransactionModelSerialize,
  deserialize: _doneTransactionModelDeserialize,
  deserializeProp: _doneTransactionModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _doneTransactionModelGetId,
  getLinks: _doneTransactionModelGetLinks,
  attach: _doneTransactionModelAttach,
  version: '3.1.0+1',
);

int _doneTransactionModelEstimateSize(
  DoneTransactionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.monthKey.length * 3;
  return bytesCount;
}

void _doneTransactionModelSerialize(
  DoneTransactionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.monthKey);
  writer.writeLong(offsets[1], object.transactionId);
  writer.writeBool(offsets[2], object.value);
}

DoneTransactionModel _doneTransactionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DoneTransactionModel(
    reader.readString(offsets[0]),
    reader.readLong(offsets[1]),
    reader.readBool(offsets[2]),
  );
  object.id = id;
  return object;
}

P _doneTransactionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _doneTransactionModelGetId(DoneTransactionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _doneTransactionModelGetLinks(
    DoneTransactionModel object) {
  return [];
}

void _doneTransactionModelAttach(
    IsarCollection<dynamic> col, Id id, DoneTransactionModel object) {
  object.id = id;
}

extension DoneTransactionModelQueryWhereSort
    on QueryBuilder<DoneTransactionModel, DoneTransactionModel, QWhere> {
  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DoneTransactionModelQueryWhere
    on QueryBuilder<DoneTransactionModel, DoneTransactionModel, QWhereClause> {
  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterWhereClause>
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

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterWhereClause>
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

extension DoneTransactionModelQueryFilter on QueryBuilder<DoneTransactionModel,
    DoneTransactionModel, QFilterCondition> {
  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
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

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
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

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
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

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> monthKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> monthKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> monthKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> monthKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> monthKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'monthKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> monthKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'monthKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
          QAfterFilterCondition>
      monthKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'monthKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
          QAfterFilterCondition>
      monthKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'monthKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> monthKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthKey',
        value: '',
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> monthKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'monthKey',
        value: '',
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> transactionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: value,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> transactionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionId',
        value: value,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> transactionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionId',
        value: value,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> transactionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel,
      QAfterFilterCondition> valueEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
      ));
    });
  }
}

extension DoneTransactionModelQueryObject on QueryBuilder<DoneTransactionModel,
    DoneTransactionModel, QFilterCondition> {}

extension DoneTransactionModelQueryLinks on QueryBuilder<DoneTransactionModel,
    DoneTransactionModel, QFilterCondition> {}

extension DoneTransactionModelQuerySortBy
    on QueryBuilder<DoneTransactionModel, DoneTransactionModel, QSortBy> {
  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      sortByMonthKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthKey', Sort.asc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      sortByMonthKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthKey', Sort.desc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      sortByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      sortByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension DoneTransactionModelQuerySortThenBy
    on QueryBuilder<DoneTransactionModel, DoneTransactionModel, QSortThenBy> {
  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      thenByMonthKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthKey', Sort.asc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      thenByMonthKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthKey', Sort.desc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      thenByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      thenByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QAfterSortBy>
      thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension DoneTransactionModelQueryWhereDistinct
    on QueryBuilder<DoneTransactionModel, DoneTransactionModel, QDistinct> {
  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QDistinct>
      distinctByMonthKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QDistinct>
      distinctByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionId');
    });
  }

  QueryBuilder<DoneTransactionModel, DoneTransactionModel, QDistinct>
      distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }
}

extension DoneTransactionModelQueryProperty on QueryBuilder<
    DoneTransactionModel, DoneTransactionModel, QQueryProperty> {
  QueryBuilder<DoneTransactionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DoneTransactionModel, String, QQueryOperations>
      monthKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthKey');
    });
  }

  QueryBuilder<DoneTransactionModel, int, QQueryOperations>
      transactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionId');
    });
  }

  QueryBuilder<DoneTransactionModel, bool, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}
