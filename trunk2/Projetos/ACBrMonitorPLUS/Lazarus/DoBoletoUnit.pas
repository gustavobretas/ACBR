{*******************************************************************************}
{ Projeto: ACBrMonitor                                                          }
{  Executavel multiplataforma que faz uso do conjunto de componentes ACBr para  }
{ criar uma interface de comunicação com equipamentos de automacao comercial.   }
{                                                                               }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida                }
{                                                                               }
{ Colaboradores nesse arquivo: Juliana Rodrigues Prado Tamizou                  }
{                              Jean Patrick F. dos Santos (envio de e-mails)    }
{                                                                               }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr     }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr       }
{                                                                               }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la  }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela   }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério)  }
{ qualquer versão posterior.                                                    }
{                                                                               }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM    }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU       }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor }
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)               }
{                                                                               }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto }
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,   }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.           }
{ Você também pode obter uma copia da licença em:                               }
{ http://www.opensource.org/licenses/gpl-license.php                            }
{                                                                               }
{ Daniel Simões de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br }
{        Rua Cel.Aureliano de Camargo, 963 - Tatuí - SP - 18270-170             }
{                                                                               }
{*******************************************************************************}

{$I ACBr.inc}

unit DoBoletoUnit;

interface

uses
  Classes, TypInfo, SysUtils, strutils, CmdUnit, ACBrUtil, ACBrBoleto,
  ACBrMonitorConfig, ACBrMonitorConsts, ACBrBoletoConversao ;

type

{ TACBrObjetoBoleto}
TACBrObjetoBoleto = class(TACBrObjetoDFe)
private
  fACBrBoleto: TACBrBoleto;
public
  constructor Create(AConfig: TMonitorConfig; ACBrBoleto: TACBrBoleto); reintroduce;
  procedure Executar(ACmd: TACBrCmd); override;

  procedure LerIniBoletos(aStr: String);
  procedure ImprimeRelatorioRetorno(sArqRetorno : String);
  function ListaBancos(): String;
  function ListaCaractTitulo() : String;
  function ListaOcorrencias(): String;
  function ListaOcorrenciasEX(): String;

  property ACBrBoleto: TACBrBoleto read fACBrBoleto;

end;

{ TMetodoConfigurarDados }

TMetodoConfigurarDados = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoLimparLista }

TMetodoLimparLista = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoTotalTitulosLista }

TMetodoTotalTitulosLista = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoImprimir }

TMetodoImprimir = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoGerarPDF }

TMetodoGerarPDF = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoGerarHTML }

TMetodoGerarHTML = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoGerarRemessa }

TMetodoGerarRemessa = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoLerRetorno }

TMetodoLerRetorno = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoEnviarEmail }

TMetodoEnviarEmail = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoIncluirTitulos  }

TMetodoIncluirTitulos  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoSetDiretorioArquivo  }

TMetodoSetDiretorioArquivo  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoListaBancos  }

TMetodoListaBancos  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoListaCaractTitulo  }

TMetodoListaCaractTitulo  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoListaOcorrencias  }

TMetodoListaOcorrencias  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoListaOcorrenciasEX  }

TMetodoListaOcorrenciasEX  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoTamNossoNumero  }

TMetodoTamNossoNumero  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoMontarNossoNumero  }

TMetodoMontarNossoNumero  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoRetornaLinhaDigitavel  }

TMetodoRetornaLinhaDigitavel  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoRetornaCodigoBarras  }

TMetodoRetornaCodigoBarras  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoCodigosMoraAceitos  }

TMetodoCodigosMoraAceitos  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoSelecionaBanco  }

TMetodoSelecionaBanco  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoImprimirBoleto  }

TMetodoImprimirBoleto  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoGerarPDFBoleto  }

TMetodoGerarPDFBoleto  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoEnviarEmailBoleto  }

TMetodoEnviarEmailBoleto  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoEnviarBoleto  }

TMetodoEnviarBoleto  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoSetOperacaoWS  }

TMetodoSetOperacaoWS  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

{ TMetodoConsultarTitulosPorPeriodo }
TMetodoConsultarTitulosPorPeriodo  = class(TACBrMetodo)
public
  procedure Executar; override;
end;

implementation

uses DoACBrUnit, DoEmailUnit, ACBrBoletoRelatorioRetorno, ACBrLibComum,
  ACBrLibResposta, ACBrLibBoletoRespostas, ACBrObjectSerializer;

{ TACBrObjetoBoleto }

constructor TACBrObjetoBoleto.Create(AConfig: TMonitorConfig;
  ACBrBoleto: TACBrBoleto);
