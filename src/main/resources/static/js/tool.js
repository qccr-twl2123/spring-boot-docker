/*****************************************************************
 jQuery Ajax封装通用类  (linjq)
 *****************************************************************/
$(function(){
    /**
     * ajax封装
     * url 发送请求的地址
     * data 发送到服务器的数据，数组存储，如：{"date": new Date().getTime(), "state": 1}
     * async 默认值: true。默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。
     *       注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。
     * type 请求方式("POST" 或 "GET")， 默认为 "GET"
     * dataType 预期服务器返回的数据类型，常用的如：xml、html、json、text
     * successfn 成功回调函数
     * errorfn 失败回调函数
     */
    jQuery.ax=function(url, data, async, type, dataType, successfn, errorfn) {
        async = (async==null || async=="" || typeof(async)=="undefined")? "true" : async;
        type = (type==null || type=="" || typeof(type)=="undefined")? "post" : type;
        dataType = (dataType==null || dataType=="" || typeof(dataType)=="undefined")? "json" : dataType;
        data = (data==null || data=="" || typeof(data)=="undefined")? {"date": new Date().getTime()} : data;
        $.ajax({
            type: type,
            async: async,
            data: data,
            url: url,
            dataType: dataType,
            success: function(d){
                successfn(d);
            },
            error: function(e){
                errorfn(e);
            }
        });
    };

    /**
     * ajax封装
     * url 发送请求的地址
     * data 发送到服务器的数据，数组存储，如：{"date": new Date().getTime(), "state": 1}
     * successfn 成功回调函数
     */
    jQuery.axs=function(url, data, successfn) {
        data = (data==null || data=="" || typeof(data)=="undefined")? {"date": new Date().getTime()} : data;
        $.ajax({
            type: "post",
            data: data,
            url: url,
            dataType: "json",
            success: function(d){
                successfn(d);
            }
        });
    };

    /**
     * ajax封装
     * url 发送请求的地址
     * data 发送到服务器的数据，数组存储，如：{"date": new Date().getTime(), "state": 1}
     * dataType 预期服务器返回的数据类型，常用的如：xml、html、json、text
     * successfn 成功回调函数
     * errorfn 失败回调函数
     */
    jQuery.axse=function(url, data, successfn, errorfn) {
        data = (data==null || data=="" || typeof(data)=="undefined")? {"date": new Date().getTime()} : data;
        $.ajax({
            type: "post",
            data: data,
            url: url,
            dataType: "json",
            success: function(d){
                successfn(d);
            },
            error: function(e){
                errorfn(e);
            }
        });
    };
});
/**
 * 表单参数化
 * @param formId
 * @returns {{}}
 */
function formToObject(formId){
    var o={};
    var a=$("#"+formId).serializeArray();
    $.each(a,function(){
        if(o[this.name]){
            if(!o[this.name].push){
                o[this.name]=[o[this.name]];
            }
            o[this.name].push(this.value||'');
        }else{
            o[this.name]=this.value||'';
        }
    });
    return o;
}

function printError(result){
    if(!result.success){
        $.toast(result.message);
        return false;
    }
    return true;
}

function render(url, params){
    if(params == null){
        window.location.href=url;
    }else{
        window.location.href=url+'?'+params;
    }
}

/**
 * post方式异步提交
 * @param url
 * @param param
 * @param callback
 */
function doPost(url,param,callback,context){
    var tmpUrl;
    if(url.indexOf('?')==-1){
        tmpUrl=url+"?randomNum="+Math.random()*99999+"&ajax_request=async";
    }else{
        tmpUrl=url+"&randomNum="+Math.random()*99999+"&ajax_request=async";
    }
    $.ajax({
        type:"POST",
        url:tmpUrl,
        data:param,
        dataType:"text",
        context:context,
        cache:false,
        error:function(result){
            $.toast(result);
        },
        success:callback
    });
}

