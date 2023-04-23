import express from 'express'
import postRouter from './routes/post.js'
import userRouter from './routes/user.js'

const app = express()

app.use(express.json())

app.use('/users', userRouter)
app.use('/posts', postRouter)

app.listen(8080)