begin
  inherited Create(AConfig);

  fACBrBoleto:= ACBrBoleto;

  ListaDeMetodos.Add(CMetodoConfigurarDados);
  ListaDeMetodos.Add(CMetodoLimparLista);
  ListaDeMetodos.Add(CMetodoTotalTitulosLista);
  ListaDeMetodos.Add(CMetodoImprimir);
  ListaDeMetodos.Add(CMetodoGerarPDF);
  ListaDeMetodos.Add(CMetodoGerarHTML);
  ListaDeMetodos.Add(CMetodoGerarRemessa);
  ListaDeMetodos.Add(CMetodoLerRetorno);
  ListaDeMetodos.Add(CMetodoEnviarEmail);
  ListaDeMetodos.Add(CMetodoIncluirTitulos);
  ListaDeMetodos.Add(CMetodoSetDiretorioArquivo);
  ListaDeMetodos.Add(CMetodoListaBancos);
  ListaDeMetodos.Add(CMetodoListaCaractTitulo);
  ListaDeMetodos.Add(CMetodoListaOcorrencias);
  ListaDeMetodos.Add(CMetodoTamNossoNumero);
  ListaDeMetodos.Add(CMetodoCodigosMoraAceitos);
  ListaDeMetodos.Add(CMetodoSelecionaBanco);
  ListaDeMetodos.Add(CMetodoListaOcorrenciasEx);
  ListaDeMetodos.Add(CMetodoMontarNossoNumero);
  ListaDeMetodos.Add(CMetodoRetornaLinhaDigitavel);
  ListaDeMetodos.Add(CMetodoRetornaCodigoBarras);
  ListaDeMetodos.Add(CMetodoImprimirBoleto);
  ListaDeMetodos.Add(CMetodoGerarPDFBoleto);
  ListaDeMetodos.Add(CMetodoEnviarEmailBoleto);
  ListaDeMetodos.Add(CMetodoEnviarBoleto);
  ListaDeMetodos.Add(CMetodoSetOperacaoWS);
  ListaDeMetodos.Add(CMetodoConsultarTitulosPorPeriodo);

end;

procedure TACBrObjetoBoleto.Executar(ACmd: TACBrCmd);
var
   AMetodoClass: TACBrMetodoClass;
   CmdNum: Integer;
   Ametodo: TACBrMetodo;
   AACBrUnit: TACBrObjetoACBr;
begin
  inherited Executar(ACmd);

  CmdNum := ListaDeMetodos.IndexOf(LowerCase(ACmd.Metodo));
  AMetodoClass := Nil;

  case CmdNum of
    0  : AMetodoClass := TMetodoConfigurarDados;
    1  : AMetodoClass := TMetodoLimparLista;
    2  : AMetodoClass := TMetodoTotalTitulosLista;
    3  : AMetodoClass := TMetodoImprimir;
    4  : AMetodoClass := TMetodoGerarPDF;
    5  : AMetodoClass := TMetodoGerarHTML;
    6  : AMetodoClass := TMetodoGerarRemessa;
    7  : AMetodoClass := TMetodoLerRetorno;
    8  : AMetodoClass := TMetodoEnviarEmail;
    9  : AMetodoClass := TMetodoIncluirTitulos;
    10 : AMetodoClass := TMetodoSetDiretorioArquivo;
    11 : AMetodoClass := TMetodoListaBancos;
    12 : AMetodoClass := TMetodoListaCaractTitulo;
    13 : AMetodoClass := TMetodoListaOcorrencias;
    14 : AMetodoClass := TMetodoTamNossoNumero;
    15 : AMetodoClass := TMetodoCodigosMoraAceitos;
    16 : AMetodoClass := TMetodoSelecionaBanco;
    17 : AMetodoClass := TMetodoListaOcorrenciasEX;
    18 : AMetodoClass := TMetodoMontarNossoNumero;
    19 : AMetodoClass := TMetodoRetornaLinhaDigitavel;
    20 : AMetodoClass := TMetodoRetornaCodigoBarras;
    21 : AMetodoClass := TMetodoImprimirBoleto;
    22 : AMetodoClass := TMetodoGerarPDFBoleto;
    23 : AMetodoClass := TMetodoEnviarEmailBoleto;
    24 : AMetodoClass := TMetodoEnviarBoleto;
    25 : AMetodoClass := TMetodoSetOperacaoWS;
    26 : AMetodoClass := TMetodoConsultarTitulosPorPeriodo;

    else
      begin
        AACBrUnit := TACBrObjetoACBr.Create(Nil); //Instancia DoACBrUnit para validar métodos padrão para todos os objetos
        try
          AACBrUnit.Executar(ACmd);
        finally
          AACBrUnit.Free;
        end;

      end;

  end;

  if Assigned(AMetodoClass) then
  begin
    Ametodo := AMetodoClass.Create(ACmd, Self);
    try
      Ametodo.Executar;
    finally
      Ametodo.Free;
    end;

  end;

end;

