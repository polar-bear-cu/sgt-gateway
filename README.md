# Subglutee Project - Gateway

Nginx reverse proxy หน้าเดียวของระบบ route `/api/v1/*` ไปแต่ละ service, `/` ไป frontend

- listen `:80` (compose publish `8000:80`)
- Docker DNS - เรียก service ด้วยชื่อ container (`auth-service`, `user-service`, ...)

### Routes

```
/api/v1/auth/            -> auth-service:8080
/api/v1/subscriptions    -> subscription-service:8080
/api/v1/reports/         -> report-service:8080
/user.v1.UserService/    -> envoy:8081 (grpc-web -> user-service)
/healthz
/                        -> frontend:80
```

### Prerequisite

- Docker
- `go install github.com/evilmartians/lefthook@latest` (git hooks)

### Setup

```terminal
git clone https://github.com/polar-bear-cu/sgt-gateway.git
cd sgt-gateway
lefthook install
```

### Build + Run standalone

```terminal
make build
make run       # publish 8000:80
```

### Config check

```terminal
make check
```
