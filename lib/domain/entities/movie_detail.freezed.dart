// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetail {

 int get id; String get title;@JsonKey(name: 'poster_path') String? get posterPath; String get overview;@JsonKey(name: 'backdrop_path') String? get backdropPath; int get runtime;@JsonKey(name: 'vote_average') double? get voteAverage; List<String> get genres;
/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailCopyWith<MovieDetail> get copyWith => _$MovieDetailCopyWithImpl<MovieDetail>(this as MovieDetail, _$identity);

  /// Serializes this MovieDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&const DeepCollectionEquality().equals(other.genres, genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,posterPath,overview,backdropPath,runtime,voteAverage,const DeepCollectionEquality().hash(genres));

@override
String toString() {
  return 'MovieDetail(id: $id, title: $title, posterPath: $posterPath, overview: $overview, backdropPath: $backdropPath, runtime: $runtime, voteAverage: $voteAverage, genres: $genres)';
}


}

/// @nodoc
abstract mixin class $MovieDetailCopyWith<$Res>  {
  factory $MovieDetailCopyWith(MovieDetail value, $Res Function(MovieDetail) _then) = _$MovieDetailCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'poster_path') String? posterPath, String overview,@JsonKey(name: 'backdrop_path') String? backdropPath, int runtime,@JsonKey(name: 'vote_average') double? voteAverage, List<String> genres
});




}
/// @nodoc
class _$MovieDetailCopyWithImpl<$Res>
    implements $MovieDetailCopyWith<$Res> {
  _$MovieDetailCopyWithImpl(this._self, this._then);

  final MovieDetail _self;
  final $Res Function(MovieDetail) _then;

/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? posterPath = freezed,Object? overview = null,Object? backdropPath = freezed,Object? runtime = null,Object? voteAverage = freezed,Object? genres = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetail].
extension MovieDetailPatterns on MovieDetail {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetail() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetail value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetail():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetail value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetail() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'poster_path')  String? posterPath,  String overview, @JsonKey(name: 'backdrop_path')  String? backdropPath,  int runtime, @JsonKey(name: 'vote_average')  double? voteAverage,  List<String> genres)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetail() when $default != null:
return $default(_that.id,_that.title,_that.posterPath,_that.overview,_that.backdropPath,_that.runtime,_that.voteAverage,_that.genres);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'poster_path')  String? posterPath,  String overview, @JsonKey(name: 'backdrop_path')  String? backdropPath,  int runtime, @JsonKey(name: 'vote_average')  double? voteAverage,  List<String> genres)  $default,) {final _that = this;
switch (_that) {
case _MovieDetail():
return $default(_that.id,_that.title,_that.posterPath,_that.overview,_that.backdropPath,_that.runtime,_that.voteAverage,_that.genres);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'poster_path')  String? posterPath,  String overview, @JsonKey(name: 'backdrop_path')  String? backdropPath,  int runtime, @JsonKey(name: 'vote_average')  double? voteAverage,  List<String> genres)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetail() when $default != null:
return $default(_that.id,_that.title,_that.posterPath,_that.overview,_that.backdropPath,_that.runtime,_that.voteAverage,_that.genres);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieDetail implements MovieDetail {
  const _MovieDetail({required this.id, required this.title, @JsonKey(name: 'poster_path') this.posterPath, required this.overview, @JsonKey(name: 'backdrop_path') this.backdropPath, required this.runtime, @JsonKey(name: 'vote_average') this.voteAverage, required final  List<String> genres}): _genres = genres;
  factory _MovieDetail.fromJson(Map<String, dynamic> json) => _$MovieDetailFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey(name: 'poster_path') final  String? posterPath;
@override final  String overview;
@override@JsonKey(name: 'backdrop_path') final  String? backdropPath;
@override final  int runtime;
@override@JsonKey(name: 'vote_average') final  double? voteAverage;
 final  List<String> _genres;
@override List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}


/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailCopyWith<_MovieDetail> get copyWith => __$MovieDetailCopyWithImpl<_MovieDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&const DeepCollectionEquality().equals(other._genres, _genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,posterPath,overview,backdropPath,runtime,voteAverage,const DeepCollectionEquality().hash(_genres));

@override
String toString() {
  return 'MovieDetail(id: $id, title: $title, posterPath: $posterPath, overview: $overview, backdropPath: $backdropPath, runtime: $runtime, voteAverage: $voteAverage, genres: $genres)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailCopyWith<$Res> implements $MovieDetailCopyWith<$Res> {
  factory _$MovieDetailCopyWith(_MovieDetail value, $Res Function(_MovieDetail) _then) = __$MovieDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'poster_path') String? posterPath, String overview,@JsonKey(name: 'backdrop_path') String? backdropPath, int runtime,@JsonKey(name: 'vote_average') double? voteAverage, List<String> genres
});




}
/// @nodoc
class __$MovieDetailCopyWithImpl<$Res>
    implements _$MovieDetailCopyWith<$Res> {
  __$MovieDetailCopyWithImpl(this._self, this._then);

  final _MovieDetail _self;
  final $Res Function(_MovieDetail) _then;

/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? posterPath = freezed,Object? overview = null,Object? backdropPath = freezed,Object? runtime = null,Object? voteAverage = freezed,Object? genres = null,}) {
  return _then(_MovieDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