{ TMetodoConsultarTitulosPorPeriodo }

{ Params: 0 - Ini - Uma String com um Path completo arquivo .ini seção [ConsultaAPI]
                         ou Uma String com conteúdo txt da Configuracao do Filtro [ConsultaAPI]
}
procedure TMetodoConsultarTitulosPorPeriodo.Executar;
var
  AIni: String;
  I : Integer;
  Titulos: TArray<TRetornoRegistroWeb>;
  Titulo : TRetornoRegistroWeb;
begin
  AIni := fpCmd.Params(0);

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    LerIniBoletos(AIni);

    try
      ACBrBoleto.Configuracoes.WebService.Operacao:= tpConsulta;
      ACBrBoleto.EnviarBoleto;
      if ACBrBoleto.ListaRetornoWeb.Count > 0 then
      begin
        SetLength(Titulos, ACBrBoleto.ListaRetornoWeb.Count);
        try
          for I:= 0 to ACBrBoleto.ListaRetornoWeb.Count -1 do
          begin
            Titulo := TRetornoRegistroWeb.Create(I + 1, TpResp, codUTF8);
            Titulo.Processar(ACBrBoleto.ListaRetornoWeb[I]);
            Titulos[I] := Titulo;
          end;

          fpCmd.Resposta := TACBrObjectSerializer.Gerar<TRetornoRegistroWeb>(Titulos, TpResp, codUTF8);
        finally
          for I:= 0 to High(Titulos) do
          begin
            Titulo := Titulos[I] as TRetornoRegistroWeb;
            FreeAndNil(Titulo);
          end;

          SetLength(Titulos, 0);
          Titulos := nil;
        end;
      end;

    except
      on E: Exception do
        raise Exception.Create('Falha ao Realizar Consulta. '+ sLineBreak + E.Message);
    end;
  end;

end;

{ TMetodoSetOperacaoWS }

{ Params: 0 - CodOperacao Integer - (0- tpInclui, 1- tpAltera, 2- tpBaixa, 3- tpConsulta, 4- tpConsultaDetalhe)
}
procedure TMetodoSetOperacaoWS.Executar;
var
   ACodOperacao: Integer;
begin
  ACodOperacao := StrToIntDef(fpCmd.Params(0), 1);

  try
    with TACBrObjetoBoleto(fpObjetoDono) do
    begin
      ACBrBoleto.Configuracoes.WebService.Operacao:= TOperacao(ACodOperacao);
      with MonitorConfig.BOLETO.WS.Config.SSL do
        Operacao:= Integer(ACBrBoleto.Configuracoes.WebService.Operacao);
      MonitorConfig.SalvarArquivo;
    end;

  except
    raise Exception.Create('Código ou Operação Inválido.');
  end;

end;

{ TMetodoConfigurarDados }

{ Params: 0 - Ini - Uma String com um Path completo arquivo .ini
                         ou Uma String com conteúdo txt da Configuracao Cedente
}

procedure TMetodoConfigurarDados.Executar;
var
  AIni: String;
begin
  AIni := fpCmd.Params(0);

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    LerIniBoletos(AIni);
  end;

end;

{ TMetodoLimparLista }

procedure TMetodoLimparLista.Executar;
begin
  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    ACBrBoleto.ListadeBoletos.Clear;

  end;

end;

{ TMetodoTotalTitulosLista }

procedure TMetodoTotalTitulosLista.Executar;
begin
  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    fpCmd.Resposta := IntToStr( ACBrBoleto.ListadeBoletos.Count);
  end;

end;

{ TMetodoImprimir }

{ Params: 0 - PrintName = Nome da Impressora
          1 - Preview = Boolean Mostrar em tela
}
procedure TMetodoImprimir.Executar;
var
  AName: String;
  APreview: Boolean;
  AState: Boolean;
begin

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    AName := fpCmd.Params(0);
    APreview := StrToBoolDef( fpCmd.Params(1), False );

    if NaoEstaVazio(AName) then
      ACBrBoleto.ACBrBoletoFC.PrinterName := AName;

    AState := ACBrBoleto.ACBrBoletoFC.MostrarPreview;

    if APreview then
      ACBrBoleto.ACBrBoletoFC.MostrarPreview := APreview;

    try
      DoAntesDeImprimir(ACBrBoleto.ACBrBoletoFC.MostrarPreview);
      ACBrBoleto.Imprimir;
    finally
      DoDepoisDeImprimir;
      ACBrBoleto.ACBrBoletoFC.MostrarPreview := AState;
    end;

  end;

end;

{ TMetodoGerarPDF }

procedure TMetodoGerarPDF.Executar;
begin
  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    ACBrBoleto.GerarPDF;
  end;

end;

{ TMetodoGerarHTML }

procedure TMetodoGerarHTML.Executar;
begin
  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    ACBrBoleto.GerarHTML;
  end;

