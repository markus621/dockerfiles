# dockerfiles

https://hub.docker.com/u/markus621

## angular-cli

install:

```bash
docker pull markus621/angular-cli
```


## php-prof

### install:

```bash
docker pull markus621/php-prof:0.742.0
```

### run:

```bash
docker run --rm --name phpprof -it -v /local/dir:/var/www -p 9000-9003:9000-9003 markus621/php-prof:0.742.0
```

### ports:

* 9000 - php-fpm
* 9001 - xdebug
* 9002 - web-server xhprof
* 9003 - web-server phpinfo

### example:

test: http://localhost:9002/demo.php

```php
<?php

xhprof_enable(XHPROF_FLAGS_CPU + XHPROF_FLAGS_MEMORY);

function demo_test()
{
    for ($i = 0; $i <= 100; $i++) {
        random_bytes(20);
    }
}
demo_test();

$xhprof_data = xhprof_disable();

$XHPROF_ROOT = '/tools/xhprof/';
include_once $XHPROF_ROOT . '/xhprof_lib/utils/xhprof_lib.php';
include_once $XHPROF_ROOT . '/xhprof_lib/utils/xhprof_runs.php';

$xhprof_runs = new \XHProfRuns_Default();
$run_id = $xhprof_runs->save_run($xhprof_data, 'xhprof_testing');

echo "http://localhost:9002/index.php?run={$run_id}&source=xhprof_testing";
?>
```
