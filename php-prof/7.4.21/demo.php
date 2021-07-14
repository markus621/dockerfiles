<?php

xhprof_enable(XHPROF_FLAGS_CPU | XHPROF_FLAGS_MEMORY);

function demo_test()
{
    for ($i = 0; $i <= 100; $i++) {
        random_bytes(20);
    }
}
demo_test();

$xhprof_data = xhprof_disable();

$XHPROF_ROOT = '/tools/xhprof/';
include_once $XHPROF_ROOT.'/xhprof_lib/utils/xhprof_lib.php';
include_once $XHPROF_ROOT.'/xhprof_lib/utils/xhprof_runs.php';

$xhprof_runs = new \XHProfRuns_Default();
$run_id      = $xhprof_runs->save_run($xhprof_data, 'xhprof_testing');

header("Location: http://localhost:9002/index.php?run={$run_id}&source=xhprof_testing");
echo "http://localhost:9002/index.php?run={$run_id}&source=xhprof_testing";
