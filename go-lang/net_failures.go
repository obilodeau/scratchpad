package main

// Olivier Bilodeau <obilodeau@gosecure.ca>

import (
		"fmt"
		"net"
		"strings"
		"time"
		)

func main() {

	//conn, err := net.DialTimeout("tcp", "127.0.0.1:28888", 10*time.Second)
	conn, err := net.DialTimeout("tcp", "192.168.1.100:5900", 10*time.Second)
	//conn, err := net.DialTimeout("tcp", "8.8.8.8:22", 10*time.Second)

	if err != nil {
		if e, ok := err.(*net.OpError); ok {
			if e.Timeout() {
				fmt.Println("Timeout")
			} else {
				// other error yields this here:
				//getsockopt: connection refused
				//dial tcp 192.168.xx.1xx:5985: getsockopt: connection refused
				// and is not a temporary error
				fmt.Println(e.Err)
				fmt.Println(e.Error())
				if e.Temporary() {
					fmt.Println("Temporary error")
				}

				if strings.Contains(e.Error(), "connection refused") {
					fmt.Println("Connection refused")
				}
			}
		}
	} else {
		defer conn.Close()
		fmt.Println("Yay!")
	}
}
