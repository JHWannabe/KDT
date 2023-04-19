const os = require('os');

console.log(os.EOL === '\n');   // 맥: true
console.log(os.EOL === '\r\n'); // 윈도우: true

console.log(os.totalmem());
console.log(os.freemem());
console.log(os.type());
console.log(os.userInfo());
console.log(os.cpus());
console.log(os.homedir());
console.log(os.hostname());