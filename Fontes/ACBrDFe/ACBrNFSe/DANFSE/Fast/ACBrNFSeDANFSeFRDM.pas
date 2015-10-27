unit ACBrNFSeDANFSeFRDM;

interface

uses
  SysUtils, Classes, frxClass, frxExportPDF, DB, DBClient, frxDBSet,
  ACBrNFSeDANFSeClass, pnfsNFSe, pnfsConversao, frxBarcode,
  ACBrUtil, ACBrValidador;

type
  TdmACBrNFSeFR = class(TDataModule)
    frxReport: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    cdsIdentificacao: TClientDataSet;
    cdsPrestador: TClientDataSet;
    cdsServicos: TClientDataSet;
    frxIdentificacao: TfrxDBDataset;
    frxPrestador: TfrxDBDataset;
    frxTomador: TfrxDBDataset;
    frxServicos: TfrxDBDataset;
    cdsParametros: TClientDataSet;
    frxParametros: TfrxDBDataset;
    cdsIdentificacaoid: TStringField;
    cdsIdentificacaoNumero: TStringField;
    cdsIdentificacaoSerie: TStringField;
    cdsIdentificacaoTipo: TStringField;
    cdsIdentificacaoCompetencia: TStringField;
    cdsIdentificacaoNFSeSubstituida: TStringField;
    cdsIdentificacaoDataEmissao: TStringField;
    cdsIdentificacaoCodigoVerificacao: TStringField;
    cdsServicosItemListaServico: TStringField;
    cdsServicosCodigoCnae: TStringField;
    cdsServicosCodigoTributacaoMunicipio: TStringField;
    cdsServicosDiscriminacao: TStringField;
    cdsServicosCodigoPais: TStringField;
    cdsServicosNumeroProcesso: TStringField;
    cdsServicosxItemListaServico: TStringField;
    cdsServicosResponsavelRetencao: TStringField;
    cdsServicosDescricao: TStringField;
    cdsServicosValorServicos: TCurrencyField;
    cdsServicosValorDeducoes: TCurrencyField;
    cdsServicosValorPis: TCurrencyField;
    cdsServicosValorCofins: TCurrencyField;
    cdsServicosValorInss: TCurrencyField;
    cdsServicosValorIr: TCurrencyField;
    cdsServicosValorCsll: TCurrencyField;
    cdsServicosValorIss: TCurrencyField;
    cdsServicosOutrasRetencoes: TCurrencyField;
    cdsServicosBaseCalculo: TCurrencyField;
    cdsServicosAliquota: TCurrencyField;
    cdsServicosIssRetido: TStringField;
    cdsServicosValorLiquidoNfse: TCurrencyField;
    cdsServicosValorIssRetido: TCurrencyField;
    cdsServicosDescontoCondicionado: TCurrencyField;
    cdsServicosDescontoIncondicionado: TCurrencyField;
    cdsPrestadorCnpj: TStringField;
    cdsPrestadorInscricaoMunicipal: TStringField;
    cdsPrestadorRazaoSocial: TStringField;
    cdsPrestadorNomeFantasia: TStringField;
    cdsPrestadorEndereco: TStringField;
    cdsPrestadorNumero: TStringField;
    cdsPrestadorComplemento: TStringField;
    cdsPrestadorBairro: TStringField;
    cdsPrestadorCodigoMunicipio: TStringField;
    cdsPrestadorUF: TStringField;
    cdsPrestadorCEP: TStringField;
    cdsPrestadorxMunicipio: TStringField;
    cdsPrestadorCodigoPais: TStringField;
    cdsPrestadorTelefone: TStringField;
    cdsPrestadorEmail: TStringField;
    cdsTomador: TClientDataSet;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    cdsTomadorCpfCnpj: TStringField;
    cdsIdentificacaoNumeroNFSe: TStringField;
    cdsParametrosExigibilidadeISS: TStringField;
    cdsParametrosCodigoMunicipio: TStringField;
    cdsParametrosMunicipioIncidencia: TStringField;
    cdsParametrosLogoExpandido: TStringField;
    cdsParametrosImagem: TStringField;
    cdsParametrosLogoCarregado: TBlobField;
    cdsServicosTotalNota: TFloatField;
    cdsServicosTotalServicos: TFloatField;
    cdsParametrosimgPrefeitura: TStringField;
    cdsParametrosLogoPrefExpandido: TStringField;
    cdsParametrosLogoPrefCarregado: TBlobField;
    cdsParametrosNome_Prefeitura: TStringField;
    cdsParametrosMensagem0: TStringField;
    cdsParametrosSistema: TStringField;
    cdsItensServico: TClientDataSet;
    frxItensServico: TfrxDBDataset;
    cdsItensServicoDiscriminacaoServico: TStringField;
    cdsItensServicoQuantidade: TFloatField;
    cdsItensServicoValorUnitario: TFloatField;
    cdsItensServicoValorTotal: TFloatField;
    cdsItensServicoTributavel: TStringField;
    cdsParametrosUsuario: TStringField;
    cdsParametrosNaturezaOperacao: TStringField;
    cdsParametrosRegimeEspecialTributacao: TStringField;
    cdsParametrosOptanteSimplesNacional: TStringField;
    cdsParametrosIncentivadorCultural: TStringField;
    constructor Create(AOwner: TComponent); override;
    procedure frxReportBeforePrint(Sender: TfrxReportComponent);
  private
    FDANFSeClassOwner: TACBrNFSeDANFSeClass;
    FNFSe: TNFSe;
    procedure CarregaIdentificacao;
    procedure CarregaPrestador;
    procedure CarregaTomador;
    procedure CarregaServicos;
    procedure CarregaItensServico;
    procedure CarregaParametros;
  public
    property NFSe: TNFSe read FNFSe write FNFSe;
    property DANFSeClassOwner: TACBrNFSeDANFSeClass read FDANFSeClassOwner;
    procedure CarregaDados;
  end;

