# 6.이미지 태그
## 파일 경로 작성 방법
1. 절대 경로
- 물리적 경로
    URL 주소: https://t1.daumcdn.net/daumtop_chanel/op/20200723055344399.png 
    드라이브: C:\Users\Administrator\Desktop\KDT\html\Day15\sea1.png 
    ㄴ 드라이브 물리적 경로는 나타나지 않아 웹사이트 개발 시 사용하지 않음

2. 상대 경로
- 이미지가 HTML 문서와 같은 디렉토리에 있는 경우
    <img src='파일명'> or <img src='./파일명'>
- 이미지가 하위 디렉토리에 있는 경우
    <img src='디렉토리명/파일명'> or <img src='./디렉토리명/파일명'>
- 이미지가 상위 디렉토리에 있는 경우
    <img src='../파일명'> or <img src='./../파일명'>
    - 이미지가 상위 디렉토리의 하위 디렉토리에 있는 경우
    <img src='../디렉토리명/파일명'> or <img src='./../디렉토리명/파일명'>

# 7. 하이퍼링크(HyperLink)
- 다른 페이지 또는 사이트로 연결하는 링크(문자 또는 이미지)
- 인라인 태그

    <a href='이동할 사이트 또는 문서의 경로'>링크에 사용할 문자 또는 이미지</a>

✔ 호스팅
- 서버 컴퓨터의 전체 또는 일정 공간을 이용할 수 있도록 임대해주는 서비스

FTP(File Transfer Protocol)
- 클라이언트 - 서버 (C/S)용 프로토콜
- 클라이언트가 파일을 요청하면 서버가 요청된 파일을 제공
- 클라이언트가 서버로 파일을 전달
- 주로 대량의 파일을 처리할 때 사용
- 기본 포트: 21

✔ 닷홈 호스팅 주의사항
- 첫 페이지는 항상 index.html로 업로드(파일 꼭 소문자로 작성하기!)
- FTP 접속 -> html documentory에 저장해야 함

✔ 파일질라 다운로드
https://filezilla-project.org/download.php?platform=win64
- FTP 클라이언트 프로그램으로 사용

ftp-simple 설치
VS Code에 설치하여 FTP 프로그램으로 사용
- 설정
ㄴ F1키 누름 → ftp-simple: config → FTP connection setting을 선택

[
	{
		"name": "전장훈의 홈페이지", (아무거나)
		"host": "ip 주소",
		"port": 21,
		"type": "ftp",
		"username": "아이디",
		"password": "비밀번호",
		"path": "/",
		"autosave": true,
		"confirm": true
	}
]

- 접속
ㄴ F1키 누름 → ftp-simple: Remote directory open to workspace


✔ 책갈피
* <a> 태그의 name 속성 또는 id 속성을 이용하여 책갈피 기능을 설정

	<a href="#도착지에 쓰일 name">링크에 사용될 문자 또는 이미지</a>
	<a name="도착지 name">문자 또는 이미지</a>

	<태그 id="도착지 name">문자 또는 이미지></태그>

## 테이블 태그
* 여러 종류의 데이터를 보기 좋게 정리하여 보여주는 표를 작성
	* <table>로 시작하고 </table>로 끝냄
	* <tr>로 행을 생성, <td>로 셀르르 생성

	<table>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>
	</table>
* <th>: 셀의 제목, 가운데 정렬, 굵은 글씨

### colspan 속성
* 셀을 가로로 합침
	<td colspan='합칠 열의 개수'>

### rowspan 속성
* 셀을 세로로 합침
	<td rowspan='합칠 행의 개수'>

### colgroup
* colgroup 태그 뒤에 나오는 컬럼(th 또는 td)에 적용할 스타일을 해당 태그에서 미리 설정할 수 있도록 함

	<table>
		<colgroup>
			<col style="css문법1">
			<col style="css문법2">
			<col style="css문법3">
		</colgroup>
        <tr>
            <td>1</td> <!-- css문법1 적용 -->
            <td>2</td> <!-- css문법2 적용 -->
            <td>3</td> <!-- css문법3 적용 -->
        </tr>
        <tr>
            <td>4</td> <!-- css문법1 적용 -->
            <td>5</td> <!-- css문법2 적용 -->
            <td>6</td> <!-- css문법3 적용 -->
        </tr>
    </table>

### caption
* 표의 제목을 붙일 때 사용
* 기본 위치는 표의 상단 중앙

### 아이프레임
* inline frame의 약자
* 웹사이트 안에 또 다른 웹사이트를 삽입

	<iframe src='삽입할 페이지의 주소 또는 문서 위치' style='크기를 설정할 css 코드'></iframe>

### target 속성
* _blank: 새탭에서 열림
* 아이프레임의 name: 해당 아이프레임에서 열림

### 폼 태그
- 웹 페이지에서 사용자로부터 입력을 받을 때 사용하는 태그
- 사용자가 입력한 데이터를 서버로 보낼 때 form 요소를 사용

	<form action='서버에게 전달할 파일 위치' method='전송방법'>
		form 태그 안에 form 요소를 통해 데이터를 서버로 전달
	</form>

### 전송방법(method)
get: URL에 데이터를 포함하여 전달
post: body에 데이터를 포함하여 전달

### input 태그: 입력 상자
* type 속성
	text: 문자를 입력받는 글상자
	password: 비밀번호를 입력받는 글상자
	radio: 여러개의 옵션 중에서 단 하나의 옵션만을 선택할 수 있도록 하는 버튼
	✔ 그룹을 맺기 위해 name 속성의 값을 동일하게 해야 함
	checkbox: 여러개의 옵션을 선택할 수 있도록 하는 버튼

#### 속성
	name: 요소의 이름을 설정. 서버에서 값을 전달받을 때 key로 사용
	id: 요소의 유일한 이름을 설정. HTML 문서에서 해당 요소의 스타일을 주거나 동적인 프로그래밍을 할 때 사용(같은 HTML 문서 내에서 다른 요소와 같은 id를 가질 수 없음)
	maxlength: 값의 최대 길이를 설정
	placeholder: 입력 전 특정 데이터를 입력하도록 안내하는 값을 설정
	value: 서버로 전달할 입력양식의 값을 설정
	checked: 라디오 또는 체크박스 중에서 미리 선택하는 값을 설정

라벨 태그
* 폼 양식에 이름을 붙이는 요소
* 다른 요소를 연결하면 해당 영역이 넓어짐
* radio, checkbox의 스타일을 설정시 많이 사용됨

	<label for="요소의 id">텍스트 또는 이미지 </label>