<?php
session_start(); include('config.php'); header('Content-Type: application/json');
if (!isset($_SESSION['uid'])) { http_response_code(401); echo json_encode(['message'=>'Please login to book a property.']); exit; }
$pid=(int)($_POST['pid'] ?? 0); $uid=(int)$_SESSION['uid'];
$stmt=mysqli_prepare($con,'SELECT price,status FROM property WHERE pid=?'); mysqli_stmt_bind_param($stmt,'i',$pid); mysqli_stmt_execute($stmt); $p=mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));
if (!$p || $p['status']==='booked') { http_response_code(404); echo json_encode(['message'=>'Property is unavailable.']); exit; }
if (strpos(RAZORPAY_KEY_ID,'replace')!==false || strpos(RAZORPAY_KEY_SECRET,'replace')!==false) { http_response_code(503); echo json_encode(['message'=>'Payment gateway is not configured. Add Razorpay test keys in config.php.']); exit; }
$amount=booking_amount($p['price'])*100;
$payload=json_encode(['amount'=>$amount,'currency'=>'INR','receipt'=>'prop_'.$pid.'_'.time(),'notes'=>['property_id'=>(string)$pid,'user_id'=>(string)$uid]]);
$ch=curl_init('https://api.razorpay.com/v1/orders');
curl_setopt_array($ch,[CURLOPT_POST=>true,CURLOPT_POSTFIELDS=>$payload,CURLOPT_HTTPHEADER=>['Content-Type: application/json'],CURLOPT_USERPWD=>RAZORPAY_KEY_ID.':'.RAZORPAY_KEY_SECRET,CURLOPT_RETURNTRANSFER=>true,CURLOPT_TIMEOUT=>30,CURLOPT_PROXY=>'']);
$body=curl_exec($ch); $curlError=curl_error($ch); $code=curl_getinfo($ch,CURLINFO_HTTP_CODE); curl_close($ch); $order=json_decode($body,true);
if ($code<200 || $code>=300 || empty($order['id'])) {
    $gatewayMessage = $curlError !== '' ? $curlError : (isset($order['error']['description']) ? $order['error']['description'] : 'No response received from Razorpay.');
    error_log('[Razorpay] Order creation failed. HTTP=' . $code . ', Error=' . $gatewayMessage . PHP_EOL, 3, __DIR__ . '/payment-debug.log');
    http_response_code(502); echo json_encode(['message'=>'Razorpay error: ' . $gatewayMessage]); exit;
}
$orderId=$order['id']; $status='created'; $stmt=mysqli_prepare($con,'INSERT INTO bookings (property_id,user_id,property_price,booking_amount,razorpay_order_id,payment_status) VALUES (?,?,?,?,?,?)'); mysqli_stmt_bind_param($stmt,'iiiiss',$pid,$uid,$p['price'],$amount,$orderId,$status); mysqli_stmt_execute($stmt);
echo json_encode(['key'=>RAZORPAY_KEY_ID,'order_id'=>$orderId,'amount'=>$amount]);
?>
