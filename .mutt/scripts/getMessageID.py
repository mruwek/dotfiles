#!/usr/bin/env python

import sys
import email.parser

raw = sys.stdin.read()
message = email.parser.Parser().parsestr(raw, headersonly=True)
messageID = message.get("Message-ID")

messageID = messageID.replace('$', '\\\$')


f = open("/tmp/reply-id", "w")
f.write(messageID)
f.close()
