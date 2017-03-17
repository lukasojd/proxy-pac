# Proxy pac
Auto generate pac file for your proxy with hostname from you docker

## Example
**You must add squid to your structure**

```
version: '2'
services:
    proxy-pac:
        image: lukasojd/proxy-pac:1.0.0
        volumes:
          - /var/run/docker.sock:/var/run/docker.sock:ro
        ports:
          - "8080:80"

    adminer_com:
      image: clue/adminer
      environment:
        - VIRTUAL_HOST=adminer.com

    adminer_eu:
        image: clue/adminer
        environment:
          - VIRTUAL_HOST=adminer.eu
```

You set to your browser ip_machine:8080/proxy.php and get pac file for your proxy.

**Functional solution with squid**

```
version: '2'
services:
    proxy-pac:
        image: lukasojd/proxy-pac:1.0.0
        volumes:
          - /var/run/docker.sock:/var/run/docker.sock:ro
        ports:
          - "8080:80"
          
   squid-proxy:
        image: lukasojd/squid-proxy:1.2.0
        volumes:
          - /var/run/docker.sock:/var/run/docker.sock:ro
          - /srv/docker/squid/cache:/var/spool/squid3
        ports:
          - "3128:3128"

    adminer_com:
      image: clue/adminer
      environment:
        - VIRTUAL_HOST=adminer.com

    adminer_eu:
        image: clue/adminer
        environment:
          - VIRTUAL_HOST=adminer.eu
```