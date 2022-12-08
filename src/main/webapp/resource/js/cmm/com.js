/*
  "type": "get/post",
  "url": "접속할 페이지 주소",
  "data": "파라미터 문자열 key=value&key=value",
//  "dataType": "text, jsp, xml, json, jsonp(원격 스크립트 허용)",
//  "timeout": 밀리세컨드단위 제한시간,
//  "cache" : 이전 요청에 대한 캐시 저장 여부 (true=사용함, false=사용안함),
  "success": function (data) {
  … 통신이 성공했을 때 실행되는 함수 …
  },
  "error": function(xhr, textStatus, errorThrown) {
  … 통신에 실패했을 때 실행되는 함수 …
  }
*/


function ajaxAction(type, url, param, callback) {
    $.ajax({
        type: type, 
        url: url,
        data: param,
        success: function(data, status, xr) {
            return callback(data);
        },
        error: function(xhr, status, error) {
            return callback(data);
        }
    });
}
