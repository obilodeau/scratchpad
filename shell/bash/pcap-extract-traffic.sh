#!/bin/bash
#
# Olivier Bilodeau <bilodeau@eset.com>
# Copyright (C) 2015 ESET
# BSD Licensed
# https://github.com/eset/malware-research/blob/master/moose/pcap-extract-traffic.sh
PATH=/usr/bin:/bin

TYPE=$1
PCAP=$2

errcho() { echo "$@" 1>&2; }

if [ "z$PCAP" == "z" ] || [ "z$TYPE" == "z" ]; then
	errcho Missing arguments.
	errcho Please read script to understand them
	exit 1
fi

case "$TYPE" in
	cnc1-request)
		# requests sent to C&C #1
		FILTER="ip.dst_host == 77.247.177.36 and tcp.dstport == 81 and data"
		FIELDS="-e tcp.stream -e frame.time_relative -e data"
		;;

	cnc1-response)
		# replies from C&C #1
		FILTER="ip.src_host == 77.247.177.36 and tcp.srcport == 81 and data"
		FIELDS="-e tcp.stream -e frame.time_relative -e data"
		;;

	cnc2)
		# C&C 2 related
		FILTER="ip.host == 93.190.140.221 and tcp.port == 80 and data"
		FIELDS="-e tcp.stream -e frame.time_relative -e data"
		;;

	cnc3-request)
		# requests from C&C 3
		FILTER="(ip.dst_host == 85.159.237.107 or ip.dst_host ==  85.159.237.108) and tcp.dstport == 81 and data"
		FIELDS="-e tcp.stream -e frame.time_relative -e data"
		;;

	cnc3-response)
		# responses from C&C 3
		FILTER="(ip.src_host == 85.159.237.107 or ip.src_host ==  85.159.237.108) and tcp.srcport == 81 and data"
		FIELDS="-e tcp.stream -e frame.time_relative -e data"
		;;

	telnet-hosts)
		# incoming telnet traffic (means we were able to exchange data)
		FILTER="tcp.srcport == 23 and telnet.data"
		FIELDS="-e frame.time_relative -e ip.src_host"
		;;

	*)
		errcho "This type of data hasn't been defined"
		errcho Please read script to understand arguments
		exit 2
		;;
esac

tshark -2 -R "$FILTER" -T fields $FIELDS -r $PCAP
