-- ==================================
-- ANÁLISE EXPLORATÓRIA DAS TABELAS
-- ==================================
select * from public.sinistros_2025_2026 limit 10

select * from public.pessoas_2025_2026 limit 10

-- ==================================
-- INFORMAÇÕES DE SINISTROS FATAIS
-- ==================================

select
	sin.id_sinistro,
	pes.id_pessoa,
	sin.logradouro,
	sin.data_sinistro,
	pes.data_obito,
	sin.tipo_via,
	sin.tp_sinistro_primario,
	pes.tipo_veiculo_vitima,
	sin.latitude,
	sin.longitude
from public.pessoas_2025_2026 as pes
left join public.sinistros_2025_2026 as sin
	on pes.id_sinistro = sin.id_sinistro
where sin.municipio = 'RIBEIRAO PRETO' and
sin.ano_sinistro = 2026 and
pes.mes_obito = 10 and 
pes.gravidade_lesao = 'FATAL'
order by sin.logradouro asc;

-- ==========================================
-- QUANTIDADE DE SINISTROS NÃO FATAIS POR VIA
-- ==========================================

select
	count(*),
	tipo_via
from public.sinistros_2025_2026
where mes_sinistro = 10 and
ano_sinistro = 2026 and
municipio = 'RIBEIRAO PRETO' and
tipo_registro not in ('SINISTRO FATAL', 'NOTIFICACAO')
group by tipo_via;

select 
	*
from public.sinistros_2025_2026
where mes_sinistro = 10 and
ano_sinistro = 2026 and
municipio = 'RIBEIRAO PRETO' and
tipo_registro not in ('SINISTRO FATAL', 'NOTIFICACAO');

-- ===========================
-- SINISTROS FATAIS POR MODAL
-- ===========================
