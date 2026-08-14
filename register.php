<?php 
include("config.php");
$error="";
$msg="";
if(isset($_REQUEST['reg']))
{
	$name=trim(isset($_POST['name']) ? $_POST['name'] : '');
	$email=trim(isset($_POST['email']) ? $_POST['email'] : '');
	$phone=trim(isset($_POST['phone']) ? $_POST['phone'] : '');
	$pass=isset($_POST['pass']) ? $_POST['pass'] : '';
	$utype=isset($_POST['utype']) ? $_POST['utype'] : 'user';
	$uploadError=isset($_FILES['uimage']['error']) ? $_FILES['uimage']['error'] : UPLOAD_ERR_NO_FILE;
	$uimage=($uploadError === UPLOAD_ERR_OK && isset($_FILES['uimage']['name'])) ? basename($_FILES['uimage']['name']) : '';
	$temp_name1=($uploadError === UPLOAD_ERR_OK && isset($_FILES['uimage']['tmp_name'])) ? $_FILES['uimage']['tmp_name'] : '';

	function register_debug($message) {
		error_log('[Register] ' . $message . PHP_EOL, 3, __DIR__ . '/register-debug.log');
	}
	register_debug('Submission received: name=' . ($name !== '' ? 'yes' : 'no') . ', email=' . ($email !== '' ? 'yes' : 'no') . ', phone=' . ($phone !== '' ? 'yes' : 'no') . ', image_upload_error=' . $uploadError . ', user_type=' . $utype);
	
	$stmt=mysqli_prepare($con, 'SELECT uid FROM user WHERE uemail=?');
	mysqli_stmt_bind_param($stmt, 's', $email);
	mysqli_stmt_execute($stmt);
	$num=mysqli_num_rows(mysqli_stmt_get_result($stmt));
	
	if($num == 1)
	{
		$error = "<p class='alert alert-warning'>Email Id already Exist</p> ";
	}
	else
	{
		
		if($name !== '' && filter_var($email, FILTER_VALIDATE_EMAIL) && $phone !== '' && $pass !== '' && $uimage !== '')
		{
			$pass=sha1($pass);
			$target='admin/user/' . $uimage;
			if (!move_uploaded_file($temp_name1, $target)) {
				register_debug('Upload move failed: target=' . $target);
				$error = "<p class='alert alert-warning'>Profile image upload failed. Please choose another image and try again.</p>";
			} else {
				$stmt=mysqli_prepare($con, 'INSERT INTO user (uname,uemail,uphone,upass,utype,uimage) VALUES (?,?,?,?,?,?)');
				mysqli_stmt_bind_param($stmt, 'ssssss', $name, $email, $phone, $pass, $utype, $uimage);
				$result=mysqli_stmt_execute($stmt);
				if($result){
					register_debug('Registration successful for email=' . $email);
				   $msg = "<p class='alert alert-success'>Register Successfully</p> ";
				} else {
					register_debug('Database insert failed: ' . mysqli_stmt_error($stmt));
				   $error = "<p class='alert alert-warning'>Register Not Successfully</p> ";
				}
			}
		}else{
			register_debug('Validation failed. Use a valid email, all fields and an image.');
			$error = "<p class='alert alert-warning'>Please Fill all the fields</p>";
		}
	}
	
}
?>
<!DOCTYPE html>
<html lang="en">
<!-- FOR MORE PROJECTS visit: codeastro.com -->
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Meta Tags -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" href="images/favicon.ico">

<!--	Fonts
	========================================================-->
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

<!--	Css Link
	========================================================-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/layerslider.css">
<link rel="stylesheet" type="text/css" href="css/color.css">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/flaticon/flaticon.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

<!--	Title
	=========================================================-->
<title>Real Estate PHP</title>
</head>
<body>

<!--	Page Loader
=============================================================
<div class="page-loader position-fixed z-index-9999 w-100 bg-white vh-100">
	<div class="d-flex justify-content-center y-middle position-relative">
	  <div class="spinner-border" role="status">
		<span class="sr-only">Loading...</span>
	  </div>
	</div>
</div>
--> 


