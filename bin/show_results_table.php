<?php

require __DIR__ . '/../libs/parse_results.php';
require __DIR__ . '/../libs/build_table.php';
require __DIR__ . '/../libs/redis.php';

$results = parse_results(__DIR__ . '/../output/results.hello_world.log');

if (getenv('REDIS_URL')) {
	$redis->set('results', file_get_contents(__DIR__ . '/../output/results.hello_world.log'));
	$redis->set('urls', file_get_contents(__DIR__ . '/../output/urls.log'));
}

echo build_table($results);
