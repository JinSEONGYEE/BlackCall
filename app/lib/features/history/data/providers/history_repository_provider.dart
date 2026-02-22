import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../../domain/repositories/history_repository.dart';
import '../repositories/history_repository_impl.dart';

part 'history_repository_provider.g.dart';

@Riverpod(keepAlive: true)
HistoryRepository historyRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return HistoryRepositoryImpl(dio);
}
