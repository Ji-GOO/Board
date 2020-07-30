console.log("Comment Module!!!!!!!")

var commentService = (function() {
	
	function createComment(comment, callback, error) {
		
		console.log("add comment.......");
		
		$.ajax({
			type : 'post',
			url : '/comment/create',
			data : JSON.stringify(comment),
			contentType : "application/json; charset=UTF-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function getAllComment(param, callback, error) {
		
		var idx = param.idx;
		var page = param.page || 1;
		
		$.getJSON("/comment/pages/" + idx + "/" + page + ".json",
				function(data) {
			if(callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	function deleteComment(id, callback, error) {
		
		$.ajax({
			type : 'delete',
			url : '/comment/' + id,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function modifyComment(comment, callback, error) {
		
		console.log("COMMENT ID : " + comment.id);
		
		$.ajax({
			type : 'put',
			url : '/comment/' + comment.id,
			data : JSON.stringify(comment),
			contentType : 'application/json; charset=UTF-8',
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function getOneComment(id, callback, error) {
		$.get("/comment/" + id + ".json", function(result) {
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, er) {
			if(error) {
				error();
			}
		});
	}
	
	function displayTime(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)) {
			var hh = dataObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	};
	
	return {
		createComment : createComment,
		getAllComment : getAllComment,
		deleteComment : deleteComment,
		modifyComment : modifyComment,
		getOneComment : getOneComment,
		displayTime : displayTime
	};
})();