#!/bin/sh

GNXIO=/usr/bin/gnxio

. /usr/share/kses/hwinit/functions

gnxio_toggle LED_GSM_RED high

gnxio_toggle LED_GSM_GREEN low
