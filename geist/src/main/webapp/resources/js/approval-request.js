/**
 * 
 */

console.log("approvalRequest.js")
console.log("2221")
console.log(today())

var approvalCreateService = (function(){   
   function appCreate(param, callback, error){
      $.ajax({
            type : 'post',
            url : '/approvalRequest/new',
            data : JSON.stringify(param),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if(callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, err) {
               console.log("에러발생")
                if(error) {
                    error(err);
                }
            }
        });
   }
   
   function detail(param, callback, error){
      var emp_no = param.emp_no;
      
      $.getJSON("/approvalRequest/new/" + emp_no + ".json", function(data){
         if(callback){
            callback(data);
         }
      }).fail(function(xhr, status, err){
         console.log("fail")
         if(error){
            error();
         }
      });
   }
   
   return {
      appCreate : appCreate,
      detail : detail
   }
})();

$(document).ready(function(){               
   var writeBtn = $(".btn-write");
   var emp_no = Number($("input[name='login_no']").val());
   
   console.log(emp_no)
   
   var deptName = $(".dept-name");
   var empPosition = $(".emp-position");
   var empName = $(".emp-name");
   var appDate = $(".app-date");
   
   detailView(emp_no);   
   
   function detailView(emp_no){
      console.log("detailVeiw 실행")
      approvalCreateService.detail({
         emp_no : emp_no
      }, function(data){            
         console.log(data)
         deptName.text(data.dept_name);
         empPosition.text(data.emp_position);
         empName.text(data.emp_name);
         appDate.text(today());
      });
   }
   
   writeBtn.click(function(){
      // app_class : 1(2, 3)
      var uri = document.location.href;
      var app_class = Number(uri.slice(-1));
      var app_title = "";
      console.log(typeof app_class)
      
      if(app_class === 1){
         app_title = "주간업무 보고서"
      }else if(app_class === 2){
         app_title = "휴가 신청서"
      }else{
         app_title = "사직 신청서"
      }
            
      // manager_no : [{...}, {...}] 
      var manager_no = [];
      var arr = [];
            
      $('input:checkbox[name="management"]').each(function() {
            if(this.checked){   //checked 처리된 항목의 값
                  var val = this.value;
                  arr.push(val);
            }
       });
      
      for(let i = 0; i < arr.length; i++){
         var obj = {};
         obj.emp_position = arr[i];
         manager_no[i] = obj;
      }
      
      approvalCreateService.appCreate({
         app_class : app_class,
         app_title : app_title,
         emp_no : emp_no,
         manager_no : manager_no
      }, function(result){
         if(result == 'success') {
                location.href = "/approvalRequest";
            } else {
                console.log("문서 생성 실패....");
            }
      })
   });
});