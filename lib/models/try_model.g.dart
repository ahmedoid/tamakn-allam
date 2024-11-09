// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'try_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTryModelCollection on Isar {
  IsarCollection<TryModel> get tryModels => this.collection();
}

const TryModelSchema = CollectionSchema(
  name: r'TryModel',
  id: -8389672969852501779,
  properties: {
    r'createdDate': PropertySchema(
      id: 0,
      name: r'createdDate',
      type: IsarType.dateTime,
    ),
    r'tryNumber': PropertySchema(
      id: 1,
      name: r'tryNumber',
      type: IsarType.long,
    )
  },
  estimateSize: _tryModelEstimateSize,
  serialize: _tryModelSerialize,
  deserialize: _tryModelDeserialize,
  deserializeProp: _tryModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tryModelGetId,
  getLinks: _tryModelGetLinks,
  attach: _tryModelAttach,
  version: '3.1.0+1',
);

int _tryModelEstimateSize(
  TryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _tryModelSerialize(
  TryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdDate);
  writer.writeLong(offsets[1], object.tryNumber);
}

TryModel _tryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TryModel();
  object.createdDate = reader.readDateTime(offsets[0]);
  object.id = id;
  object.tryNumber = reader.readLongOrNull(offsets[1]);
  return object;
}

P _tryModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tryModelGetId(TryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tryModelGetLinks(TryModel object) {
  return [];
}

void _tryModelAttach(IsarCollection<dynamic> col, Id id, TryModel object) {
  object.id = id;
}

extension TryModelQueryWhereSort on QueryBuilder<TryModel, TryModel, QWhere> {
  QueryBuilder<TryModel, TryModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TryModelQueryWhere on QueryBuilder<TryModel, TryModel, QWhereClause> {
  QueryBuilder<TryModel, TryModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TryModel, TryModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterWhereClause> idBetween(
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

extension TryModelQueryFilter
    on QueryBuilder<TryModel, TryModel, QFilterCondition> {
  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> createdDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition>
      createdDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> createdDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> createdDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> tryNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tryNumber',
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> tryNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tryNumber',
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> tryNumberEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tryNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> tryNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tryNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> tryNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tryNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterFilterCondition> tryNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tryNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TryModelQueryObject
    on QueryBuilder<TryModel, TryModel, QFilterCondition> {}

extension TryModelQueryLinks
    on QueryBuilder<TryModel, TryModel, QFilterCondition> {}

extension TryModelQuerySortBy on QueryBuilder<TryModel, TryModel, QSortBy> {
  QueryBuilder<TryModel, TryModel, QAfterSortBy> sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterSortBy> sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterSortBy> sortByTryNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tryNumber', Sort.asc);
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterSortBy> sortByTryNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tryNumber', Sort.desc);
    });
  }
}

extension TryModelQuerySortThenBy
    on QueryBuilder<TryModel, TryModel, QSortThenBy> {
  QueryBuilder<TryModel, TryModel, QAfterSortBy> thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterSortBy> thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterSortBy> thenByTryNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tryNumber', Sort.asc);
    });
  }

  QueryBuilder<TryModel, TryModel, QAfterSortBy> thenByTryNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tryNumber', Sort.desc);
    });
  }
}

extension TryModelQueryWhereDistinct
    on QueryBuilder<TryModel, TryModel, QDistinct> {
  QueryBuilder<TryModel, TryModel, QDistinct> distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdDate');
    });
  }

  QueryBuilder<TryModel, TryModel, QDistinct> distinctByTryNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tryNumber');
    });
  }
}

extension TryModelQueryProperty
    on QueryBuilder<TryModel, TryModel, QQueryProperty> {
  QueryBuilder<TryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TryModel, DateTime, QQueryOperations> createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdDate');
    });
  }

  QueryBuilder<TryModel, int?, QQueryOperations> tryNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tryNumber');
    });
  }
}
