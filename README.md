# verlihub-docker

A docker-compose friendly verlihub docker image

## Usage

This was made to be used with docker-compose. Here is one like mine:

### Quick Start

We need to first start the db, then install verlihub, then run it.

* Copy the example docker-compose.yml from below
* Run `docker-compose up -d db`
* Run `docker-compose run verlihub --install` and fill out the questions. The "server" is `db`.
* Run `docker-compose up -d verlihub

### Example docker-compose.yml

```
---
version: "3"
services:
  verlihub:
    image: narfman0/verlihub
    container_name: verlihub
    volumes:
      - ./conf:/etc/verlihub
    ports:
      - 4111:4111
    restart: unless-stopped
  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: <randomized?>
      MYSQL_DATABASE: verlihub
      MYSQL_USER: verlihub
      MYSQL_PASSWORD: <yourpass>
    # volumes:
    #  - ./db:/var/lib/mysql
    ports:
      - 3306:3306
    restart: unless-stopped
```
