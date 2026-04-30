-- ============================================================
-- Banco de Dados - Plataforma Digital para Promoção da Cultura Clássica na Grande Vitória
-- Arquivo: queries.sql
-- Objetivo: demonstrar operações de manipulação de dados no banco do MVP.
-- ============================================================

PRAGMA foreign_keys = ON;

-- ============================================================
-- 1. CONSULTAS SIMPLES
-- ============================================================

-- 1.1 Listar todas as categorias cadastradas.
SELECT
    id,
    nome
FROM categorias
ORDER BY nome;


-- 1.2 Listar todas as instituições ativas.
SELECT
    id,
    nome,
    cidade,
    latitude,
    longitude
FROM instituicoes
WHERE ativa = 1
ORDER BY nome;


-- 1.3 Listar todos os eventos ativos em ordem cronológica.
SELECT
    id,
    titulo,
    data_evento,
    horario
FROM eventos
WHERE ativo = 1
ORDER BY data_evento, horario;


-- ============================================================
-- 2. CONSULTAS COM JOIN
-- ============================================================

-- 2.1 Listar instituições com suas respectivas categorias.
SELECT
    i.id,
    i.nome AS instituicao,
    c.nome AS categoria,
    i.endereco,
    i.cidade
FROM instituicoes i
INNER JOIN categorias c
    ON i.categoria_id = c.id
WHERE i.ativa = 1
ORDER BY i.nome;


-- 2.2 Listar eventos com instituição e categoria.
SELECT
    e.id,
    e.titulo AS evento,
    e.data_evento,
    e.horario,
    i.nome AS instituicao,
    c.nome AS categoria
FROM eventos e
INNER JOIN instituicoes i
    ON e.instituicao_id = i.id
INNER JOIN categorias c
    ON e.categoria_id = c.id
WHERE e.ativo = 1
ORDER BY e.data_evento, e.horario;


-- 2.3 Listar eventos com dados úteis para exibição pública.
SELECT
    e.titulo,
    e.data_evento,
    e.horario,
    e.descricao,
    i.nome AS instituicao,
    i.endereco,
    i.cidade,
    c.nome AS categoria
FROM eventos e
INNER JOIN instituicoes i
    ON e.instituicao_id = i.id
INNER JOIN categorias c
    ON e.categoria_id = c.id
WHERE e.ativo = 1
  AND i.ativa = 1
ORDER BY e.data_evento, e.horario;


-- ============================================================
-- 3. CONSULTAS COM FILTROS
-- ============================================================

-- 3.1 Consultar instituições da categoria Música.
SELECT
    i.nome AS instituicao,
    i.endereco,
    i.cidade
FROM instituicoes i
INNER JOIN categorias c
    ON i.categoria_id = c.id
WHERE c.nome = 'Música'
  AND i.ativa = 1
ORDER BY i.nome;


-- 3.2 Consultar eventos da categoria Teatro.
SELECT
    e.titulo,
    e.data_evento,
    e.horario,
    i.nome AS instituicao
FROM eventos e
INNER JOIN instituicoes i
    ON e.instituicao_id = i.id
INNER JOIN categorias c
    ON e.categoria_id = c.id
WHERE c.nome = 'Teatro'
  AND e.ativo = 1
ORDER BY e.data_evento;


-- 3.3 Consultar eventos entre julho e setembro de 2026.
SELECT
    e.titulo,
    e.data_evento,
    e.horario,
    i.nome AS instituicao
FROM eventos e
INNER JOIN instituicoes i
    ON e.instituicao_id = i.id
WHERE e.data_evento BETWEEN '2026-07-01' AND '2026-09-30'
  AND e.ativo = 1
ORDER BY e.data_evento, e.horario;


-- 3.4 Buscar instituições por parte do nome.
SELECT
    id,
    nome,
    endereco,
    cidade
FROM instituicoes
WHERE nome LIKE '%Teatro%'
  AND ativa = 1
ORDER BY nome;


-- 3.5 Buscar eventos por palavra no título.
SELECT
    e.titulo,
    e.data_evento,
    e.horario,
    i.nome AS instituicao
FROM eventos e
INNER JOIN instituicoes i
    ON e.instituicao_id = i.id
WHERE e.titulo LIKE '%Concerto%'
  AND e.ativo = 1
ORDER BY e.data_evento;


-- ============================================================
-- 4. CONSULTAS PARA O MAPA CULTURAL
-- ============================================================

-- 4.1 Listar instituições ativas com coordenadas para exibição no mapa.
SELECT
    i.id,
    i.nome,
    c.nome AS categoria,
    i.endereco,
    i.descricao,
    i.latitude,
    i.longitude
FROM instituicoes i
INNER JOIN categorias c
    ON i.categoria_id = c.id
WHERE i.ativa = 1
ORDER BY i.nome;


-- ============================================================
-- 5. CONSULTAS COM AGREGAÇÃO
-- ============================================================

-- 5.1 Contar quantas instituições existem por categoria.
SELECT
    c.nome AS categoria,
    COUNT(i.id) AS total_instituicoes
FROM categorias c
LEFT JOIN instituicoes i
    ON i.categoria_id = c.id
   AND i.ativa = 1
