
# Time taken for DNS to resolve around the world 
* UK - < 1 day
* USA - < 1 day
* Africa - 7 days
* For other locations try a DNS Traversal e.g.: https://tools.dnsstuff.com/#dnsTraversal|type=domain&&value=example.com&&recordType=A

# Find IP address 
* http://www.whatsmyip.org

# Find the DNS server 

## Windows 
* <code>nslookup -debug 216.70.64.120</code> - This will lookup the DNS server with an IP address and give helpful debug info
* <code>nslookup -debug example.com.</code> - This will lookup the DNS server with a domain and give helpful debug info (notice it finishes with a <code>.</code> (dot)
* <code>nslookup -debug 216.70.64.120 8.8.8.8</code> - This will switch the DNS server for 8.8.8.8 (Google Public DNS) and give helpful debug info
* <code>ping -a 72.47.244.105</code> - This will show if the user can reach the server
* <code>tracert 216.70.64.120</code> - This will trace the route taken to reach the server

## Use Google Public DNS (8.8.8.8 & 8.8.4.4) 
* https://developers.google.com/speed/public-dns/docs/using

## Flush DNS 
* Windows - View local cache: <code>ipconfig /displaydns</code>, Flush cache: <code>ipconfig /flushdns</code>
* https://help.dreamhost.com/hc/en-us/articles/215680477

# How DNS works 
* https://www.youtube.com/watch?v=3EvjwlQ43_4
