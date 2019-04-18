<?php

// Strict mode
declare(strict_types = 1);

?>

<title>DOCKER-L.N.M.P</title>

<?php

// Declare function
function say(string $world) : string {
    return '<h3 style="text-align: center;">hello ' . $world . '</h3>';
}

echo say('docker-lnmp, by leon &lt;jiangxilee@gmail.com&gt;');

phpinfo();