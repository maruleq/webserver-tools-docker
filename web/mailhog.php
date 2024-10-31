<?php
$to = "test@mailhog.local";
$subject = "Wiadomość testowa - MailHog";
$body = "Wiadomość testowa";
$headers = "From: webserwer@local" . "\r\n";
mail($to,$subject,$body,$headers);
?>