var
  dmACBrNFSeFR: TdmACBrNFSeFR;

implementation

uses ACBrNFSe, ACBrDFeUtil, StrUtils, Math;

{$R *.dfm}

{ TdmACBrNFSeFR }

procedure TdmACBrNFSeFR.CarregaDados;
begin
  CarregaIdentificacao;
  CarregaPrestador;
  CarregaTomador;
  CarregaServicos;
  CarregaItensServico;
  CarregaParametros;
end;

procedure TdmACBrNFSeFR.CarregaIdentificacao;
begin
  with cdsIdentificacao do
  begin
    Close;
    CreateDataSet;
    Append;

    with FNFSe do
    begin
      with infID do
      begin
        FieldByName('Id').AsString        := IdentificacaoRps.Numero+IdentificacaoRps.Serie;
      end;

      with IdentificacaoRps do
      begin
        FieldByName('Numero').AsString    := FormatarNumeroDocumentoFiscalNFSe(Numero);
//        FieldByName('Serie').AsString     := Serie;
//        FieldByName('Tipo').AsString      := IfThen(Tipo = trRPS, '0','1');
      end;

      FieldByName('Competencia').AsString       := Competencia;
      FieldByName('NFSeSubstituida').AsString   := FormatarNumeroDocumentoFiscalNFSe(NfseSubstituida);
      FieldByName('NumeroNFSe').AsString        := FormatarNumeroDocumentoFiscalNFSe(Numero);
      FieldByName('DataEmissao').AsString       := FormatDateBr(DataEmissao);
      FieldByName('CodigoVerificacao').AsString := CodigoVerificacao;
    end;

    Post;
  end;
end;

procedure TdmACBrNFSeFR.CarregaItensServico;
var
  i: Integer;
  dValorNota: Double;
begin
  with cdsItensServico do
  begin
    Close;
    CreateDataSet;

    for i := 0 to FNFSe.Servico.ItemServico.Count -1 do
      with FNFSe.Servico.ItemServico.Items[i] do
      begin
        Append;
        cdsItensServicoDiscriminacaoServico.AsString := Descricao;
        cdsItensServicoQuantidade.AsFloat            := Quantidade;
        cdsItensServicoValorUnitario.AsFloat         := ValorUnitario;
        cdsItensServicoValorTotal.AsFloat            := ValorTotal;
        cdsItensServicoTributavel.AsString           := SimNaoToStr(Tributavel);
        Post;
      end;
  end;
end;

procedure TdmACBrNFSeFR.CarregaParametros;
var
  vStream: TMemoryStream;
  vStringStream: TStringStream;
