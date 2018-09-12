<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>人脸比对</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="http://g.alicdn.com/sui/sui3/0.0.18/css/sui.min.css">
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sui/sui3/0.0.18/js/sui.min.js"></script>
    <script src="static/js/tool.js" type="text/javascript"></script>
    <script type="text/javascript">
        function faceCompare() {
            var params = formToObject("faceCompareForm");
            $.axs("/faceCompare", params, function(data){
                if(printError(data)){
                    $("#resultPane").show();
                    $("#result").html(data.data);
                }
            });
        }
    </script>
</head>
<body style="background: #F8F8F8; text-align: center;padding: 20px;margin-top: 40px;">
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: left">上传图片</h3>
                </div>
                <div class="panel-body" style="text-align: left">
                    <form  action="upload" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="exampleInputFile">图片1</label>
                            <input type="file" id="exampleInputFile" name="file">
                        </div>
                        <#--<div class="form-group">-->
                            <#--<label for="exampleInputFile">图片2</label>-->
                            <#--<input type="file" id="exampleInputFile" name="file">-->
                        <#--</div>-->
                        <button type="submit" class="btn btn-info btn-xl">上 传</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <form id="faceCompareForm" method="post">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: left">图片1</h3>
                </div>
                <div class="panel-body" style="text-align: center">
                    <input type="hidden" name="source" value="static/images/my1.jpg"/>
                    <img src="static/images/my1.jpg"  alt="" width="400" height="300"/>
            </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: left">图片2</h3>
                </div>
                <div class="panel-body" style="text-align: center">
                    <input type="hidden" name="target" value="static/images/my2.jpg"/>
                    <img src="static/images/my2.jpg"   alt=""  width="400" height="300"/>
                </div>
            </div>

        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-success" id="resultPane" style="display: none">
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: left">比对结果</h3>
                </div>
                <div class="panel-body" style="text-align: center">
                    <span id="result"></span>
                </div>
            </div>
        </div>
        <br>
        <button type="button" onclick="faceCompare()" class="btn btn-success btn-xl">开始比对</button>
    </div>
    </form>
</div>

</body>
</html>