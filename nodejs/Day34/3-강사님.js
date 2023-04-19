const path = require("path");
const os = require("os");
const fs = require("fs");
// 1. 사용자가 정리하고자 원하는 폴더를 선택하게 함
// node 2-project test
//  0       1      2
const curdir = process.argv[2];
// console.log(curdir);
const workingDir = path.join(__dirname, curdir);
// console.log(workingDir);
if (!curdir || !fs.existsSync(workingDir)) {
  console.error("해당 경로 및 폴더가 존재하지 않습니다");
  return;
}
// 2. 사용자가 원하는 폴더안에 video, captured, duplicated 폴더를 만듬
const videoDir = path.join(workingDir, "video");
const capturedDir = path.join(workingDir, "captured");
const duplicatedDir = path.join(workingDir, "duplicated");
!fs.existsSync(videoDir) && fs.mkdirSync(videoDir);
!fs.existsSync(capturedDir) && fs.mkdirSync(capturedDir);
!fs.existsSync(duplicatedDir) && fs.mkdirSync(duplicatedDir);
// 3. 폴더안에 있는 파일들을 조건에 맞게 정리함
// mp4,mov 확장명을 가진 파일들은 video 폴더 안으로 이동
// png,aae 확장명을 가진 파일들은 captured 폴더 안으로 이동
// IMG_로 시작되는 파일들을 duplicated 폴더 안으로 이동
// IMG_E로 시작되는 파일은 그대로 둠
fs.promises.readdir(workingDir).then(processFiles).catch(console.log);
function processFiles(files) {
  files.forEach((file) => {
    if (isVideoFile(file)) {
      move(file, videoDir);
    } else if (isCapturedFile(file)) {
      move(file, capturedDir);
    } else if (isDuplicatedFile(file)) {
      move(file, duplicatedDir);
    }
  });
}
function isVideoFile(file) {
  // g: global, 전역검색
  // m: multi-line, 다중행(여러줄) 검색
  const regExp = /(mp4|mov)$/gm;
  const match = file.match(regExp);
  return !!match;
}
function isCapturedFile(file) {
  const regExp = /(png|aae)$/gm;
  const match = file.match(regExp);
  return !!match;
}
function isDuplicatedFile(file) {
    if (!file.startsWith("IMG_") || file.startsWith("IMG_E")) {
        return false;
    }
    return true;
}
function move(file, targetDir) {
    console.info(`move ${file} to ${path.basename(targetDir)}`);
    const oldPath = path.join(workingDir, file);
    const newPath = path.join(targetDir, file);
    fs.promises.rename(oldPath, newPath).catch(console.error);
}
