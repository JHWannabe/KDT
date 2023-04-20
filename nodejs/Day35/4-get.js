import express from 'express'

const app = express()

app.get('/posts', (req, res) => {
    console.log("posts를 호출!");
    console.log("path: ", req.path);
    console.log("params: ", req.params);
    console.log("query: ", req.query); // { number: '1' }
    res.sendStatus(200);
})

app.get('/posts/:id', (req, res) => {
    console.log("/posts/:id 호출!");
    console.log("path: ", req.path);
    console.log("params: ", req.params); // { id: '1' }
    console.log("query: ", req.query);
})

app.delete('/posts/:id', (req, res) => {
    console.log("delete /posts/:id 호출!");
    console.log(`${req.params.id} 번호가 삭제됨`);
    res.sendStatus(200)
})

app.listen(8080)