begin
  with cdsParametros do
  begin
    Close;
    CreateDataSet;
    Append;

    with FNFse do
    begin
      FieldByName('OutrasInformacoes').AsString			:= OutrasInformacoes;
      if DANFSeClassOwner.NFSeCancelada then
        FieldByName('Mensagem0').AsString := 'NFSe CANCELADA'
      else
        FieldByName('Mensagem0').AsString := '';

      case FNFSe.NaturezaOperacao of
        no1  : FieldByName('NaturezaOperacao').AsString := '1 - Tributa��o no munic�pio';
        no2  : FieldByName('NaturezaOperacao').AsString := '2 - Tributa��o fora do munic�pio';
        no3  : FieldByName('NaturezaOperacao').AsString := '3 - Isen��o';
        no4  : FieldByName('NaturezaOperacao').AsString := '4 - Imune';
        no5  : FieldByName('NaturezaOperacao').AsString := '5 - Exigibilidade susp. por decis�o judicial';
        no6  : FieldByName('NaturezaOperacao').AsString := '6 - Exigibilidade susp. por proced. adm.';
        no59 : FieldByName('NaturezaOperacao').AsString := '7 - Simples Nacional (Dentro Estado)';
        no69 : FieldByName('NaturezaOperacao').AsString := '8 - Simples Nacional (Fora Estado)';
        no52 : FieldByName('NaturezaOperacao').AsString := '9 - Tributacao No Municipio Sem Reten��o de ISS';
      end;

      // TnfseRegimeEspecialTributacao = ( retNenhum, retMicroempresaMunicipal, retEstimativa, retSociedadeProfissionais, retCooperativa, retMicroempresarioIndividual, retMicroempresarioEmpresaPP )
      case FNFSe.RegimeEspecialTributacao of
        retNenhum                    : FieldByName('RegimeEspecialTributacao').AsString := '0 - Nenhum';
        retMicroempresaMunicipal     : FieldByName('RegimeEspecialTributacao').AsString := '1 - Microempresa municipal';
        retEstimativa                : FieldByName('RegimeEspecialTributacao').AsString := '2 - Estimativa';
        retSociedadeProfissionais    : FieldByName('RegimeEspecialTributacao').AsString := '3 - Sociendade de profissionais';
        retCooperativa               : FieldByName('RegimeEspecialTributacao').AsString := '4 - Cooperativa';
        retMicroempresarioIndividual : FieldByName('RegimeEspecialTributacao').AsString := '5 - Microempres�rio Individual (MEI)';
        retMicroempresarioEmpresaPP  : FieldByName('RegimeEspecialTributacao').AsString := '6 - Microempres�rio e Empresa de Pequeno Porte (ME EPP)';
      end;

      // TnfseSimNao = ( snSim, snNao )
      case FNFSe.OptanteSimplesNacional of
        snSim : FieldByName('OptanteSimplesNacional').AsString := 'Sim';
        snNao : FieldByName('OptanteSimplesNacional').AsString := 'N�o';
      end;

      // TnfseSimNao = ( snSim, snNao )
      case FNFSe.IncentivadorCultural of
        snSim : FieldByName('IncentivadorCultural').AsString := 'Sim';
        snNao : FieldByName('IncentivadorCultural').AsString := 'N�o';
      end;
    end;

    with FNFSe.Servico do
    begin
      if CodigoMunicipio <> '' then
       FieldByName('CodigoMunicipio').AsString          := CodCidadeToCidade(StrToInt(CodigoMunicipio))
      else
       FieldByName('CodigoMunicipio').AsString          := '';

      case ExigibilidadeISS of
        exiExigivel                       : FieldByName('ExigibilidadeISS').AsString := 'Exig�vel';
        exiNaoIncidencia                  : FieldByName('ExigibilidadeISS').AsString := 'N�o Incid�ncia';
        exiIsencao                        : FieldByName('ExigibilidadeISS').AsString := 'Isen��o';
        exiExportacao                     : FieldByName('ExigibilidadeISS').AsString := 'Exporta��o';
        exiImunidade                      : FieldByName('ExigibilidadeISS').AsString := 'Imunidade';
        exiSuspensaDecisaoJudicial        : FieldByName('ExigibilidadeISS').AsString := 'Suspensa Decisao Judicial';
        exiSuspensaProcessoAdministrativo : FieldByName('ExigibilidadeISS').AsString := 'Suspensa Processo Administrativo';
      end;

      FieldByName('MunicipioIncidencia').AsString       := CodCidadeToCidade(StrToIntDef(CodigoMunicipio,0)); // MunicipioIncidencia // removido pois sempre vem em branco.. (Oneide)
    end;

    with FNFSe.ConstrucaoCivil do
    begin
      FieldByName('CodigoObra').AsString				:= CodigoObra;
      FieldByName('Art').AsString					    	:= Art;
    end;

    // Carrega a Logo Prefeitura
    if NaoEstaVazio(DANFSeClassOwner.Logo) then
    begin
      FieldByName('Nome_Prefeitura').AsString := DANFSeClassOwner.Prefeitura;
      FieldByName('imgPrefeitura').AsString   := DANFSeClassOwner.Logo;
      vStream := TMemoryStream.Create;
      try
        if FileExists(DANFSeClassOwner.Logo) then
          vStream.LoadFromFile(DANFSeClassOwner.Logo)
        else
        begin
          vStringStream := TStringStream.Create(DANFSeClassOwner.Logo);
          try
            vStream.LoadFromStream(vStringStream);
          finally
            vStringStream.Free;
          end;
        end;
        vStream.Position := 0;
        cdsParametrosLogoPrefCarregado.LoadFromStream(vStream);
      finally
        vStream.Free;
      end;
    end;

    // Carrega a Imagem Prestadora
    if NaoEstaVazio(DANFSeClassOwner.PrestLogo) then
    begin
      FieldByName('Imagem').AsString := DANFSeClassOwner.PrestLogo;
      vStream := TMemoryStream.Create;
      try
        if FileExists(DANFSeClassOwner.PrestLogo) then
          vStream.LoadFromFile(DANFSeClassOwner.PrestLogo)
        else
        begin
          vStringStream := TStringStream.Create(DANFSeClassOwner.PrestLogo);
          try
            vStream.LoadFromStream(vStringStream);
          finally
            vStringStream.Free;
          end;
        end;
        vStream.Position := 0;
        cdsParametrosLogoCarregado.LoadFromStream(vStream);
      finally
        vStream.Free;
      end;
    end;

    // Prefeitura
    if DANFSeClassOwner.ExpandirLogoMarca then
      FieldByName('LogoPrefExpandido').AsString := '1'
    else
      FieldByName('LogoPrefExpandido').AsString := '0';

    // Prestador
    if DANFSeClassOwner.ExpandirLogoMarca then
      FieldByName('LogoExpandido').AsString := '1'
    else
      FieldByName('LogoExpandido').AsString := '0';

    // Sistema
    if DANFSeClassOwner.Sistema <> '' then
      FieldByName('Sistema').AsString := DANFSeClassOwner.Sistema
    else
      FieldByName('Sistema').AsString := '';

    if DANFSeClassOwner.Usuario <> '' then
      FieldByName('Usuario').AsString := DANFSeClassOwner.Usuario
    else
      FieldByName('Usuario').AsString := '';

    Post;
  end;
