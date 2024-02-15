[webservers]
%{ for server in webservers ~}
${server.name} ansible_host=${server.nat_ip_address} fqdn=${server.fqdn}
%{ endfor ~}

[databases]
%{ for db in databases ~}
${db.name} ansible_host=${db.nat_ip_address} fqdn=${db.fqdn}
%{ endfor ~}

[storage]
%{ for store in storage ~}
${store.name} ansible_host=${store.nat_ip_address} fqdn=${store.fqdn}
%{ endfor ~}


