# 다단 레이아웃

- 텍스트를 column 속성으로 다단을 생성
- 다단은 레이아웃을 여러 개의 컬럼으로 쪼개서 구성한다는 의미
  - column-count: 단의 갯수를 설정
  - column-rule: 단과 단 사이의 구분선, 구분의 모양, 두께, 색상을 설정
  - column-gap: 단과 단 사이의 여백을 설정
  - column-span: 단과 안의 포함된 요소를 다단 편집에서 해제(all)

---

# Flex 레이아웃

- 수평정렬을 하기 위한 속성
- display: flex

## flex-wrap

- 플렉스 라인에 여유가 없을 때 플렉스 요소의 위치를 결정하는 속성
  - nowrap: 기본값, 플렉스 요소가 다음줄로 넘어가지 않음. 요소의 너비를 줄여 한 줄에 배치
  - wrap: 플렉스 요소의 여유 공간이 없다면 다음 줄로 넘김
  - wrap-reverse: 플렉스 요소의 여유 공간이 없다면 다음 줄로 넘김 (단, 위쪽으로 넘김)

## flex-direction

- 플렉스 요소들이 배치되는 축의 방향을 결정하는 속성
  - row: 기본값, 가로로 배치
  - row-reverse: 가로로 배치(반대로)
  - col: 세로 배치
  - col-reverse: 세로 배치 반대로

## flex-flow

- flex-wrap과 flex-direction을 한꺼번에 지정할 수 있는 속성
  예) flex-flow: row nowrap;

## justify content

- 플렉스 요소의 수평방향 정렬방식을 설정
  - flex-start: 기본값, 앞쪽에서부터 배치
  - flex-end: 뒤쪽에서부터 배치
  - center: 가운데 배치됨
  - space-between: 요소들 사이에 여유 공간을 두고 배치(앞뒤 양쪽에 요소를 붙임)
  - space-around: 요소들 사이에 여유 공간을 두고 배치(앞뒤 약간의 공간을 둠)

## align-items

- 플렉스 요소의 수직방향 정렬 방식을 설정
  - stretch: 기본값, 아이템들이 수직축 방향으로 늘어남
  - flex-start: 요소들이 시작점으로 정렬
  - flex-end: 요소들이 끝으로 정렬
  - center: 요소들이 가운데로 정렬
  - baseline: 요소들이 텍스트 베이스라인 기준으로 정렬

## align-self

- 플렉스 요소에 수직축으로 다른 align 속성값을 설정

## order

- 플렉스 요소의 순서를 설정

## align-content

- 플렉스 요소가 설정된 상태에서 요소들이 2줄이상 되었을 때 수직방향 정렬방식을 설정
  - flex-wrap의 값을 wrap으로 설정해야 함
  - stretch: 기본값, 위아래로 늘어남
  - flex-start: 요소들이 시작점으로 정렬
  - flex-end: 요소들이 끝으로 정렬
  - center: 요소들이 가운데로 정렬
  - space-between: 요소들 사이에 여유 공간을 두고 배치(앞뒤 양쪽에 요소를 붙임)
  - space-around: 요소들 사이에 여유 공간을 두고 배치(앞뒤 약간의 공간을 둠)

## flex-basis

- 플렉스 요소의 기본 크기를 설정

## flex-grow

- 플렉스 요소를 flex-basis의 설정한 값보다 커질 수 있는지를 결정하는 속성

## flex-shrink

- 플렉스 요소를 flex-basis의 설정한 값보다 작아질 수 있는지를 결정하는 속성

## flex

- flex-grow, flex-shrink, flex-basis를 한번에 설정할 수 있음

---

# 미디어 쿼리(media query)

## 반응형 웹

- 하나의 웹사이트에서 PC, 스마트폰, 태블릿 등 접속하는 디스플레이 종류에 따라 화면의 크기가 자동으로 변하도록 만든 웹페이지 접근 방법

```
@media 매체유형 and (속성에 대한 조건) {
    css 코드
    ...
}
```

### 매체 유형

- all: 모든 매체
- screen: 컴퓨터, 태블릿
- print: 프린터
- speech: 스크린 리더

# em과 rem

- 상대적인 크기를 정하는 단위

## em

- 부모 요소 크기의 몇 배인지를 단위로 설정

  - pc의 일반 텍스트 크기: 16px(브라우저 기본값), 16px = 1em
  - 모바일의 일반 텍스트 크기: 12px(브라우저 기본값), 12px = 1em

- PC의 예)

```
#hello {font-size: 2em}: 32px(pc 기준)

<div id="hello">
    <div>안녕하세요</div> # 여기서 1em = 32px
</div>
```

## rem

- 문서의 최상위 요소(html)의 몇 배인지로 크기를 설정
- pc의 예)

```
html { font-size: 2rem }

<html>
    <body> <!-- 글자 크기가 모두 2rem = 32px로 적용 -->
        <div>... </div>
    </body>
</html>
```
