import Swift

//명령법
let age: Int = 10

"안녕하세요! 저는 \(age)살입니다."

print("안녕하세요! 저는 \(age)살입니다.")


//문자열 보간법
class Person{
    var name: String = "yagom"
    var age: Int = 10
}

let yagom: Person = Person()

print(yagom)
dump(yagom)


//상수와 변수
let constatnt: String = "차후에 변경이 불가능한 상수 let"
var variable: String = "차후에 벼경이 가능한 변수 var"

variable = "변수는 이렇게 차후에 다른 값을 할 수 있지만"
//constant = "상수는 차후에 값을 변경할 수 없습니다."


//기본 데이터 타입
var someBool: Bool = true
var someInt = 199
var someUInt: UInt = 100
var someFloat: Float = 3.14
var someDouble: Double = 3.14
var someCharacter: Character = "🥺"
var someString: String = "똘망똘망"


//Any
var someAny: Any = 100
someAny = "String"
someAny = 123.12
//AnyObject
class SomeClass {}
var someAnyObject: AnyObject = SomeClass()


//nil
//someAny = nil 오류
someAny = 0
