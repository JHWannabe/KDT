const path = require('path')

// POSIX (Unix, Linux, Mac): 'users/temp/5-path.js'
// Windows: 'c:\\temp\\5-path.js'

console.log(__dirname)
console.log(__filename)

console.log(path.sep)
console.log(path.delimiter)

// 파일 이름만 가져오기
console.log(path.basename(__filename));

// 파일 확장명 제거하기
console.log(path.basename(__filename, '.js'));

// 디렉토리 이름 가져오기
console.log(path.dirname(__filename));

// 확장명 가져오기
console.log(path.extname(__filename))

// 객체
const parsed = path.parse(__filename)   // root, dir, base, ext, name를 객체화하여 다 가져옴
console.log(parsed);
console.log(parsed.root);
console.log(parsed.name);

// 문자열
const str = path.format(parsed)
console.log(str)

// 절대 경로 (true)
console.log('isAbsolute: ', path.isAbsolute(__dirname));

// 상대 경로 (false)
console.log("isAbsolute: ", path.isAbsolute('../'));

// normalize(어긋난 경로를 어느정도 바로잡아줌)
console.log(path.normalize('./nodejs/////////////sub/'));

// 문제
// 전: C:\\Users\\jhjun\\OneDrive\\바탕 화면\\KDT\\nodejs\\Day33
// 후: C:\\Users\\jhjun\\OneDrive\\바탕 화면\\KDT\\nodejs\\Day33\\image

console.log('-----------------');
console.log(__dirname + '\\' + 'image');
console.log(__dirname + path.sep + 'image');
console.log(path.join(__dirname,'image'));