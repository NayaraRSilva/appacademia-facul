<?php
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT");
    header("Access-Control-Allow-Headers: Content-Type, Authorization");
    exit;
}


// Configurações do banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "academia_db";

// Cria a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Endpoint para o cadastro de usuário
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
    $stmt->bind_param("ss", $username, $password);

    if ($stmt->execute()) {
        echo json_encode(["message" => "Usuário cadastrado com sucesso"]);
    } else {
        echo json_encode(["message" => "Falha no cadastro do usuário"]);
    }

    $stmt->close();
}

// Endpoint para o login
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login_username']) && isset($_POST['login_password'])) {
    $loginUsername = $_POST['login_username'];
    $loginPassword = $_POST['login_password'];

    $stmt = $conn->prepare("SELECT username, password FROM users WHERE username = ?");
    $stmt->bind_param("s", $loginUsername);
    $stmt->execute();
    $stmt->bind_result($resultUsername, $resultPassword);

    if ($stmt->fetch() && password_verify($loginPassword, $resultPassword)) {
        echo json_encode(["message" => "Login bem-sucedido"]);
    } else {
        echo json_encode(["message" => "Falha no login"]);
    }

    $stmt->close();
}

$conn->close();
?>  