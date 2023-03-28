# CSS(Cascading Style Sheet)
* 웹 페이지의 특정 요소 또는 요소 그룹에 적응할 스타일 그룹을 지정하는 규칙을 정의하는 언어

## 참고
* MDN : https://developer.mozilla.org/ko/

## CSS 문법
* HTML 문서 <head> 요소 안에 <style> 요소를 사용하여 CSS 문법을 적용  

```
선택자 { 속성명1: 속성값; 속성명2: 속성값; ... }  
Ex) p {text-align: center; color: deepskyblue;}  
  -----  ----------  ------
  선택자    속성명    속성값
```

## 주석문
* /* ~ */ 사이에 내용 입력

## CSS를 적용하는 방법
### 1. 인라인 스타일
* HTML 요소 내부에 style 속성을 사용하여 적용하는 방법  
```
 <p style="text-align: center; color: deepskyblue;">안녕하세요!</p>
 ```

### 2. 내부 스타일
* HTML 문서의 <head> ~ </head> 사이에 <style> ~ </style> 요소를 사용하여 적용하는 방법
```  
<style>
    h2 {text-align: center; font-size: 50px; color: deepskyblue;}
    p {text-align: center; font-size: 20px;}
</style>
```

### 3. 외부 스타일
* 웹 사이트 전체의 스타일을 하나의 파일에서 변경할 수 있도록 적용하는 방법  
```
<link rel="stylesheet" href="css 파일 경로">
```

### rel
* 현재 문서와 링크된 문서 사이의 연관관게를 명시

### VSCode Extension: indent-rainbow
* 들여쓰기를 컬러화 시킨 프로그램


# 선택자
## 1. 전체 선택자
* 스타일을 모든 요소에 적용  
* '*' 기호를 사용해서 표현
* 너무 많은 요소가 있는 HTML 문서에 사용할 경우 클라이언트에 부하를 줄 수 있음

    * { 속성명1: 속성값; 속성명2: 속성값 ...}  

   ✔ 개별적으로 적용한 스타일은 전체 선택자에 적용한 스타일보다 우선!

## 2. 요소 선택자
* 특정 요소가 쓰인 모든 요소에 스타일을 적용

### 상속
* 부모 요소의 속성값이 자식 요소에게 전달되는 것
* https://www.w3.org/TR/CSS22/propidx.html

## 3. id 선택자
* 웹 문서만의 특정 부분 스타일을 적용
* '#'기호를 사용해서 id 속성을 가진 요소에 스타일을 적용  
```
CSS
h2 {font-size: 30px;} // 안녕하세요, 반갑습니다 모두 적용
h2#hello {font-size: 20px;} // 안녕하세요 20px로 변경
#hello {color: pink;} // 안녕하세요 pink 색상으로 적용

HTML
<h2 id="hello">안녕하세요</h2>
<h2>반갑습니다</h2>
```

## 4. class 선택자
* 특정 집단의 요소를 한번에 스타일을 적용
* '.' 기호를 사용해서 같은 class 이름을가진 요소에 스타일을 적용

    CSS
    h2 {font-size: 20px;} //안녕하세요, 반갑습니다 적용
    h2.hello {color: deeppink;} // 안녕하세요 적용
    .hello {color: deepskyblue;} // 안녕하세요, 하이 적용
    p {font-weight: bold;} // 하이, 또 만났군요 적용


    HTML
    <h2 class="hello">안녕하세요</h2>
    <h2>반갑습니다</h2>
    <p class="hello">하이</p>
    <p>또 만났군요</p>

## 5.그룹 선택자
* 여러 개의 요소를 나열하고 ','로 구분하여 스타일을 적용  

    h2, p {text-align: center;}

## HTML 구조 확인하기
```
<html>
<head>
    <title>테스트</title>
</head>

<body>
    <h2>HTML의 구조</h2>
    <p>HTML의 <b>구조</b>입니다</p>

</body>
</html>
```

```
                        <html>
    <head>                                  <body>
    <title>                      <h2>                    <p>
    테스트                    HTML의 구조         HTML의   <b>  입니다
```

## 6. 자식 선택자
* 부모의 요소 하위의 자식요소의 스타일을 적용  
```
body > p { color: deepskyblue;}
```

## 7. 자손 선택자
* 조상요소 하위의 모든 요소의 스타일을 적용
* 자손은 자식을 포함
```
body p {color: deepskyblue;}
```

## 8. 인접 형제 선택자
* 동일한 부모의 요소를 갖는 자식 요소들의 관계
* 연속된 동생 요소의 스타일을 적용
```
h2 + p {color: deepskyblue;}
```

