import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../../domain/repositories/auth_repository.dart';
import '../repositories/auth_repository_impl.dart';

part 'auth_repository_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepositoryImpl(dio);
}
