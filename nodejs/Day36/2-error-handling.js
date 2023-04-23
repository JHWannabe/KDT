import express from 'express'
import fs from 'fs'
import fsAsync from 'fs/promises'

const app = express()

app.use(express.json())
// 비동기식
app.get('/file1', (req, res) => {
    fs.readFile('/file1.txt', (err, data) => {
        if(err){
            res.sendStatus(404)
        }
    })
})

// 동기식
app.get('/file2', (req, res) => {
    try {
        fs.readFileSync("/file2.txt")
    } catch (e) {
        res.sendStatus(404)
    }
})

// promise
app.get('/file3', (req,res) => {
    fsAsync
        .readFile("/file3.txt")
        .catch(() => res.sendStatus(404))
})

// await, async
app.get('/file4', async(req, res) => {
    try {
        const data = await fsAsync.readFile("/file4.txt");
        res.send(data);
    } catch (err) {
        res.sendStatus(404);
    }
})

app.use((error, req, res, next) => {
    console.error(error);
    features.status(500).join({message: '서버 에러!!'})
})

app.listen(8080)