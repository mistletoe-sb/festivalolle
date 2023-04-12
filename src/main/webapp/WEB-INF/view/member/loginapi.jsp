<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
</head>
<body>
	<ul>
		<li>
	      <!-- 아래와같이 아이디를 꼭 써준다. -->
	      <a id="naverIdLogin_loginButton" href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id={OxS7FrvZnBU8ZjBTSIXl}&redirect_uri={http://localhost:8080/festivalolle}&state=state">
	          <span>네이버 로그인</span>
	      </a>
		</li>
		<li onclick="naverLogout(); return false;">
	      <a href="javascript:void(0)">
	          <span>네이버 로그아웃</span>
	      </a>
		</li>
	</ul>

	<div>
	    <a href="https://kauth.kakao.com/oauth/authorize?client_id=28b8b839a02fc2065b839bd2af182415&redirect_uri=	
http://localhost:8080/festivalolle&response_type=code">카카오 로그인 버튼</a>
	    <br>
	    <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=OxS7FrvZnBU8ZjBTSIXl&state=state&redirect_uri=http://localhost:8080/festivalolle">네이버 로그인 버튼</a>
	</div>
	
	<!-- https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=OxS7FrvZnBU8ZjBTSIXl&state=state&redirect_uri=http://localhost:8080/festivalolle -->
	
	
	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>
	
	
	
	
	
	
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
	<script>
	  Kakao.init('c089c8172def97eb00c07217cae17495'); // 사용하려는 앱의 JavaScript 키 입력
	</script>
	
	<script>
	
		var naverLogin = new naver.LoginWithNaverId({
				clientId: "OxS7FrvZnBU8ZjBTSIXl", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
				callbackUrl: "http://localhost:8080/festivalolle" // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
				isPopup: false,
				callbackHandle: true
		});	

		naverLogin.init();
		
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
		    		
					console.log(naverLogin.user); 
		    		
		            if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
		
		var testPopUp;
		function openPopUp() {
		    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
		}
		function closePopUp(){
		    testPopUp.close();
		}

		function naverLogout() {
			openPopUp();
			setTimeout(function() {
				closePopUp();
				}, 1000);
			
			
		}


</script>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
    });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>


</body>
</html>