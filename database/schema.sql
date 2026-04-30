-- ============================================================
-- Banco de Dados - Plataforma Digital para Promoção da Cultura Clássica na Grande Vitória
-- ============================================================
-- Arquivo: schema.sql
-- Objetivo: criar a estrutura relacional inicial do banco de dados do MVP da aplicação.
-- ============================================================

PRAGMA foreign_keys = ON;

-- ============================================================
-- Remoção das tabelas, caso já existam
-- A ordem respeita as dependências entre chaves estrangeiras.
-- ============================================================

DROP TABLE IF EXISTS eventos;
DROP TABLE IF EXISTS instituicoes;
DROP TABLE IF EXISTS administradores;
DROP TABLE IF EXISTS categorias;

-- ============================================================
-- Tabela: categorias
-- Armazena as categorias culturais utilizadas para classificar instituições e eventos.
-- ============================================================

CREATE TABLE categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(80) NOT NULL UNIQUE
);

-- ============================================================
-- Tabela: administradores
-- Representa os usuários responsáveis pela curadoria e manutenção dos dados da plataforma.
-- ============================================================

CREATE TABLE administradores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    ativo INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0, 1))
);

-- ============================================================
-- Tabela: instituicoes
-- Armazena instituições culturais reais selecionadas para o MVP. Cada instituição pertence a uma categoria principal.
-- ============================================================

CREATE TABLE instituicoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(150) NOT NULL,
    categoria_id INTEGER NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(80) NOT NULL DEFAULT 'Vitória/ES',
    descricao TEXT NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    ativa INTEGER NOT NULL DEFAULT 1 CHECK (ativa IN (0, 1)),

    CONSTRAINT fk_instituicoes_categorias
        FOREIGN KEY (categoria_id)
        REFERENCES categorias(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ============================================================
-- Tabela: eventos
-- Armazena eventos culturais vinculados a instituições.
-- ============================================================

CREATE TABLE eventos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo VARCHAR(150) NOT NULL,
    instituicao_id INTEGER NOT NULL,
    categoria_id INTEGER NOT NULL,
    data_evento DATE NOT NULL,
    horario TIME NOT NULL,
    descricao TEXT NOT NULL,
    administrador_id INTEGER,
    ativo INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0, 1)),

    CONSTRAINT fk_eventos_instituicoes
        FOREIGN KEY (instituicao_id)
        REFERENCES instituicoes(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_eventos_categorias
        FOREIGN KEY (categoria_id)
        REFERENCES categorias(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_eventos_administradores
        FOREIGN KEY (administrador_id)
        REFERENCES administradores(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);