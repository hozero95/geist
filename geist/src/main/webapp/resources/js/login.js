/**
 * 로그인 페이지
 */
	var loginService = (function() {
            function login(param, callback, error) {
                $.ajax({
                    type : 'post',
                    url : '/login/login',
                    data : JSON.stringify(param),
                    contentType : "application/json; charset=utf-8",
                    success : function(result, status, xhr) {
                        if(callback) {
                            callback(result);
                        }
                    },
                    error : function(xhr, status, err) {
                        if(error) {
                            error(err);
                        }
                    }
                });
            }
            
            return {
                login : login
            }
        })();
        
        
        $(document).ready(function(){
            var loginForm = $("#loginForm");
            var loginBtn = $(".btn-login");
            var registerLink = $(".registerLink");
            var idSearchLink = $(".idSearchLink");
            var pwSearchLink = $(".pwSearchLink");
            
            $("#id-error").hide();
            $("#pwd-error").hide();
            
            loginBtn.click(function() {
                var id = $("#id").val();
                var pw = $("#pwd").val();

                if(id.length < 1) {
                    $("#id-error").show();
                    $("#id").focus();
                    return false;
                } else {
                    $("#id-error").hide();
                }
                
                if(pw.length < 1) {
                    $("#pwd-error").show();
                    $("#pwd").focus();
                    return false;
                } else {
                    $("#pwd-error").hide();
                }
                
                var emp_id = $("input[name='emp_id']").val();
                var emp_pw = $("input[name='emp_pw']").val();
                
                loginService.login({
    				emp_id : emp_id,
    				emp_pw : emp_pw
    			}, function(result){
    				if(result == 'success') {
    					location.href = "/main";
    				}
    				else{
    					console.log("로그인 실패")
    					alert("아이디 또는 비밀번호가 잘못되었습니다.");
    				}
    			});
            });
            
            registerLink.on("click", function() {
                location.href = "/register";
            });
            
            idSearchLink.on("click", function() {
                location.href = "/idSearch";
            });
            
            pwSearchLink.on("click", function() {
                location.href = "/pwSearch";
            });
        });