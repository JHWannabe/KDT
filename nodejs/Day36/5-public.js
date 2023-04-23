import express from 'express'

const app = express()

app.use(express.json())

app.get('/', (req, res) => {
    console.log('/ get으로 실행');
    res.status(200).send('get으로 첫 페이지 실행')
})

// app.use(express.static('public'))

app.use('/aaa',express.static("public"));

app.listen(8080)
