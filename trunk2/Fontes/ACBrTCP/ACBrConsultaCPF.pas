{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esse arquivo usa a classe  SynaSer   Copyright (c)2001-2003, Lukas Gebauer   }
{  Project : Ararat Synapse     (Found at URL: http://www.ararat.cz/synapse/)  }
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
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}
{******************************************************************************
|* Historico
|*
|* 07/08/2013: Primeira Versao - Adaptador conforme ACBRConsultaCNPJ
|*    Daniel - schrsistemas@gmail.com
******************************************************************************}

{$I ACBr.inc}

unit ACBrConsultaCPF;

interface

uses
  SysUtils, Classes, ACBrSocket;

type
  EACBrConsultaCPFException = class ( Exception );

  { TACBrConsultaCPF }

  TACBrConsultaCPF = class(TACBrHTTP)
  private
    FDataNascimento: String;
    FNome: String;
    FSituacao: String;
    FCPF: String;
    FDigitoVerificador: String;
    FEmissao: String;
    FCodCtrlControle: String;
    FTokenCaptcha: String;

    function VerificarErros(Str: String): String;
    function LerCampo(Texto: TStringList; NomeCampo: String): String;
  public
    procedure Captcha(Stream: TStream);
    function Consulta(const ACPF, DataNasc, ACaptcha: String;
      ARemoverEspacosDuplos: Boolean = False): Boolean;
  published
    property CPF: String Read FCPF Write FCPF;
    property DataNascimento : String Read FDataNascimento write FDataNascimento;
    property Nome: String Read FNome;
    property Situacao: String Read FSituacao;
    property DigitoVerificador: String Read FDigitoVerificador;
    property Emissao: String Read FEmissao;
    property CodCtrlControle: String Read FCodCtrlControle;
  end;

implementation

uses
  ACBrUtil, ACBrValidador, synautil, strutils;

function StrEntreStr(Str, StrInicial, StrFinal: String; ComecarDe: Integer = 1): String;
var
  Ini, Fim: Integer;
begin
  Ini:= PosEx(StrInicial, Str, ComecarDe) + Length(StrInicial);
  if Ini > 0 then
  begin
    Fim:= PosEx(StrFinal, Str, Ini);
    if Fim > 0 then
      Result:= Copy(Str, Ini, Fim - Ini)
    else
      Result:= '';
  end
  else
    Result:= '';
end;

procedure TACBrConsultaCPF.Captcha(Stream: TStream);
begin
  try
    HTTPGet('http://www.receita.fazenda.gov.br/Aplicacoes/ATCTA/CPF/captcha/gerarCaptcha.asp');
    if HTTPSend.ResultCode = 200 then
    begin
      HTTPSend.Document.Position := 0;
      Stream.CopyFrom(HttpSend.Document, HttpSend.Document.Size);

      Stream.Position := 0;
    end;
  Except
    on E: Exception do begin
      raise EACBrConsultaCPFException.Create('Erro na hora de fazer o download da imagem do captcha.'+#13#10+E.Message);
    end;
  end;
end;

function TACBrConsultaCPF.VerificarErros(Str: String): String;
var
  Res: String;
begin
  Res := '';
  if Res = '' then
    if Pos( ACBrStr('Os caracteres da imagem n�o foram preenchidos corretamente'), Str) > 0 then
      Res := 'Os caracteres da imagem n�o foram preenchidos corretamente.';

  if Res = '' then
    if Pos(ACBrStr('O n�mero do CPF n�o � v�lido. Verifique se o mesmo foi digitado corretamente.'), Str) > 0 then
      Res := 'O n�mero do CPF n�o � v�lido. Verifique se o mesmo foi digitado corretamente.';

  if Res = '' then
    if Pos(ACBrStr('N�o existe no Cadastro de Pessoas Jur�dicas o n�mero de CPF informado. '+
                   'Verifique se o mesmo foi digitado corretamente.'), Str) > 0 then
      Res := 'N�o existe no Cadastro de Pessoas Jur�dicas o n�mero de CPF informado. '+
             'Verifique se o mesmo foi digitado corretamente.';

  if Res = '' then
    if Pos(ACBrStr('a. No momento n�o podemos atender a sua solicita��o. Por favor tente mais tarde.'), Str) > 0 then
      Res := 'Erro no site da receita federal. Tente mais tarde.';

  Result := ACBrStr(Res);
end;

function TACBrConsultaCPF.LerCampo(Texto : TStringList ; NomeCampo : String
  ) : String ;
var
  i : integer;
  linha : String;
begin
  NomeCampo := ACBrStr(NomeCampo);
  Result := '';
  for i := 0 to Texto.Count-1 do
  begin
    linha := Texto[i];
    if Pos(NomeCampo, linha) > 0 then
    begin
      Result := Trim(StringReplace(linha, NomeCampo, ' ',[rfReplaceAll]));
      break;
    end;
  end
end;

function TACBrConsultaCPF.Consulta(const ACPF, DataNasc,  ACaptcha: String;
  ARemoverEspacosDuplos: Boolean): Boolean;
var
  Post: TStringStream;
  Erro: String;
  Resposta : TStringList;
begin
  Erro := ValidarCPF( ACPF ) ;
  if Erro <> '' then
     raise EACBrConsultaCPFException.Create(Erro);

  //txtCPF=11122334410&txtToken_captcha_serpro_gov_br=299218104152138191166941752496584741018616278361624164&txtTexto_captcha_serpro_gov_br=ZCI8B9&Enviar=Consultar
  Post:= TStringStream.Create('');
  try
    {Post.WriteString('txtCPF='+OnlyNumber(ACPF)+'&');
    //Post.WriteString('tempTxtNascimento='+dataNasc+'&');
    Post.WriteString('txtToken_captcha_serpro_gov_br='+FTokenCaptcha+'&');
    Post.WriteString('txtTexto_captcha_serpro_gov_br='+Trim(ACaptcha)+'&');
    Post.WriteString('Enviar=Consultar');}

    Post.WriteString('tempTxtCPF='+ACPF+'&');
    Post.WriteString('tempTxtNascimento='+datanasc+'&');
    Post.WriteString('temptxtToken_captcha_serpro_gov_br='+FTokenCaptcha+'&');
    Post.WriteString('txtTexto_captcha_serpro_gov_br='+Trim(ACaptcha)+'&');
    Post.WriteString('temptxtTexto_captcha_serpro_gov_br='+Trim(ACaptcha)+'&');
    Post.WriteString('Enviar=Consultar');

    Post.Position:= 0;

    HttpSend.Clear;
    HttpSend.Document.Position:= 0;
    HttpSend.Document.CopyFrom(Post, Post.Size);
    HTTPSend.MimeType := 'application/x-www-form-urlencoded';
    HTTPPost('http://www.receita.fazenda.gov.br/aplicacoes/atcta/cpf/ConsultaPublicaExibir.asp');

    Erro := VerificarErros(RespHTTP.Text);

    if Erro = '' then
    begin
      Result:= True;
      Resposta := TStringList.Create;
      try
        Resposta.Text := StripHTML(RespHTTP.Text);
        RemoveEmptyLines( Resposta );

        //DEBUG:
        //Resposta.SaveToFile('C:\temp\cpf.txt');

        FCPF      := LerCampo(Resposta,'No do CPF:');
        FNome     := LerCampo(Resposta,'Nome da Pessoa F�sica:');
        FDataNascimento := LerCampo(Resposta,'Data de Nascimento:');
        FSituacao := LerCampo(Resposta,'Situa��o Cadastral:');
        FEmissao  := LerCampo(Resposta,'Comprovante emitido �s:');
        FCodCtrlControle   := LerCampo(Resposta,'C�digo de controle do comprovante:');
        FDigitoVerificador := LerCampo(Resposta,'Digito Verificador:');

        if Trim(FNome) = '' then
        begin
          Erro     := LerCampo(Resposta,'Data de nascimento informada');
          if Trim(Erro) <> '' then
            Erro := 'Erro de data';
        end;
      finally
        Resposta.Free;
      end ;

      if Trim(Erro) = 'Erro de data' then
            raise EACBrConsultaCPFException.Create('Data de nascimento divergente da base da Receita Federal.');

      if Trim(FNome) = '' then
        raise EACBrConsultaCPFException.Create('N�o foi poss�vel obter os dados.');

      if ARemoverEspacosDuplos then
      begin
        FNome := RemoverEspacosDuplos(FNome);
      end;
    end
    else
    begin
      Result:= False;
      raise EACBrConsultaCPFException.Create(Erro);
    end;
  finally
    Post.Free;
  end;
end;

end.

