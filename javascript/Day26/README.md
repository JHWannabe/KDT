# 객체2
## Location 객체
- 현재 브라우저에 표시된 HTML 문서의 주소를 얻거나, 브라우저에 새 문서를 불러올 때 사용
```
    https://koreaisacademy.com/renewal2021/community/interview.asp
    -----   ----------------- ------------------------------------
   protocol      hostname                  pathname
```
- protocol: 콜론을 포함한 http, https, ftp 등 프로토콜 정보를 반환
- hostname: 호스트의 이름과 포트번호를 반환
- pathname: URL 경로부분의 정보를 반환
- href: 페이지 URL 전체 정보를 반환 또는 URL을 지정하여 페이지를 이동
- reload(): 새로고침

## history 객체
- 브라우저의 히스토리 정보를 문서와 문서 상태 목록으로 저장하는 객체
- 현재는 사용자의 개인 정보를 보호하기 위해 이 객체의 대부분의 기능을 접근 제한
<br><br>
- back(): 페이지 뒤로 이동
- forward(): 페이지 앞으로 이동
- go(0): 새로고침(location.reload()와 같은 기능)

## navigator 객체
- 브라우저 공급자 및 버전 정보 등을 포함한 브라우저에 대한 정보를 저장하는 객체
<br><br>
- geolocation: GPS 정보를 수신하는 프로퍼티

## 문서 객체 모델(DOM: Document Object Model)
- HTML 문서 또는 XML 문서 등을 접근하기 위한 일종의 인터페이스 역할
- 문서 내의 모든 요소를 정의하고 각각의 요소에 접근하는 방법을 제공

### document 객체
- 웹 페이지 자체(body)를 읨하는 객체
- 웹 페이지에 존재하는 HTML 요소에 접근하고자 할 때 반드시 document 객체로부터 시작
<br><br>
- getElementById(): 해당 아이디의 요소를 선택
- getElementsByTagName(): 해당 태그 이름의 요소를 모두 선택
- getElementsByClassName(): 해당 클래스에 속한 요소를 모두 선택
- getElementsByName(): name 속성값을 가지는 요소를 모두 선택
- querySelectorAll(): 선택자로 선택되는 요소를 모두 선택
- querySelector(): 선택자로 선택되는 요소를 선택

## 노드(Node)
- HTML DOM은 노드라고 불리는 계층적 단위에 정보를 저장

### 노드 종류
- 문서노드: 문서 전체를 나타내는 노드
- 요소노드: HTML 요소는 요소노드, 속성노드를 가질 수 있음
- 속성노드: 속성은 모두 속성노드이며, 요소노드에 관한 정보를 가짐 
- 텍스트노드: 텍스트는 모두 텍스트노드
- 주석노드: 주석은 모두 주석노드

## 노드의 관계
- parentNode: 부모 노드
- children: 자식
- childNodes: 자식 노드 리스트
- firstChild: 첫번째 자식 노드(모든 종류의 노드)
- firstElementChild: 첫번째 자식 요소 노드(요소노드만 찾음)
- lastChild: 마지막 자식 노드
- lastElementChild: 마지막 자식 요소 노드
- nextSibling: 다음 형제 노드
- previousSibling: 이전 형제 노드

## 노드 추가
- appendChild(): 새로운 노드를 해당 노드의 자식 노드 리스트 맨 마지막에 추가
- insertBefore(): 새로운 노드를 특정 자식 노드 바로 앞에 추가
- insertData(): 새로운 노드를 텍스트 데이터로 추가

## 노드 생성
- createElement(): 새로운 요소 노드를 만듦
- createAttribute(): 새로운 속성 노드를 만듦
- createTextNode(): 새로운 텍스트 노드를 만듦

## 노드 제거
- removeChild(): 자식 노드 리스트에서 특정 자식 노드를 제거. 노드가 제거되면 해당 노드를 반환. 노드가 제거될 때 노드의 자식들도 다같이 제거
- removeAttribute(): 특정 속성 노드를 제거

## 노드 복제
- cloneNode(): 기존의 존재하는 노드와 동일한 새로운 노드를 생성하여 반환

<br><hr>

# 정규표현식

- / ~ / 시작과 끝
- ^ : 패턴의 시작
- [ ] : 안의 문자를 찾음
- [x-z] : x~z 사이의 문자를 하나를 찾음
- x+ : x가 1번이상 반복
- x$ : 문자열이 x로 끝남
- ^x : 문자열이 x로 시작
- \d : 숫자
- x{n} : x를 n번 반복한 문자를 찾음
- x{n,m} : x를 n번 이상 m번 이하 반복한 문자를 찾음
<br>

> 아이디:
> - 영문 대문자 또는 소문자로 길이는 4 ~ 20자까지 입력 가능   
>   /^[A-Za-z]{4, 20}/

> 이름: 
> - 한글만 사용   
>   /^[가-힣]+$/

> 휴대폰 번호:
> - 앞번호는 3글자, -, 중간번호는 3글자 또는 4글자, - 마짐가 번호는 4글자
> - 010-111-1111 또는 010-1111-1111  
>   /^\d{3}-\d{3,4}-\d{4}$/

> 이메일:
> - 영문 대문자 또는 소문자 또는 숫자로 시작
> - 적절한 위치에 @포함 .포함
>   /^[A-Za-z0-9\-\.]+@[A-Za-z0-9\-\.]+\.[A-Za-z0-9\-\.]+$/

## 자바스크립트 정규표현식 적용
### test()
- 정규표현식에 대입한 문자열이 적합하면 true, 아니면 false를 리턴