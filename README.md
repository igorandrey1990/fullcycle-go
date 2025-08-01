# Full Cycle Go Docker Challenge

Este projeto é uma solução para o desafio Full Cycle que consiste em criar uma aplicação simples em Go, empacotá-la em uma imagem Docker muito leve (menos de 2MB) e publicar essa imagem no Docker Hub.

---

## O que o projeto faz?

- Imprime no console a mensagem:

- Usa uma imagem Docker multi-stage para compilar o binário Go de forma otimizada.
- A imagem final é construída a partir da imagem `scratch`, tornando-a extremamente leve (~1.5MB).

---

## Arquivos do projeto

- `main.go` — Código fonte da aplicação Go.
- `go.mod` — Arquivo de módulo Go para gerenciamento de dependências.
- `Dockerfile` — Script para criar a imagem Docker multi-stage.

---

## Como usar

### Build da imagem Docker localmente

```bash
docker build -t seu-usuario/fullcycle .
