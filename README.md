# Tarea de laboratorio semana 3 - Terraform Hands-on Lab

Despliega un Frontend (Nginx), un Backend (Node) y una BD (PostgreSQL) en dos entornos: **DEV** y **QA**.

## Requisitos

- Docker Desktop abierto
- Terraform instalado

## Ejecutar

```bash
cd iac
terraform init
terraform apply -auto-approve
```

## Probar

| Entorno | Frontend | Backend | BD |
|---|---|---|---|
| DEV | http://localhost:4001 | http://localhost:4002 | localhost:4003 |
| QA  | http://localhost:5001 | http://localhost:5002 | localhost:5003 |

Abre el frontend en el navegador. Debe mostrar que `"bd": "conectada"`.
