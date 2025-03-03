abstract class UseCase<T, Param, Param2> {
  Future<T> execute(Param param, {Param2 param2});
}
