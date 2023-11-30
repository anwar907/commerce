part of 'product_bloc.dart';

abstract class ProductEvent {}

class ShowListProductEvent extends ProductEvent {}

class SearchQueryEvent extends ProductEvent {
  final String query;

  SearchQueryEvent(this.query);
}

class DetailsProductEvent extends ProductEvent {
  final String id;

  DetailsProductEvent(this.id);
}

