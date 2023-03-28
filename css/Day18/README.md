# CSS(Cascading Style Sheet)
* 웹 페이지의 특정 요소 또는 요소 그룹에 적응할 스타일 그룹을 지정하는 규칙을 정의하는 언어

## 참고
* MDN : https://developer.mozilla.org/ko/

## CSS 문법
* HTML 문서 <head> 요소 안에 <style> 요소를 사용하여 CSS 문법을 적용  

    선택자 { 속성명1: 속성값; 속성명2: 속성값; ... }  
    Ex) p { text-align: center; color: deepskyblue; }  
     -----  ----------  ------
     선택자    속성명    속성값


## 주석문
* /* ~ */ 사이에 내용 입력

## CSS를 적용하는 방법
### 1. 인라인 스타일
* HTML 요소 내부에 style 속성을 사용하여 적용하는 방법  
    <p style="text-align: center; color: deepskyblue;">안녕하세요!</p>

### 2. 내부 스타일
* HTML 문서의 <head> ~ </head> 사이에 <style> ~ </style> 요소를 사용하여 적용하는 방법  
    <style>
        h2 {text-align: center; font-size: 50px; color: deepskyblue;}
        p {text-align: center; font-size: 20px;}
    </style>

### 3. 외부 스타일
* 웹 사이트 전체의 스타일을 하나의 파일에서 변경할 수 있도록 적용하는 방법  
    <link rel="stylesheet" href="css 파일 경로">

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

    CSS
    h2 { font-size: 30px;} /* 안녕하세요, 반갑습니다 모두 적용 */
    h2#hello { font-size: 20px; } /* 안녕하세요 20px로 변경 */
    #hello { color: pink; } /* 안녕하세요 pink 색상으로 적용 */

    HTML
    <h2 id="hello">안녕하세요</h2>
    <h2>반갑습니다</h2>

## 4. class 선택자
* 특정 집단의 요소를 한번에 스타일을 적용
* '.' 기호를 사용해서 같은 class 이름을가진 요소에 스타일을 적용

    CSS
    h2 {font-size: 20px;} /* 안녕하세요, 반갑습니다 적용 */
    h2.hello {color: deeppink;} /* 안녕하세요 적용 */
    .hello {color: deepskyblue;} /* 안녕하세요, 하이 적용 */
    p {font-weight: bold;} /* 하이, 또 만났군요 적용*/
    

    HTML
    <h2 class="hello">안녕하세요</h2>
    <h2>반갑습니다</h2>
    <p class="hello">하이</p>
    <p>또 만났군요</p>
