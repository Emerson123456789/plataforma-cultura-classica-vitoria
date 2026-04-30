-- ============================================================
-- Banco de Dados - Plataforma Digital para Promoção da Cultura Clássica na Grande Vitória
-- Arquivo: seed.sql
-- Objetivo: inserir dados iniciais no banco de dados do MVP.
-- ============================================================

PRAGMA foreign_keys = ON;

-- ============================================================
-- Inserção de categorias culturais
-- ============================================================

INSERT INTO categorias (nome) VALUES
('Música'),
('Teatro'),
('Literatura'),
('Artes Visuais'),
('Dança'),
('Formação');

-- ============================================================
-- Inserção de administrador demonstrativo
-- ============================================================

INSERT INTO administradores (nome, email, ativo) VALUES
('Administrador do MVP', 'admin@culturaclassicavitoria.local', 1);

-- ============================================================
-- Inserção de instituições culturais reais selecionadas
-- ============================================================

INSERT INTO instituicoes (
    nome,
    categoria_id,
    endereco,
    cidade,
    descricao,
    latitude,
    longitude,
    ativa
) VALUES
(
    'Faculdade de Música do Espírito Santo (FAMES)',
    1,
    'Praça Américo Poli Monjardim, 60, Centro, Vitória/ES, CEP 29010-640',
    'Vitória/ES',
    'Instituição de referência na formação musical e na promoção de atividades ligadas à música de concerto no Espírito Santo.',
    -20.3200429,
    -40.3288298,
    1
),
(
    'Theatro Carlos Gomes',
    2,
    'Praça Costa Pereira, 25, Centro, Vitória/ES, CEP 29010-080',
    'Vitória/ES',
    'Espaço cultural tradicional da capital, associado a concertos, recitais, montagens cênicas e outras atividades artísticas.',
    -20.3196835,
    -40.3350956,
    1
),
(
    'Biblioteca Pública do Espírito Santo (BPES)',
    3,
    'Av. João Batista Parra, 165, Praia do Suá, Vitória/ES, CEP 29052-120',
    'Vitória/ES',
    'Instituição voltada à difusão do livro, da leitura e de atividades culturais e formativas.',
    -20.3147975,
    -40.2991813,
    1
),
(
    'Centro Cultural Sesc Glória',
    2,
    'Av. Jerônimo Monteiro, 428, Centro, Vitória/ES, CEP 29010-002',
    'Vitória/ES',
    'Espaço cultural com programação diversificada, incluindo música, dança, teatro e atividades formativas.',
    -20.3206126,
    -40.3352925,
    1
),
(
    'Palácio Anchieta',
    4,
    'Praça João Clímaco, 142, Cidade Alta, Centro, Vitória/ES, CEP 29015-110',
    'Vitória/ES',
    'Espaço histórico e cultural que abriga visitas guiadas e mostras de artes visuais e patrimônio cultural.',
    -20.3212011,
    -40.3397104,
    1
),
(
    'Museu de Arte do Espírito Santo (MAES)',
    4,
    'Av. Jerônimo Monteiro, 631, Centro, Vitória/ES',
    'Vitória/ES',
    'Museu dedicado à preservação e difusão das artes visuais, com exposições, ações educativas e programação cultural.',
    -20.3199393,
    -40.3344102,
    1
),
(
    'Casa da Música Sônia Cabral',
    1,
    'Praça João Clímaco, s/n, Centro, Vitória/ES, CEP 29015-140',
    'Vitória/ES',
    'Espaço cultural voltado à realização de apresentações musicais, encontros formativos e atividades artísticas.',
    -20.3207449,
    -40.3389922,
    1
),
(
    'Escola Técnica Municipal de Teatro, Dança e Música (FAFI)',
    5,
    'Av. Jerônimo Monteiro, 656, Centro Histórico, Vitória/ES, CEP 29010-004',
    'Vitória/ES',
    'Escola técnica e espaço cultural com tradição em teatro, dança e formação artística.',
    -20.3198406,
    -40.3333418,
    1
),
(
    'Teatro Universitário (UFES)',
    2,
    'Av. Fernando Ferrari, 514, Campus Universitário, Goiabeiras, Vitória/ES, CEP 29075-910',
    'Vitória/ES',
    'Espaço universitário para apresentações cênicas, musicais e atividades culturais vinculadas à comunidade acadêmica e externa.',
    -20.2774886,
    -40.3021655,
    1
),
(
    'Centro Cultural Sesi',
    6,
    'Rua Tupinambás, 240, Jardim da Penha, Vitória/ES, CEP 29060-810',
    'Vitória/ES',
    'Espaço voltado à promoção de atividades culturais, educativas e artísticas, com programação diversificada.',
    -20.2842358,
    -40.3002683,
    1
);

