<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ajax Upload and Resize with jQuery and PHP - Demo</title>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery.form.min.js"></script>

<script type="text/javascript">
$(document).ready(function() { 

	var progressbox     = $('#proggif');
	var progressbar     = $('#progressbar');
	var statustxt       = $('#statustxt');
	var completed       = '0%';
	
	var options = { 
			target:   '#output',   // target element(s) to be updated with server response 
			beforeSubmit:  beforeSubmit,  // pre-submit callback 
			uploadProgress: OnProgress,
			success:       afterSuccess,  // post-submit callback 
			resetForm: true        // reset the form after successful submit 
		}; 
		
	 $('#MyUploadForm').submit(function() { 
             
			$(this).ajaxSubmit(options);  			
			// return false to prevent standard browser submit and page navigation
                        
                        return true;
			 
		});
	
//when upload progresses	
function OnProgress(event, position, total, percentComplete)
{
	//Progress bar
        progressbar.position(position);
	progressbar.width(percentComplete + '%'); //update progressbar percent complete
	statustxt.html(percentComplete + '%'); //update status text
	if(percentComplete>50)
		{
			statustxt.css('color','#fff'); //change status text to white after 50%
		}
}

//after succesful upload
function afterSuccess()
{
        progressbox.hide();
	$('#submit-btn').hide(); //hide submit button
	$('#loading-img').hide(); //hide submit button
        $('#imageInput').hide();
        $('#uploaded').fadeIn(800);
        
        

}

//function to check file size before uploading.
function beforeSubmit(){
    //check whether browser fully supports all File API
   if (window.File && window.FileReader && window.FileList && window.Blob)
	{

		if( !$('#imageInput').val()) //check empty input filed
		{
			$("#output").html("Zəhmət olmasa şəkil seçin");
			return false;
		}
		
		var fsize = $('#imageInput')[0].files[0].size; //get file size
		var ftype = $('#imageInput')[0].files[0].type; // get file type
		
		//allow only valid image file types 
		switch(ftype)
        {
            case 'image/png': case 'image/gif': case 'image/jpeg': case 'image/pjpeg':
                break;
            default:
                $("#output").html("<b>"+ftype+"</b> Zəhmət olmasa icazə verilən şəkil formatlarından birini seçin!");
				return false;
        }
		
		//Allowed file size is less than 1 MB (1048576)
		if(fsize>6291456) 
		{
			$("#output").html("<b>"+bytesToSize(fsize) +"</b> Faylın həcmi çox böyükdür! <br />");
			return false;
		}
		
		//Progress bar
		progressbox.show(); //show progressbar
		progressbar.width(completed); //initial value 0% of progressbar
		statustxt.html(completed); //set status text
		statustxt.css('color','#000'); //initial color of status text

				
		$('#submit-btn').hide(); //hide submit button
		$('#loading-img').show(); //hide submit button
                
		$("#output").html("");  
	}
	else
	{
		//Output error to older unsupported browsers that doesn't support HTML5 File API
		$("#output").html("Zəhmət olmasa brouzerinizi yeniləyin");
		return false;
	}
}

//function to format bites bit.ly/19yoIPO
function bytesToSize(bytes) {
   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
   if (bytes === 0) return '0 Bytes';
   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
}

}); 

</script>
<style>
    .link:visited{
            color: #376f2a;
            font-weight: 600;
        }
        .link{
            color: #376f2a;
            font-weight: 600;
         }
         .link:hover{
            text-decoration:underline;
            color: #376f2a;
            font-weight: 600;
         }
</style>
<link href="style/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="upload-wrapper" style="height: 130px " >
<div align="center">
<h3>Profil şəklini seçin</h3>
<span class="">İcazə verilən formatlar: Jpeg, Jpg, Png və Gif. | Limit 6 MB</span>
<form action="User_photo" onSubmit="return false;" method="post" enctype="multipart/form-data" id="MyUploadForm">
    <input name="ImageFile" id="imageInput" type="file" />
<input type="submit"  id="submit-btn" value="Yüklə" />
<img src="images/ajax-loader.gif" id="loading-img" style="display:none;" alt="Zəhmət olmasa gözləyin"/>
</form>
<div id="proggif" style="margin-top: 5px; display: none" ><img height="25px" width="45%" src="images/progress1.GIF" /></div>
<div id="uploaded" style="display: none"><img src="images/right.png" /><a class="link" href="account.jsp">Hesaba keç</a></div>
<div id="output"></div>
</div>
</div>

</body>
</html>