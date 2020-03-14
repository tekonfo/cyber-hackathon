<?php
require 'vendor/autoload.php';

$client = new Predis\Client();

// ハッシュを追加します
$client->hset('user_image', '1', 'Taro');
$client->hset('user_image', '2', 'ziro');

// 追加したハッシュを取得して表示します
$name = $client->hget('user_image', '3'); // "Taro" が返却される
$country = $client->hget('user_image', '2'); // "Japan" が返却される

// ハッシュを取得します
$man1 = $client->hgetall('user_image');
echo (key_exists('2', $man1));

// ハッシュの特定のキーを削除します
$client->hdel('man1', 'country');

// ハッシュを削除します
$client->del('man1');
