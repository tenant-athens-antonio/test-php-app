<?php
session_start();

function writeLog($message) {
    // Format the message with a timestamp
    $formattedMessage = date('Y-m-d H:i:s') . ' - ' . $message;
    
    // Write the message to stdout
    error_log($formattedMessage, 4);
}

if (isset($_POST['submit'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    
    writeLog("Form submitted with name=$name and email=$email");
    
    if (!empty($name) && !empty($email)) {
        $_SESSION['message'] = "Form is submitted successfully!";
        writeLog("Form is valid, redirecting to index.php");
        header('Location: index.php');
    } else {
        $_SESSION['message'] = "Please fill in all fields!";
        writeLog("Form is invalid, redirecting to index.php");
        header('Location: index.php');
    }
}