GROUP BY c.id, c.nome
ORDER BY total_instituicoes DESC, c.nome;


-- 5.2 Contar quantos eventos existem por instituição.
SELECT
    i.nome AS instituicao,
    COUNT(e.id) AS total_eventos
FROM instituicoes i
LEFT JOIN eventos e
    ON e.instituicao_id = i.id
   AND e.ativo = 1
WHERE i.ativa = 1
GROUP BY i.id, i.nome
ORDER BY total_eventos DESC, i.nome;


-- 5.3 Contar eventos por categoria.
SELECT
    c.nome AS categoria,
    COUNT(e.id) AS total_eventos
FROM categorias c
LEFT JOIN eventos e
    ON e.categoria_id = c.id
   AND e.ativo = 1
GROUP BY c.id, c.nome
ORDER BY total_eventos DESC, c.nome;


-- ============================================================
-- 6. INSERÇÃO DE DADOS
-- ============================================================

-- 6.1 Inserir uma nova instituição cultural.
INSERT INTO instituicoes (
    nome,
    categoria_id,
    endereco,
    cidade,
    descricao,
    latitude,
    longitude,
    ativa
) VALUES (
    'Auditório Cultural Demonstrativo',
    6,
    'Rua Exemplo, 100, Centro, Vitória/ES',
    'Vitória/ES',
    'Instituição fictícia inserida para demonstrar operação de cadastro no banco de dados.',
    -20.3150000,
    -40.3200000,
    1
);


-- 6.2 Inserir um novo evento vinculado à instituição criada.
INSERT INTO eventos (
    titulo,
    instituicao_id,
    categoria_id,
    data_evento,
    horario,
    descricao,
    administrador_id,
    ativo
) VALUES (
    'Palestra Demonstrativa sobre Cultura Clássica',
    (SELECT id FROM instituicoes WHERE nome = 'Auditório Cultural Demonstrativo'),
    6,
    '2026-12-12',
    '15:00',
    'Evento fictício criado para demonstrar inserção de dados e vínculo com instituição cadastrada.',
    1,
    1
);


-- 6.3 Consultar o evento recém-inserido.
SELECT
    e.titulo,
    e.data_evento,
    e.horario,
    i.nome AS instituicao,
    c.nome AS categoria
FROM eventos e
INNER JOIN instituicoes i
    ON e.instituicao_id = i.id
INNER JOIN categorias c
    ON e.categoria_id = c.id
WHERE e.titulo = 'Palestra Demonstrativa sobre Cultura Clássica';


-- ============================================================
-- 7. ATUALIZAÇÃO DE DADOS
-- ============================================================

-- 7.1 Atualizar o horário de um evento.
UPDATE eventos
SET horario = '16:00'
WHERE titulo = 'Palestra Demonstrativa sobre Cultura Clássica';


-- 7.2 Atualizar a descrição da instituição demonstrativa.
UPDATE instituicoes
SET descricao = 'Instituição fictícia atualizada para demonstrar operação UPDATE no banco de dados.'
WHERE nome = 'Auditório Cultural Demonstrativo';


-- 7.3 Consultar os dados após atualização.
SELECT
    e.titulo,
    e.data_evento,
    e.horario,
    i.nome AS instituicao,
    i.descricao AS descricao_instituicao
FROM eventos e
INNER JOIN instituicoes i
    ON e.instituicao_id = i.id
WHERE e.titulo = 'Palestra Demonstrativa sobre Cultura Clássica';


-- ============================================================
-- 8. REMOÇÃO LÓGICA
-- ============================================================

-- 8.1 Marcar o evento demonstrativo como inativo.
-- Esta operação representa soft delete.
UPDATE eventos
SET ativo = 0
WHERE titulo = 'Palestra Demonstrativa sobre Cultura Clássica';


-- 8.2 Verificar eventos ativos após a remoção lógica.
SELECT
    id,
    titulo,
    ativo
FROM eventos
WHERE titulo = 'Palestra Demonstrativa sobre Cultura Clássica';


-- 8.3 Consultar apenas eventos ativos, demonstrando que o evento inativo
-- não aparece mais nas listagens públicas.
SELECT
    titulo,
    data_evento,
    horario
FROM eventos
WHERE ativo = 1
ORDER BY data_evento, horario;


-- ============================================================
-- 9. REMOÇÃO FÍSICA CONTROLADA
-- ============================================================

-- 9.1 Remover fisicamente o evento demonstrativo.
-- Como este evento foi criado apenas para teste, a remoção física é aceitável.
DELETE FROM eventos
WHERE titulo = 'Palestra Demonstrativa sobre Cultura Clássica';


-- 9.2 Remover fisicamente a instituição demonstrativa.
-- Esta remoção só é possível depois da remoção do evento vinculado,
-- por causa da restrição de chave estrangeira.
DELETE FROM instituicoes
WHERE nome = 'Auditório Cultural Demonstrativo';


-- 9.3 Verificar se os registros demonstrativos foram removidos.
SELECT
    id,
    nome
FROM instituicoes
WHERE nome = 'Auditório Cultural Demonstrativo';

SELECT
    id,
    titulo
FROM eventos
WHERE titulo = 'Palestra Demonstrativa sobre Cultura Clássica';