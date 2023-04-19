const fs = require("fs");
const zlib = require("zlib");
const readStream = fs.createReadStream("./file.txt"); //파일 읽기 객체
const zlibStream = zlib.createGzip(); //파일 압축 객체
const writeStream = fs.createWriteStream("./file3.zip");
const piping = readStream.pipe(zlibStream).pipe(writeStream);
//읽고, 압축하고, 쓰겠다.라는 변수 생성
piping.on("finish", () => {
  console.log("끝 났 다 !");
});
//finish는 pipe안에 기본 이벤트 !
