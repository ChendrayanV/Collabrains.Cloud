

```yaml
version: '3'

services:
  product-service:
    build: ./products
    volumes:
      - ./products:/usr/src/server
    ports:
      - 3001:3001

  application:
    build: ./application
    volumes:
      - ./application:/usr/src/app
    ports:
      - 3000:3000
    depends_on:
      - product-service
```