end;

procedure TdmACBrNFSeFR.CarregaPrestador;
begin
  with cdsPrestador do
  begin
    Close;
    CreateDataSet;
    Append;

    with FNFSe.PrestadorServico do
    begin
      FieldByName('RazaoSocial').AsString               := RazaoSocial;
      FieldByName('NomeFantasia').AsString              := NomeFantasia;

      with IdentificacaoPrestador do
      begin
        FieldByName('Cnpj').AsString                    := FormatarCNPJ(Cnpj);
        FieldByName('InscricaoMunicipal').AsString      := InscricaoMunicipal;
      end;
      with Endereco do
      begin
        FieldByName('Endereco').AsString                := Endereco;
        FieldByName('Numero').AsString                  := Numero;
        FieldByName('Complemento').AsString             := Complemento;
        FieldByName('Bairro').AsString                  := Bairro;
        FieldByName('CodigoMunicipio').AsString         := CodigoMunicipio;
        FieldByName('UF').AsString                      := UF;
        FieldByName('CEP').AsString                     := FormatarCEP(CEP);
        FieldByName('xMunicipio').AsString              := xMunicipio;
        FieldByName('CodigoPais').AsString              := IntToStr(CodigoPais);
      end;
      with Contato do
      begin
        FieldByName('Telefone').AsString                := FormatarFone(Telefone);
        FieldByName('Email').AsString                   := Email;
      end;
    end;
    Post;
  end;
end;

procedure TdmACBrNFSeFR.CarregaServicos;
var
  i: Integer;
  dValorNota: Double;
