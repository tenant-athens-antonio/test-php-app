<?php
// Check if headers are sent by the server
if (!function_exists('getallheaders')) {
    function getallheaders() {
        $headers = [];
        foreach ($_SERVER as $name => $value) {
            if (substr($name, 0, 5) == 'HTTP_') {
                $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
            }
        }
        return $headers;
    }
}

// Get all headers
$headers = getallheaders();

// Output headers
header('Content-Type: application/json');
echo json_encode($headers, JSON_PRETTY_PRINT);