end;

{ TMetodoGerarRemessa }

{ Params: 0 - Dir = Diretório do arquivo de Remessa
          1 - NumArq = Integer: Número do arquivo de Remessa
          2 - ListaRelat = Nome do arquivo de Remessa
}

procedure TMetodoGerarRemessa.Executar;
var
  ADir : String;
  ANumArq : Integer;
  ANomeArq : String;
begin
  ADir     := fpCmd.Params(0);
  ANumArq  := StrToIntDef(fpCmd.Params(1),1);
  ANomeArq := fpCmd.Params(2);

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    if NaoEstaVazio( ADir ) then
      ACBrBoleto.DirArqRemessa := ADir;
    if NaoEstaVazio( ANomeArq ) then
      ACBrBoleto.NomeArqRemessa:= ANomeArq;
    ACBrBoleto.GerarRemessa( ANumArq );

  end;

end;

{ TMetodoLerRetorno }

{ Params: 0 - Dir = Diretório do arquivo de Retorno
          1 - NomeArq = Nome do arquivo de Retorno
          2 - ListaRelat = Boolean: Listar Relatório caso seja true
          3 - RetResposta = Boolean: Obter o Retorna na Resposta
}
procedure TMetodoLerRetorno.Executar;
var
  ADir     : String;
  ANomeArq : String;
  AListaRelat : Boolean;
  ARetResposta : Boolean;
  RespRetorno : TRetornoBoleto;
begin
  ADir     := fpCmd.Params(0);
  ANomeArq := fpCmd.Params(1);
  AListaRelat := StrToBoolDef( fpCmd.Params(2), False );
  ARetResposta := StrToBoolDef( fpCmd.Params(3), False );

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    ACBrBoleto.DirArqRetorno  := ADir;
    ACBrBoleto.NomeArqRetorno := ANomeArq;
    ACBrBoleto.LerRetorno();

    if ARetResposta then
    begin
      RespRetorno := TRetornoBoleto.Create(TpResp, codUTF8);
      try
        RespRetorno.Processar(ACBrBoleto);
        fpCmd.Resposta := sLineBreak + RespRetorno.Gerar;
      Finally
        RespRetorno.Free;
      end;

    end;

    ACBrBoleto.GravarArqIni(ADir,'');

    if ( AListaRelat ) then
        ImprimeRelatorioRetorno(ADir);

  end;

end;

{ TMetodoEnviarEmail }

{ Params: 0 - Dest : email do destinatário
}
procedure TMetodoEnviarEmail.Executar;
var
  ADest: String;
  Mensagem: TStringList;
begin
  ADest := Trim(fpCmd.Params(0));

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    if (ADest = '') and (ACBrBoleto.ListadeBoletos.Count > 0) then
      ADest := ACBrBoleto.ListadeBoletos[0].Sacado.Email;

    with MonitorConfig.BOLETO.Email do
    begin
        Mensagem := TStringList.Create;
      try
        Mensagem.Text:= StringToBinaryString(EmailMensagemBoleto);
        try
          ACBrBoleto.MAIL.IsHTML := EmailFormatoHTML;
          ACBrBoleto.EnviarEmail( ADest,
                 EmailAssuntoBoleto,
                 Mensagem,
                 True);
          if not(MonitorConfig.Email.SegundoPlano) then
            fpCmd.Resposta := 'E-mail enviado com sucesso!'
          else
            fpCmd.Resposta := 'Enviando e-mail em segundo plano...';

        except
          on E: Exception do
            raise Exception.Create('Erro ao enviar email' + sLineBreak + E.Message);
        end;

      finally
        Mensagem.Free;
      end;
    end;

  end;

end;

{ TMetodoIncluirTitulos }

{ Params: 0 - AIni : String com Path ou conteúdo .ini
          1 - TpSaida: Caractere com o Tipo de Saída
}
procedure TMetodoIncluirTitulos.Executar;
var
  AIni: String;
  ATpSaida: String;
  Mensagem: TStringList;
begin
  AIni := fpCmd.Params(0);
  ATpSaida := fpCmd.Params(1);

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    LerIniBoletos(AIni);

    if ATpSaida = 'I' then
    begin
      try
        DoAntesDeImprimir(ACBrBoleto.ACBrBoletoFC.MostrarPreview);
        ACBrBoleto.Imprimir;
      finally
        DoDepoisDeImprimir;
      end;
    end
    else if ATpSaida = 'P' then
      ACBrBoleto.GerarPDF
    else if ATpSaida = 'E' then
    begin
      with MonitorConfig.BOLETO.Email do
      begin
        Mensagem := TStringList.Create;
        try
          Mensagem.Text:= StringToBinaryString(EmailMensagemBoleto);
          ACBrBoleto.MAIL.IsHTML := EmailFormatoHTML;
          ACBrBoleto.EnviarEmail( ACBrBoleto.ListadeBoletos[0].Sacado.Email,
                           EmailAssuntoBoleto,
                           Mensagem,
                           True );
          fpCmd.Resposta := 'E-mail enviado com sucesso!'

        finally
          Mensagem.Free;
        end;
      end;

    end;

  end;

