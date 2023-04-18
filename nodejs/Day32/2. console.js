console.log('로딩중...')
console.clear()

console.log('log')      // 개발
console.info('info')    // 정보
console.warn('warn')    // 경고
console.error('error')  //에러, 사용자 에러, 시스템 에러

// assert(조건을 만족하지 않으면 에러 메세지를 출력)
console.assert(2 === 2, '두 값이 같아요!')  // 값이 출력되지 않음
console.assert(2 === 3, '두 값이 달라요!')  // 값이 출력됨
console.log('---------------------')

const user = {userid:'apple', username:'김사과', age:20, company: {name:'SK', addr:'서울 중구'}}
console.log(user)
console.table(user)
console.log("---------------------")
console.dir(user, {showHidden: true, depth:0, colors: false})

// 실행시간 확인
console.time('for loop')
for(let i=0; i<10; i++){
    console.log(i)
}

console.timeEnd('for loop')

// 함수 실행 카운트
function func1() {
    console.log('func1() 실행!')
    console.count("func1 function");
}

function func2() {
    console.log('func2() 실행!')
}

func1()
func2()
func1()
console.countReset('func1 function')
func1()

// trace 사용법
function func3() {
    func4()
}

function func4() {
    func5()
}

function func5() {
    console.log('func5() 실행!')
    console.trace()
}

func3()