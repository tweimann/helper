#!/bin/bash

echo "  1 GB =   1024 MB =  1048576 KB =  1073741824 B"
echo "  2 GB =   2048 MB =  2097152 KB =  2147483648 B"
echo "  4 GB =   4096 MB =  4194304 KB =  4294967296 B"
echo "  6 GB =   6144 MB =  6291456 KB =  6442450944 B"
echo "  8 GB =   8192 MB =  8388608 KB =  8589934592 B"
echo " 12 GB =  12288 MB = 12582912 KB = 12884901888 B"
echo " 16 GB =  16384 MB = 16777216 KB = 17179869184 B"
echo " 24 GB =  24576 MB = 25165824 KB = 25769803776 B"
echo " 32 GB =  32768 MB = 33554432 KB = 34359738368 B"
echo " 64 GB =  65536 MB"
echo " 96 GB =  98304 MB"
echo "128 GB = 131072 MB"

echo "PLEASE ENTER RAM IN GB"; read INPUT; echo $(expr $INPUT \* 1024)