begin
  with cdsServicos do
  begin
    Close;
    CreateDataSet;
    Append;

    with FNFSe.Servico do
    begin
      FieldByName('ItemListaServico').AsString          := ItemListaServico;
      FieldByName('xItemListaServico').AsString         := xItemListaServico;
      FieldByName('CodigoCnae').AsString                := CodigoCnae;
      FieldByName('CodigoTributacaoMunicipio').AsString := CodigoTributacaoMunicipio;
      //FieldByName('Discriminacao').AsString             := StringReplace(Discriminacao, ';', #13, [rfReplaceAll]);
	    FieldByName('Discriminacao').AsString             := StringReplace(Discriminacao, TACBrNFSe(DANFSeClassOwner.ACBrNFSe).Configuracoes.WebServices.QuebradeLinha, #13, [rfReplaceAll, rfIgnoreCase]);

      FieldByName('CodigoPais').AsString                := IntToStr(CodigoPais);
      FieldByName('NumeroProcesso').AsString            := NumeroProcesso;
//      FieldByName('ResponsavelRetencao').AsString       := IfThen(ResponsavelRetencao = rtPrestador,'0','1');
      FieldByName('Descricao').AsString                 := Descricao;

      with Valores do
      begin
        FieldByName('ValorServicos').AsFloat            := ValorServicos;
        FieldByName('ValorDeducoes').AsFloat            := ValorDeducoes;
        FieldByName('ValorPis').AsFloat                 := ValorPis;
        FieldByName('ValorCofins').AsFloat              := ValorCofins;
        FieldByName('ValorInss').AsFloat                := ValorInss;
        FieldByName('ValorIr').AsFloat                  := ValorIr;
        FieldByName('ValorCsll').AsFloat                := ValorCsll;
        case IssRetido of
          stRetencao    : FieldByName('IssRetido').AsString := '1 - Sim' ;
          stNormal      : FieldByName('IssRetido').AsString := '2 - N�o' ;
          stSubstituicao: FieldByName('IssRetido').AsString := '3 - Subst.' ;
        end;
        FieldByName('ValorIss').AsFloat                 := ValorIss;
        FieldByName('OutrasRetencoes').AsFloat          := OutrasRetencoes;
        FieldByName('BaseCalculo').AsFloat              := BaseCalculo;
        FieldByName('Aliquota').AsFloat                 := Aliquota;
        FieldByName('ValorLiquidoNfse').AsFloat         := ValorLiquidoNfse;
        FieldByName('ValorIssRetido').AsFloat           := ValorIssRetido;
        FieldByName('DescontoCondicionado').AsFloat     := DescontoCondicionado;
        FieldByName('DescontoIncondicionado').AsFloat   := DescontoIncondicionado;
      end;
    end;
    Post;
  end;
end;

procedure TdmACBrNFSeFR.CarregaTomador;
begin
  with cdsTomador do
  begin
    Close;
    CreateDataSet;
    Append;

    with FNFSe.Tomador do
    begin
      FieldByName('RazaoSocial').AsString               := RazaoSocial;

      with IdentificacaoTomador do
      begin
        if NaoEstaVazio(CpfCnpj) then
        begin
          if Length(CpfCnpj) > 11 then
            FieldByName('CpfCnpj').AsString := FormatarCNPJ(CpfCnpj)
          else
            FieldByName('CpfCnpj').AsString := FormatarCPF(CpfCnpj);
        end
        else
          FieldByName('CpfCnpj').AsString := '';

        FieldByName('InscricaoMunicipal').AsString      := InscricaoMunicipal;
      end;

      with Endereco do
      begin
        FieldByName('Endereco').AsString                := Endereco;
        FieldByName('Numero').AsString                  := Numero;
        FieldByName('Complemento').AsString             := Complemento;
        FieldByName('Bairro').AsString                  := Bairro;
        FieldByName('CodigoMunicipio').AsString         := CodigoMunicipio;
        FieldByName('UF').AsString                      := UF;
        FieldByName('CEP').AsString                     := FormatarCEP(CEP);
        FieldByName('xMunicipio').AsString              := xMunicipio;
        FieldByName('CodigoPais').AsString              := IntToStr(CodigoPais);
      end;

      with Contato do
      begin
        FieldByName('Telefone').AsString                := FormatarFone(Telefone);
        FieldByName('Email').AsString                   := Email;
      end;
    end;

    Post;
  end;
end;

constructor TdmACBrNFSeFR.Create(AOwner: TComponent);
begin
  inherited;
  FDANFSeClassOwner := TACBrNFSeDANFSeClass(AOwner);
end;

procedure TdmACBrNFSeFR.frxReportBeforePrint(Sender: TfrxReportComponent);
begin
  if DANFSeClassOwner.ImprimeCanhoto
   then begin
     frxReport.FindObject('Memo23').Visible := True;
     frxReport.FindObject('Memo75').Visible := True;
     frxReport.FindObject('Memo77').Visible := True;
     frxReport.FindObject('Memo68').Visible := True;
     frxReport.FindObject('Memo73').Visible := True;
   end
   else
   begin
     frxReport.FindObject('Memo23').Visible := False;
     frxReport.FindObject('Memo75').Visible := False;
     frxReport.FindObject('Memo77').Visible := False;
     frxReport.FindObject('Memo68').Visible := False;
     frxReport.FindObject('Memo73').Visible := False;
   end;
end;

end.
