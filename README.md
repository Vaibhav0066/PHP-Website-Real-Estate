# Real Estate PHP

A PHP and MySQL real-estate listing application. Users can browse properties, register, manage listings, and make property booking payments. It includes a separate admin panel for managing users, listings, cities, feedback, contacts, and site content.

## Requirements

- [XAMPP](https://www.apachefriends.org/) with Apache, MySQL, PHP, and phpMyAdmin
- PHP 7.4 or later recommended
- A modern web browser
- A Razorpay test account and API keys only when testing online bookings

## Install and Run with XAMPP

1. Install XAMPP and open the **XAMPP Control Panel**.
2. Start the **Apache** and **MySQL** services.
3. Place this project in the XAMPP web root:

   ```text
   C:\xampp\htdocs\Real-Estate
   ```

4. Open phpMyAdmin at [http://localhost/phpmyadmin](http://localhost/phpmyadmin).
5. Create a database named `realestatephp` with collation `utf8mb4_general_ci`.
6. Select the `realestatephp` database, choose **Import**, and import:

   ```text
   DATABASE FILE/realestatephp.sql
   ```

7. Confirm the database settings in [config.php](config.php). The default XAMPP configuration is:

   ```php
   mysqli_connect("localhost", "root", "", "realestatephp");
   ```

   If your MySQL `root` account has a password, update the third value in both [config.php](config.php) and [admin/config.php](admin/config.php).

8. Open the application:

   ```text
   http://localhost/Real-Estate/
   ```

   Admin panel:

   ```text
   http://localhost/Real-Estate/admin/
   ```



## Razorpay Booking Setup

Online property booking uses Razorpay. To enable it:

1. Create Razorpay **test** API keys from the Razorpay Dashboard.
2. In [config.php](config.php), set `RAZORPAY_KEY_ID` and `RAZORPAY_KEY_SECRET` to your own keys.
3. Ensure PHP cURL is enabled in XAMPP (`extension=curl` in `php.ini`), then restart Apache.

Do not commit real Razorpay keys. Use test keys locally and store production keys outside version control.

## Common Problems

| Problem | Fix |
| --- | --- |
| `Failed to connect to MySQL` | Start MySQL in XAMPP and verify the host, username, password, and database name in both config files. |
| `404 Not Found` | Confirm the folder is `C:\xampp\htdocs\Real-Estate` and use `http://localhost/Real-Estate/`. |
| Tables are missing | Re-import `DATABASE FILE/realestatephp.sql` into the `realestatephp` database. |
| Razorpay booking fails | Add valid test keys and enable the PHP cURL extension, then restart Apache. |

## Project Layout

```text
admin/          Admin dashboard and management pages
include/        Shared header and footer templates
DATABASE FILE/  MySQL database export
images/         Site images and uploaded media
config.php      Application database and Razorpay configuration
index.php       Application home page
```

## Security Note

This repository is designed for local development and learning. Before production use, move database and payment credentials to environment-specific configuration, rotate any exposed keys, use a non-root database user, and review authentication, validation, and error handling.