end;

{ TMetodoSetDiretorioArquivo }

{ Params: 0 - ADir : String com Diretório do Arquivo
          1 - AArq: String com Nome Arquivo
}
procedure TMetodoSetDiretorioArquivo.Executar;
var
  ADir: String;
  AArq: String;
begin
  ADir := fpCmd.Params(0);
  AArq := fpCmd.Params(1);

  if DirectoryExists(ADir) then
  begin
    with TACBrObjetoBoleto(fpObjetoDono) do
    begin
      with MonitorConfig.BOLETO.Layout do
      begin
        DirArquivoBoleto := PathWithDelim(ADir);
        MonitorConfig.SalvarArquivo;

        if ACBrBoleto.ACBrBoletoFC.Filtro = TACBrBoletoFCFiltro(fiHTML) then
           ACBrBoleto.ACBrBoletoFC.NomeArquivo := PathWithDelim( ADir )  +
             IfThen(NaoEstaVazio(AArq), AArq , 'boleto.html' )
        else
           ACBrBoleto.ACBrBoletoFC.NomeArquivo := PathWithDelim( ADir) +
             IfThen(NaoEstaVazio(AArq), AArq , 'boleto.pdf' );

        fpCmd.Resposta := ACBrBoleto.ACBrBoletoFC.NomeArquivo;

      end;

    end;

  end
  else
    raise Exception.Create('Arquivo não encontrado.');

end;

{ TMetodoListaBancos }

procedure TMetodoListaBancos.Executar;
begin
  with TACBrObjetoBoleto(fpObjetoDono) do
    fpCmd.Resposta := ListaBancos();

end;

{ TMetodoListaCaractTitulo }

procedure TMetodoListaCaractTitulo.Executar;
begin
  with TACBrObjetoBoleto(fpObjetoDono) do
    fpCmd.Resposta := ListaCaractTitulo();
end;

{ TMetodoListaOcorrencias }

procedure TMetodoListaOcorrencias.Executar;
begin
  with TACBrObjetoBoleto(fpObjetoDono) do
    fpCmd.Resposta := ListaOcorrencias();
end;

{ TMetodoListaOcorrenciasEX }

procedure TMetodoListaOcorrenciasEX.Executar;
begin
  with TACBrObjetoBoleto(fpObjetoDono) do
    fpCmd.Resposta := ListaOcorrenciasEX();
end;

{ TMetodoTamNossoNumero }

{ Params: 0 - ACarteira: Código Carteira
}
procedure TMetodoTamNossoNumero.Executar;
var
  ATam: String;
begin
  ATam := fpCmd.Params(0);

  with TACBrObjetoBoleto(fpObjetoDono) do
    fpCmd.Resposta := IntToStr(ACBrBoleto.Banco.CalcularTamMaximoNossoNumero(ATam));

end;

{ TMetodoMontarNossoNumero }

{ Params: 0 - Titulo: Indice do Título
}
procedure TMetodoMontarNossoNumero.Executar;
var
   ATitulo: Integer;
begin

  ATitulo := StrToIntDef(fpCmd.Params(0),0);

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    if (ACBrBoleto.ListadeBoletos.Count = 0) then
      raise Exception.Create('Nenhum título encontrado na Lista!');

    try
      fpCmd.Resposta := ACBrBoleto.Banco.MontarCampoNossoNumero(ACBrBoleto.ListadeBoletos[ATitulo]);

    except
      raise Exception.Create('Título de Indice '+IntToStr(ATitulo)+' não encontrado na Lista!');
    end;
  end;

end;
{ TMetodoRetornaLinhaDigitavel }

{ Params: 0 - Titulo: Indice do Título
}
procedure TMetodoRetornaLinhaDigitavel.Executar;
var
  ATitulo: Integer;
  ABarras: String;
begin

  ATitulo := StrToIntDef(fpCmd.Params(0),0);

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    if (ACBrBoleto.ListadeBoletos.Count = 0) then
      raise Exception.Create('Nenhum título encontrado na Lista!');

    try
      ABarras := ACBrBoleto.Banco.MontarCodigoBarras(ACBrBoleto.ListadeBoletos[ATitulo]);
      fpCmd.Resposta := ACBrBoleto.Banco.MontarLinhaDigitavel(ABarras,ACBrBoleto.ListadeBoletos[ATitulo]);

    except
      raise Exception.Create('Título de Indice '+IntToStr(ATitulo)+' não encontrado na Lista!');
    end;
  end;

