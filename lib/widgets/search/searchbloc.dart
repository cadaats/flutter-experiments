import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import 'filter.dart';
import 'isearcher.dart';

class SearchBloc<T> {
  final Searcher searcher;
  Filter<T> filter;

  Sink<SearchQuery> get searchTerm => _searchTermController.sink;
  get _searchTermController => StreamController<SearchQuery>();

  Stream<UnmodifiableListView<String>> get searchResults =>
      _searchResultsSubject.stream;
  get _searchResultsSubject => BehaviorSubject<UnmodifiableListView<String>>();

  final _isInSearchMode = BehaviorSubject<bool>();
  final _searchQuery = BehaviorSubject<String>();

  ///
  /// Inputs
  ///
  get onSearchQueryChanged => _searchQuery.add;

  get setSearchMode => _isInSearchMode.add;

  Function get onClearSearchQuery => () => onSearchQueryChanged('');

  ///
  /// Outputs
  ///
  Stream<bool> get isInSearchMode => _isInSearchMode.stream;

  Stream<String> get searchQuery => _searchQuery.stream;

  ///
  /// Constructor
  ///
  SearchBloc({
    @required this.searcher,
    this.filter,
  }) {
    _configureFilter();
    searchQuery.listen((query) {
      final List<T> filtered =
          searcher.data.where((test) => filter(test, query)).toList();
      searcher.onDataFiltered(filtered);
    });
  }

  _configureFilter() {
    if (filter == null) {
      if (T == String) {
        filter = _defaultFilter;
      } else {
        throw (Exception(
            'If data is not a List of Strings, a filter function must be provided for SearchAppBar!'));
      }
    }
  }

  Filter get _defaultFilter => Filters.startsWith;

  void dispose() {
    _isInSearchMode.close();
    _searchQuery.close();
  }
}

class SearchQuery {
  final String queryText;

  SearchQuery({this.queryText});
}
