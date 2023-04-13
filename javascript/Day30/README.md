# async / await
- callback, Promise 비동기처리를 좀 더 쉽게 처리할 수 있도록 사용됨
- ES7에 추가된 문법
```
1. Promise(비동기 처리될 전체 함수)를 만들고자 하는 함수 앞에 async를 붙여줌

async function 함수명(){
    ...
    // 2. promise 앞에 await를 붙여줌

    return 값   // 3. resolve()값과 동일
}
```

<br><hr>

# JSON(JavaScript Object Notation)
- 데이터를 저장하거나 전송할 때 사용되는 경량의 Data 교환 형식
- 사람과 기계 모두 이해하기 쉬우며 용량이 작아서 XML을 대체하여 데이터 전송 등에 많이 사용
- 데이터 포멧일 뿐, 통신 방법도 프로그래밍 문법도 아님

## JSON의 특징
- 서버와 클라이언트간의 교류에서 일반적으로 많이 사용
- 자바스크립트를 이용하여 JSON 형식의 문서를 자바스크립트 객체로 변환하기 쉬움
- 자바스크립트 문법과 굉장히 유사하지만 텍스트 형식일 뿐
- 특정 언어에 종속되지 않으며, 대부분 프로그래밍 언어에서 JSON 포멧의 데이터를 핸들링 할 수 있는 라이브러리를 제공
```
{"name":"루시", "age":14, "family":"포메라니안", "weight":3.5}
✔️ JSON은 이름과 값으로 구성된 프로퍼티의 정렬되지 않은 집합이며 메소드 프로퍼티가 없음
```

## JSON의 구조
- 이름과 값의 싸으로 이루어짐
- 데이터는 쉼표로 구분하여 나열
- {}중괄호로 감싸 표현
- 배열은 []대괄호로 감싸 표현

## JSON의 타입
숫자, 문자열, 불리언, 객체, 배열, null
```
{
    "class":
    [
        {"name":"김사과", "age":20, "hp":"010-1111-1111", "pass":true},
        {"name":"반하나", "age":25, "hp":"010-2222-2222", "pass":false},
        {"name":"오렌지", "age":30, "hp":"010-3333-3333", "pass":true}
    ],
    [
        ...
    ]
}
```

### stringify(object)
- 객체를 문자열로 변환

### parse(JSON)
- 문자열 데이터를 자바스크립트 객체로 변환

### fetch api
- Request나 Response와 같은 객체를 이용하여 HTTP 프로토콜을 통해 원격지의 정보를 가져오기 위해 사용하는 api
- Promise를 기반으로 동작
```
Ajax -> XMLHttpRequest() -> fetch API
     -> jQuery, Axios
```

JSON 예시 : https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json
JSON 검증 사이트 : https://jsonlint.com/