<?php

$con = mysqli_connect("localhost","root","","realestatephp");
	if (mysqli_connect_errno())
	{
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}

/* Razorpay live/test credentials. Keep the secret key on the server only. */
define('RAZORPAY_KEY_ID', 'rzp_test_TO0Cd1yl8YT0V8');
define('RAZORPAY_KEY_SECRET', 'Qd67iKfktVslMBFig3HzWl91');
define('BOOKING_PERCENTAGE', 0.25);
define('BOOKING_MAX_AMOUNT', 100000);

function booking_amount($propertyPrice) {
	return min((int) round($propertyPrice * BOOKING_PERCENTAGE / 100), BOOKING_MAX_AMOUNT);
}
?>