end;

{ TMetodoRetornaCodigoBarras }

{ Params: 0 - ATitulo: Integer com índice do título na lista
}
procedure TMetodoRetornaCodigoBarras.Executar;
var
  ATitulo: Integer;
begin
  ATitulo := StrToIntDef(fpCmd.Params(0),0);

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    if (ACBrBoleto.ListadeBoletos.Count = 0) then
      raise Exception.Create('Nenhum título encontrado na Lista!');

    try
      fpCmd.Resposta := ACBrBoleto.Banco.MontarCodigoBarras(ACBrBoleto.ListadeBoletos[ATitulo])
    except
      raise Exception.Create('Título de Indice '+IntToStr(ATitulo)+' não encontrado na Lista!');
    end;
  end;

end;

{ TMetodoCodigosMoraAceitos }

procedure TMetodoCodigosMoraAceitos.Executar;
begin
  with TACBrObjetoBoleto(fpObjetoDono) do
    fpCmd.Resposta := ACBrBoleto.Banco.CodigosMoraAceitos;
end;

{ TMetodoSelecionaBanco }

{ Params: 0 - ACodBanco: Código do Banco
}
procedure TMetodoSelecionaBanco.Executar;
var
  ACodBanco: String;
begin
  ACodBanco := fpCmd.Params(0);

  with TACBrObjetoBoleto(fpObjetoDono) do
    ACBrBoleto.Banco.TipoCobranca := ACBrBoleto.GetTipoCobranca(StrToInt64Def(Trim(ACodBanco),0))

end;

{ TMetodoImprimirBoleto }

{ Params: 0 - Indice do Título a ser impresso
          1 - PrintName = Nome da Impressora
          2 - Preview = Boolean Mostrar em tela
}
procedure TMetodoImprimirBoleto.Executar;
var
  AIndice: Integer;
  AName: String;
  APreview: Boolean;
  AState: Boolean;
begin
  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    AIndice := StrToIntDef(fpCmd.Params(0),0);
    AName := fpCmd.Params(1);
    APreview := StrToBoolDef(fpCmd.Params(2),False);

    if NaoEstaVazio(AName) then
      ACBrBoleto.ACBrBoletoFC.PrinterName := AName;

    AState := ACBrBoleto.ACBrBoletoFC.MostrarPreview;

    if APreview then
      ACBrBoleto.ACBrBoletoFC.MostrarPreview := APreview;

    try
      DoAntesDeImprimir( ACBrBoleto.ACBrBoletoFC.MostrarPreview );
      try
        ACBrBoleto.ListadeBoletos[AIndice].Imprimir();
      Except
        raise Exception.Create('Título de Indice '+IntToStr(AIndice)+' não identificado na Lista!');
      end;
    finally
      DoDepoisDeImprimir;
      ACBrBoleto.ACBrBoletoFC.MostrarPreview := AState;
    end;

  end;

end;

{ TMetodoGerarPDFBoleto }

{ Params: 0 - Indice do Título a ser impresso}
procedure TMetodoGerarPDFBoleto.Executar;
var
  AIndice: Integer;
begin
  AIndice := StrToIntDef(fpCmd.Params(0),0);

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    try
      ACBrBoleto.ListadeBoletos[AIndice].GerarPDF();
    Except
      raise Exception.Create('Título de Indice '+IntToStr(AIndice)+' não identificado na Lista!');
    end;

  end;

end;

{ TMetodoEnviarEmailBoleto }

{ Params: 0 - Indice do Título a ser enviado
          1 - Dest : email do destinatário
}
procedure TMetodoEnviarEmailBoleto.Executar;
var
  AIndice: Integer;
  ADest: String;
  Mensagem: TStringList;
begin
  AIndice := StrToIntDef(fpCmd.Params(0),0);
  ADest := Trim(fpCmd.Params(1));

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    if AIndice > (ACBrBoleto.ListadeBoletos.Count -1) then
      raise Exception.Create('Título de Indice '+IntToStr(AIndice)+' não identificado na Lista!');

    if (ADest = '') and (ACBrBoleto.ListadeBoletos.Count > 0) then
      ADest := ACBrBoleto.ListadeBoletos[AIndice].Sacado.Email;

    with MonitorConfig.BOLETO.Email do
    begin
        Mensagem := TStringList.Create;
      try
        Mensagem.Text:= StringToBinaryString(EmailMensagemBoleto);
        try
          ACBrBoleto.MAIL.IsHTML := EmailFormatoHTML;
          ACBrBoleto.ListadeBoletos[AIndice].EnviarEmail( ADest,
                 EmailAssuntoBoleto,
                 Mensagem,
                 True);
          if not(MonitorConfig.Email.SegundoPlano) then
            fpCmd.Resposta := 'E-mail enviado com sucesso!'
          else
            fpCmd.Resposta := 'Enviando e-mail em segundo plano...';

        except
          on E: Exception do
            raise Exception.Create('Erro ao enviar email' + sLineBreak + E.Message);
        end;

      finally
        Mensagem.Free;
      end;
    end;

  end;

