#!/usr/bin/env bash

xprop -name $1 -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $(printf 0x%x $((0xffffffff * $2 / 100)))
