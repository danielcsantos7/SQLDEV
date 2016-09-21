/* ||################################################################################################
   || Autor           : SWB                                                                        ||
   || Empresa         : SWB                                                                        ||
   || Versão          : v1.00                                                                      ||
   || Data            : 30/08/2016                                                                 ||
   || Projeto         : Desconto Estabelecimento Cliente Valecard                                  ||
   ||################################################################################################
   ||  RN05 – Regras de parametrização do valor máximo do desconto.                                ||
   ||	No WebAdm, deverá ter uma opção para parametrizar o valor máximo do campo desconto(RN01).  ||
   ||   Apenas o perfil colaborador poderá parametrizar tal valor.                                 ||
   ||   No MENU > BACKOFFICE > CADASTRO > PARAMETRIZAÇÃO DO SISTEMA, deverá existir uma            ||
   ||   forma de parametrizar o valor máximo do desconto a ser negociado para o Estabelecimento    ||
   ||   (Quando o BackOffice logar no sistema, deverá identificar o Estabelecimento para a devida  ||
   ||   parametrização).                                                                           ||
   ||	Campos de parametrização:                                                                  ||  
   ||   Desconto Valecard (%) – Valor máximo:                                                      ||
   ||   Deverá ter valor máximo permitido igual a 30,00.                                           ||
   ||   Desconto Valecard (R$) – Valor máximo:                                                     ||  
   ||   Deverá ter valor máximo permitido igual a 2,00.                                            ||  
   ||   Campo editável e Numérico (com duas casas decimais) que receberá o valor especificado      ||
   ||   no campo Forma de desconto. Este campo será habilitado apenas se o campo “Forma de         ||
   ||   Desconto” estiver selecionado.                                                             ||
   ||   Valor mínimo igual a 0,01, para ambos os tipos de desconto(% ou R$).                       ||
   ||                                                                                              ||
   ||                                                                                              ||
   ||                                                                                              ||
   ||----------------------------------------------------------------------------------------------||*/

-- Add/modify columns 
alter table ADC_PARAMETROS_WEBADM add DESC_VALECARD_PERC number;
alter table ADC_PARAMETROS_WEBADM add DESC_VALECARD_MAX number ;
alter table ADC_PARAMETROS_WEBADM add DESC_VALECARD_FIXO number ;
-- Add comments to the columns 
comment on column ADC_PARAMETROS_WEBADM.DESC_VALECARD_PERC is 'VALOR PORCENTUAL DE DESCONTO ';
comment on column ADC_PARAMETROS_WEBADM.DESC_VALECARD_MAX  is 'VALOR MAXIMO DE DESCONTO';
comment on column ADC_PARAMETROS_WEBADM.DESC_VALECARD_FIXO  is 'VALOR FIXO DE DESCONTO';
