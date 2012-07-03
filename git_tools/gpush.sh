#!/usr/bin/expect

spawn git push -u origin master
expect "Username"; send "jedi-master\n"
expect "Password"; send "prince4712\n"
interact
