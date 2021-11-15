
# disable Touchscreen
TouchscreenID=$( xinput | grep "ELAN Touchscreen" | sed 's/.*=//' | sed 's/\t.*//' )
[ -z "$TouchscreenID" ] && xinput disable $TouchscreenID
