const http = require('http')
const fs = require('fs')
const ejs = require('ejs')

const name = 'apple'
const skills = [
    { name: "HTML" },
    { name: "CSS" },
    { name: "JavaScript" },
    { name: "Nodejs" },
    { name: "Python" }
];

const server = http.createServer((req, res) => {
  const url = req.url;
  res.setHeader("Content-Type", "text/html");
  if (url == "/") {
    ejs
      .renderFile("./template/index.ejs", { name: name })
      .then((data) => res.end(data));
  } else if (url == "/mypage") {
    ejs
      .renderFile("./template/mypage.ejs", { skills: skills })
      .then((data) => res.end(data));
  }
  // 위 페이지 외에 호출시 not-found.ejs 페이지를 출력
  // xxx님이 요청하신 페이지를 찾을 수 없습니다. (Not Found! 😥)
  else{
    ejs
      .renderFile("./template/not-found.ejs", { name })
      .then((data) => res.end(data));
  }
})

server.listen(8080)