<div id="page-wrapper">
    <div class="row"> 
        <!--	Header start  -->
		<?php include("include/header.php");?>
        <!--	Header end  --><!-- FOR MORE PROJECTS visit: codeastro.com -->
        
        <!--	Banner   --->
        <!-- <div class="banner-full-row page-banner" style="background-image:url('images/breadcromb.jpg');">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h2 class="page-name float-left text-white text-uppercase mt-1 mb-0"><b>Register</b></h2>
                    </div>
                    <div class="col-md-6">
                        <nav aria-label="breadcrumb" class="float-left float-md-right">
                            <ol class="breadcrumb bg-transparent m-0 p-0">
                                <li class="breadcrumb-item text-white"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Register</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div> -->
         <!--	Banner   --->
		 
		 
		 
        <div class="page-wrappers login-body full-row bg-gray">
            <div class="login-wrapper">
            	<div class="container">
                	<div class="loginbox">
                        <div class="login-right">
							<div class="login-right-wrap">
								<h1>Register</h1>
								<p class="account-subtitle">Access to our dashboard</p>
								<?php echo $error; ?><?php echo $msg; ?>
								<!-- Form -->
								<form id="register-form" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<input type="text"  name="name" class="form-control" placeholder="Your Name*" required>
									</div>
									<div class="form-group">
										<input type="email"  name="email" class="form-control" placeholder="Your Email*" required>
									</div>
									<div class="form-group">
										<input type="text"  name="phone" class="form-control" placeholder="Your Phone*" maxlength="10" required>
									</div>
									<div class="form-group">
										<input type="password" name="pass"  class="form-control" placeholder="Your Password*" required>
									</div>

									 <div class="form-check-inline">
									  <label class="form-check-label">
										<input type="radio" class="form-check-input" name="utype" value="user" checked>User
									  </label>
									</div><!-- FOR MORE PROJECTS visit: codeastro.com -->
									<div class="form-check-inline">
									  <label class="form-check-label">
										<input type="radio" class="form-check-input" name="utype" value="agent">Agent
									  </label>
									</div>
									<div class="form-check-inline disabled">
									  <label class="form-check-label">
										<input type="radio" class="form-check-input" name="utype" value="builder">Builder
									  </label>
									</div> 
									
									<div class="form-group">
										<label class="col-form-label"><b>User Image</b></label>
										<input class="form-control" name="uimage" type="file" accept="image/*" required>
									</div>
									
									<button class="btn btn-success" name="reg" value="Register" type="submit">Register</button>
									
								</form>
								
								<div class="login-or">
									<span class="or-line"></span>
									<span class="span-or">or</span>
								</div>
								
								<!-- Social Login -->
								<!-- <div class="social-login">
									<span>Register with</span>
									<a href="#" class="facebook"><i class="fab fa-facebook-f"></i></a>
									<a href="#" class="google"><i class="fab fa-google"></i></a>
									<a href="#" class="facebook"><i class="fab fa-twitter"></i></a>
									<a href="#" class="google"><i class="fab fa-instagram"></i></a>
								</div> -->
								<!-- /Social Login -->
								
								<div class="text-center dont-have">Already have an account? <a href="login.php">Login</a></div>
								
							</div><!-- FOR MORE PROJECTS visit: codeastro.com -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<!--	login  -->
        
        
        <!--	Footer   start-->
		<?php include("include/footer.php");?>
		<!--	Footer   start-->
        
        <!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
    </div>
</div>
<!-- Wrapper End --> 
<!-- FOR MORE PROJECTS visit: codeastro.com -->
<!--	Js Link
============================================================--> 
<script src="js/jquery.min.js"></script> 
<!--jQuery Layer Slider --> 
<script src="js/greensock.js"></script> 
<script src="js/layerslider.transitions.js"></script> 
<script src="js/layerslider.kreaturamedia.jquery.js"></script> 
<!--jQuery Layer Slider --> 
<script src="js/popper.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/owl.carousel.min.js"></script> 
<script src="js/tmpl.js"></script> 
<script src="js/jquery.dependClass-0.1.js"></script> 
<script src="js/draggable-0.1.js"></script> 
<script src="js/jquery.slider.js"></script> 
<script src="js/wow.js"></script> 
<script src="js/custom.js"></script>
<script>
document.getElementById('register-form').addEventListener('submit', function () {
    var form = this;
    console.info('[Register] Submitting form', {
        nameFilled: form.name.value.trim() !== '',
        emailFilled: form.email.value.trim() !== '',
        phoneFilled: form.phone.value.trim() !== '',
        imageSelected: form.uimage.files.length > 0,
        userType: form.utype.value
    });
});
</script>
</body>
</html>
