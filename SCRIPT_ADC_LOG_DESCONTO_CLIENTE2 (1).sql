/* ||################################################################################################
   || Autor           : SWB                                                                        ||
   || Empresa         : SWB                                                                        ||
   || Versão          : v1.00                                                                      ||
   || Data            : 10/08/2016                                                                 ||
   || Projeto         : Desconto Estabelecimento Cliente Valecard                                  ||
   ||################################################################################################
   ||  Objetivo : RN04 – Regras geração de LOG. (Requisito 3)                                      ||
   ||  Alterações na tela de Desconto Valecard deverão gerar um LOG de alteração contendo:         ||
   ||  ID, Usuário, Data e Horário de Alteração, Campo Alterado, Valor Antigo e Valor Novo para que||
   ||  possa ser consultado através de relatório (Vide UC_04).Este log deverá ser persistido em    ||
   ||  tabela do banco para futuras consultas.                                                     ||
   ||  UC_04:Registrar alterações em LOG (dentro de tabela de banco) bem como usar tal registro    ||
   ||  para consultar de forma detalhada todas as inclusões e/ou alterações efetuadas tanto pelo   ||
   ||  Colaborador como por parte do Estabelecimento (aprovadas pela área responsável). Este caso  ||
   ||  de uso serve para a emissão de relatório de Descontos Mensais.                              ||                                                  ||
   ||                                                                                              ||
   ||                                                                                              ||
   ||                                                                                              ||
   ||----------------------------------------------------------------------------------------------||*/
-- Create table
CREATE TABLE  ADC_LOG_DESCONTO_VALECARD
(
  ID                             NUMBER(10)NOT NULL,
  FILIAL                         VARCHAR2(5) ,
  CODIGO                         VARCHAR2(5) ,
  SEQUENCIA			 VARCHAR2(2) ,
  USUARIO                        VARCHAR2(30) not null,
  DATA_ALTERACAO                 DATE ,
  CAMPO_ALTERADO                 VARCHAR2(30),
  VALOR_ANTIGO                   VARCHAR2(10),
  VALOR_NOVO                     VARCHAR2(10),
  STATUS			 number(1)
);


-- Add comments to the columns
comment on column ADC_LOG_DESCONTO_VALECARD.ID             is 'ID DA ADC_LOG_DESCONTO_VALECARD';
comment on column ADC_LOG_DESCONTO_VALECARD.FILIAL         is 'FILIAL DO ESTABELECIMENTO';
comment on column ADC_LOG_DESCONTO_VALECARD.CODIGO         is 'CODIGO DO ESTABELECIMENTO';
comment on column ADC_LOG_DESCONTO_VALECARD.SEQUENCIA      is 'SEQUENCIA DO ESTABELECIMENTO';
comment on column ADC_LOG_DESCONTO_VALECARD.USUARIO        is 'USUARIO LOGADO QUE FEZ A ALTERACAO';
comment on column ADC_LOG_DESCONTO_VALECARD.DATA_ALTERACAO is 'DATA DE ALTERACAO DOS CAMPOS DA TABELA ADC_LOG_DESCONTO_VALECARD';
comment on column ADC_LOG_DESCONTO_VALECARD.CAMPO_ALTERADO is 'CAMPO QUE FOI ALTERADO DA TABELA ADC_LOG_DESCONTO_VALECARD';
comment on column ADC_LOG_DESCONTO_VALECARD.VALOR_ANTIGO   is 'VALOR ANTES DA ALTERACAO DA TABELA ADC_LOG_DESCONTO_VALECARD';
comment on column ADC_LOG_DESCONTO_VALECARD.VALOR_NOVO     is 'NOVO VALOR DA TABELA ADC_LOG_DESCONTO_VALECARD';
comment on column ADC_LOG_DESCONTO_VALECARD.STATUS        is 'APROVADO=1 - AGUARDANDO APROVACAO =2 REPROVADO=3';

-- Create/Recreate primary, unique and foreign key constraints
alter table ADC_LOG_DESCONTO_VALECARD  add constraint ADC_LOG_DESC_CLI_PK primary key (ID) using index ;

-- Create/Recreate indexes
create index ADC_LOG_DESC_CONV_FILIAL_IDX on ADC_LOG_DESCONTO_VALECARD (FILIAL,CODIGO,SEQUENCIA);
create index ADC_LOG_DESC_CONV_CAMPO_IDX on ADC_LOG_DESCONTO_VALECARD (CAMPO_ALTERADO);
create index ADC_LOG_DESC_CONV_DTA_IDX on ADC_LOG_DESCONTO_VALECARD (DATA_ALTERACAO);
create index ADC_LOG_DESC_CONV_STATUS_IDX on ADC_LOG_DESCONTO_VALECARD (STATUS);

CREATE PUBLIC SYNONYM ADC_LOG_DESCONTO_VALECARD FOR ADEB.ADC_LOG_DESCONTO_VALECARD;

GRANT SELECT, INSERT, UPDATE, DELETE ON ADC_LOG_DESCONTO_VALECARD TO GESTAO_FROTA;
GRANT SELECT ON ADC_LOG_DESCONTO_VALECARD TO ANALISTAS_TI;

-- Create sequence
create sequence SEQ_ADC_LOG_DESCONTO_VALECARD
start with 1
increment by 1;

CREATE PUBLIC SYNONYM SEQ_ADC_LOG_DESCONTO_VALECARD FOR ADEB.SEQ_ADC_LOG_DESCONTO_VALECARD;
GRANT SELECT ON ADC_LOG_DESCONTO_VALECARD TO GESTAO_FROTA;
GRANT SELECT ON ADC_LOG_DESCONTO_VALECARD TO ANALISTAS_TI
