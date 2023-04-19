// 버퍼(buffer)
// 메모리에 저장되는 일부 공간
// 바이트 단위로 저장되며 integer 형태의 배열
const fs = require('fs')
const buf = Buffer.from('Hi')

console.log(buf)
console.log(buf.length)
console.log(buf[0])
console.log(buf[1])
console.log(buf.toString());

const buf2 = Buffer.alloc(2);
buf2[0] = 72
buf2[1] = 105
console.log(buf2.toString());

// nodejs를 메모리에 버퍼 저장하고 출력하기
const buf3 = Buffer.alloc(6)
buf3[0] = 110
buf3[1] = 111
buf3[2] = 100
buf3[3] = 101
buf3[4] = 106
buf3[5] = 115
console.log(buf3.toString());

// concat
const newBuf = Buffer.concat([buf, buf2, buf3])
console.log(newBuf.toString());