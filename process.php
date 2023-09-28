<?php
session_start();

if (isset($_POST['submit'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    
    if (!empty($name) && !empty($email)) {
        $_SESSION['message'] = "Form is submitted successfully!";
        header('Location: index.php');
    } else {
        $_SESSION['message'] = "Please fill in all fields!";
        header('Location: index.php');
    }
}
