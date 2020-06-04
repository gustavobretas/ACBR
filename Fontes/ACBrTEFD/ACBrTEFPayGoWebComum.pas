{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
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

unit ACBrTEFPayGoWebComum;

interface

uses
  Classes, SysUtils,
  ACBrTEFComum, ACBrBase;

resourcestring
  sErrLibJaInicializda = 'PW_iInit j� executado';
  sErrEventoNaoAtribuido = 'Evento %s n�o atribuido';
  sErrPWRET_WRITERR = 'Falha de grava��o no diret�rio %s';
  sErrPWRET_INVCALL = 'J� foi efetuada uma chamada � fun��o PW_iInit';
  sErrPWRET_NODATA = 'A informa��o solicitada n�o est� dispon�vel';
  sErrPWRET_BUFOVFLW = 'O valor da informa��o solicitada n�o cabe no Buffer alocado';
  sErrPWRET_DLLNOTINIT = 'Biblioteca PGWebLib n�o foi inicializada';
  sErrPWRET_TRNNOTINIT = 'N�o foi iniciada uma Transa��o';
  sErrPWRET_NOTINST = '� necess�rio efetuar uma transa��o de Instala��o';
  sErrPWRET_INVPARAM = 'Valor %s Inv�lido para par�metro %s';
  sErrPWRET_NOMANDATORY = 'Par�metros obrigat�rios n�o informados';

const
  {$IFDEF LINUX}
   CACBrTEFPGWebLib = 'PGWebLib.so';
  {$ELSE}
   CACBrTEFPGWebLib = 'PGWebLib.dll';
  {$ENDIF}

  CSleepNothing = 100;

//==========================================================================================
// N�mero maximo de itens em um menu de sele��o
//==========================================================================================
  PWMENU_MAXINTENS = 40;

//==========================================================
// Erros espec�ficos da biblioteca compartilhada de PIN-pad
//==========================================================
  PWRET_PPS_MAX  = -2100;
  PWRET_PPS_MIN  = PWRET_PPS_MAX - 100;


//==========================================================================================
//    C�digos de Confirma��o de Transa��o
//==========================================================================================
  PWCNF_CNF_AUTO     = 289;     // A transa��o foi confirmada pelo Ponto de Captura, sem interven��o do usu�rio.
  PWCNF_CNF_MANU_AUT = 12833;   // A transa��o foi confirmada manualmente na Automa��o.*/
  PWCNF_REV_MANU_AUT = 12849;   // A transa��o foi desfeita manualmente na Automa��o.*/
  PWCNF_REV_PRN_AUT  = 78129;   // A transa��o foi desfeita pela Automa��o, devido a uma falha na impress�o do comprovante (n�o fiscal). A priori, n�o usar. Falhas na impress�o n�o devem gerar desfazimento, deve ser solicitada a reimpress�o da transa��o.*/
  PWCNF_REV_DISP_AUT = 143665;  // A transa��o foi desfeita pela Automa��o, devido a uma falha no mecanismo de libera��o da mercadoria.*/
  PWCNF_REV_COMM_AUT = 209201;  // A transa��o foi desfeita pela Automa��o, devido a uma falha de comunica��o/integra��o com o ponto de captura (Cliente Muxx).*/
  PWCNF_REV_ABORT    = 274737;  // A transa��o n�o foi finalizada, foi interrompida durante a captura de dados.*/
  PWCNF_REV_OTHER_AUT= 471345;  // A transa��o foi desfeita a pedido da Automa��o, por um outro motivo n�o previsto.*/
  PWCNF_REV_PWR_AUT  = 536881;  // A transa��o foi desfeita automaticamente pela Automa��o, devido a uma queda de energia (rein�cio abrupto do sistema).*/
  PWCNF_REV_FISC_AUT = 602417;  // A transa��o foi desfeita automaticamente pela Automa��o, devido a uma falha de registro no sistema fiscal (impressora S@T, on-line, etc.).*/

//=========================================================================================
// Tipos de evento a serem ativados para monitora��o no PIN-pad
//==========================================================================================
  PWPPEVTIN_KEYS = 1;   // Acionamento de teclas
  PWPPEVTIN_MAG  = 2;   // Passagem de cart�o magn�tico
  PWPPEVTIN_ICC  = 4;   // Inser��o de cart�o com chip.
  PWPPEVTIN_CTLS = 8;   // Aproxima��o de um cart�o sem contato

//==========================================================================================
//  Tipos de evento retornados pelo PIN-pad
//==========================================================================================
  PWPPEVT_MAGSTRIPE = 1;     //  01h Foi passado um cart�o magn�tico.
  PWPPEVT_ICC       = 2;     //  02h Foi detectada a presen�a de um cart�o com chip.
  PWPPEVT_CTLS      = 3;     //  03h Foi detectada a presen�a de um cart�o sem contato.
  PWPPEVT_KEYCONF   = 17;    //  11h Foi pressionada a tecla [OK].
  PWPPEVT_KEYBACKSP = 18;    //  12h Foi pressionada a tecla [CORRIGE].
  PWPPEVT_KEYCANC   = 19;    //  13h Foi pressionada a tecla [CANCELA].
  PWPPEVT_KEYF1     = 33;    //  21h Foi pressionada a tecla [F1].
  PWPPEVT_KEYF2     = 34;    //  22h Foi pressionada a tecla [F2].
  PWPPEVT_KEYF3     = 35;    //  23h Foi pressionada a tecla [F3].
  PWPPEVT_KEYF4     = 36;    //  24h Foi pressionada a tecla [F4].

//==========================================================================================
//  Tabela de C�digos de retorno das transa��es
//==========================================================================================
  PWOPER_NULL        = 0;   // Testa comunica��o com a infraestrutura do Pay&Go Web
  PWOPER_INSTALL     = 1;   // Registra o Ponto de Captura perante a infraestrutura do Pay&Go Web, para que seja autorizado a realizar transa��es
  PWOPER_PARAMUPD    = 2;   // Obt�m da infraestrutura do Pay&Go Web os par�metros de opera��o atualizados do Ponto de Captura.
  PWOPER_REPRINT     = 16;  // Obt�m o �ltimo comprovante gerado por uma transa��o
  PWOPER_RPTTRUNC    = 17;  // Obt�m um relat�rio sint�tico das transa��es realizadas desde a �ltima obten��o deste relat�rio
  PWOPER_RPTDETAIL   = 18;  // Relat�rio detalhado das transa��es realizadas na data informada, ou data atual.
  PWOPER_ADMIN       = 32;  // Acessa qualquer transa��o que n�o seja disponibilizada pelo comando PWOPER_SALE. Um menu � apresentado para o operador selecionar a transa��o desejada.
  PWOPER_SALE        = 33;  // (Venda) Realiza o pagamento de mercadorias e/ou servi�os vendidos pelo Estabelecimento ao Cliente (tipicamente, com cart�o de cr�dito/d�bito), transferindo fundos entre as respectivas contas.
  PWOPER_SALEVOID    = 34;  // (Cancelamento de venda) Cancela uma transa��o PWOPER_SALE, realizando a transfer�ncia de fundos inversa
  PWOPER_PREPAID     = 35;  // Realiza a aquisi��o de cr�ditos pr�-pagos (por exemplo, recarga de celular).
  PWOPER_CHECKINQ    = 36;  // Consulta a validade de um cheque papel
  PWOPER_RETBALINQ   = 37;  // Consulta o saldo/limite do Estabelecimento (tipicamente, limite de cr�dito para venda de cr�ditos pr�-pagos).
  PWOPER_CRDBALINQ   = 38;  // Consulta o saldo do cart�o do Cliente
  PWOPER_INITIALIZ   = 39;  // (Inicializa��o/abertura) Inicializa a opera��o junto ao Provedor e/ou obt�m/atualiza os par�metros de opera��o mantidos por este
  PWOPER_SETTLEMNT   = 40;  // (Fechamento/finaliza��o) Finaliza a opera��o junto ao Provedor
  PWOPER_PREAUTH     = 41;  // (Pr�-autoriza��o) Reserva o valor correspondente a uma venda no limite do cart�o de cr�dito de um Cliente, por�m sem efetivar a transfer�ncia de fundos.
  PWOPER_PREAUTVOID  = 42;  // (Cancelamento de pr�-autoriza��o) Cancela uma transa��o PWOPER_PREAUTH, liberando o valor reservado no limite do cart�o de cr�dito
  PWOPER_CASHWDRWL   = 43;  // (Saque) Registra a retirada de um valor em esp�cie pelo Cliente no Estabelecimento, para transfer�ncia de fundos nas respectivas contas
  PWOPER_LOCALMAINT  = 44;  // (Baixa t�cnica) Registra uma interven��o t�cnica no estabelecimento perante o Provedor.
  PWOPER_FINANCINQ   = 45;  // Consulta as taxas de financiamento referentes a uma poss�vel venda parcelada, sem efetivar a transfer�ncia de fundos ou impactar o limite de cr�dito do Cliente
  PWOPER_ADDRVERIF   = 46;  // Verifica junto ao Provedor o endere�o do Cliente
  PWOPER_SALEPRE     = 47;  // Efetiva uma pr�-autoriza��o (PWOPER_PREAUTH), previamente realizada, realizando a transfer�ncia de fundos entre as contas do Estabelecimento e do Cliente
  PWOPER_LOYCREDIT   = 48;  // Registra o ac�mulo de pontos pelo Cliente, a partir de um programa de fidelidade.
  PWOPER_LOYCREDVOID = 49;  // Cancela uma transa��o PWOPER_LOYCREDIT
  PWOPER_LOYDEBIT    = 50;  // Registra o resgate de pontos/pr�mio pelo Cliente, a partir de um programa de fidelidade.
  PWOPER_LOYDEBVOID  = 51;  // Cancela uma transa��o PWOPER_LOYDEBIT
  PWOPER_VOID        = 57;  // Exibe um menu com os cancelamentos dispon�veis, caso s� exista um tipo, este � selecionado automaticamente
  PWOPER_VERSION     = 252; // (Vers�o) Permite consultar a vers�o da biblioteca atualmente em uso.
  PWOPER_CONFIG      = 253; // (Configura��o) Visualiza e altera os par�metros de opera��o locais da biblioteca
  PWOPER_MAINTENANCE = 254; // (Manuten��o) Apaga todas as configura��es do Ponto de Captura, devendo ser novamente realizada uma transa��o de Instala��o.

//==========================================================================================
//   Tipos de dados que podem ser informados pela Automa��o
//==========================================================================================
  PWINFO_OPERATION      = 2;      // Tipo de transa��o (PWOPER_xxx). Consultar os valores poss�veis na descri��o da fun��o PW_iNewTransac
  PWINFO_POSID          = 17;     // Identificador do Ponto de Captura.
  PWINFO_AUTNAME        = 21;     // Nome do aplicativo de Automa��o
  PWINFO_AUTVER         = 22;     // Vers�o do aplicativo de Automa��o
  PWINFO_AUTDEV         = 23;     // Empresa desenvolvedora do aplicativo de Automa��o.
  PWINFO_DESTTCPIP      = 27;     // Endere�o TCP/IP para comunica��o com a infraestrutura Pay&Go Web, no formato <endere�o IP>:<porta TCP> ou <nome do servidor>:<porta TCP>
  PWINFO_MERCHCNPJCPF   = 28;     // CNPJ (ou CPF) do Estabelecimento, sem formata��o. No caso de estarem sendo utilizadas afilia��es de mais de um estabelecimento, este dado pode ser adicionado pela automa��o para selecionar previamente o estabelecimento a ser utilizado para determinada transa��o. Caso este dado n�o seja informado, ser� solicitada a exibi��o de um menu para a escolha dentre os v�rios estabelecimentos dispon�veis.
  PWINFO_AUTCAP         = 36;     // Capacidades da Automa��o (soma dos valores abaixo): 1: funcionalidade de troco/saque; 2: funcionalidade de desconto; 4: valor fixo, sempre incluir; 8: impress�o das vias diferenciadas do comprovante para Cliente/Estabelecimento; 16: impress�o do cupom reduzido. 32: utiliza��o de saldo total do voucher para abatimento do valor da compra.
  PWINFO_TOTAMNT        = 37;     // Valor total da opera��o, considerando PWINFO_CURREXP (em centavos se igual a 2), incluindo desconto, saque, gorjeta, taxa de embarque, etc.
  PWINFO_CURRENCY       = 38;     // Moeda (padr�o ISO4217, 986 para o Real)
  PWINFO_CURREXP        = 39;     // Expoente da moeda (2 para centavos)
  PWINFO_FISCALREF      = 40;     // Identificador do documento fiscal
  PWINFO_CARDTYPE       = 41;     // Tipo de cart�o utilizado (PW_iGetResult), ou tipos de cart�o aceitos (soma dos valores abaixo, PW_iAddParam): 1: cr�dito 2: d�bito 4: voucher/PAT 8: outros
  PWINFO_PRODUCTNAME    = 42;     // Nome/tipo do produto utilizado, na nomenclatura do Provedor.
  PWINFO_DATETIME       = 49;     // Data e hora local da transa��o, no formato �AAAAMMDDhhmmss�
  PWINFO_REQNUM         = 50;     // Refer�ncia local da transa��o
  PWINFO_AUTHSYST       = 53;     // Nome do Provedor: �ELAVON�; �FILLIP�; �LIBERCARD�; �RV�; etc
  PWINFO_VIRTMERCH      = 54;     // Identificador do Estabelecimento
  PWINFO_AUTMERCHID     = 56;     // Identificador do estabelecimento para o Provedor (c�digo de afilia��o).
  PWINFO_PHONEFULLNO    = 58;     // N�mero do telefone, com o DDD (10 ou 11 d�gitos).
  PWINFO_FINTYPE        = 59;     // Modalidade de financiamento da transa��o: 1: � vista 2: parcelado pelo emissor 4: parcelado pelo estabelecimento 8: pr�-datado
  PWINFO_INSTALLMENTS   = 60;     // Quantidade de parcelas
  PWINFO_INSTALLMDATE   = 61;     // Data de vencimento do pr�-datado, ou da primeira parcela. Formato �DDMMAA
  PWINFO_PRODUCTID      = 62;     // Identifica��o do produto utilizado, de acordo com a nomenclatura do Provedor.
  PWINFO_RESULTMSG      = 66;     // Mensagem descrevendo o resultado final da transa��o, seja esta bem ou mal sucedida (conforme �4.3.Interface com o usu�rio�, p�gina 8
  PWINFO_CNFREQ         = 67;     // Necessidade de confirma��o: 0: n�o requer confirma��o; 1: requer confirma��o.
  PWINFO_AUTLOCREF      = 68;     // Refer�ncia da transa��o para a infraestrutura Pay&Go Web
  PWINFO_AUTEXTREF      = 69;     // Refer�ncia da transa��o para o Provedor (NSU host).
  PWINFO_AUTHCODE       = 70;     // C�digo de autoriza��o
  PWINFO_AUTRESPCODE    = 71;     // C�digo de resposta da transa��o (campo ISO8583:39)
  PWINFO_AUTDATETIME    = 72;     // Data/hora da transa��o para o Provedor, formato �AAAAMMDDhhmmss�.
  PWINFO_DISCOUNTAMT    = 73;     // Valor do desconto concedido pelo Provedor, considerando PWINFO_CURREXP, j� deduzido em PWINFO_TOTAMNT
  PWINFO_CASHBACKAMT    = 74;     // Valor do saque/troco, considerando PWINFO_CURREXP, j� inclu�do em PWINFO_TOTAMNT
  PWINFO_CARDNAME       = 75;     // Nome do cart�o ou do emissor do cart�o
  PWINFO_ONOFF          = 76;     // Modalidade da transa��o: 1: online 2: off-line
  PWINFO_BOARDINGTAX    = 77;     // Valor da taxa de embarque, considerando PWINFO_CURREXP, j� inclu�do em PWINFO_TOTAMNT
  PWINFO_TIPAMOUNT      = 78;     // Valor da taxa de servi�o (gorjeta), considerando PWINFO_CURREXP, j� inclu�do em PWINFO_TOTAMNT
  PWINFO_INSTALLM1AMT   = 79;     // Valor da entrada para um pagamento parcelado, considerando PWINFO_CURREXP, j� inclu�do em PWINFO_TOTAMNT
  PWINFO_INSTALLMAMNT   = 80;     // Valor da parcela, considerando PWINFO_CURREXP, j� inclu�do em PWINFO_TOTAMNT
  PWINFO_RCPTFULL       = 82;     // Comprovante para impress�o � Via completa. At� 40 colunas, quebras de linha identificadas pelo caractere 0Dh
  PWINFO_RCPTMERCH      = 83;     // Comprovante para impress�o � Via diferenciada para o Estabelecimento. At� 40 colunas, quebras de linha identificadas pelo caractere 0Dh.
  PWINFO_RCPTCHOLDER    = 84;     // Comprovante para impress�o � Via diferenciada para o Cliente. At� 40 colunas, quebras de linha identificadas pelo caractere 0Dh.
  PWINFO_RCPTCHSHORT    = 85;     // Comprovante para impress�o � Cupom reduzido (para o Cliente). At� 40 colunas, quebras de linha identificadas pelo caractere 0Dh
  PWINFO_TRNORIGDATE    = 87;     // Data da transa��o original, no caso de um cancelamento ou uma confirma��o de pr�-autoriza��o (formato �DDMMAA�).
  PWINFO_TRNORIGNSU     = 88;     // NSU da transa��o original, no caso de um cancelamento ou uma confirma��o de pr�-autoriza��
  PWINFO_SALDOVOUCHER   = 89;     // Saldo do cart�o voucher recebido do autorizador
  PWINFO_TRNORIGAMNT    = 96;     // Valor da transa��o original, no caso de um cancelamento ou uma confirma��o de pr�-autoriza��o.
  PWINFO_TRNORIGAUTH    = 98;     // C�digo de autoriza��o da transa��o original, no caso de um cancelamento ou uma confirma��o de pr�-autoriza��o
  PWINFO_LANGUAGE       = 108;    // Idioma a ser utilizado para a interface com o cliente: 0: Portugu�s 1: Ingl�s 2: Espanhol
  PWINFO_PROCESSMSG     = 111;    // Mensagem a ser exibida para o cliente durante o processamento da transa��o
  PWINFO_TRNORIGREQNUM  = 114;    // N�mero da solicita��o da transa��o original, no caso de um cancelamento ou uma confirma��o de pr�-autoriza��o
  PWINFO_TRNORIGTIME    = 115;    // Hora da transa��o original, no caso de um cancelamento ou uma confirma��o de pr�-autoriza��o (formato �HHMMSS�).
  PWINFO_CNCDSPMSG      = 116;    // Mensagem a ser exibida para o operador no terminal no caso da transa��o ser abortada (cancelamento ou timeout).
  PWINFO_CNCPPMSG       = 117;    // Mensagem a ser exibida para o portador no PIN-pad no caso da transa��o ser abortada (cancelamento ou timeout).
  PWINFO_CARDENTMODE    = 192;    // Modo(s) de entrada do cart�o: 1: digitado 2: tarja magn�tica 4: chip com contato 16: fallback de chip para tarja 32: chip sem contato simulando tarja (cliente informa tipo efetivamente utilizado) 64: chip sem contato EMV (cliente informa tipo efetivamente utilizado) 256: fallback de tarja para digitado
  PWINFO_CARDFULLPAN    = 193;    // N�mero do cart�o completo, para transa��o digitada. Este dado n�o pode ser recuperado pela fun��o PW_iGetResult
  PWINFO_CARDEXPDATE    = 194;    // Data de vencimento do cart�o (formato �MMAA�).
  PWINFO_CARDNAMESTD    = 196;    // Descri��o do produto bandeira padr�o relacionado ao BIN.
  PWINFO_CARDPARCPAN    = 200;    // N�mero do cart�o, truncado ou mascarado
  PWINFO_CHOLDVERIF     = 207;    // Verifica��o do portador, soma dos seguintes valores: �1�: Assinatura do portador em papel. �2�: Senha verificada off-line. �4�: Senha off-line bloqueada no decorrer desta transa��o. �8�: Senha verificada online
  PWINFO_AID            = 216;    // Aplica��o do cart�o utilizada durante a transa��o
  PWINFO_BARCODENTMODE  = 233;    // Modo(s) de entrada do c�digo de barras: 1:  digitado; 2:  lido atrav�s de dispositivo eletr�nico.
  PWINFO_BARCODE        = 234;    // C�digo de barras completo, lido ou digitado
  PWINFO_MERCHADDDATA1  = 240;    // Dados adicionais relevantes para a Automa��o (#1)
  PWINFO_MERCHADDDATA2  = 241;    // Dados adicionais relevantes para a Automa��o (#2)
  PWINFO_MERCHADDDATA3  = 242;    // Dados adicionais relevantes para a Automa��o (#3)
  PWINFO_MERCHADDDATA4  = 243;    // Dados adicionais relevantes para a Automa��o (#4)
  PWINFO_RCPTPRN        = 244;    // Indica quais vias de comprovante devem ser impressas: 0: n�o h� comprovante 1: imprimir somente a via do Cliente 2: imprimir somente a via do Estabelecimento 3: imprimir ambas as vias do Cliente e do Estabelecimento
  PWINFO_AUTHMNGTUSER   = 245;    // Identificador do usu�rio autenticado com a senha do lojista
  PWINFO_AUTHTECHUSER   = 246;    // Identificador do usu�rio autenticado com a senha t�cnica.
  PWINFO_PAYMNTTYPE     = 7969;   // Modalidade de pagamento: 1: cart�o 2: dinheiro 3: cheque
  PWINFO_CHOLDERNAME    = 7992;   // Nome do portador do cart�o utilizado, o tamanho segue o mesmo padr�o da tag 5F20 EMV.
  PWINFO_USINGPINPAD    = 32513;  // Indica se o ponto de captura faz ou n�o o uso de PIN-pad: 0: N�o utiliza PIN-pad; 1: Utiliza PIN-pad.
  PWINFO_PPCOMMPORT     = 32514;  // N�mero da porta serial � qual o PIN-pad est� conectado. O valor 0 (zero) indica uma busca autom�tica desta porta
  PWINFO_IDLEPROCTIME   = 32516;  // Pr�xima data e hor�rio em que a fun��o PW_iIdleProc deve ser chamada pela Automa��o. Formato �AAMMDDHHMMSS�
  PWINFO_PNDAUTHSYST    = 32517;  // Nome do provedor para o qual existe uma transa��o pendente.
  PWINFO_PNDVIRTMERCH   = 32518;  // Identificador do Estabelecimento para o qual existe uma transa��o pendente
  PWINFO_PNDREQNUM      = 32519;  // Refer�ncia local da transa��o que est� pendente.
  PWINFO_PNDAUTLOCREF   = 32520;  // Refer�ncia para a infraestrutura Pay&Go Web da transa��o que est� pendente.
  PWINFO_PNDAUTEXTREF   = 32521;  // Refer�ncia para o Provedor da transa��o que est� pendente
  PWINFO_LOCALINFO1     = 32522;  // Texto exibido para um item de menu selecionado pelo usu�rio
  PWINFO_SERVERPND      = 32523;  // Indica se o ponto de captura possui alguma pend�ncia a ser resolvida com o Pay&Go Web: 0: n�o possui pend�ncia; 1: possui pend�ncia
  PWINFO_PPINFO         = 32533;  // Informa��es do PIN-pad conectado, seguindo o padr�o posi��o/informa��o abaixo: 001-020 / Nome do fabricante do PIN-pad. 021-039 / Modelo/vers�o do hardware. 040 / Se o PIN-pad suporta cart�o com chip sem contato, este campo deve conter a letra �C�, caso contr�rio um espa�o em branco. 041-060 / Vers�o do software b�sico/firmware. 061-064 / Vers�o da especifica��o, no formato �V.VV�. 065-080 / Vers�o da aplica��o b�sica, no formato �VVV.VV AAMMDD� (com 3 espa�os � direita). 081-100 / N�mero de s�rie do PIN-pad (com espa�os � direita)
  PWINFO_DUEAMNT        = 48902;  // Valor devido pelo usu�rio, considerando PWINFO_CURREXP, j� deduzido em PWINFO_TOTAMNT
  PWINFO_READJUSTEDAMNT = 48905;  // Valor total da transa��o reajustado, este campo ser� utilizado caso o autorizador, por alguma regra de neg�cio espec�fica dele, resolva alterar o valor total que foi solicitado para a transa��o

  //===========================================================
  //  Tabela de C�digos de Erro de Retorno da Biblioteca
  //===========================================================
  PWRET_OK                 = 0;      // Opera��o bem sucedida
  PWRET_FROMHOSTPENDTRN    = -2599;  // Existe uma transa��o pendente, � necess�rio confirmar ou desfazer essa transa��o atrav�s de PW_iConfirmation.
  PWRET_FROMHOSTPOSAUTHERR = -2598;  // Falha de autentica��o do ponto de captura com a infraestrutura do Pay&Go Web.
  PWRET_FROMHOSTUSRAUTHERR = -2597;  // Falha de autentica��o do usu�rio
  PWRET_FROMHOST           = -2596;  // Erro retornado pela infraestrutura do Pay&Go Web. Verificar a mensagem (PWINFO_RESULTMSG) para mais informa��es
  PWRET_TLVERR             = -2595;  // Falha de comunica��o com a infraestrutura do Pay&Go Web (codifica��o da mensagem).
  PWRET_SRVINVPARAM        = -2594;  // Falha de comunica��o com a infraestrutura do Pay&Go Web (par�metro inv�lido).
  PWRET_REQPARAM           = -2593;  // Falha de comunica��o com a infraestrutura do Pay&Go Web (falta par�metro obrigat�rio).
  PWRET_HOSTCONNUNK        = -2592;  // Erro interno da biblioteca (conex�o ao host).
  PWRET_INTERNALERR        = -2591;  // Erro interno da biblioteca
  PWRET_BLOCKED            = -2590;  // O ponto de captura foi bloqueado para uso
  PWRET_FROMHOSTTRNNFOUND  = -2589;  // A transa��o referenciada (cancelamento, confirma��o, etc.) n�o foi encontrada.
  PWRET_PARAMSFILEERR      = -2588;  // Inconsist�ncia dos par�metros de opera��o recebidos da infraestrutura do Pay&Go Web
  PWRET_NOCARDENTMODE      = -2587;  // O Ponto de Captura n�o tem a capacidade de efetuar a captura do cart�o atrav�s dos tipos de entrada especificados pelo Pay&Go Web
  PWRET_INVALIDVIRTMERCH   = -2586;  // Falha de comunica��o com a infraestrutura do Pay&Go Web (c�digo de afilia��o inv�lido).
  PWRET_HOSTTIMEOUT        = -2585;  // Falha de comunica��o com a infraestrutura do Pay&Go Web (tempo de resposta esgotado).
  PWRET_CONFIGREQUIRED     = -2584;  // Erro de configura��o. � necess�rio acionar a fun��o de configura��o.
  PWRET_HOSTCONNERR        = -2583;  // Falha de conex�o � infraestrutura do Pay&Go Web
  PWRET_HOSTCONNLOST       = -2582;  // A conex�o com a infraestrutura do Pay&Go Web foi interrompida
  PWRET_FILEERR            = -2581;  // Falha no acesso aos arquivos da biblioteca de integra��o
  PWRET_PINPADERR          = -2580;  // Falha de comunica��o com o PIN-pad (aplica��o).
  PWRET_MAGSTRIPEERR       = -2579;  // Formato de tarja magn�tica n�o reconhecido
  PWRET_PPCRYPTERR         = -2578;  // Falha de comunica��o com o PIN-pad (comunica��o segura).
  PWRET_SSLCERTERR         = -2577;  // Falha no certificado SSL
  PWRET_SSLNCONN           = -2576;  // Falha ao tentar estabelecer conex�o SSL
  PWRET_GPRSATTACHFAILED   = -2575;  // Falha no registro GPRS.
  PWRET_INVPARAM           = -2499;  // Par�metro inv�lido passado � fun��o
  PWRET_NOTINST            = -2498;  // Ponto de Captura n�o instalado. � necess�rio acionar a fun��o de Instala��o.
  PWRET_MOREDATA           = -2497;  // Ainda existem dados que precisam ser capturados para a transa��o poder ser realizada
  PWRET_NODATA             = -2496;  // A informa��o solicitada n�o est� dispon�vel.
  PWRET_DISPLAY            = -2495;  // A Automa��o deve apresentar uma mensagem para o operador
  PWRET_INVCALL            = -2494;  // Fun��o chamada no momento incorreto
  PWRET_NOTHING            = -2493;  // Nada a fazer, continuar o processamento
  PWRET_BUFOVFLW           = -2492;  // O tamanho da �rea de mem�ria informado � insuficiente.
  PWRET_CANCEL             = -2491;  // Opera��o cancelada pelo operador
  PWRET_TIMEOUT            = -2490;  // Tempo limite excedido para a��o do operador
  PWRET_PPNOTFOUND         = -2489;  // PIN-pad n�o encontrado na busca efetuada.
  PWRET_TRNNOTINIT         = -2488;  // N�o foi chamada a fun��o PW_iNewTransac
  PWRET_DLLNOTINIT         = -2487;  // N�o foi chamada a fun��o PW_iInit
  PWRET_FALLBACK           = -2486;  // Ocorreu um erro no cart�o magn�tico, passar a aceitar o cart�o digitado, caso j� n�o esteja sendo aceito
  PWRET_WRITERR            = -2485;  // Falha de grava��o no diret�rio de trabalho.
  PWRET_PPCOMERR           = -2484;  // Falha na comunica��o com o PIN-pad (protocolo).
  PWRET_NOMANDATORY        = -2483;  // Algum dos par�metros obrigat�rios n�o foi adicionado
  PWRET_INVALIDTRN         = -2482;  // A transa��o informada para confirma��o n�o existe ou j� foi confirmada anteriormente.
  PWRET_PPS_XXX            = -2200;  // Erros retornados pelo PIN-pad, conforme se��o 10.2

//==========================================================================================
// Tipos utilizados na captura de dados dinamica
//==========================================================================================
  PWDAT_MENU         = 1;   // menu de op��es
  PWDAT_TYPED        = 2;   // entrada digitada
  PWDAT_CARDINF      = 3;   // dados de cart�o
  PWDAT_PPENTRY      = 5;   // entrada digitada no PIN-pad
  PWDAT_PPENCPIN     = 6;   // senha criptografada
  PWDAT_CARDOFF      = 9;   // processamento off-line de cart�o com chip
  PWDAT_CARDONL      = 10;  // processamento on-line de cart�o com chip
  PWDAT_PPCONF       = 11;  // confirma��o de informa��o no PIN-pad
  PWDAT_BARCODE      = 12;  // C�digo de barras, lido ou digitado
  PWDAT_PPREMCRD     = 13;  // Remo��o do cart�o do PIN-pad.
  PWDAT_PPGENCMD     = 14;  // comando propriet�rio da rede no PIN-pad.
  PWDAT_PPDATAPOSCNF = 16;  // confirma��o positiva de dados no PIN-pad.
  PWDAT_USERAUTH     = 17;  // valida��o da senha.

//==========================================================================================
// Tipos de opera��o, utilizados na fun��o PW_iGetOperations
//==========================================================================================
  PWOPTYPE_ADMIN  = 1;  // Opera��es administrativas (relat�rio, reimpress�o, etc).
  PWOPTYPE_SALE   = 2;  // Opera��es financeiras.

//==========================================================================================
// Dados digitado pelo portador do cart�o no PIN-pad.
//==========================================================================================
  PWDPIN_DIGITE_O_DDD                = 1;
  PWDPIN_REDIGITE_O_DDD              = 2;
  PWDPIN_DIGITE_O_TELEFONE           = 3;
  PWDPIN_REDIGITE_O_TELEFONE         = 4;
  PWDPIN_DIGITE_DDD_TELEFONE         = 5;
  PWDPIN_REDIGITE_DDD_TELEFONE       = 6;
  PWDPIN_DIGITE_O_CPF                = 7;
  PWDPIN_REDIGITE_O_CPF              = 8;
  PWDPIN_DIGITE_O_RG                 = 9;
  PWDPIN_REDIGITE_O_RG               = 10;
  PWDPIN_DIGITE_OS_4_ULTIMOS_DIGITOS = 11;
  PWDPIN_DIGITE_CODIGO_DE_SEGURANCA  = 12;

//==========================================================================================
//  Tipos de Cart�es
//==========================================================================================
  PWCARTAO_NaoDefinido = 0;
  PWCARTAO_Credito     = 1;
  PWCARTAO_Debito      = 2;
  PWCARTAO_Voucher     = 4;
  PWCARTAO_Outros      = 8;

//==========================================================================================
//  Tipos de Vendas
//==========================================================================================
  PWTVENDA_NaoDefinido              = 0;
  PWTVENDA_AVista                   = 1;
  PWTVENDA_ParceladoEmissor         = 2;
  PWTVENDA_ParceladoEstabelecimento = 4;
  PWTVENDA_PreDatado                = 8;

type
  EACBrTEFPayGoWeb = class(EACBrTEFErro);

  TACBrTEFRespHack = class(TACBrTEFResp);    // Hack para acessar conteudo Protected

  { TACBrTEFRespPGWeb }

  TACBrTEFRespPGWeb = class(TACBrTEFResp)
  public
    procedure ConteudoToProperty; override;
  end;

  //========================================================
  // Record que descreve cada membro da estrutura PW_GetData:
  //========================================================
  TPW_GetData = record
    wIdentificador : Word;
    bTipoDeDado : Byte;
     szPrompt: Array[0..83] of AnsiChar;
    bNumOpcoesMenu: Byte;
    vszTextoMenu: Array[0..PWMENU_MAXINTENS-1] of Array[0..40] of AnsiChar;
    vszValorMenu: Array[0..PWMENU_MAXINTENS-1] of Array[0..255] of AnsiChar;
    szMascaraDeCaptura: Array[0..40] of AnsiChar;
    bTiposEntradaPermitidos: Byte;
    bTamanhoMinimo: Byte;
    bTamanhoMaximo: Byte;
    ulValorMinimo : LongWord;
    ulValorMaximo : LongWord;
    bOcultarDadosDigitados: Byte;
    bValidacaoDado: Byte;
    bAceitaNulo: Byte;
    szValorInicial: Array[0..40] of AnsiChar;
    bTeclasDeAtalho: Byte;
    szMsgValidacao: Array[0..83] of AnsiChar;
    szMsgConfirmacao: Array[0..83] of AnsiChar;
    szMsgDadoMaior: Array[0..83] of AnsiChar;
    szMsgDadoMenor: Array[0..83] of AnsiChar;
    bCapturarDataVencCartao: Byte;
    ulTipoEntradaCartao: LongWord;
    bItemInicial: Byte;
    bNumeroCapturas: Byte;
    szMsgPrevia: Array[0..83] of AnsiChar;
    bTipoEntradaCodigoBarras: Byte;
    bOmiteMsgAlerta: Byte;
    bIniciaPelaEsquerda: Byte;
    bNotificarCancelamento: Byte;
    bAlinhaPelaDireita: Byte;
  end;

  PW_GetData = Array[0..10] of TPW_GetData;

  //====================================================================
  // Estrutura para armazenamento de dados para Tipos de Opera��o
  //====================================================================
  TPW_Operations = record
    bOperType: Byte;
    szText: Array[0..21] of AnsiChar;
    szValue: Array[0..21] of AnsiChar;
  end;

  PW_Operations = Array[0..9] of TPW_Operations;

  TACBrTEFPGWebAPIExibeMenu = procedure(Titulo: String; Opcoes: TStringList;
    var ItemSelecionado: Integer) of object ;

  TACBrTEFPGWebAPIObtemCampo = procedure(Titulo: String;
    TamanhoMinimo, TamanhoMaximo: Integer ;
    TipoCampo: Integer; Operacao : TACBrTEFDCliSiTefOperacaoCampo;
    var Resposta : AnsiString)
    of object ;

  { TACBrTEFPGWebAPI }

  TACBrTEFPGWebAPI = class
  private
    fDiretorioTrabalho: String;
    fImprimirViaClienteReduzida: Boolean;
    fInicializada: Boolean;
    fNomeAplicacao: String;
    fOnExibeMenu: TACBrTEFPGWebAPIExibeMenu;
    fOnGravarLog: TACBrGravarLog;
    fPathDLL: String;
    fSoftwareHouse: String;
    fSuportaDesconto: Boolean;
    fSuportaSaque: Boolean;
    fSuportaViasDiferenciadas: Boolean;
    fUtilizaSaldoTotalVoucher: Boolean;
    fVersaoAplicacao: String;

    xPW_iInit: function (const pszWorkingDir: PAnsiChar): SmallInt;
              {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iGetResult: function(iInfo: SmallInt; pszData: PAnsiChar; ulDataSize: LongWord): Smallint;
              {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iNewTransac: function(bOper: Byte): SmallInt;
              {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iAddParam: function(wParam: Word; const pszValue: PAnsiChar): SmallInt;
              {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iExecTransac: function(pvstParam: PW_GetData; var piNumParam: SmallInt): SmallInt;
              {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iConfirmation: function(ulResult: LongWord; const pszReqNum: PAnsiChar;
              const pszLocRef: PAnsiChar; const pszExtRef: PAnsiChar;
              const pszVirtMerch: PAnsiChar; const pszAuthSyst: PAnsiChar): SmallInt;
              {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iIdleProc: function(): SmallInt;
              {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iGetOperations: function(bOperType: Byte; vstOperations: PW_Operations;
              piNumOperations: SmallInt): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPEventLoop: function(pszDisplay: PAnsiChar; ulDisplaySize: LongWord): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPAbort: function(): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPGetCard: function(uiIndex: Word): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPGetPIN: function(uiIndex: Word): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPGetData: function(uiIndex: Word): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPGoOnChip: function(uiIndex: Word): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPFinishChip: function(uiIndex: Word): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPConfirmData: function(uiIndex: Word): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPGenericCMD: function(uiIndex: Word): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPDataConfirmation: function(uiIndex: Word): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPDisplay: function(const pszMsg: PAnsiChar): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPGetUserData: function(uiMessageId: Word; bMinLen: Byte; bMaxLen: Byte;
             iToutSec:  SmallInt; pszData: PAnsiChar): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPWaitEvent: function(var pulEvent: LongWord): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPRemoveCard: function(): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iPPGetPINBlock: function(bKeyID: Byte; const pszWorkingKey: PAnsiChar;
             bMinLen: Byte; bMaxLen: Byte; iToutSec: SmallInt;
             const pszPrompt: PAnsiChar; pszData: PAnsiChar): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};
    xPW_iTransactionInquiry: function(const pszXmlRequest: PAnsiChar;
             pszXmlResponse: PAnsiChar; ulXmlResponseLen: Word): SmallInt;
             {$IfDef MSWINDOWS}stdcall{$Else}cdecl{$EndIf};

    procedure SetDiretorioTrabalho(AValue: String);
    procedure SetInicializada(AValue: Boolean);
    procedure SetNomeAplicacao(AValue: String);
    procedure SetPathDLL(AValue: String);
    procedure SetSoftwareHouse(AValue: String);
    procedure SetVersaoAplicacao(AValue: String);
  protected
    procedure LoadDLLFunctions;
    procedure UnLoadDLLFunctions;
    procedure ClearMethodPointers;

    procedure VerificarOK(iRET: SmallInt);
    function ObterUltimoErro: String;

    procedure AdicionarDadosObrigatorios;
    function CalcularCapacidadesDaAutomacao: Integer;

    procedure ObterDados(ArrGetData: PW_GetData; ArrLen: SmallInt);
    procedure ObterDadoMenu(AGetData: TPW_GetData);
    procedure ObterDadoDigitado(AGetData: TPW_GetData);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Inicializar;
    procedure DesInicializar;

    function ObterResultado(iINFO: SmallInt): String;
    procedure GravarLog(const AString: AnsiString; Traduz: Boolean = False);

    procedure IniciarTransacao(iOPER: SmallInt);
    procedure AdicionarParametro(iINFO: Word; const AValor: AnsiString);
    procedure ExcutarTransacao;

    property PathDLL: String read fPathDLL write SetPathDLL;
    property DiretorioTrabalho: String read fDiretorioTrabalho write SetDiretorioTrabalho;
    property Inicializada: Boolean read fInicializada write SetInicializada;

    property SoftwareHouse: String read fSoftwareHouse write SetSoftwareHouse;
    property NomeAplicacao: String read fNomeAplicacao write SetNomeAplicacao ;
    property VersaoAplicacao: String read fVersaoAplicacao write SetVersaoAplicacao ;

    Property SuportaSaque: Boolean read fSuportaSaque write fSuportaSaque;
    Property SuportaDesconto: Boolean read fSuportaDesconto write fSuportaDesconto;
    property ImprimirViaClienteReduzida : Boolean read fImprimirViaClienteReduzida
      write fImprimirViaClienteReduzida;
    property SuportaViasDiferenciadas: Boolean read fSuportaViasDiferenciadas
      write fSuportaViasDiferenciadas;
    property UtilizaSaldoTotalVoucher: Boolean read fUtilizaSaldoTotalVoucher
      write fUtilizaSaldoTotalVoucher;

    property OnGravarLog: TACBrGravarLog read fOnGravarLog write fOnGravarLog;
    property OnExibeMenu: TACBrTEFPGWebAPIExibeMenu read fOnExibeMenu write fOnExibeMenu;
  end;

function PWINFOToString(iINFO: SmallInt): String;
function PWRETToString(iRET: SmallInt): String;
function PWOPERToString(iOPER: SmallInt): String;

implementation

uses
  ACBrUtil;

function PWINFOToString(iINFO: SmallInt): String;
begin
  case iINFO of
    PWINFO_OPERATION:       Result := 'PWINFO_OPERATION';
    PWINFO_POSID:           Result := 'PWINFO_POSID';
    PWINFO_AUTNAME:         Result := 'PWINFO_AUTNAME';
    PWINFO_AUTVER:          Result := 'PWINFO_AUTVER';
    PWINFO_AUTDEV:          Result := 'PWINFO_AUTDEV';
    PWINFO_DESTTCPIP:       Result := 'PWINFO_DESTTCPIP';
    PWINFO_MERCHCNPJCPF:    Result := 'PWINFO_MERCHCNPJCPF';
    PWINFO_AUTCAP:          Result := 'PWINFO_AUTCAP';
    PWINFO_TOTAMNT:         Result := 'PWINFO_TOTAMNT';
    PWINFO_CURRENCY:        Result := 'PWINFO_CURRENCY';
    PWINFO_CURREXP:         Result := 'PWINFO_CURREXP';
    PWINFO_FISCALREF:       Result := 'PWINFO_FISCALREF';
    PWINFO_CARDTYPE:        Result := 'PWINFO_CARDTYPE';
    PWINFO_PRODUCTNAME:     Result := 'PWINFO_PRODUCTNAME';
    PWINFO_DATETIME:        Result := 'PWINFO_DATETIME';
    PWINFO_REQNUM:          Result := 'PWINFO_REQNUM';
    PWINFO_AUTHSYST:        Result := 'PWINFO_AUTHSYST';
    PWINFO_VIRTMERCH:       Result := 'PWINFO_VIRTMERCH';
    PWINFO_AUTMERCHID:      Result := 'PWINFO_AUTMERCHID';
    PWINFO_PHONEFULLNO:     Result := 'PWINFO_PHONEFULLNO';
    PWINFO_FINTYPE:         Result := 'PWINFO_FINTYPE';
    PWINFO_INSTALLMENTS:    Result := 'PWINFO_INSTALLMENTS';
    PWINFO_INSTALLMDATE:    Result := 'PWINFO_INSTALLMDATE';
    PWINFO_PRODUCTID:       Result := 'PWINFO_PRODUCTID';
    PWINFO_RESULTMSG:       Result := 'PWINFO_RESULTMSG';
    PWINFO_CNFREQ:          Result := 'PWINFO_CNFREQ';
    PWINFO_AUTLOCREF:       Result := 'PWINFO_AUTLOCREF';
    PWINFO_AUTEXTREF:       Result := 'PWINFO_AUTEXTREF';
    PWINFO_AUTHCODE:        Result := 'PWINFO_AUTHCODE';
    PWINFO_AUTRESPCODE:     Result := 'PWINFO_AUTRESPCODE';
    PWINFO_AUTDATETIME:     Result := 'PWINFO_AUTDATETIME';
    PWINFO_DISCOUNTAMT:     Result := 'PWINFO_DISCOUNTAMT';
    PWINFO_CASHBACKAMT:     Result := 'PWINFO_CASHBACKAMT';
    PWINFO_CARDNAME:        Result := 'PWINFO_CARDNAME';
    PWINFO_ONOFF:           Result := 'PWINFO_ONOFF';
    PWINFO_BOARDINGTAX:     Result := 'PWINFO_BOARDINGTAX';
    PWINFO_TIPAMOUNT:       Result := 'PWINFO_TIPAMOUNT';
    PWINFO_INSTALLM1AMT:    Result := 'PWINFO_INSTALLM1AMT';
    PWINFO_INSTALLMAMNT:    Result := 'PWINFO_INSTALLMAMNT';
    PWINFO_RCPTFULL:        Result := 'PWINFO_RCPTFULL';
    PWINFO_RCPTMERCH:       Result := 'PWINFO_RCPTMERCH';
    PWINFO_RCPTCHOLDER:     Result := 'PWINFO_RCPTCHOLDER';
    PWINFO_RCPTCHSHORT:     Result := 'PWINFO_RCPTCHSHORT';
    PWINFO_TRNORIGDATE:     Result := 'PWINFO_TRNORIGDATE';
    PWINFO_TRNORIGNSU:      Result := 'PWINFO_TRNORIGNSU';
    PWINFO_SALDOVOUCHER:    Result := 'PWINFO_SALDOVOUCHER';
    PWINFO_TRNORIGAMNT:     Result := 'PWINFO_TRNORIGAMNT';
    PWINFO_TRNORIGAUTH:     Result := 'PWINFO_TRNORIGAUTH';
    PWINFO_LANGUAGE:        Result := 'PWINFO_LANGUAGE';
    PWINFO_PROCESSMSG:      Result := 'PWINFO_PROCESSMSG';
    PWINFO_TRNORIGREQNUM:   Result := 'PWINFO_TRNORIGREQNUM';
    PWINFO_TRNORIGTIME:     Result := 'PWINFO_TRNORIGTIME';
    PWINFO_CNCDSPMSG:       Result := 'PWINFO_CNCDSPMSG';
    PWINFO_CNCPPMSG:        Result := 'PWINFO_CNCPPMSG';
    PWINFO_CARDENTMODE:     Result := 'PWINFO_CARDENTMODE';
    PWINFO_CARDFULLPAN:     Result := 'PWINFO_CARDFULLPAN';
    PWINFO_CARDEXPDATE:     Result := 'PWINFO_CARDEXPDATE';
    PWINFO_CARDNAMESTD:     Result := 'PWINFO_CARDNAMESTD';
    PWINFO_CARDPARCPAN:     Result := 'PWINFO_CARDPARCPAN';
    PWINFO_CHOLDVERIF:      Result := 'PWINFO_CHOLDVERIF';
    PWINFO_AID:             Result := 'PWINFO_AID';
    PWINFO_BARCODENTMODE:   Result := 'PWINFO_BARCODENTMODE';
    PWINFO_BARCODE:         Result := 'PWINFO_BARCODE';
    PWINFO_MERCHADDDATA1:   Result := 'PWINFO_MERCHADDDATA1';
    PWINFO_MERCHADDDATA2:   Result := 'PWINFO_MERCHADDDATA2';
    PWINFO_MERCHADDDATA3:   Result := 'PWINFO_MERCHADDDATA3';
    PWINFO_MERCHADDDATA4:   Result := 'PWINFO_MERCHADDDATA4';
    PWINFO_RCPTPRN:         Result := 'PWINFO_RCPTPRN';
    PWINFO_AUTHMNGTUSER:    Result := 'PWINFO_AUTHMNGTUSER';
    PWINFO_AUTHTECHUSER:    Result := 'PWINFO_AUTHTECHUSER';
    PWINFO_PAYMNTTYPE:      Result := 'PWINFO_PAYMNTTYPE';
    PWINFO_CHOLDERNAME:     Result := 'PWINFO_CHOLDERNAME';
    PWINFO_USINGPINPAD:     Result := 'PWINFO_USINGPINPAD';
    PWINFO_PPCOMMPORT:      Result := 'PWINFO_PPCOMMPORT';
    PWINFO_IDLEPROCTIME:    Result := 'PWINFO_IDLEPROCTIME';
    PWINFO_PNDAUTHSYST:     Result := 'PWINFO_PNDAUTHSYST';
    PWINFO_PNDVIRTMERCH:    Result := 'PWINFO_PNDVIRTMERCH';
    PWINFO_PNDREQNUM:       Result := 'PWINFO_PNDREQNUM';
    PWINFO_PNDAUTLOCREF:    Result := 'PWINFO_PNDAUTLOCREF';
    PWINFO_PNDAUTEXTREF:    Result := 'PWINFO_PNDAUTEXTREF';
    PWINFO_LOCALINFO1:      Result := 'PWINFO_LOCALINFO1';
    PWINFO_SERVERPND:       Result := 'PWINFO_SERVERPND';
    PWINFO_PPINFO:          Result := 'PWINFO_PPINFO';
    PWINFO_DUEAMNT:         Result := 'PWINFO_DUEAMNT';
    PWINFO_READJUSTEDAMNT:  Result := 'PWINFO_READJUSTEDAMNT';
  else
    Result := 'PWINFO_'+IntToStr(iINFO);
  end;
end;

function PWRETToString(iRET: SmallInt): String;
begin
  case iRET of
    PWRET_OK:                   Result := 'PWRET_OK';
    PWRET_FROMHOSTPENDTRN:      Result := 'PWRET_FROMHOSTPENDTRN';
    PWRET_FROMHOSTPOSAUTHERR:   Result := 'PWRET_FROMHOSTPOSAUTHERR';
    PWRET_FROMHOSTUSRAUTHERR:   Result := 'PWRET_FROMHOSTUSRAUTHERR';
    PWRET_FROMHOST:             Result := 'PWRET_FROMHOST';
    PWRET_TLVERR:               Result := 'PWRET_TLVERR';
    PWRET_SRVINVPARAM:          Result := 'PWRET_SRVINVPARAM';
    PWRET_REQPARAM:             Result := 'PWRET_REQPARAM';
    PWRET_HOSTCONNUNK:          Result := 'PWRET_HOSTCONNUNK';
    PWRET_INTERNALERR:          Result := 'PWRET_INTERNALERR';
    PWRET_BLOCKED:              Result := 'PWRET_BLOCKED';
    PWRET_FROMHOSTTRNNFOUND:    Result := 'PWRET_FROMHOSTTRNNFOUND';
    PWRET_PARAMSFILEERR:        Result := 'PWRET_PARAMSFILEERR';
    PWRET_NOCARDENTMODE:        Result := 'PWRET_NOCARDENTMODE';
    PWRET_INVALIDVIRTMERCH:     Result := 'PWRET_INVALIDVIRTMERCH';
    PWRET_HOSTTIMEOUT:          Result := 'PWRET_HOSTTIMEOUT';
    PWRET_CONFIGREQUIRED:       Result := 'PWRET_CONFIGREQUIRED';
    PWRET_HOSTCONNERR:          Result := 'PWRET_HOSTCONNERR';
    PWRET_HOSTCONNLOST:         Result := 'PWRET_HOSTCONNLOST';
    PWRET_FILEERR:              Result := 'PWRET_FILEERR';
    PWRET_PINPADERR:            Result := 'PWRET_PINPADERR';
    PWRET_MAGSTRIPEERR:         Result := 'PWRET_MAGSTRIPEERR';
    PWRET_PPCRYPTERR:           Result := 'PWRET_PPCRYPTERR';
    PWRET_SSLCERTERR:           Result := 'PWRET_SSLCERTERR';
    PWRET_SSLNCONN:             Result := 'PWRET_SSLNCONN';
    PWRET_GPRSATTACHFAILED:     Result := 'PWRET_GPRSATTACHFAILED';
    PWRET_INVPARAM:             Result := 'PWRET_INVPARAM';
    PWRET_NOTINST:              Result := 'PWRET_NOTINST';
    PWRET_MOREDATA:             Result := 'PWRET_MOREDATA';
    PWRET_NODATA:               Result := 'PWRET_NODATA';
    PWRET_DISPLAY:              Result := 'PWRET_DISPLAY';
    PWRET_INVCALL:              Result := 'PWRET_INVCALL';
    PWRET_NOTHING:              Result := 'PWRET_NOTHING';
    PWRET_BUFOVFLW:             Result := 'PWRET_BUFOVFLW';
    PWRET_CANCEL:               Result := 'PWRET_CANCEL';
    PWRET_TIMEOUT:              Result := 'PWRET_TIMEOUT';
    PWRET_PPNOTFOUND:           Result := 'PWRET_PPNOTFOUND';
    PWRET_TRNNOTINIT:           Result := 'PWRET_TRNNOTINIT';
    PWRET_DLLNOTINIT:           Result := 'PWRET_DLLNOTINIT';
    PWRET_FALLBACK:             Result := 'PWRET_FALLBACK';
    PWRET_WRITERR:              Result := 'PWRET_WRITERR';
    PWRET_PPCOMERR:             Result := 'PWRET_PPCOMERR';
    PWRET_NOMANDATORY:          Result := 'PWRET_NOMANDATORY';
    PWRET_INVALIDTRN:           Result := 'PWRET_INVALIDTRN';
    PWRET_PPS_XXX:              Result := 'PWRET_PPS_XXX';
  else
    Result := 'PWRET_'+IntToStr(iRET);
  end;
end;

function PWOPERToString(iOPER: SmallInt): String;
begin
  case iOPER of
    PWOPER_NULL:         Result := 'PWOPER_NULL';
    PWOPER_INSTALL:      Result := 'PWOPER_INSTALL';
    PWOPER_PARAMUPD:     Result := 'PWOPER_PARAMUPD';
    PWOPER_REPRINT:      Result := 'PWOPER_REPRINT';
    PWOPER_RPTTRUNC:     Result := 'PWOPER_RPTTRUNC';
    PWOPER_RPTDETAIL:    Result := 'PWOPER_RPTDETAIL';
    PWOPER_ADMIN:        Result := 'PWOPER_ADMIN';
    PWOPER_SALE:         Result := 'PWOPER_SALE';
    PWOPER_SALEVOID:     Result := 'PWOPER_SALEVOID';
    PWOPER_PREPAID:      Result := 'PWOPER_PREPAID';
    PWOPER_CHECKINQ:     Result := 'PWOPER_CHECKINQ';
    PWOPER_RETBALINQ:    Result := 'PWOPER_RETBALINQ';
    PWOPER_CRDBALINQ:    Result := 'PWOPER_CRDBALINQ';
    PWOPER_INITIALIZ:    Result := 'PWOPER_INITIALIZ';
    PWOPER_SETTLEMNT:    Result := 'PWOPER_SETTLEMNT';
    PWOPER_PREAUTH:      Result := 'PWOPER_PREAUTH';
    PWOPER_PREAUTVOID:   Result := 'PWOPER_PREAUTVOID';
    PWOPER_CASHWDRWL:    Result := 'PWOPER_CASHWDRWL';
    PWOPER_LOCALMAINT:   Result := 'PWOPER_LOCALMAINT';
    PWOPER_FINANCINQ:    Result := 'PWOPER_FINANCINQ';
    PWOPER_ADDRVERIF:    Result := 'PWOPER_ADDRVERIF';
    PWOPER_SALEPRE:      Result := 'PWOPER_SALEPRE';
    PWOPER_LOYCREDIT:    Result := 'PWOPER_LOYCREDIT';
    PWOPER_LOYCREDVOID:  Result := 'PWOPER_LOYCREDVOID';
    PWOPER_LOYDEBIT:     Result := 'PWOPER_LOYDEBIT';
    PWOPER_LOYDEBVOID:   Result := 'PWOPER_LOYDEBVOID';
    PWOPER_VOID:         Result := 'PWOPER_VOID';
    PWOPER_VERSION:      Result := 'PWOPER_VERSION';
    PWOPER_CONFIG:       Result := 'PWOPER_CONFIG';
    PWOPER_MAINTENANCE:  Result := 'PWOPER_MAINTENANCE';
  else
    Result := 'PWOPER_'+IntToStr(iOPER);
  end;
end;

{ TACBrTEFRespPGWeb }

procedure TACBrTEFRespPGWeb.ConteudoToProperty;
begin
  inherited ConteudoToProperty;
end;

{ TACBrTEFPGWebAPI }

constructor TACBrTEFPGWebAPI.Create;
begin
  inherited Create;

  fSuportaSaque := False;
  fSuportaDesconto := False;
  fSuportaViasDiferenciadas := True;
  fImprimirViaClienteReduzida := False;
  fUtilizaSaldoTotalVoucher := False;
  fInicializada := False;
  fDiretorioTrabalho := '';
  ClearMethodPointers;

  fOnGravarLog := Nil;
  fOnExibeMenu := Nil;
end;

destructor TACBrTEFPGWebAPI.Destroy;
begin
  GravarLog('TACBrTEFPGWebAPI.Destroy');
  UnLoadDLLFunctions;
  inherited Destroy;
end;

procedure TACBrTEFPGWebAPI.Inicializar;
var
  iRet: SmallInt;
  MsgErro: String;
begin
  if fInicializada then
    Exit;

  GravarLog('TACBrTEFPGWebAPI.Inicializar');
  if (fDiretorioTrabalho = '') then
    fDiretorioTrabalho := ApplicationPath + 'TEF' + PathDelim + 'PGWeb';

  LoadDLLFunctions;
  if not DirectoryExists(fDiretorioTrabalho) then
    ForceDirectories(fDiretorioTrabalho);

  GravarLog('PW_iInit( '+fDiretorioTrabalho+' )');
  iRet := xPW_iInit(PAnsiChar(fDiretorioTrabalho));
  case iRet of
    PWRET_OK: MsgErro := '';
    PWRET_WRITERR: MsgErro := Format(sErrPWRET_WRITERR, [fDiretorioTrabalho]);
    PWRET_INVCALL: MsgErro := sErrPWRET_INVCALL;
  else
    MsgErro := ObterUltimoErro;
  end;

  if (MsgErro <> '') then
    raise EACBrTEFPayGoWeb.Create(MsgErro);

  fInicializada := True;
end;

procedure TACBrTEFPGWebAPI.DesInicializar;
begin
  GravarLog('TACBrTEFPGWebAPI.DesInicializar');
  UnLoadDLLFunctions;
  fInicializada := False;
end;

procedure TACBrTEFPGWebAPI.ClearMethodPointers;
begin
  xPW_iInit := Nil;
  xPW_iGetResult := Nil;
  xPW_iNewTransac := Nil;
  xPW_iAddParam := Nil;
  xPW_iExecTransac := Nil;
  xPW_iConfirmation := Nil;
  xPW_iIdleProc := Nil;
  xPW_iGetOperations := Nil;
  xPW_iPPEventLoop := Nil;
  xPW_iPPAbort := Nil;
  xPW_iPPGetCard := Nil;
  xPW_iPPGetPIN := Nil;
  xPW_iPPGetData := Nil;
  xPW_iPPGoOnChip := Nil;
  xPW_iPPFinishChip := Nil;
  xPW_iPPConfirmData := Nil;
  xPW_iPPGenericCMD := Nil;
  xPW_iPPDataConfirmation := Nil;
  xPW_iPPDisplay := Nil;
  xPW_iPPGetUserData := Nil;
  xPW_iPPWaitEvent := Nil;
  xPW_iPPRemoveCard := Nil;
  xPW_iPPGetPINBlock := Nil;
  xPW_iTransactionInquiry := Nil;
end;

procedure TACBrTEFPGWebAPI.VerificarOK(iRET: SmallInt);
var
  MsgErro: String;
begin
  if (iRET = PWRET_OK) then
    Exit;

  MsgErro := ObterUltimoErro;
  if (MsgErro <> '') then
    raise EACBrTEFPayGoWeb.CreateFmt('%s (%s)', [ACBrStr(MsgErro), PWRETToString(iRET)]);
end;

function TACBrTEFPGWebAPI.ObterResultado(iINFO: SmallInt): String;
var
  pszData: PAnsiChar;
  ulDataSize: LongWord;
  iRet: SmallInt;
  MsgErro: String;
begin
  LoadDLLFunctions;
  Result := '';
  ulDataSize := 10240;   // 10K
  pszData := AllocMem(ulDataSize);
  try
    GravarLog('PW_iGetResult( '+ PWINFOToString(iINFO)+' )');
    iRet := xPW_iGetResult(iINFO, pszData, ulDataSize);
    if (iRet = PWRET_OK) then
      Result := String(pszData)
    else
    begin
      case iRet of
        PWRET_NODATA: MsgErro := sErrPWRET_NODATA;
        PWRET_BUFOVFLW: MsgErro := sErrPWRET_BUFOVFLW;
        PWRET_DLLNOTINIT: MsgErro := sErrPWRET_DLLNOTINIT;
        PWRET_TRNNOTINIT: MsgErro := sErrPWRET_TRNNOTINIT;
        PWRET_NOTINST: MsgErro := sErrPWRET_NOTINST;
      else
        MsgErro := PWRETToString(iRet);
      end;

      raise EACBrTEFPayGoWeb.Create(ACBrStr(MsgErro));
    end;
  finally
    Freemem(pszData);
  end;
end;

function TACBrTEFPGWebAPI.ObterUltimoErro: String;
begin
  Result := ObterResultado(PWINFO_RESULTMSG);
end;

procedure TACBrTEFPGWebAPI.GravarLog(const AString: AnsiString; Traduz: Boolean);
Var
  Tratado: Boolean;
  AStringLog: AnsiString;
begin
  if not Assigned(fOnGravarLog) then
    Exit;

  if Traduz then
    AStringLog := TranslateUnprintable(AString)
  else
    AStringLog := AString;

  Tratado := False;
  fOnGravarLog(AStringLog, Tratado);
end;

procedure TACBrTEFPGWebAPI.IniciarTransacao(iOPER: SmallInt);
var
  iRet: SmallInt;
  MsgErro: String;
begin
  iRet := xPW_iNewTransac(iOPER);
  if (iRet <> PWRET_OK) then
  begin
    case iRet of
      PWRET_DLLNOTINIT: MsgErro := sErrPWRET_DLLNOTINIT;
      PWRET_NOTINST: MsgErro := sErrPWRET_NOTINST;
    else
      MsgErro := ObterUltimoErro;
    end;

    raise EACBrTEFPayGoWeb.Create(ACBrStr(MsgErro));
  end;

  AdicionarDadosObrigatorios
end;

procedure TACBrTEFPGWebAPI.AdicionarParametro(iINFO: Word;
  const AValor: AnsiString);
var
  iRet: SmallInt;
  MsgErro: String;
begin
  iRet := xPW_iAddParam(iINFO, PAnsiChar(AValor));
  if (iRet <> PWRET_OK) then
  begin
    case iRet of
      PWRET_INVPARAM: MsgErro := Format(sErrPWRET_INVPARAM, [AValor, PWINFOToString(iINFO)]);
      PWRET_DLLNOTINIT: MsgErro := sErrPWRET_DLLNOTINIT;
      PWRET_NOTINST: MsgErro := sErrPWRET_NOTINST;
      PWRET_TRNNOTINIT: MsgErro := sErrPWRET_TRNNOTINIT;
    else
      MsgErro := ObterUltimoErro;
    end;

    raise EACBrTEFPayGoWeb.Create(ACBrStr(MsgErro));
  end;
end;

procedure TACBrTEFPGWebAPI.ExcutarTransacao;
var
  iRet: SmallInt;
  MsgErro: String;
  ArrParams: PW_GetData;
  NumParams: SmallInt;
begin
  NumParams := Length(ArrParams);
  repeat
    iRet := xPW_iExecTransac(ArrParams, NumParams);
    case iRet of
      PWRET_OK:
        Break;

      PWRET_NOTHING:
        Sleep(CSleepNothing);

      PWRET_MOREDATA:
        ObterDados(ArrParams, NumParams) ;

      PWRET_NOMANDATORY:
        raise EACBrTEFPayGoWeb.Create(ACBrStr(sErrPWRET_NOMANDATORY));

      PWRET_DLLNOTINIT:
        raise EACBrTEFPayGoWeb.Create(ACBrStr(sErrPWRET_DLLNOTINIT));

      PWRET_NOTINST:
        raise EACBrTEFPayGoWeb.Create(ACBrStr(sErrPWRET_NOTINST));

      PWRET_TRNNOTINIT:
        raise EACBrTEFPayGoWeb.Create(ACBrStr(sErrPWRET_TRNNOTINIT));

    else
      raise EACBrTEFPayGoWeb.Create(ACBrStr(ObterUltimoErro));
    end;
  until (iRet = PWRET_OK);
end;

procedure TACBrTEFPGWebAPI.ObterDados(ArrGetData: PW_GetData; ArrLen: SmallInt);
var
  AGetData: TPW_GetData;
  i: Integer;
begin
  for i := 0 to ArrLen-1 do
  begin
    AGetData := ArrGetData[i];

    case AGetData.bTipoDeDado of
      PWDAT_MENU:
        ObterDadoMenu(AGetData);
      PWDAT_TYPED:
        ObterDadoDigitado(AGetData);
      PWDAT_CARDINF:;
      PWDAT_PPENTRY:;
      PWDAT_PPENCPIN:;
      PWDAT_CARDOFF:;
      PWDAT_CARDONL:;
      PWDAT_PPCONF:;
      PWDAT_BARCODE:;
      PWDAT_PPREMCRD:;
      PWDAT_PPGENCMD:;
      PWDAT_PPDATAPOSCNF:;
      PWDAT_USERAUTH:;
    end;
  end;
end;

procedure TACBrTEFPGWebAPI.ObterDadoMenu(AGetData: TPW_GetData);
var
  SL: TStringList;
  ItemSelecionado, i: Integer;
  AOpcao: String;
begin
  if not Assigned(fOnExibeMenu) then
    raise EACBrTEFPayGoWeb.CreateFmt(ACBrStr(sErrEventoNaoAtribuido), ['OnExibeMenu']);

  SL := TStringList.Create;
  try
    for i := 0 to AGetData.bNumOpcoesMenu-1 do
    begin
      AOpcao := Trim(AGetData.vszTextoMenu[i]);
      if (AGetData.bTeclasDeAtalho = 1) then
        AOpcao := IntToStr(i)+' - '+AOpcao;

      SL.Add(AOpcao);
    end;

    ItemSelecionado := AGetData.bItemInicial;
    fOnExibeMenu(Trim(AGetData.szPrompt), SL, ItemSelecionado);

    if (ItemSelecionado > 0) and (ItemSelecionado <= SL.Count) then
      AdicionarParametro(wIdentificador, AGetData.vszValorMenu[ItemSelecionado-1]);
  finally
    SL.Free;
  end;
end;

procedure TACBrTEFPGWebAPI.ObterDadoDigitado(AGetData: TPW_GetData);
begin
//  AGetData.bValidacaoDado
//0: sem valida��o
//1: o dado n�o pode ser vazio
//2: (�ltimo) d�gito verificador, algoritmo m�dulo 10
//3: CPF ou CNPJ
//4: data no formato �MMAA�
//5: data no formato �DDMMAA�
//6: solicitar a digita��o duas vezes iguais (confirma��o)
end;

procedure TACBrTEFPGWebAPI.AdicionarDadosObrigatorios;
begin
  AdicionarParametro(PWINFO_AUTNAME, NomeAplicacao);
  AdicionarParametro(PWINFO_AUTVER, VersaoAplicacao);
  AdicionarParametro(PWINFO_AUTDEV, SoftwareHouse);
  AdicionarParametro(PWINFO_AUTCAP, IntToStr(CalcularCapacidadesDaAutomacao));
end;

function TACBrTEFPGWebAPI.CalcularCapacidadesDaAutomacao: Integer;
begin
  Result := 4;            // 4: valor fixo, sempre incluir;
  if fSuportaSaque then
    Inc(Result, 1);       // 1: funcionalidade de troco/saque;
  if fSuportaDesconto then
    Inc(Result, 2);       // 2: funcionalidade de desconto;
  if fSuportaViasDiferenciadas then
    Inc(Result, 8);       // 8: impress�o das vias diferenciadas do comprovante para Cliente/Estabelecimento;
  if fImprimirViaClienteReduzida then
    Inc(Result, 16);      // 16: impress�o do cupom reduzido
  if fUtilizaSaldoTotalVoucher then
    Inc(Result, 32);      // 32: utiliza��o de saldo total do voucher para abatimento do valor da compra
end;

procedure TACBrTEFPGWebAPI.SetInicializada(AValue: Boolean);
begin
  if fInicializada = AValue then
    Exit;

  GravarLog('TACBrTEFPGWebAPI.SetInicializada( '+BoolToStr(AValue, True)+' )');

  if AValue then
    Inicializar
  else
    DesInicializar;
end;

procedure TACBrTEFPGWebAPI.SetPathDLL(AValue: String);
begin
  if fPathDLL = AValue then
    Exit;

  GravarLog('TACBrTEFPGWebAPI.SetPathDLL( '+AValue+' )');

  if fInicializada then
    raise EACBrTEFPayGoWeb.Create(ACBrStr(sErrLibJaInicializda));

  fPathDLL := AValue;
end;

procedure TACBrTEFPGWebAPI.SetSoftwareHouse(AValue: String);
begin
  if fSoftwareHouse = AValue then Exit;
  fSoftwareHouse := LeftStr(Trim(AValue),50);
end;

procedure TACBrTEFPGWebAPI.SetNomeAplicacao(AValue: String);
begin
  if fNomeAplicacao = AValue then Exit;
  fNomeAplicacao := LeftStr(Trim(AValue),128);
end;

procedure TACBrTEFPGWebAPI.SetVersaoAplicacao(AValue: String);
begin
  if fVersaoAplicacao = AValue then Exit;
  fVersaoAplicacao := LeftStr(Trim(AValue),128);
end;

procedure TACBrTEFPGWebAPI.SetDiretorioTrabalho(AValue: String);
begin
  if fDiretorioTrabalho = AValue then
    Exit;

  GravarLog('TACBrTEFPGWebAPI.SetDiretorioTrabalho( '+AValue+' )');

  if fInicializada then
    raise EACBrTEFPayGoWeb.Create(ACBrStr(sErrLibJaInicializda));

  fDiretorioTrabalho := AValue;
end;

procedure TACBrTEFPGWebAPI.LoadDLLFunctions;

  procedure PGWebFunctionDetect( FuncName: AnsiString; var LibPointer: Pointer ) ;
  var
    sLibName: string;
  begin
    if not Assigned( LibPointer )  then
    begin
      GravarLog('   '+FuncName);

      // Verifica se exite o caminho das DLLs
      sLibName := '';
      if Length(PathDLL) > 0 then
        sLibName := PathWithDelim(PathDLL);

      // Concatena o caminho se exitir mais o nome da DLL.
      sLibName := sLibName + CACBrTEFPGWebLib;

      if not FunctionDetect( sLibName, FuncName, LibPointer) then
      begin
        LibPointer := NIL ;
        raise EACBrTEFErro.Create( ACBrStr( 'Erro ao carregar a fun��o:'+FuncName+
                                            ' de: '+CACBrTEFPGWebLib ) ) ;
      end ;
    end ;
  end;

 begin
   if fInicializada then
     Exit;

   GravarLog('TACBrTEFPGWebAPI.LoadDLLFunctions');

   PGWebFunctionDetect('PW_iInit', @xPW_iInit);
   PGWebFunctionDetect('PW_iGetResult', @xPW_iGetResult);
   PGWebFunctionDetect('PW_iNewTransac', @xPW_iNewTransac);
   PGWebFunctionDetect('PW_iAddParam', @xPW_iAddParam);
   PGWebFunctionDetect('PW_iExecTransac', @xPW_iExecTransac);
   PGWebFunctionDetect('PW_iConfirmation', @xPW_iConfirmation);
   PGWebFunctionDetect('PW_iIdleProc', @xPW_iIdleProc);
   PGWebFunctionDetect('PW_iGetOperations', @xPW_iGetOperations);
   PGWebFunctionDetect('PW_iPPEventLoop', @xPW_iPPEventLoop);
   PGWebFunctionDetect('PW_iPPAbort', @xPW_iPPAbort);
   PGWebFunctionDetect('PW_iPPGetCard', @xPW_iPPGetCard);
   PGWebFunctionDetect('PW_iPPGetPIN', @xPW_iPPGetPIN);
   PGWebFunctionDetect('PW_iPPGetData', @xPW_iPPGetData);
   PGWebFunctionDetect('PW_iPPGoOnChip', @xPW_iPPGoOnChip);
   PGWebFunctionDetect('PW_iPPFinishChip', @xPW_iPPFinishChip);
   PGWebFunctionDetect('PW_iPPConfirmData', @xPW_iPPConfirmData);
   PGWebFunctionDetect('PW_iPPGenericCMD', @xPW_iPPGenericCMD);
   //PGWebFunctionDetect('PW_iPPDataConfirmation', @xPW_iPPDataConfirmation);
   PGWebFunctionDetect('PW_iPPDisplay', @xPW_iPPDisplay);
   PGWebFunctionDetect('PW_iPPGetUserData', @xPW_iPPGetUserData);
   PGWebFunctionDetect('PW_iPPWaitEvent', @xPW_iPPWaitEvent);
   PGWebFunctionDetect('PW_iPPRemoveCard', @xPW_iPPRemoveCard);
   PGWebFunctionDetect('PW_iPPGetPINBlock', @xPW_iPPGetPINBlock);
   PGWebFunctionDetect('PW_iTransactionInquiry', @xPW_iTransactionInquiry);
end;

procedure TACBrTEFPGWebAPI.UnLoadDLLFunctions;
var
  sLibName: String;
begin
  if not fInicializada then
    Exit;

  GravarLog('TACBrTEFPGWebAPI.UnLoadDLLFunctions');

  sLibName := '';
  if Length(PathDLL) > 0 then
     sLibName := PathWithDelim(PathDLL);

  UnLoadLibrary( sLibName + CACBrTEFPGWebLib );
  ClearMethodPointers;
end;

end.

