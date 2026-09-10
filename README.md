# Subglutee Project - Gateway

Nginx reverse proxy หน้าเดียวของระบบ route `/api/v1/*` ไปแต่ละ service, `/` ไป frontend

- listen `:80` (compose publish `8000:80`)
- Docker DNS - เรียก service ด้วยชื่อ container (`auth-service`, `user-service`, ...)
- repo นี้มีแค่ nginx config + image. compose ที่ประกอบทั้งระบบอยู่ `sgt-deploy`

### Routes

```
/api/v1/auth/            -> auth-service:8080
/api/v1/users/           -> user-service:8080
/api/v1/subscriptions    -> subscription-service:8080
/api/v1/reports/         -> report-service:8080
/healthz                 -> nginx ตอบเอง {"status":"ok"}
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

รันเดี่ยว upstream (`auth-service` ฯลฯ) resolve ไม่ได้ ใช้จริงรันผ่าน compose ใน `sgt-deploy`

### Config check

```terminal
make check     # docker run --entrypoint nginx <image> -t
```
