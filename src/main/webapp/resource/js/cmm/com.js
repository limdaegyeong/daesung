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
	