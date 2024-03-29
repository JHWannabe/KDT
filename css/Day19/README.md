# CSS 텍스트
## font-size
- 텍스트 크기를 설정
- px, %, em, rem

## font-family
- 텍스트의 글꼴을 설정

### 글꼴을 선택하는 방법
- 누구나 설치되어 있는 기본 글꼴을 사용
- 이미지로 처리
- 클라이언트에 글꼴을 다운로드 시켜 사용
- 웹 폰트를 사용

## font-weight
- 텍스트의 굵기를 설정
- 기본 굵기: 400 (범위 100 ~ 900)

****************************************************************
# CSS 배경
## background
- 배경 속성을 한꺼번에 적용
```
background 파일위치 반복여부 위치 사이즈 ...
```
## background-color
- HTML 요소의 배경색을 설정

## background-image
- HTML 요소의 배경으로 나타날 배경 이미지를 설정
- 배경 이미지는 기본 설정으로 반복되어 나타남
```
background-image: url(파일경로)
```

## background-repeat
- 배경 이미지를 수평이나 수직방향으로 반복하도록 설정(repeat-x, repeat-y, no-repeat)

## background-position
- 반복되지 않는 배경 이미지의 상대 위치를 설정
- %나 px을 사용해서 상대위치를 직접 설정할 수 잇음
- 상대 위치를 결정하는 기준은 왼쪽 상단(left top)
```
    left top        center top    right top
    left center     center        right center
    left bottom     center bottom right bottom

    background-position: center bottom;
    background-position: 가로위치값 세로위치값;
    예) background-position: 10% 100px;
```

## background-attachment
- 위치가 설정된 배경 이미지를 원하는 위치에 고정시킬 수 있음
- 고정된 배경 이미지는 스크롤과 무관하게 화면의 위치에서 이동되지 않음
- fixed, scroll

## background-size
- 배경 이미지 크기를 설정
- px, %, contain, cover
- contain
    - 배경 이미지의 가로, 세로 모두 요소보다 작다는 조건하에 가능한 설정
    - 가로, 세로 비율은 유지
    - 배경 이미지의 크기는 요소의 크기보다 항상 작거나 같음
- cover
    - 배경 이미지의 가로, 세로 길이 모두 요소보다 크다는 조건하에 가능한 설정
    - 가로, 세로 비율은 유지
    - 배경 이미지의 크기는 요소의 크기보다 항상 크거나 같음

## 무료 jpeg 사이트
- https://pixabay.com/

****************************************************************
# 박스 모델(Box Model)
- 모든 HTML 요소는 박스 모양으로 구성
- 박스 모델은 HTML 요소를 내용, 패딩, 테두리, 마진으로 구분함

## 내용(content)
- 텍스트나 이미지가 들어있는 박스의 실질적인 내용 부분
```
<p>안녕</p>
```

## 패딩(padding)
- 내용과 테두리 사이의 간격
- padding-top, padding-right, padding-bottom, padding-left
- padding: 위 오른쪽 아래 왼쪽 순으로 설정
```
CSS
#padding {padding: 20px 50px 30px 10px;}
위 20px, 오른쪽 50px, 아래 30px, 왼쪽 10px

#padding {padding: 20px 50px 30px;}
위 20px, 오른쪽 왼쪽 50px, 아래 30px

#padding {padding: 20px 50px;}
위 아래 20px, 오른쪽 왼쪽 50px

#padding {padding: 20px;}
모든방향 20px

HTML
<div id="padding">안녕하세요</div>
```

## 테두리(border)
- 내용(content)과 패딩(padding) 주변을 감싸는 테두리
- border-style(테두리 모양), border-color(테두리 색상), border-width(테두리 두께), border(한꺼번에 설정)

## 마진(margin)
- 테두리(border)와 이웃하는 요소들 사이의 간격
- 마진은 눈에 보이지 않음
- 세로 겹침 현상이 나타남

### 세로 겹침 현상
- 세로로 나열된 두 박스의 간격을 두 마진의 합이 아니라 둘 중 큰 값을 선택하는 현상

## 박스 사이징(box-sizing)
- width, height 값에 padding, border 영역은 포함되지 않음
- 만약 width가 100%로 설정되는 경우 padding이나 border 속성을 추가하면 안됨
- box-sizing 속성값을 border-box로 설정하면 width와 height값에 padding과 border를 포함

****************************************************************
# CSS 디스플레이
- 웹 페이지의 레이아웃을 결정하는 속성
- block, inline, inline-block, none

✔ visibility: hidden; → visibility: visible;

```
아이디: [     apple       ] [중복검색]
사용할 수 있는 아이디입니다. -> "이 부분"
비밀번호: [  ***********  ]
```

****************************************************************
# CSS 폼
- 폼 요소의 스타일 설정

****************************************************************
# CSS Position
- 요소의 위치를 결정하는 방식을 설정

## 1. 정적 위치 지정방식
- static position. 기본값
- HTML 요소의우위치를 결정하는 기본적인 방식
- 단순히 웹 페이지의 흐름에 따라 차례대로 요소들이 위치를 결정하는 방식

## 2. 상대 위치 지정방식
- HTML 요소의 기본 위치(정적 위치 지정방식)를 기준으로 위치를 재설정 하는 방식
- top, left, right, bottom 속성값을 사용하여 재설정

## 3. 고정 위치 지정방식
- fixed position
- 웹 페이지가 스크롤 되어도 고정위치로 지정된 요소는 항상 같은 곳에 위치
-뷰포트를 기준으로 위치를 설정하는 방식
 top, left, right, bottom 속성값을 사용할 수 있음

## 4. 부모태그를 이용한 고정위치 지정방식
- sticky position
- fixed가 브라우저 화면의 절대 위치를 사용하는 반면 sticky는 부모 태그의 절대 위치값을 사용하는 방식
- 익스플로러에서는 작동하지 않음

## 5. 절대 위치 지정방식
- absolute position
- 뷰포트를 기준으로 위치를 설정하는 방식
- 조상요소를 기준으로 위치를 지정할 수 있음
- 조상요소를 가지지 않으면 body 요소를 기준으로 위치를 결정
- 조상요소를 기준으로 위치를 지정하려면 조상요소는 반드시 정적 위치 지정 방식이 아니여야 함.
- top, left, right, bottom 속성값을 사용할 수 있음

## z-index
- HTML 요소의 위치를 설정하게도되면 위치 및 방식에 따라 요소가 겹칠 수 있음
- 겹쳐지는 요소들이 쌓이는 순서를 결정할 때 z-index를 사용

## float
- HTML 요소가 주변(수평으로 나열된)의 다른 요소들과 자연스럽게 어울리도록 만들기 위해 사용
- float를 적용받은 요소의 다음에 나오는 모든 요소들이 끌어올려짐
- float를 적용받은 요소의 방향을 결정(left, right)
- content 크기 만큼만 영역을 설정(블록)
- float를 적용받은 요소는 다른 요소보다 위쪽에우위치(배경보다 위)

## clear
- float 속성이 적용된 이후 나타나는 요소들의 동작을 조절
- float 속성이 적용되면 그 이후에 등장하는 모든 요소들은 정확한 위치를 설정하기 힘듦
- clear 속성을 이용하여 float 이후에 등장하는 요소들이 더이상 float 속성에 영향을 받지 않도록 설정(left, right, both)