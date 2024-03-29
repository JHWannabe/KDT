# 이벤트(Event)
- 웹 브라우저가 알려주는 HTML 요소에 대한 사건이 발생
- 웹 페이지에 사용된 자바스크립트는 발생한 이벤트에 반응하여 특정 동작을 수행할 수 있음
- 자바스크립트는 비동기식 이벤트 중심의 프로그래밍 모델
```
<input type="button" onclick="sendit()" value="확인">
             -------  ------- ---------
    (event)  target    type    listener
```

## 1. 이벤트 타입(Event Type)
- 발생한 이벤트의 종류를 나타내는 문자열로 이벤트명이라고도 함
- 키보드, 마우스, HTML DOM, Window 객체.. 등을 처리하는 이벤트 제공
- https://developer.mozilla.org/ko/docs/Web/API/Event

## 2. 이벤트 타겟(Event Target)
- 이벤트가 일어날 객체를 의미

## 3. 이벤트 리스너(Event Listener)
- 이벤트가 발생했을 때 그 처리를 담당하는 함수
- 이벤트 핸들러(Handler)라고도 부름
- 지정된 타입의 이벤트가 특정 요소에서 발생하면 웹 브라우저는 그 요소에 등록된 이벤트 리스너를 실행

### 이벤트 등록
```
객체.addEventListener(이벤트타입, 이벤트리스너)
```

### 이벤트 제거
```
객체.removeEventListener(이벤트타입, 이벤트리스너)
```

## 4. 이벤트 객체(Event Object)
- 특정 타입의 이벤트와 관련이 있는 객체
- 이벤트 객체는 해당 타입의 이벤트에 대한 상세 정보를 저장하고 있음
- 모든 이벤트 객체는 이벤트의 타입을 나타내는 type 프로퍼티와 이벤트 대상을 나타내는 target 프로퍼티를 가지고 있음
- 이벤트 객체를 이벤트 리스너가 호출할 때 인수로 전달
```
function sendit(e) {
    // e.target(button), e.type(click)

}

<input type="button" onclick="sendit()" value="완료">
```

## 5. 이벤트 전파(Event Propagation)
- 이벤트가 발생했을 때 브라우저가 이벤트 리스너를 실행시킬 대상 요소를 결정하는 과정
- document 객체나 html 문서의 요소에서 이벤트가 발생하면 대상 요소를 결정하기 위해 이벤트 전파가 일어남

### 5-1. 버블링 전파방식
- 자식에서 부모로 이벤트를 전파

### 5-2. 캡처링 전파방식
- 부모에서 자식으로 이벤트를 전파

### 이벤트 전파를 막는 방법
- 이벤트객체명.stopPropagation()

<br><hr>

# 이터레이터(Iterator)
- 반복 처리가 가능한 객체
- 내부적으로 next() 메서드를 가지며 next() 메서드는 IteratorResult 객체 value와 done이라는 프로퍼티를 가진 객체를 반환해야 함

## 이터러블(Iterable)
- 반복이 가능한 객체
- Symbol.Iterator 메서드가 있어야 하며 Symbol.Iterator는 이터레이터 객체를 반환해야 함
- String, Array, Map, Set.. 등 객체
- for 문법으로 반복이 가능

# 제너레이터(Generator)
- 실행을 멈췄다가 나중에 다시 접근할 수 있는 특이한 형태의 함수
- 나중에 다시 접근하기 위해 context(변수)를 저장된 상태로 남겨둠
- 이터레이터를 좀 더 유연하게 사용할 수 있음
```
function* 제너레이터명() {

}
```

<br><hr>

# 스프레드(Spread) 연산자
- 모든 Iterable은 Spread가 될 수 있음
- 순회가능한 데이터는 펼쳐질 수 있음
```
function 함수명(...iterable)
    [...iterable]
    {...obj}

function add(num1, num2, num3){
    return num1 + num2 + num3
}

add(10, 20, 30)

const num2 = [10, 20, 30]
add(nums[0], nums[1], nums[2])
add(...nums)
```

## 구조분해할당
```
const fruits = ['🍌','🍊', '🍎','🍉','🍒']
const [fruit1, fruit2, fruit3, fruit4, fruit5] = fruits
const [fruit1, fruit2, ...others] = fruits

✔️ 참고
const point = [1, 2]
const [x, y, z=0] = point
```

<br><hr>

# 세트(Set)
- set 객체는 중복되지 않은 유일한 값들의 집합
- 요소 순서에 의미가 없음
- 인덱스로 요소에 접근할 수 없음
- 교집합, 합집합, 차집합, 여집합 등을 구현
```
const 세트명 = new Set([요소1, 요소2, 요소3, ...])
```

# 맵(Map)
- Key, Value로 이루어진 데이터 집합의 자료구조
```
const 맵이름 = new Map([['키1', '값1'], ['키2', '값2'], ...])
```

## ✔️ 주석(comments)
// 한줄짜리 주석
/* .... */ 여러줄 주석
/** */ JSDoc 주석(추천)

# 예외처리
```
try {
    예외가 발생할 것으로 예상되는 문장;
    ...
    ...
} catch (error 객체){
    예외가 발생했을 때 처리할 문장;
    ...
    ...
} finally{
    예외와 관계없이 무조건 실행할 문장;
    ...
}
```