end;

{ TMetodoEnviarBoleto }

{ Params: 0 - TipoOperacao: Integer (0-Inclui, 1-Altera, 2-Baixa, 3-Consulta, 4-ConsultaDetalhe)
}
procedure TMetodoEnviarBoleto.Executar;
var
  I : Integer;
  AOperacao: Integer;
  Titulos: TArray<TRetornoRegistroWeb>;
  Titulo : TRetornoRegistroWeb;

begin
  AOperacao := StrToIntDef(fpCmd.Params(0),0);

  with TACBrObjetoBoleto(fpObjetoDono) do
  begin
    try
      ACBrBoleto.Configuracoes.WebService.Operacao:= TOperacao(AOperacao);
      ACBrBoleto.EnviarBoleto;
      if ACBrBoleto.ListaRetornoWeb.Count > 0 then
      begin
        SetLength(Titulos, ACBrBoleto.ListaRetornoWeb.Count);
        try
          for I:= 0 to ACBrBoleto.ListaRetornoWeb.Count -1 do
          begin
            Titulo := TRetornoRegistroWeb.Create(I + 1, TpResp, codUTF8);
            Titulo.Processar(ACBrBoleto.ListaRetornoWeb[I]);
            Titulos[I] := Titulo;
          end;

          fpCmd.Resposta := TACBrObjectSerializer.Gerar<TRetornoRegistroWeb>(Titulos, TpResp, codUTF8);
        finally
          for I:= 0 to High(Titulos) do
          begin
            Titulo := Titulos[I] as TRetornoRegistroWeb;
            FreeAndNil(Titulo);
          end;

          SetLength(Titulos, 0);
          Titulos := nil;
        end;
      end;

      {if ACBrBoleto.ListaRetornoWeb.Count > 0 then
      for I:= 0 to ACBrBoleto.ListaRetornoWeb.Count -1 do
      begin
        RespRetornoWeb := TRetornoRegistroWeb.Create(I+1 , TpResp, codUTF8);
        try
          RespRetornoWeb.Processar(ACBrBoleto.ListaRetornoWeb[I]);
          fpCmd.Resposta := fpCmd.Resposta + sLineBreak + RespRetornoWeb.Gerar;
        Finally
          RespRetornoWeb.Free;
        end;

      end;}

    except
      on E: Exception do
        raise Exception.Create('Falha ao Enviar Boleto. '+ sLineBreak + E.Message);
    end;

  end;

end;

procedure TACBrObjetoBoleto.LerIniBoletos( aStr: String ) ;
begin
  if not ( ACBrBoleto.LerArqIni( aStr ) ) then
      raise exception.Create('Erro ao ler arquivo de entrada ou '+
         'parâmetro incorreto.');

  {Parametros do Cedente}
  with MonitorConfig.BOLETO do
  begin
    Nome               := fACBrBoleto.Cedente.Nome;
    CNPJCPF            := fACBrBoleto.Cedente.CNPJCPF;
    Logradouro         := fACBrBoleto.Cedente.Logradouro;
    Numero             := fACBrBoleto.Cedente.NumeroRes;
    Bairro             := fACBrBoleto.Cedente.Bairro;
    Cidade             := fACBrBoleto.Cedente.Cidade;
    CEP                := fACBrBoleto.Cedente.CEP;
    Complemento        := fACBrBoleto.Cedente.Complemento;
    UF                 := fACBrBoleto.Cedente.UF;
    with Conta do
    begin
      CodCedente       := fACBrBoleto.Cedente.CodigoCedente;
      RespEmis         := Integer( fACBrBoleto.Cedente.ResponEmissao );
      Pessoa           := Integer( fACBrBoleto.Cedente.TipoInscricao );
      Modalidade       := fACBrBoleto.Cedente.Modalidade;
      Convenio         := fACBrBoleto.Cedente.Convenio;
    end;
    with RemessaRetorno do
      CodTransmissao    := fACBrBoleto.Cedente.CodigoTransmissao;
    if ( Integer(fACBrBoleto.ACBrBoletoFC.LayOut) > 0 ) then
    with Layout do
      Layout            := Integer(fACBrBoleto.ACBrBoletoFC.LayOut);

  end;

  {Parametros do Banco}
  with MonitorConfig.BOLETO.Conta do
    Banco := Integer(fACBrBoleto.Banco.TipoCobranca);
  with MonitorConfig.BOLETO.RemessaRetorno do
    CNAB := Integer(fACBrBoleto.LayoutRemessa);


  {Parametros da Conta}
  with MonitorConfig.BOLETO.Conta do
  begin
    Conta         := fACBrBoleto.Cedente.Conta;
    DigitoConta   := fACBrBoleto.Cedente.ContaDigito;
    Agencia       := fACBrBoleto.Cedente.Agencia;
    DigitoAgencia := fACBrBoleto.Cedente.AgenciaDigito;
    CodCedente    := fACBrBoleto.Cedente.CodigoCedente;
    DigitoAgenciaConta := fACBrBoleto.Cedente.DigitoVerificadorAgenciaConta;
  end;

  MonitorConfig.SalvarArquivo;

