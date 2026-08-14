<?php
session_start();
include('config.php');
if (!isset($_SESSION['uid'])) { header('Location: login.php?redirect=mybookings.php'); exit; }

$uid=(int)$_SESSION['uid'];
$stmt=mysqli_prepare($con,'SELECT b.*,p.title,p.city,p.state,p.location,p.pimage FROM bookings b JOIN property p ON p.pid=b.property_id WHERE b.user_id=? ORDER BY b.created_at DESC');
mysqli_stmt_bind_param($stmt,'i',$uid);
mysqli_stmt_execute($stmt);
$bookings=mysqli_stmt_get_result($stmt);
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>My Orders</title>
    <style>
        .orders-page { padding-top: 155px; padding-bottom: 70px; background: #f7f8fa; min-height: 100vh; }
        .order-card { border: 0; box-shadow: 0 3px 16px rgba(0,0,0,.08); overflow: hidden; height: 100%; transition: transform .2s ease, box-shadow .2s ease; }
        .order-card:hover { transform: translateY(-4px); box-shadow: 0 10px 24px rgba(0,0,0,.13); }
        .order-card img { height: 190px; width: 100%; object-fit: cover; }
        .order-meta { color: #68717a; font-size: 13px; }
        .order-value { font-size: 18px; font-weight: 700; color: #1d9b45; }
        .status-paid { background: #d9f5e1; color: #19733a; }
        .status-created { background: #fff0c6; color: #9a6500; }
        .empty-orders { padding: 55px 20px; text-align: center; background: #fff; border-radius: 4px; box-shadow: 0 3px 16px rgba(0,0,0,.06); }
    </style>
</head>
<body>
<?php include('include/header.php'); ?>
<main class="orders-page">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="text-secondary mb-1">My Orders</h2>
                <p class="text-muted mb-0">Track your property booking token payments.</p>
            </div>
            <a class="btn btn-success" href="property.php">Browse Properties</a>
        </div>

        <?php if(mysqli_num_rows($bookings)===0) { ?>
            <div class="empty-orders">
                <h4 class="text-secondary">No orders yet</h4>
                <p class="text-muted">Your property booking orders will appear here after payment is initiated.</p>
                <a class="btn btn-success" href="property.php">Explore Properties</a>
            </div>
        <?php } else { ?>
            <div class="row">
            <?php while($b=mysqli_fetch_assoc($bookings)) {
                $isPaid=$b['payment_status']==='paid';
                $statusText=$isPaid ? 'Token Paid' : 'Payment Pending';
            ?>
                <div class="col-md-6 col-lg-4 mb-4">
                    <article class="card order-card">
                        <img src="admin/property/<?php echo htmlspecialchars($b['pimage']); ?>" alt="<?php echo htmlspecialchars($b['title']); ?>">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <span class="badge <?php echo $isPaid ? 'status-paid' : 'status-created'; ?> px-2 py-2"><?php echo $statusText; ?></span>
                                <small class="text-muted">Order #<?php echo (int)$b['booking_id']; ?></small>
                            </div>
                            <h5 class="text-secondary mb-1"><?php echo htmlspecialchars($b['title']); ?></h5>
                            <p class="order-meta mb-3"><i class="fas fa-map-marker-alt text-success"></i> <?php echo htmlspecialchars($b['location'].', '.$b['city']); ?></p>
                            <div class="border-top pt-3">
                                <div class="d-flex justify-content-between mb-2"><span class="order-meta">Property price</span><strong>&#8377;<?php echo number_format($b['property_price']); ?></strong></div>
                                <div class="d-flex justify-content-between mb-3"><span class="order-meta">Token amount</span><span class="order-value">&#8377;<?php echo number_format($b['booking_amount']/100); ?></span></div>
                            </div>
                            <p class="order-meta mb-3">Placed on <?php echo date('d M Y', strtotime($b['created_at'])); ?><?php if($isPaid && $b['razorpay_payment_id']) { ?><br>Payment ID: <?php echo htmlspecialchars($b['razorpay_payment_id']); ?><?php } ?></p>
                            <a class="btn btn-outline-success btn-sm" href="propertydetail.php?pid=<?php echo (int)$b['property_id']; ?>">View Property</a>
                            <?php if(!$isPaid) { ?><a class="btn btn-success btn-sm float-right" href="booking.php?pid=<?php echo (int)$b['property_id']; ?>">Complete Payment</a><?php } ?>
                        </div>
                    </article>
                </div>
            <?php } ?>
            </div>
        <?php } ?>
    </div>
</main>
</body>
</html>
