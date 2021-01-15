#!/bin/bash

cat > index.html <<EOF
<h1>Hello, World</h1>
<p>Server PORT: ${server_port}</p>
EOF

nohup busybox httpd -f -p ${server_port} &