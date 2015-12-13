<?php

require_once __DIR__ . '/../vendor/autoload.php';

if (getenv('REDIS_URL')) {
	$redis = new \Predis\Client([
		'host' => parse_url($_ENV['REDIS_URL'], PHP_URL_HOST),
		'port' => parse_url($_ENV['REDIS_URL'], PHP_URL_PORT),
		'password' => parse_url($_ENV['REDIS_URL'], PHP_URL_PASS),
	]);
}
