# Inmana

## Descrição

Gerenciamento de suprimentos de restaurantes.

### Requisitos

- [x] Podem ser cadastrados restaurantes e suprimentos
- [x] Deve ser possível visualizar as informações de um suprimento
- [ ] Deve ser gerada uma relação de itens à vencer toda semana para cada um dos restaurantes
- [ ] A relação de itens deve ser enviada para o email do restaurante

## How to Develop / Como desenvolver?

1. Clonar o repositório
2. Navegar até a pasta do repositório
3. Instalar dependências
4. Criar e migrar o banco de dados
5. Iniciar servidor de desenvolvimento (Phoenix)

```bash
git clone https://github.com/virb30/nlw5-elixir.git inmana
cd inmana
mix deps.get
mix ecto.setup
mix phx.server
```

O servidor de desenvolvimento estará disponível em:

[`localhost:4000`](http://localhost:4000)

### Rotas disponíveis

`/dashboard` - Dashboard padrão do phoenix
`[POST] /api/restaurants` - criar restaurantes
`[POST] /api/supplies` - criar suprimento
`[GET] /api/supplies/:id` - exibir detalhes do suprimento `:id`