## 9. 일반 형제 선택자
* 형제 관계를 갖는 요소 중에서 요소 다음에 나오는 모든 동생 요소의 스타일을 적용
```
h2 ~ p {color: deeppink;}
```

## 10. 속성 선택자
* HTML 요소에서 src, href, style, type, id, class .. 등 속성을 선택자로 지정해서 스타일을 적용
* 패턴이 많음 -> MDN 참고(https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Attribute_selectors)

```
CSS
[src] {border: 3px solid red;}
[src='apple.png] {width: 200px; height: 200px;}

HTML
<img src='apple.png' alt='사과 이미지'>
<img src='banana.png' alt='바나나 이미지'>
```

## 11. 가상 선택자
* 클래스를 추가할 필요없이 요소 중에서 순서에 따라 원하는 요소를 선택
```
CSS
.deepsky {color: deepskyblue;}

HTML
<ul>
    <li class='deepsky'>김사과</li>
    <li class='deepsky'>반하나</li>
    <li>오렌지</li>
    <li>이메론</li>
</ul>
```

* li:first-child
li 요소 중에서 첫번째 요소의 스타일을 적용
예) ul > li:first-child {color: deeppink;}
* li:last-child
li 요소 중에서 마지막 요소의 스타일을 적용

* li:nth-child(n)
li 요소 중에서 n번째 요소의 스타일을 적용

* li:nth-child(odd)
li 요소 중에서 홀수 번째 요소의 스타일을 적용

* li:nth-child(even)
li 요소 중에서 짝수 번째 요소의 스타일을 적용

## 12. 스타일링 링크
* a:link
하이퍼링크가 연결되었을 때 선택

* a:visited
특정 하이퍼링크를 방문한 적이 있을 때 선택

* a:hover
특정 요소에 마우스를 올렸을 때 선택

* a:active
특정 요소에 마우스 버튼을 클릭하고 있을 때 선택

# CSS의 컬러
## 1. 색상 이름으로 표현
```
red, yellow, blue, salmon, ...
```

## 2. RGB 색상값으로 표현
```
rgb(0~255, 0~255, 0~255) -> rgb(0, 0, 255)
     RED   GREEN  BLUE
rgba(0~255, 0~255, 0~255, 0~1의 소수)
                            ALPHA
```

## 3. 16진수 색상값으로 표현
```
#0000FF -> 파랑
00 00 FF -> #00F
R  G  B
```
# CSS의 텍스트
## 1. color
* 텍스트의 색상을 설정
* 기본값은 검정색

## 2. letter-spacing
* 텍스트 내에서 글자 사이의 간격을 설정
예) 안녕하세요. 오늘은 화요일.. 아직도?
    안 녕 하 세 요 . 오 늘 은 화 요 일 . . 아 직 도?

## 3. word-spacing
* 텍스트 내에서 단어 사이의 간격을 설정
예) 안녕하세요. 오늘은 화요일.. 아직도?
    안녕하세요.  오늘은   화요일..  아직도?

## 4. text-align
* 텍스트 수평 방향 정렬을 설정(left, right, center, justify)

## 5. text-indent
* 단락의 첫 줄의 들여쓰기를 설정

## 6. line-height
* 줄 높이를 정하는 속성
예) 글자크기가 40px일 때
line-height: 1.5 -> 줄 높이는 40px의 1.5배인 60px
ㄴ> 글자 크기는 40px이므로 글자 위와 아래에 각각 10px의 여백이 생김
ㄴ> 만약 줄 높이가 글자 크기보다 작으면 세로 방향으로 글자가 겹침

## 7. text-decoration
* 텍스트에 여러가지 효과를 설정하거나 제거하는데 사용(none, underline, line-through, overline)

## 8. text-transform
* 텍스트에 포함된 영문자에 대한 대소문자를 설정(lowercase, uppercase,capitalize)

## 9. font-variant
* 소문자를 작은 대문자로 변경(small-caps)

## 10. text-shadow
* 텍스트에 그림자 효과를 설정
```
선택자 {text-shadow: 가로길이 세로길이 번짐정도 색상;}
```

## 11. white-space
* 스페이스와 탭, 줄바꿈, 자동줄바꿈을 어떻게 처리할 지 결정하는 속성(nowrap, pre, pre-wrap, pre-line)

## 12. text-overflow
* 텍스트를 줄바꿈하지 않았을 때 넘치는 텍스트를 어떻게 처리할 지 결정하는 속성(clip, ellipsis)

## 13. overflow
* 요소내의 컨텐츠가 너무 커서 모두 보여주기 힘들 때 어떻게 보여줄지 정하는 속성(visible, hidden, scroll, auto)