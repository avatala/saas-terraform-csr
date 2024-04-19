upstream CUSTOMER_NAME  {
  server IP:PORT;
  zone tcp_mem 64k;
  least_conn;
}
server {
  listen PORT;
  proxy_pass CUSTOMER_NAME;
}
