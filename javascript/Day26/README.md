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