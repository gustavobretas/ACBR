object dmACBrNFSeFR: TdmACBrNFSeFR
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 236
  Top = 198
  Height = 363
  Width = 580
  object cdsIdentificacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 56
    object cdsIdentificacaoid: TStringField
      FieldName = 'id'
      Size = 10
    end
    object cdsIdentificacaoNumero: TStringField
      FieldName = 'Numero'
      Size = 16
    end
    object cdsIdentificacaoSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object cdsIdentificacaoTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object cdsIdentificacaoCompetencia: TStringField
      FieldName = 'Competencia'
      Size = 7
    end
    object cdsIdentificacaoNumeroNFSe: TStringField
      FieldName = 'NumeroNFSe'
      Size = 16
    end
    object cdsIdentificacaoNFSeSubstituida: TStringField
      FieldName = 'NFSeSubstituida'
      Size = 15
    end
    object cdsIdentificacaoDataEmissao: TStringField
      FieldName = 'DataEmissao'
      Size = 10
    end
    object cdsIdentificacaoCodigoVerificacao: TStringField
      FieldName = 'CodigoVerificacao'
      Size = 15
    end
  end
  object cdsPrestador: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 120
    object cdsPrestadorCnpj: TStringField
      FieldName = 'Cnpj'
      Size = 18
    end
    object cdsPrestadorInscricaoMunicipal: TStringField
      FieldName = 'InscricaoMunicipal'
      Size = 15
    end
    object cdsPrestadorRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 60
    end
    object cdsPrestadorNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 60
    end
    object cdsPrestadorEndereco: TStringField
      FieldName = 'Endereco'
      Size = 60
    end
    object cdsPrestadorNumero: TStringField
      FieldName = 'Numero'
      Size = 60
    end
    object cdsPrestadorComplemento: TStringField
      FieldName = 'Complemento'
      Size = 60
    end
    object cdsPrestadorBairro: TStringField
      FieldName = 'Bairro'
      Size = 60
    end
    object cdsPrestadorCodigoMunicipio: TStringField
      FieldName = 'CodigoMunicipio'
      Size = 7
    end
    object cdsPrestadorUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsPrestadorCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsPrestadorxMunicipio: TStringField
      FieldName = 'xMunicipio'
      Size = 60
    end
    object cdsPrestadorCodigoPais: TStringField
      FieldName = 'CodigoPais'
      Size = 4
    end
    object cdsPrestadorTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object cdsPrestadorEmail: TStringField
      FieldName = 'Email'
      Size = 60
    end
  end
  object cdsServicos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 56
    object cdsServicosItemListaServico: TStringField
      FieldName = 'ItemListaServico'
      Size = 6
    end
    object cdsServicosCodigoCnae: TStringField
      FieldName = 'CodigoCnae'
      Size = 15
    end
    object cdsServicosCodigoTributacaoMunicipio: TStringField
      FieldName = 'CodigoTributacaoMunicipio'
      Size = 1
    end
    object cdsServicosDiscriminacao: TStringField
      FieldName = 'Discriminacao'
      Size = 500
    end
    object cdsServicosCodigoPais: TStringField
      FieldName = 'CodigoPais'
      Size = 4
    end
    object cdsServicosNumeroProcesso: TStringField
      FieldName = 'NumeroProcesso'
      Size = 10
    end
    object cdsServicosxItemListaServico: TStringField
      FieldName = 'xItemListaServico'
      Size = 100
    end
    object cdsServicosResponsavelRetencao: TStringField
      FieldName = 'ResponsavelRetencao'
      Size = 1
    end
    object cdsServicosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object cdsServicosValorServicos: TCurrencyField
      FieldName = 'ValorServicos'
    end
    object cdsServicosValorDeducoes: TCurrencyField
      FieldName = 'ValorDeducoes'
    end
    object cdsServicosValorPis: TCurrencyField
      FieldName = 'ValorPis'
    end
    object cdsServicosValorCofins: TCurrencyField
      FieldName = 'ValorCofins'
    end
    object cdsServicosValorInss: TCurrencyField
      FieldName = 'ValorInss'
    end
    object cdsServicosValorIr: TCurrencyField
      FieldName = 'ValorIr'
    end
    object cdsServicosValorCsll: TCurrencyField
      FieldName = 'ValorCsll'
    end
    object cdsServicosIssRetido: TStringField
      DisplayWidth = 10
      FieldName = 'IssRetido'
      Size = 1
    end
    object cdsServicosValorIss: TCurrencyField
      FieldName = 'ValorIss'
    end
    object cdsServicosOutrasRetencoes: TCurrencyField
      FieldName = 'OutrasRetencoes'
    end
    object cdsServicosBaseCalculo: TCurrencyField
      FieldName = 'BaseCalculo'
    end
    object cdsServicosAliquota: TCurrencyField
      FieldName = 'Aliquota'
    end
    object cdsServicosValorLiquidoNfse: TCurrencyField
      FieldName = 'ValorLiquidoNfse'
    end
    object cdsServicosValorIssRetido: TCurrencyField
      FieldName = 'ValorIssRetido'
    end
    object cdsServicosDescontoCondicionado: TCurrencyField
      FieldName = 'DescontoCondicionado'
    end
    object cdsServicosDescontoIncondicionado: TCurrencyField
      FieldName = 'DescontoIncondicionado'
    end
    object cdsServicosTotalServicos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalServicos'
      Calculated = True
    end
    object cdsServicosTotalNota: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalNota'
      Calculated = True
    end
  end
  object frxIdentificacao: TfrxDBDataset
    UserName = 'Identificacao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'Numero=Numero'
      'Serie=Serie'
      'Tipo=Tipo'
      'Competencia=Competencia'
      'NumeroNFSe=NumeroNFSe'
      'NFSeSubstituida=NFSeSubstituida'
      'DataEmissao=DataEmissao'
      'CodigoVerificacao=CodigoVerificacao')
    OpenDataSource = False
    DataSet = cdsIdentificacao
    BCDToCurrency = False
    Left = 216
    Top = 56
  end
  object frxPrestador: TfrxDBDataset
    UserName = 'Prestador'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Cnpj=Cnpj'
      'InscricaoMunicipal=InscricaoMunicipal'
      'RazaoSocial=RazaoSocial'
      'NomeFantasia=NomeFantasia'
      'Endereco=Endereco'
      'Numero=Numero'
      'Complemento=Complemento'
      'Bairro=Bairro'
      'CodigoMunicipio=CodigoMunicipio'
      'UF=UF'
      'CEP=CEP'
      'xMunicipio=xMunicipio'
      'CodigoPais=CodigoPais'
      'Telefone=Telefone'
      'Email=Email')
    OpenDataSource = False
    DataSet = cdsPrestador
    BCDToCurrency = False
    Left = 216
    Top = 120
  end
  object frxTomador: TfrxDBDataset
    UserName = 'Tomador'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CpfCnpj=CpfCnpj'
      'InscricaoMunicipal=InscricaoMunicipal'
      'RazaoSocial=RazaoSocial'
      'NomeFantasia=NomeFantasia'
      'Endereco=Endereco'
      'Numero=Numero'
      'Complemento=Complemento'
      'Bairro=Bairro'
      'CodigoMunicipio=CodigoMunicipio'
      'UF=UF'
      'CEP=CEP'
      'xMunicipio=xMunicipio'
      'CodigoPais=CodigoPais'
      'Telefone=Telefone'
      'Email=Email')
    OpenDataSource = False
    DataSet = cdsTomador
    BCDToCurrency = False
    Left = 216
    Top = 184
  end
  object frxServicos: TfrxDBDataset
    UserName = 'Servicos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ItemListaServico=ItemListaServico'
      'CodigoCnae=CodigoCnae'
      'CodigoTributacaoMunicipio=CodigoTributacaoMunicipio'
      'Discriminacao=Discriminacao'
      'CodigoMunicipio=CodigoMunicipio'
      'CodigoPais=CodigoPais'
      'ExigibilidadeISS=ExigibilidadeISS'
      'MunicipioIncidencia=MunicipioIncidencia'
      'NumeroProcesso=NumeroProcesso'
      'xItemListaServico=xItemListaServico'
      'ResponsavelRetencao=ResponsavelRetencao'
      'Descricao=Descricao'
      'ValorServicos=ValorServicos'
      'ValorDeducoes=ValorDeducoes'
      'ValorPis=ValorPis'
      'ValorCofins=ValorCofins'
      'ValorInss=ValorInss'
      'ValorIr=ValorIr'
      'ValorCsll=ValorCsll'
      'IssRetido=IssRetido'
      'ValorIss=ValorIss'
      'OutrasRetencoes=OutrasRetencoes'
      'BaseCalculo=BaseCalculo'
      'Aliquota=Aliquota'
      'ValorLiquidoNfse=ValorLiquidoNfse'
      'ValorIssRetido=ValorIssRetido'
      'DescontoCondicionado=DescontoCondicionado'
      'DescontoIncondicionado=DescontoIncondicionado'
      'TotalNota=TotalNota')
    OpenDataSource = False
    DataSet = cdsServicos
    BCDToCurrency = False
    Left = 400
    Top = 56
  end
  object cdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 240
    object cdsParametrosExigibilidadeISS: TStringField
      FieldName = 'ExigibilidadeISS'
      Size = 60
    end
    object cdsParametrosCodigoMunicipio: TStringField
      FieldName = 'CodigoMunicipio'
      Size = 60
    end
    object cdsParametrosMunicipioIncidencia: TStringField
      FieldName = 'MunicipioIncidencia'
      Size = 60
    end
    object cdsParametrosOutrasInformacoes: TStringField
      FieldName = 'OutrasInformacoes'
      Size = 500
    end
    object cdsParametrosCodigoObra: TStringField
      FieldName = 'CodigoObra'
      Size = 60
    end
    object cdsParametrosArt: TStringField
      FieldName = 'Art'
      Size = 60
    end
    object cdsParametrosImagem: TStringField
      FieldName = 'Imagem'
      Size = 256
    end
    object cdsParametrosLogoExpandido: TStringField
      FieldName = 'LogoExpandido'
      Size = 1
    end
    object cdsParametrosLogoCarregado: TBlobField
      FieldName = 'LogoCarregado'
    end
    object cdsParametrosimgPrefeitura: TStringField
      FieldName = 'imgPrefeitura'
      Size = 256
    end
    object cdsParametrosLogoPrefExpandido: TStringField
      FieldName = 'LogoPrefExpandido'
      Size = 1
    end
    object cdsParametrosLogoPrefCarregado: TBlobField
      FieldName = 'LogoPrefCarregado'
    end
    object cdsParametrosNome_Prefeitura: TStringField
      FieldName = 'Nome_Prefeitura'
      Size = 256
    end
    object cdsParametrosMensagem0: TStringField
      FieldName = 'Mensagem0'
      Size = 50
    end
    object cdsParametrosSistema: TStringField
      FieldName = 'Sistema'
      Size = 50
    end
    object cdsParametrosUsuario: TStringField
      FieldName = 'Usuario'
    end
    object cdsParametrosNaturezaOperacao: TStringField
      FieldName = 'NaturezaOperacao'
      Size = 50
    end
    object cdsParametrosRegimeEspecialTributacao: TStringField
      FieldName = 'RegimeEspecialTributacao'
      Size = 50
    end
    object cdsParametrosOptanteSimplesNacional: TStringField
      FieldName = 'OptanteSimplesNacional'
      Size = 10
    end
    object cdsParametrosIncentivadorCultural: TStringField
      FieldName = 'IncentivadorCultural'
      Size = 10
    end
  end
  object frxParametros: TfrxDBDataset
    UserName = 'Parametros'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ExigibilidadeISS=ExigibilidadeISS'
      'CodigoMunicipio=CodigoMunicipio'
      'MunicipioIncidencia=MunicipioIncidencia'
      'OutrasInformacoes=OutrasInformacoes'
      'CodigoObra=CodigoObra'
      'Art=Art'
      'Imagem=Imagem'
      'LogoExpandido=LogoExpandido'
      'LogoCarregado=LogoCarregado'
      'imgPrefeitura=imgPrefeitura'
      'LogoPrefExpandido=LogoPrefExpandido'
      'LogoPrefCarregado=LogoPrefCarregado'
      'Nome_Prefeitura=Nome_Prefeitura'
      'Mensagem0=Mensagem0'
      'Sistema=Sistema'
      'Usuario=Usuario'
      'IncentivadorCultural=IncentivadorCultural'
      'OptanteSimplesNacional=OptanteSimplesNacional'
      'RegimeEspecialTributacao=RegimeEspecialTributacao'
      'NaturezaOperacao=NaturezaOperacao')
    OpenDataSource = False
    DataSet = cdsParametros
    BCDToCurrency = False
    Left = 216
    Top = 240
  end
  object cdsTomador: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 184
    object cdsTomadorCpfCnpj: TStringField
      FieldName = 'CpfCnpj'
      Size = 18
    end
    object StringField2: TStringField
      FieldName = 'InscricaoMunicipal'
      Size = 15
    end
    object StringField3: TStringField
      FieldName = 'RazaoSocial'
      Size = 60
    end
    object StringField4: TStringField
      FieldName = 'NomeFantasia'
      Size = 60
    end
    object StringField5: TStringField
      FieldName = 'Endereco'
      Size = 60
    end
    object StringField6: TStringField
      FieldName = 'Numero'
      Size = 60
    end
    object StringField7: TStringField
      FieldName = 'Complemento'
      Size = 60
    end
    object StringField8: TStringField
      FieldName = 'Bairro'
      Size = 60
    end
    object StringField9: TStringField
      FieldName = 'CodigoMunicipio'
      Size = 7
    end
    object StringField10: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object StringField11: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object StringField12: TStringField
      FieldName = 'xMunicipio'
      Size = 60
    end
    object StringField13: TStringField
      FieldName = 'CodigoPais'
      Size = 4
    end
    object StringField14: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object StringField15: TStringField
      FieldName = 'Email'
      Size = 60
    end
  end
  object cdsItensServico: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 120
    object cdsItensServicoDiscriminacaoServico: TStringField
      FieldName = 'DiscriminacaoServico'
      Size = 80
    end
    object cdsItensServicoQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object cdsItensServicoValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
    end
    object cdsItensServicoValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
    object cdsItensServicoTributavel: TStringField
      FieldName = 'Tributavel'
      Size = 1
    end
  end
  object frxItensServico: TfrxDBDataset
    UserName = 'ItensServico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DiscriminacaoServico=DiscriminacaoServico'
      'Quantidade=Quantidade'
      'ValorUnitario=ValorUnitario'
      'ValorTotal=ValorTotal'
      'Tributavel=Tributavel')
    OpenDataSource = False
    DataSet = cdsItensServico
    BCDToCurrency = False
    Left = 400
    Top = 120
  end
end
