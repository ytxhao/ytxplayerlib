  #include <openssl/ssl.h>
  #include <stdint.h>
    long check_OPENSSL_init_ssl(void) { return (long) OPENSSL_init_ssl; }
    int main(void) { int ret = 0;
    ret |= ((intptr_t)check_OPENSSL_init_ssl) & 0xFFFF;
   return ret; }
