import express from 'express'
import morgan from 'morgan'
import cors from 'cors'

const app = express()

app.use(morgan('common'))
app.use(cors())

app.get('/', (req, res) => {
    console.log('/ get으로 메인페이지 호출!');
    res.send('Welcome!')
})

app.listen(8080)