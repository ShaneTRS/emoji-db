#!/bin/sh
sed -i -E 's/alt=":([^:]+):" src="([^"]+)"/\n{"name": "\1","url": "\2"},\n/g' $1
grep '{"name": "' $1>$1.tmp
split -l30 $1.tmp
sed -i '1i{"name": "Emoji","author": "Shane","emotes": [' x*
sed -i '$ s/.$/]}/' x*
rm $1.tmp
