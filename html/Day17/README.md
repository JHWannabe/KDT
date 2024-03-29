# 폼 태그
- 웹 페이지에서 사용자로부터 입력을 받을 때 사용하는 태그
- 사용자가 입력한 데이터를 서버로 보낼 때 form 요소를 사용

	<form action='서버에게 전달할 파일 위치' method='전송방법'>
		form 태그 안에 form 요소를 통해 데이터를 서버로 전달
	</form>

## input 태그: 입력 상자
* type 속성  
	* text: 문자를 입력받는 글상자
	* password: 비밀번호를 입력받는 글상자
	* radio: 여러개의 옵션 중에서 단 하나의 옵션만을 선택할 수 있도록 하는 버튼  
		✔ 그룹을 맺기 위해 name 속성의 값을 동일하게 해야 함
	* checkbox: 여러개의 옵션 중에서 다수의 옵션을 입력받을 수 있도록 하는 버튼  
		✔ 그룹을 맺기 위해 name 속성의 값을 동일하게 해야 함
	* file: 원하는 파일을 서버로 전송하기 위한 글상자
	* button: 이벤트가 없는 일반 버튼
	* reset: 입력받은 데이터를 초기화하는 버튼
	* submit: 입력받은 데이터를 서버에 제출하는 버튼
	* email: 이메일을 입력받는 글상자(@ 필요)
	* url: 웹사이트를 입력받는 글상자(http 필요)
	* tel: 전화번호를 입력받는 글상자(모바일에서 숫자 키패드를 사용)
	* date: 원하는 날짜를 입력받는 글상자
	* number: 원하는 숫자를 입력받는 글상자
		<input type="number" min="최소값" max="최대값" step="증가값">
	* color: 원하는 색상을 입력받는 요소(선택한 색상은 16진수 RGB 컬러값으로 서버에 전달)
	* search: 검색어를 입력받는 글상자
	* range: 일정 범위 안의 값만을 입력하는 조절바
		<input type="range" min="최소값" max="최대값" value="현재값">
	* hidden: 보이지는 않으나, 서버에 값을 전달하고 싶을 때 사용하는 글상자


## 속성
* name: 요소의 이름을 설정. 서버에서 값을 전달받을 때 key로 사용
* id: 요소의 유일한 이름을 설정. HTML 문서에서 해당 요소의 스타일을 주거나 동적인 프로그래밍을 할 때 사용(같은 HTML 문서 내에서 다른 요소와 같은 id를 가질 수 없음)  
* maxlength: 값의 최대 길이를 설정  
* placeholder: 입력 전 특정 데이터를 입력하도록 안내하는 값을 설정  
* value: 서버로 전달할 입력양식의 값을 설정  
* checked: 라디오 또는 체크박스 중에서 미리 선택하는 값을 설정  
* readonly: 데이터를 볼 수 있으나 수정할 수 없게 설정(서버로 데이터가 전달됨)  
* disabled: 입력필드를 사용할 수 없게 설정(서버로 데이터가 전달되지 않음)  
* required: 데이터를 submit할 때 데이터를 필수로 입력하도록 강제하는 설정  

## 버튼 태그 
* 버튼을 생성하는 요소
* type="reset", type="button", type="submit" (기본값)
	<button>버튼클릭</button>

## 선택상자
* 여러개의 옵션이 드롭다운 리스트로 되어 있으며 그 중에서 단 하나의 옵션만을 선택

	<select>
		<option value="apple">김사과</option>
		<option value="banana">반하나</option>
		<option value="orange">오렌지</option>
	</select>

## 여러줄 글상자
* 여러줄의 텍스트를 입력받는 글상자
* value 위치 조심!

	<textarea cols="가로 글자수" rows="세로 줄수">value</textarea>


# HTML의 디스플레이
## 1. inline
	- content 크기 만큼만 자리를 차지하는 요소
	- 텍스트, img, span
	- 텍스트의 특징을 가지고 있음

## 2. block
	- 라인을 모두 차지하는 요소
	- p, h, ul, li, div, ...
	- 명의 특징을 가지고 있음

## span 태그
- 줄 단위로 영역이 설정
- inline 특징을 가지고 있음

## div 태그
- 면 단위로 영역이 설정
- block 특징을 가지고 있음

## 시맨틱 태그(Sementic)
- Sementic: 의미론적인
- 의미가 있는 태그를 사용

### 시맨틱 태그의 장점
- 검색 엔진 최적화
- 스크린 리더를 사용하여 페이지를 탐색할 때 도움
- div>div>div>div>div>... 끝없는 div를 탐색하는 것보다 효율적
- 개발자에게 명확한 의미를 전달

#### <header> </header>
- 페이지의 제목과 같은 소개 내용을 포함
- heading 태그나 로고, 검색양식, 작성자 이름 등을 포함

#### <nav> </nav>
- 메뉴, 목차 등에 용용

#### <main> </main>
- 지배적인 컨텐츠 영역을 나타내는 태그

#### <section> </section>
- 구체적인 시맨틱 태그가 없는 문서의 독립적인 영역을 나타냄
- 섹션에는 항상 제목이 잇는 것이 일반적

#### <article> </article>
- 자체로 의미가 있는 웹페이지 부분이며, 독립적으로 배포 또는 재사용되도록 의도된 문서
- 게시물, 잡지, 블로그 또는 신문기사

#### <footer> </footer>
- 작성자에 대한 정보, 저작권 데이터 또는 관련 문서에 대한 링크, 카피라이트 등을 포함

#### <aside> </aside>
- 간접적으로 문서와 관련된 내용
- 사이드 바