-- ==============================================================================
-- Proyecto: Auditoria de Integracion ERP
-- Archivo: 01_training_view.sql
-- Descripcion: Creacion de vista materializada logica para entrenamiento del 
--              modelo ARIMA. Agrupa el conteo de transacciones por dia y categoria.
-- ==============================================================================

CREATE OR REPLACE VIEW `<project_id>.<dataset_id>.view_training_data` AS
SELECT
  TIMESTAMP_TRUNC(_PARTITIONTIME, DAY) as fecha_corte,
  UserJeCategoryName,
  COUNT(*) as total_registros
FROM
  `<project_id>.<dataset_id>.<source_accounting_table>`
-- Filtro historico: Se ajusta segun la profundidad de datos disponible en el Datalake
WHERE _PARTITIONTIME >= TIMESTAMP("2025-01-01") 
GROUP BY 1, 2;


