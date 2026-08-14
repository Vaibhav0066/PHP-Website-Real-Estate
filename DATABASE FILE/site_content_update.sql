-- Apply once to replace the original demo About content.
UPDATE `about` SET
`title`='About Vaibhav Real Estate',
`content`='<p>Vaibhav Real Estate is a modern property platform built to make buying and reserving a home simpler for everyone.</p><p>We bring verified residential listings from growing Indian cities together with transparent prices, detailed property information and trusted agent support.</p><p>Browse homes, compare your options and reserve an available property online with a secure Razorpay token payment. Your order history remains available in My Orders after login.</p><h4>Why choose us?</h4><ul><li>Indian property listings with clear pricing</li><li>Easy search by city, type and sale status</li><li>Secure online booking and payment verification</li><li>Helpful agents and a simple customer journey</li></ul>'
WHERE `id`=10;
