abstract class AsyncUseCase<Input, Output> {
  Future<Output> execute(Input input);
}

abstract class UseCase<Input, Output> {
  Output execute(Input input);
}

class NoParams {
  const NoParams();
}
