#!/bin/bash

BASE_DIR="${0%/*}"

for i in "$@"; do
	[ "$i" = "conn/sasl.h" ] && continue
	[ "$i" = "conn/ssl.c"  ] && continue
	[ "$i" = "conn/ssl.h"  ] && continue

	iwyu \
		-D_ALL_SOURCE=1 \
		-D_GNU_SOURCE=1 \
		-D__EXTENSIONS__ \
		-DNCURSES_WIDECHAR \
		-DDEBUG \
		-I . \
		-I /usr/lib/gcc/x86_64-redhat-linux/9/include \
		-Xiwyu --pch_in_code \
		-Xiwyu --no_comments \
		-Xiwyu --mapping_file="$BASE_DIR/conn.imp" \
		"$i"
done

		# -DLOFF_T=long \
