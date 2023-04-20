/*
    REST(Representational State Transfer)
    자원을 이름으로 구분하여 해당 자원의 상태를 주고 받는 모든 것을 의미

    API(Application Programming Interface)
    기능의 집합을 제공해서 컴퓨터 프로그램간 상호작용을 하도록 하는 것

    REST API
    REST 기반으로 서비스 API를 구현한 것

    CRUD Operation
    POST: 생성(Create)
    GET: 조회(Read)
    PUT: 수정(Update)
    DELETE: 삭제(Delete)
*/

import express from 'express'

const app = express()

app.listen(8080)

app.get('/', (req, res, next) => {
    res.send('<h2>익스프레스 서버로 만든 첫번째 페이지</h2>')
})

app.get("/hello", (req, res, next) => {
    res.setHeader("Content-Type", "application/json");
    res.status(200).json({ name: "apple", age: 20 });
});

app.use((req, res, next) => {
    res.setHeader("node-skill", "node middleware!!");
    next();
});

app.use((req, res, next) => {
    res.send("<h2>Not Found</h2>");
});