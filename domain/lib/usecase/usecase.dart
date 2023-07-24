abstract class UseCase<Input, Output> {
  Future<Output> execute(Input input);
}

class NoParams{
  const NoParams();
}
