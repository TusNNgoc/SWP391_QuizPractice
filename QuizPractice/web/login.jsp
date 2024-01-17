<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Bootstrap 4 Admin &amp; Dashboard Template">
	<meta name="author" content="Bootlab">

	<title>Final Exam</title>

	<link rel="preconnect" href="//fonts.gstatic.com/" crossorigin="">
	<link href="classic.css" rel="stylesheet">

	<!-- Common -->
	<!-- <script src="../../js/settings.js"></script>
	<script src="../../js/app.js"></script> -->

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-120946860-6"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() { dataLayer.push(arguments); }
		gtag('js', new Date());

		gtag('config', 'UA-120946860-6');
	</script>
</head>

<body>
	<main class="main d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row h-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">
						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<div class="text-center">
										<img src="./img/72211215-quiz-logo-flat-icon-question-competition-questionnaire-concept-vector-background.jpg" alt="avatar"
											class="img-fluid rounded-circle" width="132" height="132">
									</div>
									<form id="login-form">
										<div class="form-group">
											<label class="form-label required">Username</label>
											<input class="form-control form-control-lg" type="text"
												placeholder="Enter your username" name="login-validation-username"
												id="login-validation-username-input">
										</div>
										<div class="form-group">
											<label class="form-label required">Password</label>
											<input class="form-control form-control-lg" type="password"
												placeholder="Enter your password" autocomplete="on"
												name="login-validation-password" id="login-validation-password-input">
											<small>
												<a href="./resetPassword/forgot-password.html">Forgot password?</a>
											</small>
										</div>
										<div>
											<input type="checkbox" class="custom-checkbox" id="login-remember-me-input">
											<label class="text-small ml-1">Remember me next time</label>
										</div>
										<div class="row">
											<div class="text-center mt-3 col-lg-6">
												<button type="submit" class="btn btn-lg btn-primary">Login</button>
											</div>
											<div class="text-center mt-3 col-lg-6">
												<button type="button" class="btn btn-lg btn-primary"
													onclick="redirectToAccountRegistrationPage()">
													Register
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- BEGIN Blocked Account modal -->
	<div class="modal fade" id="blocked-account-modal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form id="blocked-account-form">
					<div class="modal-header">
						<h5 class="modal-title">Blocked Account Modal</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body m-3">
						<p>Your account is inactive, Please check your email to active account or resend active account
							email.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
						<button id="resend-active-account-email-btn" onclick="resendActiveAccountEmailToServer()"
							type="submit" class="btn btn-primary">Resend Email</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- END create modal -->

	<!-- import common -->
	<!-- <script src="../../js/constant.js"></script>
	<script src="../../js/common.js"></script>
	<script src="../../js/storage/storage.js"></script> -->

	<!-- import API -->
	<!-- <script src="../../api/authApi.js"></script> -->

	<!-- import validator -->
	<!-- <script src="../../js/validator/loginValidator.js"></script> -->

	<!-- import page -->
	<!-- <script src="../../js/pages/auth/login.js"></script> -->

</body>

</html>