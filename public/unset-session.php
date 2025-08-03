<?php
session_start();
unset($_SESSION['asd']);
http_response_code(204); // Keine Antwort nötig
