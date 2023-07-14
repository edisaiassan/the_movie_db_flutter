
//Estos dos datos son los que devuelven en un
//inicio de sesión, si falla será de tipo Enum
//pero si no, devuelve un String que pronto será
//nuestra sesión de usuario
//Paso 1
class Either<Left, Right> {
  final Left? _left;
  final Right? _right;
  final bool isLeft;

  Either._(this._left, this._right, this.isLeft);

  factory Either.left(Left failure) {
    //Dependiendo
    //de los datos datos que ingrese se retornará estas cosas
    return Either._(failure, null, true);
  }

  factory Either.right(Right value) {
    return Either._(null, value, false);
  }
  
  //paso 2
  T when<T>( //Función que recibe 2 funciones como parámetro
   T Function(Left) left,
   T Function(Right) right,
  ) {
    if (isLeft) {
      return left(_left!); //isLeft no es nulo, entonces retorna el _left, el error
    } else {
      return right(_right!); //si lo es retorna el _right, la sesión correcta
    }
  }
}
