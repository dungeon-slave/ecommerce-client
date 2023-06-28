abstract class IUseCase<Input, Output> {
  Future<Output> execute(Input input);
}