-- ============================================================
-- Inserção de eventos fictícios para demonstração do MVP
-- ============================================================

INSERT INTO eventos (
    titulo,
    instituicao_id,
    categoria_id,
    data_evento,
    horario,
    descricao,
    administrador_id,
    ativo
) VALUES
(
    'Recital de Piano Brasileiro',
    1,
    1,
    '2026-07-18',
    '19:30',
    'Apresentação fictícia dedicada a obras brasileiras para piano, com repertório de inspiração clássica e nacionalista.',
    1,
    1
),
(
    'Concerto de Câmara: Cordas e Sopros',
    1,
    1,
    '2026-08-22',
    '18:00',
    'Evento fictício com formação de câmara composta por estudantes e professores convidados.',
    1,
    1
),
(
    'Noite de Teatro Clássico',
    2,
    2,
    '2026-07-25',
    '20:00',
    'Montagem fictícia inspirada em repertório teatral clássico, apresentada em formato cênico reduzido.',
    1,
    1
),
(
    'Sarau Literário: Leituras da Tradição',
    3,
    3,
    '2026-08-05',
    '17:00',
    'Encontro fictício para leitura comentada de textos clássicos e humanísticos.',
    1,
    1
),
(
    'Mostra Cênica de Inverno',
    4,
    2,
    '2026-08-29',
    '19:00',
    'Evento fictício com apresentações curtas de teatro, dança e música em diálogo com repertórios tradicionais.',
    1,
    1
),
(
    'Visita Guiada Histórica ao Palácio',
    5,
    4,
    '2026-09-12',
    '15:00',
    'Atividade fictícia de visita orientada ao espaço histórico, com foco em arte, memória e patrimônio.',
    1,
    1
),
(
    'Exposição Comentada: Mestres da Gravura',
    6,
    4,
    '2026-09-26',
    '16:00',
    'Mostra fictícia dedicada a técnicas clássicas de gravura e à formação do olhar artístico.',
    1,
    1
),
(
    'Concerto ao Entardecer',
    7,
    1,
    '2026-10-10',
    '18:30',
    'Apresentação fictícia de música de câmara com repertório clássico e romântico.',
    1,
    1
),
(
    'Mostra de Dança Clássica e Contemporânea',
    8,
    5,
    '2026-10-24',
    '19:30',
    'Evento fictício com coreografias inspiradas na tradição do balé e em releituras contemporâneas.',
    1,
    1
),
(
    'Festival Universitário de Artes Cênicas',
    9,
    2,
    '2026-11-07',
    '18:00',
    'Mostra fictícia de grupos universitários com cenas inspiradas em textos clássicos.',
    1,
    1
),
(
    'Oficina de Formação Cultural',
    10,
    6,
    '2026-11-21',
    '14:00',
    'Atividade fictícia de formação voltada a professores, estudantes e agentes culturais.',
    1,
    1
),
(
    'Ciclo de Música e Humanidades',
    10,
    6,
    '2026-12-05',
    '16:30',
    'Encontro fictício com palestra e audição comentada sobre música, formação estética e cultura clássica.',
    1,
    1
);