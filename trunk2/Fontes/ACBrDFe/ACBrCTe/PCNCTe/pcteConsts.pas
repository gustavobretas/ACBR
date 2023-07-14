{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Italo Giurizzato Junior                         }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatu� - SP - 18270-170         }
{******************************************************************************}

{$I ACBr.inc}

unit pcteConsts;

interface

uses
  SysUtils;

const
  NAME_SPACE_CTE = 'xmlns="http://www.portalfiscal.inf.br/cte"';

  xRazao3 = 'CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
  xRazao4 = 'CTE EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';

  DSC_TPCTe    = 'Tipo do Conhecimento';
  DSC_CMUNEMI  = 'C�digo do Munic�pio onde o CT-e est� sendo emitido';
  DSC_ORIGCALC = 'Munic�pio origem para efeito de c�lculo do frete';
  DSC_DESTCALC = 'Munic�pio destino para efeito de c�lculo do frete';
  DSC_XOBS     = 'Observa��es Gerais';
  DSC_TOMA     = 'Tomador do Servi�o';
  DSC_INFNF    = 'Informa��es da Nota Fiscal';
  DSC_INFNFE   = 'Informa��es da Nota Fiscal Eletr�nica';
  DSC_NDOC     = 'N�mero da Nota Fiscal';
  DSC_PESO     = 'Peso';
  DSC_TPDOC    = 'Tipo de documento origin�rio';
  DSC_OUTROS   = 'Descri��o';
  DSC_VTPREST  = 'Valor total da presta��o do servi�o';
  DSC_VREC     = 'Valor a Receber';
  DSC_XNOMEC   = 'Nome do Componente';
  DSC_VCOMP    = 'Valor do Componente';
  DSC_VCRED    = 'Valor do Cr�dito outorgado/presumido';
  DSC_VMERC    = 'Valor da mercadoria para efeito de averba��o';

  DSC_DPREV    = 'Data prevista de entrega';
  DSC_CINT     = 'C�digo interno do emitente';
  DSC_INFOUTRO = 'informa��es dos demais documentos';
  DSC_TPSERV   = 'Tipo do Servi�o';
  DSC_RETIRA   = 'Recebedor retira na Filial?';
  DSC_PRED     = 'Produto predominante';
  DSC_OUTCAT   = 'Outras caracter�sticas da carga';
  DSC_VTMERC   = 'Valor total da mercadoria';
  DSC_INFQ     = 'Informa��es de quantidades da Carga';
  DSC_TPMED    = 'Tipo da Medida';
  DSC_QTD      = 'Quantidade';
  DSC_DRET     = 'Detalhes da Retirada';

  DSC_XCARACAD  = 'Caracteristica adicional do transporte';
  DSC_XCARACSET = 'Caracteristica adicional do servi�o';
  DSC_XEMI      = 'Funcion�rio emissor do CTe';
  DSC_XORIG     = 'Sigla ou c�digo interno de Origem';
  DSC_XPASS     = 'Sigla ou c�digo interno da Passagem';
  DSC_XDEST     = 'Sigla ou c�digo interno do Destino';
  DSC_XROTA     = 'C�digo da Rota de Entrega';
  DSC_TPPER     = 'Tipo de data/per�odo programado para entrega';
  DSC_DPROG     = 'Data programada';
  DSC_DINI      = 'Data inicial';
  DSC_DFIM      = 'Data final';
  DSC_TPHOR     = 'Tipo de hora para entrega';
  DSC_HPROG     = 'Hora programada';
  DSC_HINI      = 'Hora inicial';
  DSC_HFIM      = 'Hora final';
  DSC_NROMA     = 'Numero do Romaneio';
  DSC_NPED      = 'Numero do Pedido';
  DSC_VUNITV    = 'Valor Unit�rio do Ve�culo';
  DSC_VFRETEV   = 'Frete Unit�rio';
  DSC_CIOT      = 'C�digo Identificador da Opera��o de Transporte';
  DSC_NOCC      = 'N�mero da Ordem de Coleta';
  DSC_NCOMPRA   = 'N�mero do Comprovante de Compra';
  DSC_CINTV     = 'C�digo interno do Ve�culo';
  DSC_TARA      = 'Tara em KG';
  DSC_CAPKG     = 'Capacidade em KG';
  DSC_CAPM3     = 'Capacidade em M3';
  DSC_INDSN     = 'Indicador de Simples Nacional';
  DSC_NMINU     = 'N�mero da Minuta';
  DSC_NOCA      = 'N�mero Operacional do Conhecimento A�reo';
  DSC_XLAGEMI   = 'Identifica��o do Emissor';
  DSC_IDT       = 'Identifica��o Interna do Tomador';
  DSC_CL        = 'Classe';
  DSC_CTAR      = 'C�digo da Tarifa';
  DSC_VTAR      = 'Valor da Tarifa';
  DSC_XDIME     = 'Dimens�o';
  DSC_CINFMANU  = 'Informa��es de Manuseio';
  DSC_CIMP      = 'Carga Especial';
  DSC_VPREST    = 'Valor da presta��o BC do AFRMM';
  DSC_NBOOKING  = 'N�mero do Booking';
  DSC_NCTRL     = 'N�mero de Controle';
  DSC_XNAVIO    = 'Identifica��o do Navio';
  DSC_XBALSA    = 'Identificador da Balsa';
  DSC_NVIAG     = 'N�mero da Viagem';
  DSC_DIREC     = 'Dire��o';
  DSC_PRTEMB    = 'Porto de Embarque';
  DSC_PRTTRANS  = 'Porto de Transbordo';
  DSC_PRTDEST   = 'Porto de Destino';
  DSC_TPTRAF    = 'Tipo de Tr�fego';
  DSC_RESPFAT   = 'Respons�vel pelo Faturamento';
  DSC_FERREMI   = 'Ferrovia Emitente do CTe';
  DSC_FLUXO     = 'Fluxo Ferrovi�rio';
  DSC_IDTREM    = 'Identifica��o do Trem';
  DSC_CINTF     = 'C�digo interno da Ferrovia envolvida';
  DSC_CAPTO     = 'Capacidade em Toneladas';
  DSC_TPVAG     = 'Tipo de Vag�o';
  DSC_PESOR     = 'Peso Real em Toneladas';
  DSC_PESOBC    = 'Peso Base de Calculo de Frete em Toneladas';
  DSC_COTM      = 'N�mero do Certificado do Operador de Transporte Multimodal';
  DSC_INDNEG    = 'Indicador Negoci�vel';
  DSC_CRTCTE    = 'C�digo do Regime Tribut�rio';

  DSC_PONTOFULGOR  = 'Ponto de Fulgor';
  DSC_QTOTEMB      = 'Quantidade Total de Embalagens';
  DSC_UNIAP        = 'Unidade de Medida';

  DSC_NCONT            = 'Identifica��o do Container';
  DSC_DETCONT          = 'Detalhamento dos Containers';
  DSC_INDGLOBALIZADO   = 'Indicador de CT-e Globalizado';
  DSC_INDIETOMA        = 'Indicador de I.E. do tomador';
  DSC_PASS             = 'Passagens';
  DSC_XDESCSERV        = 'Descri��o do Servi�o';
  DSC_QCARGA           = 'Quantidade de Carga';
  DSC_IDDOCANTPAP      = 'Documentos de transporte anterior de Papel';
  DSC_IDDOCANTELE      = 'Documentos de transporte anterior eletr�nicos';
  DSC_IDDOCANT         = 'Documentos de transporte anterior';
  DSC_EMIDOCANT        = 'Emissor do documento anterior';
  DSC_OCC              = 'Ordens de Coleta associados';
  DSC_VEIC             = 'Veiculos';
  DSC_TAF              = 'Termo de Autoriza��o de Fretamento';
  DSC_NROREGESTADUAL   = 'N�mero do Registro Estadual';
  DSC_PERI             = 'Produtos Perigosos';
  DSC_VEICNOVOS        = 'Ve�culos Novos';
  DSC_INDALTERATOMA    = 'Indicador de altera��o de Tomador';
  DSC_CHCTEMULTIMODAL  = 'Chave do CT-e Multimodal';
  DSC_INFCTEMULTIMODAL = 'Informa��es do CT-e Multimodal';
  DSC_TPFRETAMENTO     = 'Tipo de Fretamento';
  DSC_DHVIAGEM         = 'Data / Hora da Viagem';
  DSC_INFQRCODCTE      = 'Texto com o QR-Code impresso no DACTE';

  DSC_CHBPE       = 'Chave do BP-e';
  DSC_INFGTVE     = 'Informa��es do GTVe';
  DSC_TPCOMP      = 'Tipo de Componente';
  DSC_XCOMP       = 'Descri��o do Componente';
  DSC_TPESPECIE   = 'Tipo de Esp�cie';
  DSC_VESPECIE    = 'Valor em Esp�cie';
  DSC_TPNUMERARIO = 'Tipo de Numer�rio';
  DSC_XMOEDAESTR  = 'Nome da Moeda Estrangeira';

implementation

end.

