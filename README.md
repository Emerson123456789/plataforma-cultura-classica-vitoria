# Plataforma Digital para Promoção da Cultura Clássica na Grande Vitória

Aplicação web desenvolvida como MVP para organização, consulta e visualização de instituições e eventos culturais ligados à cultura clássica na Região Metropolitana de Vitória/ES.

## Objetivo

O projeto busca enfrentar o problema da fragmentação e da baixa visibilidade digital de iniciativas culturais, reunindo em uma interface simples informações sobre instituições e eventos.

## Funcionalidades implementadas

- listagem de instituições culturais
- listagem de eventos culturais
- busca por nome de instituição
- busca por título de evento
- filtros por categoria
- página de detalhes de instituições
- página de detalhes de eventos
- mapa com marcadores das instituições
- área administrativa simples para cadastro local
- persistência local com `localStorage`

## Tecnologias utilizadas

- Vue 3
- Vite
- Vue Router
- HTML5
- CSS3
- JavaScript
- Leaflet

## Estrutura do projeto

src/
  assets/
  components/
  data/
  router/
  views/
  App.vue
  main.js

## Como executar o projeto

### 1. Instale as dependências

bash id="hv9s2q"
npm install

### 2. Execute o servidor de desenvolvimento

bash id="s5h6ym"
npm run dev

### 3. Abra no navegador

O terminal mostrará um endereço local, normalmente semelhante a:
http://localhost:5173/

## Dados da aplicação

O projeto utiliza dois tipos de dados:
- dados-base em arquivos JSON
- dados cadastrados localmente via `localStorage`

## Observações

A área administrativa deste MVP utiliza armazenamento local no navegador, sem integração com backend nesta etapa do projeto.

## Banco de dados

Para o Módulo 3 do Projeto Integrador II, foi elaborada uma modelagem relacional inicial para a aplicação, com o objetivo de representar em SQL os principais dados utilizados pelo MVP.

A modelagem contempla as seguintes entidades:
- categorias
- instituições
- eventos
- administradores

Os scripts SQL estão organizados na pasta `database/`:
database/
  schema.sql
  seed.sql
  queries.sql

## Autor

Emerson Gonçalves Garcia

## Contexto acadêmico

Projeto desenvolvido para a disciplina Projeto Integrador de Tecnologia da Informação II, no contexto do Programa de Extensão UFMS Digital.
