<?php

// Strict mode
declare(strict_types = 1);

?>

<title>docker-lnmp</title>

<?php

// Declare function
function say(string $world) : string {
    return '<center>hello ' . $world . '</center>';
}

echo say('docker-lnmp, by leon &lt;jiangxilee@gmail.com&gt;');

phpinfo();
?>