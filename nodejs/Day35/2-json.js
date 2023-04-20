const http = require('http')

const skills = [
    { name: "HTML" },
    { name: "CSS" },
    { name: "JavaScript" },
    { name: "Nodejs" },
    { name: "Python" }
];

const server = http.createServer((req, res) => {
    const url = req.url
    const method = req.method
    // console.log(url);
    // console.log(method);
    if(method === 'GET'){
        res.writeHead(200, {'Content-Type':'application/json'})
        res.end(JSON.stringify(skills))
    }else if(method === 'POST'){
        const body = []
        req.on('data', (chunk) => {
            console.log(chunk)
            body.push(chunk)
        })
        req.on('end', () => {
            const bodyStr = Buffer.concat(body).toString()
            const skill = JSON.parse(bodyStr)
            skills.push(skill)
            console.log(skill)
            res.writeHead(201)
            res.end()
        })
    }
})

server.listen(8080)