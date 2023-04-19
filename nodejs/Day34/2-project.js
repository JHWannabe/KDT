// 1. 사용자가 정리하고자 하는 폴더를 선택하게 함
// node 2-project test
//   0       1      2
const curdir = process.argv[2]
console.log(curdir);

// 2. 사용자가 원하는 폴더 안에 video, captured, duplicated 폴더를 만듬
const fs = require("fs");
try {
    fs.mkdir("test/video");
    fs.mkdir("test/captured");
    fs.mkdir("test/duplicated");
} catch (e) {
    console.error(e);
}

// 3. 폴더 안에 있는 파일들을 조건에 맞게 정리함
// mp4, mov 확장명을 가진 파일들은 video 폴더로 이동
// png, aee 확장명을 가진 파일들은 captured 폴더로 이동
// IMG_로 시작되는 파일들을 duplicated 폴더로 이동
// IMG_E로 시작되는 파일은 그대로 둠

try{
    fs.readdir('./test', (err, files) => {
        for (i=0; i<files.length; i++){
            fileExt = files[i].split('.')
            file = String(files[i])
            if (fileExt[1] == "mp4" || fileExt[1] == "mov") {
                fs.rename('./test/'+file, "./test/video/" + file)
            } else if (fileExt[1] == "png" || fileExt[1] == "aae") {
                fs.rename('./test/'+file, "./test/captured/" + file)
            } else if (fileExt[0].includes("IMG_E")) {
                fs.rename(file, file, (error) => {
                    console.log(error);
                });
            } else if (fileExt[0].includes("IMG_")) {
                fs.rename('./test/'+file, "./test/duplicated/" + file)
            }
        }
    })
}catch(e) {
    console.error(e);
}