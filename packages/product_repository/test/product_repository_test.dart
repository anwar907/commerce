import 'package:api_repository/api_repository.dart';
import 'package:client_repository/client_repository.dart';
import 'package:client_repository/models/cart_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_repository/product_repository.dart';

class MockProductRepository extends Mock implements ApiRepository {}

class FakeProduct extends Fake implements ProductModels {}

void main() {
  final apiClient = MockProductRepository();

  final ProductRepository product = ProductRepository(apiRepository: apiClient);

  group('Fetch all data product', () {
    test('should show exception', () async {
      when(() => apiClient.listProduct())
          .thenThrow(Exception('Something wrong'));
      expect(() => product.listProduct(), throwsA(isA<ListProductException>()));
    });

    test('should get list data from api', () async {
      when(() => apiClient.listProduct())
          .thenAnswer((_) async => [ProductModels()]);

      expect(await product.listProduct(), [isA<ProductModels>()]);
    });
  });

  group('Details product by id items', () {
    test('should return exception', () {
      when(() => apiClient.detailsProduct(id: any(named: 'id')))
          .thenThrow(Exception('Something wrong'));

      expect(() => product.detailsProduct(id: 4),
          throwsA(isA<DetailsProductException>()));
    });

    test('should return details data with id', () async {
      when(() => apiClient.detailsProduct(id: any(named: 'id')))
          .thenAnswer((_) async => ProductModels());

      expect(await product.detailsProduct(id: 4), isA<ProductModels>());
    });
  });

  group('Data cart items', () {
    test('should return exception', () async {
      when(() => apiClient.listCart()).thenThrow(Exception('Something wrong'));
      expect(
          () => product.listDataCart(), throwsA(isA<CartProductException>()));
    });

    test('should return data cart', () async {
      when(() => apiClient.listCart()).thenAnswer((_) async => [CartModels()]);

      expect(await product.listDataCart(), [isA<CartModels>()]);
    });
  });
}
