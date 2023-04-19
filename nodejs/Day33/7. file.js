const fs = require('fs').promises

// 파일 읽기
fs.readFile('./test.txt', 'utf-8')
    .then((data) => console.log(data))
    .catch(console.error)

// 파일 쓰기
fs.writeFile('./write.txt', 'Hello! 파일 쓰기 예제입니다!')
    .catch(console.error)

// 파일 추가 쓰기
fs.appendFile('./write.txt', '추가로 글을 입력합니다!')
    .catch(console.error)

// 복사
fs.copyFile('./test.txt', './test2.txt')
    .catch(console.error)

// 디렉토리 생성
fs.mkdir('subdir')
    .catch(console.error)

// 디렉토리 리스트 확인
fs.readdir('./')
    .then(console.log)
    .catch(console.error)