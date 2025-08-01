# Etapa 1: Usamos a imagem oficial do Go para compilar o código
FROM golang:1.24.5 AS builder

# Define o diretório de trabalho dentro da imagem
WORKDIR /app

# Copia o arquivo go.mod
COPY go.mod ./

# Copia o código fonte (main.go) para dentro do contêiner
COPY main.go .

# Compila o programa Go com:
# - GOOS=linux: para gerar binário para Linux
# - GOARCH=amd64: para arquitetura 64 bits
# - CGO_ENABLED=0: para desativar dependências C e permitir build estático
# - -ldflags="-s -w": remove informações de debug para reduzir o tamanho
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o fullcycle

# Etapa 2: Criamos uma imagem mínima a partir de 'scratch' (imagem vazia)
FROM scratch

# Copia o binário gerado na etapa de build para a imagem final
COPY --from=builder /app/fullcycle /

# Define o ponto de entrada do contêiner (o executável que será rodado)
ENTRYPOINT ["/fullcycle"]