end;

function TACBrObjetoBoleto.ListaBancos() : String;
var
   IBanco : TACBrTipoCobranca;
   SBanco : String;
begin
   IBanco := Low(TACBrTipoCobranca);
   Inc(IBanco); // Removendo item 0-Nenhum
   Result := '';

   while IBanco <= High(TACBrTipoCobranca) do
   begin
     sBanco := GetEnumName( TypeInfo(TACBrTipoCobranca), Integer(IBanco) );
     sBanco := copy(SBanco,4, Length(SBanco)); // Removendo "cob" do nome do banco.
     Result := Result + sBanco + '|';

     Inc(IBanco);
   end;

   if Result <> '' then
      Result := copy(Result,1,Length(Result)-1) ;
end;

function TACBrObjetoBoleto.ListaCaractTitulo: String;
var
   ICaractTitulo : TACBrCaracTitulo;
   SCaractTitulo : String;
begin
   ICaractTitulo := Low(TACBrCaracTitulo);

   while ICaractTitulo <= High(TACBrCaracTitulo) do
   begin
     SCaractTitulo := GetEnumName( TypeInfo(TACBrCaracTitulo), Integer(ICaractTitulo) );
     SCaractTitulo := copy(SCaractTitulo, 3, Length(SCaractTitulo)); // Removendo "tc".
     Result := Result + SCaractTitulo + '|';

     Inc(ICaractTitulo);
   end;

   if Result <> '' then
      Result := copy(Result,1,Length(Result)-1) ;
end;

function TACBrObjetoBoleto.ListaOcorrencias: String;
var
   ITipoOcorrencia : TACBrTipoOcorrencia;
   SOcorrencia     : String;
begin
  ITipoOcorrencia := Low(TACBrTipoOcorrencia);

  while ( ITipoOcorrencia <= High(TACBrTipoOcorrencia) ) do
  begin
    SOcorrencia := GetEnumName( TypeInfo(TACBrTipoOcorrencia), Integer(ITipoOcorrencia) ) ;
    Result := Result + copy(SOcorrencia, 3, Length(SOcorrencia)) + '|';  //Remove "to"
    Inc(ITipoOcorrencia);
  end;

  if (Result <> '') then
    Result := copy(Result,1,Length(Result)-1) ;
end;

function TACBrObjetoBoleto.ListaOcorrenciasEX(): String;
var
   ITipoOcorrencia : TACBrTipoOcorrencia;
   SOcorrencia     : String;
   ValorIndice     : Integer;
begin
  ITipoOcorrencia := Low(TACBrTipoOcorrencia);

  while ( ITipoOcorrencia <= High(TACBrTipoOcorrencia) ) do
  begin
    ValorIndice := Integer(ITipoOcorrencia);
    SOcorrencia := GetEnumName( TypeInfo(TACBrTipoOcorrencia), ValorIndice ) ;
    Result := Result + IntToStr(ValorIndice) + '-' +
              copy(SOcorrencia, 3, Length(SOcorrencia)) + '|';  //Remove "to"
    Inc(ITipoOcorrencia);
  end;

  if (Result <> '') then
    Result := copy(Result, 1, Length(Result)-1) ;
end;

procedure TACBrObjetoBoleto.ImprimeRelatorioRetorno(sArqRetorno : String);
var
   fRelRetorno : TfrmACBrBoletoRelatorioRet;
begin

    fRelRetorno := TfrmACBrBoletoRelatorioRet.Create(frmACBrBoletoRelatorioRet);
    try
    fRelRetorno.ACBrBoleto     := fACBrBoleto;
    fRelRetorno.ArquivoRetorno := sArqRetorno;
    fRelRetorno.PathLogo       := MonitorConfig.BOLETO.Layout.DirLogos;
    fRelRetorno.LogoEmpresa    := MonitorConfig.BOLETO.Relatorio.LogoEmpresa;

    if MonitorConfig.BOLETO.Relatorio.MostraPreviewRelRetorno then
      fRelRetorno.ResumoRetornoRemessa.Preview()
    else
      fRelRetorno.ResumoRetornoRemessa.Print;
    finally
    end;
end;




end.

