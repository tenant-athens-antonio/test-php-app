<?php 
require_once 'process.php'; 

function writeLog($message) {
    $formattedMessage = date('Y-m-d H:i:s') . ' - ' . $message;
    error_log($formattedMessage, 4);
}

// Log the incoming request
writeLog("Incoming request: " . $_SERVER['REQUEST_METHOD'] . " " . $_SERVER['REQUEST_URI']);
$headers = getallheaders();
writeLog("Headers: " . json_encode($headers));

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple PHP App</title>
</head>
<body>
    <form action="process.php" method="POST">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>
        <br>
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>
        <br>
        <button type="submit" name="submit">Submit</button>
    </form>
    
    <?php if (isset($_SESSION['message'])): ?>
    <div>
        <?php
            echo $_SESSION['message'];
            unset($_SESSION['message']);
        ?>
    </div>
    <?php endif; ?>
</body>
</html>
