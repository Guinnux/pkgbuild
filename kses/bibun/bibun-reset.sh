#!/bin/sh

# Restart the bibund service if it is running.
if systemctl is-active bibund; then
	systemctl restart bibund
fi
