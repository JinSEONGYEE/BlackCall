import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../../domain/repositories/fraud_repository.dart';
import '../repositories/fraud_repository_impl.dart';

part 'fraud_repository_provider.g.dart';

@Riverpod(keepAlive: true)
FraudRepository fraudRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return FraudRepositoryImpl(dio);
}
