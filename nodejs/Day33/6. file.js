const fs = require('fs')

/*
    rename(..., callback(error))      // 비동기식
    try { renameSync(...) } catch(e) { }    // 동기식
    promises.rename(...).then().catch()     // promise
*/

// 동기식
try {
    fs.renameSync('./test.txt', './test-new.txt')
}catch(e){
    console.error(e)
}

// 비동기식
fs.rename('./test-new.txt', './test-new-new.txt', (error) => {
    console.log(error);
})

console.log('파일 이름 바꾸기!');

// fs.promises.reanme()을 사용하여 test-new-new.txt를 test.txt로 변경
// 변경되었다면 Done! 출력, 에러시 error 객체를 출력
fs.promises
    .rename('./test-new-new.txt', './test.txt')
    .then(() => console.log('Done!'))
    .catch(console.error)