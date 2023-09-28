<?php
// Enable Error Reporting
error_reporting(E_ALL);
ini_set('display_errors', '1');
ini_set('log_errors', '1'); // Ensures that errors are logged

// Log incoming requests with their headers
error_log("Request received: " . $_SERVER['REQUEST_METHOD'] . " " . $_SERVER['REQUEST_URI']);
foreach (getallheaders() as $name => $value) {
    error_log("$name: $value");
}

// Set the response header
header('Content-Type: application/json');

// Respond with a simple JSON message
echo json_encode(['message' => 'Hello, World!']);
?>
