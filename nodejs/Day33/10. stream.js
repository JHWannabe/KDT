const fs = require('fs')

const readStream = fs.createReadStream('./file.txt', {
    // 기본 데이터 64 kbytes
    highWaterMark: 8,
    encoding: 'utf-8'
})

const beforeMem = process.memoryUsage().rss;
const data = []
readStream.on('data', (chunk) => {
    console.log(chunk)
    console.count('data')
    readStream.close()
})

readStream.on('close', () => {
    const afterMem = process.memoryUsage().rss
    const diff = afterMem - beforeMem
    const consumed = diff/1024/1024
    console.log(diff)
    console.log(`Consumed Memory: ${consumed}MB`)
})