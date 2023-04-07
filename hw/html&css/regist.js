function sendit() {
  // alert('회원가입 완료')
  const userid = document.getElementById("userid");
  const userpw = document.getElementById("userpw");
  const userpw_re = document.getElementById("userpw_re");
  const username = document.getElementById("username");
  const userhp = document.getElementsById("hp");
  const useremail = document.getElementById("email");
  const ssn1 = document.getElementById("ssn1");
  const ssn2 = document.getElementById("ssn2");

  // 정규 표현식
  const expIdText = /^[A-Za-z]{4,20}$/;
  const expPwText = /^[A-Za-z0-9]{8,20}$/;
  const expNameText = /^[가-힣]{2,15}$/;
  const expHpText = /^[01][0-9]{8,9}$/;
  const expEmailText = /^[A-Za-z0-9\-\.]+$/;

  // 아이디 정규식 확인
  if (!expIdText.test(userid.value)) {
    alert("아이디는 4자 이상 20자 이하의 영문자로 입력하세요");
    userid.focus();
    return false;
  }

  // 비밀번호 정규식 확인
  if (!expPwText.test(userpw.value)) {
    alert("비밀번호는 8자 이상 20자 이하의 소문자, 대문자, 숫자로 입력하세요");
    userpw.focus();
    return false;
  }

  // 비밀번호 확인 절차
  if (userpw.value != userpw_re.value) {
    alert("비밀번호를 확인해주세요");
    userpw.focus();
    return false;
  }

  // 이름 정규식 확인
  if (!expNameText.test(username.value)) {
    alert("이름은 2자 이상으로 입력하세요");
    username.focus();
    return false;
  }

  // 핸드폰 번호 정규식 확인
  if (!expHpText.test(userhp.value)) {
    alert("핸드폰 번호를 확인하세요");
    userhp.focus();
    return false;
  }

  // 이메일 정규식 확인
  if (!expEmailText.test(useremail.value)) {
    alert("아이디는 4자 이상 20자 이하의 영문자로 입력하세요");
    useremail.focus();
    return false;
  }
}
