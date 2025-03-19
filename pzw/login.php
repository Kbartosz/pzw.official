<?php
// include 'config.php';

// if ($_SERVER["REQUEST_METHOD"] === "POST") {
//     $email = trim($_POST['email']);
//     $haslo = trim($_POST['password']);

//     // Sprawdzenie poprawności danych
//     try {
//         $stmt = $conn->prepare("SELECT * FROM pacjent WHERE mail = ?");
//         $stmt->execute([$email]);
//         $user = $stmt->fetch(PDO::FETCH_ASSOC);

//         if ($user && password_verify($haslo, $user['haslo'])) {
//             session_start();
//             $_SESSION['user'] = $user['imie'] . " " . $user['nazwisko'];
//             echo "Zalogowano pomyślnie!";
//         } else {
//             echo "Nieprawidłowy email lub hasło.";
//         }
//     } catch (PDOException $e) {
//         die("Błąd bazy danych: " . $e->getMessage());
//     }
// }



session_start();
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = trim($_POST['email']);
    $haslo = trim($_POST['password']);

    // Sprawdzenie, czy użytkownik istnieje w bazie
    $stmt = $conn->prepare("SELECT imie, nazwisko, haslo FROM czlonkowie WHERE mail = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result(); 

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($imie, $nazwisko, $hashedPassword);
        $stmt->fetch();

        if (password_verify($haslo, $hashedPassword)) {
            $_SESSION['user'] = $imie . " " . $nazwisko;
            header("Location: index.html"); // Przekierowanie na stronę główną po zalogowaniu
            exit();
        } else {
            echo "❌ Nieprawidłowe hasło.";
        }
    } else {
        echo "❌ Nie znaleziono użytkownika z tym adresem e-mail.";
    }

    $stmt->close();
}
?>
