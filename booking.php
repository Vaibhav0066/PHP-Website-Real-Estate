<?php
ini_set('session.cache_limiter','public');
session_cache_limiter(false);
session_start();
include('config.php');
if (!isset($_SESSION['uid'])) { header('Location: login.php?redirect=' . urlencode('booking.php?pid=' . (int)($_GET['pid'] ?? 0))); exit; }
$pid = (int)($_GET['pid'] ?? 0);
$stmt = mysqli_prepare($con, 'SELECT pid,title,price,location,city,state,pimage,status FROM property WHERE pid = ?');
mysqli_stmt_bind_param($stmt, 'i', $pid); mysqli_stmt_execute($stmt);
$property = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));
if (!$property || $property['status'] === 'booked') { http_response_code(404); exit('This property is not available for booking.'); }
$bookingAmount = booking_amount($property['price']);
?>
<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><link rel="stylesheet" href="css/bootstrap.min.css"><link rel="stylesheet" href="css/style.css"><title>Confirm Booking</title></head>
<body><div class="container py-5"><div class="row justify-content-center"><div class="col-md-8"><a href="propertydetail.php?pid=<?php echo $pid; ?>">&larr; Back to property</a><div class="card mt-3"><div class="card-body p-4"><h3 class="text-secondary">Confirm your booking</h3><hr><div class="row"><div class="col-md-4"><img class="img-fluid" src="admin/property/<?php echo htmlspecialchars($property['pimage']); ?>" alt="Property"></div><div class="col-md-8"><h4><?php echo htmlspecialchars($property['title']); ?></h4><p><?php echo htmlspecialchars($property['location'] . ', ' . $property['city'] . ', ' . $property['state']); ?></p><p class="mb-1">Property price: <strong>&#8377;<?php echo number_format($property['price']); ?></strong></p><p>Booking amount (<?php echo BOOKING_PERCENTAGE; ?>%, maximum &#8377;<?php echo number_format(BOOKING_MAX_AMOUNT); ?>): <strong class="text-success">&#8377;<?php echo number_format($bookingAmount); ?></strong></p></div></div><button id="pay-button" class="btn btn-success btn-lg btn-block">Pay booking amount securely</button><p id="payment-message" class="small text-muted mt-3 mb-0">You must complete payment to reserve this property.</p></div></div></div></div></div>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script><script>
document.getElementById('pay-button').onclick = async function () {
 const button=this, message=document.getElementById('payment-message'); button.disabled=true; message.textContent='Creating secure payment order...';
 try { const response=await fetch('create_razorpay_order.php',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded'},body:'pid=<?php echo $pid; ?>'}); const data=await response.json(); if(!response.ok) throw new Error(data.message||'Unable to start payment');
  new Razorpay({key:data.key,amount:data.amount,currency:'INR',name:'Real Estate',description:'Property booking',order_id:data.order_id,handler:function(r){ const f=document.createElement('form');f.method='POST';f.action='payment_verify.php'; ['razorpay_payment_id','razorpay_order_id','razorpay_signature'].forEach(k=>{let i=document.createElement('input');i.type='hidden';i.name=k;i.value=r[k];f.appendChild(i)});document.body.appendChild(f);f.submit();},theme:{color:'#28a745'}}).open();
 } catch(e) { message.textContent=e.message; button.disabled=false; } };
</script></body></html>
