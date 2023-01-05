        ��  ��                  �N
 @   ��
 A C B R N F S E X S E R V I C O S       0         ; Campo Params tem a seguinte sintaxe:

;   Params=Chave1:Valor1[|Chave2:Valor2|Chave3:Valor31,Valor32...]

; Podemos ter 1 ou mais Chaves sepadas por "|"
; Toda Chave deve conter o caracter ":" no final
; Se a Chave for Booleana n�o precisa informar o seu valor, pois a presen�a desse tipo de Chave
; em Params j� indica que o seu valor � True
; Se a Chave for string ou numerica devemos informar o seu valor
; A Chave poder� ter valores pr� definidos (enumerados), caso venha ser informado um valor 
; diferente o mesmo ser� ignorado.
; A Chave poder� ter 1 ou mais valores que devem estar separados por virgula
 
; Chaves que podem ser utilizadas:

; AliasCidade � do tipo string (ex: AliasCidade:B_SJOSE)

; CodigoCidade � do tipo numerico (ex: CodigoCidade:23)

; Assinar � do tipo enumerados e seus valores poss�veis s�o: 
;   AssRps, AssLoteRps, AssConsultarSituacao, AssConsultarLote, AssConsultarNFSeRps, 
;   AssConsultarNFSe, AssCancelarNFSe, AssRpsGerarNFSe, AssLoteGerarNFSe, AssRpsSubstituirNFSe, 
;   AssSubstituirNFSe, AssAbrirSessao e AssFecharSessao (ex: Assinar:AssRps)

; GerarTag � do tipo string (ex: GerarTag:ItemLei116)

; NaoGerarTag � do tipo string (ex: NaoGerarTag:ItemLei116)

; VersaoArquivo � do tipo numerico (ex: VersaoArquivo:2)

; VersaoImpressao � do tipo numerico (ex: VersaoImpressao:1)

; DataEmissao � do tipo enumerado e seus valores poss�veis s�o:
;   Date e DateTime (ex: DataEmissao:Date)

; NaoDividir100 � do tipo Boolean
; Dividir100 � do tipo Boolean

; SolicitarCancelamento � do tipo Boolean

; NomeTagAtividadeEconomica � do tipo string (ex: NomeTagAtividadeEconomica:ItemLei116AtividadeEconomica)

; URLProducao � do tipo string (ex: URLProducao:nfse.cataguases.mg.gov.br)
; URLHomologacao � do tipo string (ex: URLHomologacao:homologacaocataguases.agilistecnologia.com.br)

; NaoGerarGrupoRps � do tipo Boolean
; GerarGrupoRps � do tipo Boolean

; FormatoData � do tipo enumerados e seus valores poss�veis s�o:
; Por padr�o para as 3 datas � AAAAMMDD
;   NFSeDDMMAAAA, NFSeMMDDAAAA, RpsDDMMAAAA, RpsMMDDAAAA, 
;   CompDDMMAAAA, CompMMDDAAAA, CancDDMMAAAA, CancMMDDAAAA

; NaoFormatarItemServico � do tipo Boolean
; FormatarItemServico � do tipo Boolean

; Informa��es sobre alguns provedores:
; No Envelope Soap do provedor Elotech tem uma tag que diz se � homologa��o ou n�o.

; As se��es abaixo se referem aos provedores que possuem
; URLs padronizadas para todas as cidades 

[ABase]
ProRecepcionar=http://nfse.abase.com.br/webservice/nfsews.asmx
HomRecepcionar=http://testenfse.abase.com.br/webservice/nfsews.asmx

[Agili]
ProRecepcionar=https://agiliblue.agilicloud.com.br/api/EnviarLoteRps
ProConsultarLote=https://agiliblue.agilicloud.com.br/api/ConsultarLoteRps
ProConsultarNFSeRps=https://agiliblue.agilicloud.com.br/api/ConsultarNfseRps
ProConsultarNFSe=https://agiliblue.agilicloud.com.br/api/ConsultarNfseFaixa
ProCancelarNFSe=https://agiliblue.agilicloud.com.br/api/CancelarNfse
ProGerarNFSe=https://agiliblue.agilicloud.com.br/api/GerarNfse
ProSubstituirNFSe=https://agiliblue.agilicloud.com.br/api/SubstituirNfse
;
HomRecepcionar=
HomConsultarLote=
HomConsultarNFSeRps=
HomConsultarNFSe=
HomCancelarNFSe=
HomGerarNFSe=
HomSubstituirNFSe=

[Bauhaus]
HomRecepcionar=*
HomGerarNFSe=https://api-nfse-homologacao.prefeituramoderna.com.br/ws/services/gerar
HomConsultarNFSe=https://api-nfse-homologacao.prefeituramoderna.com.br/ws/services/consultar
HomCancelarNFSe=https://api-nfse-homologacao.prefeituramoderna.com.br/ws/services/cancelar
HomSubstituirNFSe=https://api-nfse-homologacao.prefeituramoderna.com.br/ws/services/substituir

[Betha]
ProRecepcionar=https://e-gov.betha.com.br/e-nota-contribuinte-ws/recepcionarLoteRps
ProConsultarSituacao=https://e-gov.betha.com.br/e-nota-contribuinte-ws/consultarSituacaoLoteRps
ProConsultarLote=https://e-gov.betha.com.br/e-nota-contribuinte-ws/consultarLoteRps
ProConsultarNFSeRps=https://e-gov.betha.com.br/e-nota-contribuinte-ws/consultarNfsePorRps
ProConsultarNFSe=https://e-gov.betha.com.br/e-nota-contribuinte-ws/consultarNfse
ProCancelarNFSe=https://e-gov.betha.com.br/e-nota-contribuinte-ws/cancelarNfseV02
;
HomRecepcionar=https://e-gov.betha.com.br/e-nota-contribuinte-test-ws/recepcionarLoteRps
HomConsultarSituacao=https://e-gov.betha.com.br/e-nota-contribuinte-test-ws/consultarSituacaoLoteRps
HomConsultarLote=https://e-gov.betha.com.br/e-nota-contribuinte-test-ws/consultarLoteRps
HomConsultarNFSeRps=https://e-gov.betha.com.br/e-nota-contribuinte-test-ws/consultarNfsePorRps
HomConsultarNFSe=https://e-gov.betha.com.br/e-nota-contribuinte-test-ws/consultarNfse
HomCancelarNFSe=https://e-gov.betha.com.br/e-nota-contribuinte-test-ws/cancelarNfseV02

[CIGA]
ProRecepcionar=https://nfse.ciga.sc.gov.br/webservice/v1
HomRecepcionar=https://nfse-testes.ciga.sc.gov.br/webservice/v1

[Citta]
HomRecepcionar=http://citta.inf.br:888/nfse/services/nfseSOAP
;
HomLinkURL=http://citta.inf.br:888/nfse/api/public/documento/report/%CodVerif%

[Coplan]
HomRecepcionar=https://www.gp.srv.br/tributario/homologacao/anfse_web_service
;
HomLinkURL=http://www.gp.srv.br/tributario/homologacao/tnfse_validacao?%CodVerif%

[DataSmart]
ProRecepcionar=http://191.252.58.191:83/soap/INFSe
HomRecepcionar=http://191.252.58.191:83/soap/INFSe

[Desenvolve]
HomRecepcionar=http://187.18.59.136:10022/nfsd/IntegracaoNfsd

[Equiplano]
ProRecepcionar=https://www.esnfs.com.br:8444/enfsws/services/Enfs
ProLinkURL=https://www.esnfs.com.br/esenfs.view.logic?aut=%CodVerif%
;
HomRecepcionar=https://www.esnfs.com.br:9443/homologacaows/services/Enfs
HomLinkURL=https://www.esnfs.com.br:9443/esenfs.view.logic?aut=%CodVerif%

[Facundo]
ProRecepcionar=*
ProConsultarNFSe=https://www.facundo.tec.br:443/issqn/wservice/wsnfeconsultaxml.php
ProCancelarNFSe=https://www.facundo.tec.br:443/issqn/wservice/wsnfecancela.php
ProGerarNFSe=https://www.facundo.tec.br:443/issqn/wservice/wsnfeenvia.php
;
HomRecepcionar=*
HomGerarNFSe=https://www.facundo.tec.br:443/issqn/wservice/wsnfe_teste_homologacao.php

[FGMaiss]
ProRecepcionar=*
ProConsultarNFSe=https://www1.fgmaiss.com.br:443/issqn/wservice/wsnfeconsultaxml.php
ProCancelarNFSe=https://www1.fgmaiss.com.br:443/issqn/wservice/wsnfecancela.php
ProGerarNFSe=https://www1.fgmaiss.com.br:443/issqn/wservice/wsnfeenvia.php
;
HomRecepcionar=*
HomGerarNFSe=https://www1.fgmaiss.com.br:443/issqn/wservice/wsnfe_teste_homologacao.php

[Fiorilli]
HomRecepcionar=http://fi1.fiorilli.com.br:5663/IssWeb-ejb/IssWebWS/IssWebWS
HomLinkURL=http://fi1.fiorilli.com.br:5663/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[FISSLex]
HomRecepcionar=https://demo.fisslex.com.br/fiss-lex/servlet/aws_recepcionarloterps
HomConsultarSituacao=https://demo.fisslex.com.br/fiss-lex/servlet/aws_consultarsituacaoloterps
HomConsultarLote=https://demo.fisslex.com.br/fiss-lex/servlet/aws_consultaloterps
HomConsultarNFSeRps=https://demo.fisslex.com.br/fiss-lex/servlet/aws_consultanfseporrps
HomConsultarNFSe=https://demo.fisslex.com.br/fiss-lex/servlet/aws_consultanfse
HomCancelarNFSe=https://demo.fisslex.com.br/fiss-lex/servlet/aws_cancelarnfse
;
HomLinkURL=https://demo.fisslex.com.br/fiss-lex/servlet/apnotafiscalurl?%CodVerif%

[GeisWeb]
HomRecepcionar=https://www.geisweb.net.br/homologacao/modelo/webservice/GeisWebServiceImpl.php

[Ginfes]
ProRecepcionar=https://producao.ginfes.com.br/ServiceGinfesImpl
;
HomRecepcionar=https://homologacao.ginfes.com.br/ServiceGinfesImpl

[Horus]
HomRecepcionar=http://teste.horusdm.com.br/service

[IPM]
ProRecepcionar=http://sync.nfs-e.net/datacenter/include/nfw/importa_nfw/nfw_import_upload.php?eletron=1
HomRecepcionar=http://sync.nfs-e.net/datacenter/include/nfw/importa_nfw/nfw_import_upload.php?eletron=1
;
ProLinkURL=http://sync.nfs-e.net/datacenter/include/nfw/nfw_imp_notas.php?codauten=%CodVerif%
HomLinkURL=http://sync.nfs-e.net/datacenter/include/nfw/nfw_imp_notas.php?codauten=%CodVerif%

; Se a cidade requer a passagem dos par�metros: login, senha e f1: n�o incluir o campo Versao
; Se a cidade requer a passagem dos par�metros: username, password deve-se incluir o campo Versao com o valor 1.01

[ISSDSF]
HomRecepcionar=http://treinamento.dsfweb.com.br/WsNFe2/LoteRps.jws

[ISSNet]
HomRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/homologacao/servicos.asmx

[NFSeBrasil]
ProRecepcionar=http://nfsebrasil.net.br/nfse/ws/lote_rps_service.php
HomRecepcionar=http://web1.memory.com.br:81/nfse/ws/lote_rps_service.php

[PadraoNacional]
ProRecepcionar=https://www.nfse.gov.br/API/SefinNacional
ProConsultarDFe=https://adn.nfse.gov.br/contribuinte
;
HomRecepcionar=https://sefin.producaorestrita.nfse.gov.br/SefinNacional
HomConsultarDFe=https://adn.producaorestrita.nfse.gov.br/contribuintes

[Publica]
HomRecepcionar=http://nfse-teste.publica.inf.br/homologa_nfse_integracao/Services

[SafeWeb]
ProRecepcionar=https://nfse.safeweb.com.br/nfseprefeituras/webservices/NfseWebService.asmx
HomRecepcionar=https://nfse.safeweb.com.br/nfseprefeituras/webservices/NfseWebService.asmx

[SH3]
HomRecepcionar=https://homologamunicipio.nfiss.com.br/soap/

[Siam]
ProRecepcionar=http://ws.imap.org.br/siam/Nfse.svc
HomRecepcionar=http://ws.imap.org.br/siam/Nfse.svc

[SigISSWeb]
HomRecepcionar=https://wshml.sigissweb.com/

[SimplISS]
HomRecepcionar=http://wshomologacao.simplissweb.com.br/nfseservice.svc
HomLinkURL=http://wshomologacao.simplissweb.com.br/nfseservice.svc

[SpeedGov]
HomRecepcionar=http://speedgov.com.br/wsmod/Nfes

[TcheInfo]
ProRecepcionar=https://nfse.tcheinfo.com.br/TcheNFSePortal/servlet/com.tche.nfse.anfsewebservice
HomRecepcionar=https://nfse.tcheinfo.com.br/TcheNFSePortal/servlet/com.tche.nfse.anfsewebservice

[WebFisco]
ProRecepcionar=*
ProConsultarNFSe=https://www.webfiscotecnologia.com.br:443/issqn/wservice/wsnfeconsultaxml.php
ProCancelarNFSe=https://www.webfiscotecnologia.com.br:443/issqn/wservice/wsnfecancela.php
ProGerarNFSe=https://www.webfiscotecnologia.com.br:443/issqn/wservice/wsnfeenvia.php
;
HomRecepcionar=*
HomGerarNFSe=https://www.webfiscotecnologia.com.br:443/issqn/wservice/wsnfe_teste_homologacao.php

; Cidades atendidas pelo componente ACBrNFSeX

[1100015]
Nome=Alta Floresta D Oeste
UF=RO
Provedor=PadraoNacional

[1100023]
; Atualizado em 26/07/2021
Nome=Ariquemes
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://nfse.ariquemes.ro.gov.br:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://nfse.ariquemes.ro.gov.br:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100031]
Nome=Cabixi
UF=RO
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://nfse.cabixi.ro.gov.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://nfse.cabixi.ro.gov.br/nfse.portal.integracao.teste/services.svc

[1100049]
; Atualizado em 17/11/2021
Nome=Cacoal
UF=RO
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://cacoalro.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://cacoalro.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[1100056]
Nome=Cerejeiras
UF=RO
Provedor=PadraoNacional

[1100064]
Nome=Colorado do Oeste
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://iss.coloradodooeste.ro.gov.br:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://iss.coloradodooeste.ro.gov.br:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100072]
Nome=Corumbiara
UF=RO
Provedor=PadraoNacional

[1100080]
Nome=Costa Marques
UF=RO
Provedor=PadraoNacional

[1100098]
Nome=Espigao D Oeste
UF=RO
Provedor=PadraoNacional

[1100106]
Nome=Guajara-Mirim
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://179.252.20.236:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://179.252.20.236:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100114]
; Atualizado em 18/11/2022
Nome=Jaru
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=https://nfse.jaru.ro.gov.br/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=https://nfse.jaru.ro.gov.br/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100122]
Nome=Ji-Parana
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://177.124.184.59:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://177.124.184.59:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100130]
; Inclu�do em 06/10/2021
Nome=Machadinho do Oeste
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://nfe.machadinho.ro.gov.br:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://nfe.machadinho.ro.gov.br:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100148]
Nome=Nova Brasilandia D Oeste
UF=RO
Provedor=PadraoNacional

[1100155]
Nome=Ouro Preto do Oeste
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://201.216.110.67:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://201.216.110.67:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100189]
; Atualizado em 01/11/2021
Nome=Pimenta Bueno
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://nfse.pimentabueno.ro.gov.br:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://nfse.pimentabueno.ro.gov.br:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100205]
Nome=Porto Velho
UF=RO
Provedor=ISSPortoVelho
Versao=2.00
ProRecepcionar=https://www.semfazonline.com/nfse/NfseWSService
HomRecepcionar=https://homologacao.semfazonline.com/nfse/NfseWSService

[1100254]
; Inclu�do em 18/10/2022
Nome=Presidente Medici
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://131.161.35.20:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://131.161.35.20:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100262]
Nome=Rio Crespo
UF=RO
Provedor=PadraoNacional

[1100288]
Nome=Rolim de Moura
UF=RO
Provedor=PadraoNacional

[1100296]
Nome=Santa Luzia D Oeste
UF=RO
Provedor=PadraoNacional

[1100304]
Nome=Vilhena
UF=RO
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://vilhenaro.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://vilhenaro.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[1100320]
Nome=Sao Miguel do Guapore
UF=RO
Provedor=PadraoNacional

[1100338]
Nome=Nova Mamore
UF=RO
Provedor=PadraoNacional

[1100346]
Nome=Alvorada D Oeste
UF=RO
Provedor=PadraoNacional

[1100379]
Nome=Alto Alegre Dos Parecis
UF=RO
Provedor=PadraoNacional

[1100403]
; Inclu�do em 24/06/2021
Nome=Alto Paraiso
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://servicos.altoparaiso.ro.gov.br:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://servicos.altoparaiso.ro.gov.br:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100452]
Nome=Buritis
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://160.238.242.254:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://160.238.242.254:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1100502]
Nome=Novo Horizonte do Oeste
UF=RO
Provedor=PadraoNacional

[1100601]
Nome=Cacaulandia
UF=RO
Provedor=PadraoNacional

[1100700]
Nome=Campo Novo de Rondonia
UF=RO
Provedor=PadraoNacional

[1100809]
Nome=Candeias do Jamari
UF=RO
Provedor=PadraoNacional

[1100908]
Nome=Castanheiras
UF=RO
Provedor=PadraoNacional

[1100924]
Nome=Chupinguaia
UF=RO
Provedor=PadraoNacional

[1100940]
Nome=Cujubim
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://receita.cujubim.ro.gov.br:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://receita.cujubim.ro.gov.br:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1101005]
Nome=Governador Jorge Teixeira
UF=RO
Provedor=PadraoNacional

[1101104]
; Inclu�do em 06/10/2021
Nome=Itapu� do Oeste
UF=RO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://45.225.19.186:5660/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://45.225.19.186:5660/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1101203]
Nome=Ministro Andreazza
UF=RO
Provedor=PadraoNacional

[1101302]
Nome=Mirante da Serra
UF=RO
Provedor=PadraoNacional

[1101401]
Nome=Monte Negro
UF=RO
Provedor=PadraoNacional

[1101435]
Nome=Nova Uniao
UF=RO
Provedor=PadraoNacional

[1101450]
Nome=Parecis
UF=RO
Provedor=PadraoNacional

[1101468]
Nome=Pimenteiras do Oeste
UF=RO
Provedor=PadraoNacional

[1101476]
Nome=Primavera de Rondonia
UF=RO
Provedor=PadraoNacional

[1101484]
Nome=Sao Felipe D Oeste
UF=RO
Provedor=PadraoNacional

[1101492]
Nome=Sao Francisco do Guapore
UF=RO
Provedor=PadraoNacional

[1101500]
Nome=Seringueiras
UF=RO
Provedor=PadraoNacional

[1101559]
Nome=Teixeiropolis
UF=RO
Provedor=PadraoNacional

[1101609]
Nome=Theobroma
UF=RO
Provedor=PadraoNacional

[1101708]
Nome=Urupa
UF=RO
Provedor=PadraoNacional

[1101757]
; Inclu�do em 06/10/2021
Nome=Vale do Anari
UF=RO
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://valedoanari.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://valedoanari.iss.elotech.com.br/iss-ws/nfse203.wsdl

[1101807]
Nome=Vale do Paraiso
UF=RO
Provedor=PadraoNacional

[1200013]
Nome=Acrelandia
UF=AC
Provedor=PadraoNacional

[1200054]
Nome=Assis Brasil
UF=AC
Provedor=PadraoNacional

[1200104]
Nome=Brasileia
UF=AC
Provedor=PadraoNacional

[1200138]
Nome=Bujari
UF=AC
Provedor=PadraoNacional

[1200179]
Nome=Capixaba
UF=AC
Provedor=PadraoNacional

[1200203]
Nome=Cruzeiro do Sul
UF=AC
Provedor=Betha

[1200252]
Nome=Epitaciolandia
UF=AC
Provedor=Betha

[1200302]
Nome=Feijo
UF=AC
Provedor=PadraoNacional

[1200328]
Nome=Jordao
UF=AC
Provedor=PadraoNacional

[1200336]
Nome=Mancio Lima
UF=AC
Provedor=Betha

[1200344]
Nome=Manoel Urbano
UF=AC
Provedor=PadraoNacional

[1200351]
Nome=Marechal Thaumaturgo
UF=AC
Provedor=PadraoNacional

[1200385]
Nome=Placido de Castro
UF=AC
Provedor=PadraoNacional

[1200393]
Nome=Porto Walter
UF=AC
Provedor=PadraoNacional

[1200401]
Nome=Rio Branco
UF=AC
Provedor=Abaco
ProRecepcionar=https://nota.riobranco.ac.gov.br/servlet/arecepcionarloterps
ProConsultarSituacao=https://nota.riobranco.ac.gov.br/servlet/aconsultarsituacaoloterps
ProConsultarLote=https://nota.riobranco.ac.gov.br/servlet/aconsultarloterps
ProConsultarNFSeRps=https://nota.riobranco.ac.gov.br/servlet/aconsultarnfseporrps
ProConsultarNFSe=https://nota.riobranco.ac.gov.br/servlet/aconsultarnfse
ProCancelarNFSe=https://nota.riobranco.ac.gov.br/servlet/acancelarnfse
;
HomRecepcionar=https://homologa.e-nfs.com.br/riobranco/servlet/arecepcionarloterps
HomConsultarSituacao=https://homologa.e-nfs.com.br/riobranco/servlet/aconsultarsituacaoloterps
HomConsultarLote=https://homologa.e-nfs.com.br/riobranco/servlet/aconsultarloterps
HomConsultarNFSeRps=https://homologa.e-nfs.com.br/riobranco/servlet/aconsultarnfseporrps
HomConsultarNFSe=https://homologa.e-nfs.com.br/riobranco/servlet/aconsultarnfse
HomCancelarNFSe=https://homologa.e-nfs.com.br/riobranco/servlet/acancelarnfse
;
ProLinkURL=https://nota.riobranco.ac.gov.br/servlet/wvalidarautenticidadenfse?%Cnpj%,%ValorServico%,%NumeroNFSe%,%CodVerif%
HomLinkURL=https://homologa.e-nfs.com.br/riobranco/servlet/wvalidarautenticidadenfse?%Cnpj%,%ValorServico%,%NumeroNFSe%,%CodVerif%

[1200427]
Nome=Rodrigues Alves
UF=AC
Provedor=Betha

[1200435]
Nome=Santa Rosa do Purus
UF=AC
Provedor=PadraoNacional

[1200450]
Nome=Senador Guiomard
UF=AC
Provedor=Betha

[1200500]
Nome=Sena Madureira
UF=AC
Provedor=PadraoNacional

[1200609]
Nome=Tarauaca
UF=AC
Provedor=Betha

[1200708]
Nome=Xapuri
UF=AC
Provedor=PadraoNacional

[1200807]
Nome=Porto Acre
UF=AC
Provedor=PadraoNacional

[1300029]
Nome=Alvaraes
UF=AM
Provedor=PadraoNacional

[1300060]
Nome=Amatura
UF=AM
Provedor=PadraoNacional

[1300086]
Nome=Anama
UF=AM
Provedor=PadraoNacional

[1300102]
Nome=Anori
UF=AM
Provedor=PadraoNacional

[1300144]
Nome=Apui
UF=AM
Provedor=PadraoNacional

[1300201]
Nome=Atalaia do Norte
UF=AM
Provedor=PadraoNacional

[1300300]
Nome=Autazes
UF=AM
Provedor=PadraoNacional

[1300409]
Nome=Barcelos
UF=AM
Provedor=PadraoNacional

[1300508]
Nome=Barreirinha
UF=AM
Provedor=PadraoNacional

[1300607]
Nome=Benjamin Constant
UF=AM
Provedor=PadraoNacional

[1300631]
Nome=Beruri
UF=AM
Provedor=PadraoNacional

[1300680]
Nome=Boa Vista do Ramos
UF=AM
Provedor=PadraoNacional

[1300706]
Nome=Boca do Acre
UF=AM
Provedor=PadraoNacional

[1300805]
Nome=Borba
UF=AM
Provedor=PadraoNacional

[1300839]
Nome=Caapiranga
UF=AM
Provedor=PadraoNacional

[1300904]
Nome=Canutama
UF=AM
Provedor=PadraoNacional

[1301001]
Nome=Carauari
UF=AM
Provedor=PadraoNacional

[1301100]
Nome=Careiro
UF=AM
Provedor=PadraoNacional

[1301159]
Nome=Careiro da Varzea
UF=AM
Provedor=PadraoNacional

[1301209]
Nome=Coari
UF=AM
Provedor=PadraoNacional

[1301308]
Nome=Codajas
UF=AM
Provedor=PadraoNacional

[1301407]
Nome=Eirunepe
UF=AM
Provedor=PadraoNacional

[1301506]
Nome=Envira
UF=AM
Provedor=PadraoNacional

[1301605]
Nome=Fonte Boa
UF=AM
Provedor=PadraoNacional

[1301654]
Nome=Guajara
UF=AM
Provedor=PadraoNacional

[1301704]
Nome=Humaita
UF=AM
Provedor=PadraoNacional

[1301803]
Nome=Ipixuna
UF=AM
Provedor=PadraoNacional

[1301852]
Nome=Iranduba
UF=AM
Provedor=PadraoNacional

[1301902]
Nome=Itacoatiara
UF=AM
Provedor=PadraoNacional

[1301951]
Nome=Itamarati
UF=AM
Provedor=PadraoNacional

[1302009]
Nome=Itapiranga
UF=AM
Provedor=PadraoNacional

[1302108]
Nome=Japura
UF=AM
Provedor=PadraoNacional

[1302207]
Nome=Jurua
UF=AM
Provedor=PadraoNacional

[1302306]
Nome=Jutai
UF=AM
Provedor=PadraoNacional

[1302405]
Nome=Labrea
UF=AM
Provedor=PadraoNacional

[1302504]
Nome=Manacapuru
UF=AM
Provedor=PadraoNacional

[1302553]
Nome=Manaquiri
UF=AM
Provedor=PadraoNacional

[1302603]
Nome=Manaus
UF=AM
Provedor=Abaco
Versao=1.01
ProRecepcionar=https://nfse-prd.manaus.am.gov.br/nfse/servlet/arecepcionarloterps
ProConsultarSituacao=https://nfse-prd.manaus.am.gov.br/nfse/servlet/aconsultarsituacaoloterps
ProConsultarLote=https://nfse-prd.manaus.am.gov.br/nfse/servlet/aconsultarloterps
ProConsultarNFSeRps=https://nfse-prd.manaus.am.gov.br/nfse/servlet/aconsultarnfseporrps
ProConsultarNFSe=https://nfse-prd.manaus.am.gov.br/nfse/servlet/aconsultarnfse
ProCancelarNFSe=https://nfse-prd.manaus.am.gov.br/nfse/servlet/acancelarnfse
;
HomRecepcionar=https://nfsev-prd.manaus.am.gov.br/nfsev/servlet/arecepcionarloterps
HomConsultarSituacao=https://nfsev-prd.manaus.am.gov.br/nfsev/servlet/aconsultarsituacaoloterps
HomConsultarLote=https://nfsev-prd.manaus.am.gov.br/nfsev/servlet/aconsultarloterps
HomConsultarNFSeRps=https://nfsev-prd.manaus.am.gov.br/nfsev/servlet/aconsultarnfseporrps
HomConsultarNFSe=https://nfsev-prd.manaus.am.gov.br/nfsev/servlet/aconsultarnfse
HomCancelarNFSe=https://nfsev-prd.manaus.am.gov.br/nfsev/servlet/acancelarnfse
;
ProLinkURL=https://nfse-prd.manaus.am.gov.br/nfse/servlet/wvalidarautenticidadenfse?%Cnpj%,%ValorServico%,%NumeroNFSe%,%CodVerif%
HomLinkURL=https://nfsev-prd.manaus.am.gov.br/nfsev/servlet/wvalidarautenticidadenfse?%Cnpj%,%ValorServico%,%NumeroNFSe%,%CodVerif%

[1302702]
Nome=Manicore
UF=AM
Provedor=PadraoNacional

[1302801]
Nome=Maraa
UF=AM
Provedor=PadraoNacional

[1302900]
Nome=Maues
UF=AM
Provedor=PadraoNacional

[1303007]
Nome=Nhamunda
UF=AM
Provedor=PadraoNacional

[1303106]
Nome=Nova Olinda do Norte
UF=AM
Provedor=PadraoNacional

[1303205]
Nome=Novo Airao
UF=AM
Provedor=PadraoNacional

[1303304]
Nome=Novo Aripuana
UF=AM
Provedor=PadraoNacional

[1303403]
Nome=Parintins
UF=AM
Provedor=PadraoNacional

[1303502]
Nome=Pauini
UF=AM
Provedor=PadraoNacional

[1303536]
Nome=Presidente Figueiredo
UF=AM
Provedor=PadraoNacional

[1303569]
Nome=Rio Preto da Eva
UF=AM
Provedor=PadraoNacional

[1303601]
Nome=Santa Isabel do Rio Negro
UF=AM
Provedor=PadraoNacional

[1303700]
Nome=Santo Antonio do Ica
UF=AM
Provedor=PadraoNacional

[1303809]
Nome=Sao Gabriel da Cachoeira
UF=AM
Provedor=PadraoNacional

[1303908]
Nome=Sao Paulo de Olivenca
UF=AM
Provedor=PadraoNacional

[1303957]
Nome=Sao Sebastiao do Uatuma
UF=AM
Provedor=PadraoNacional

[1304005]
Nome=Silves
UF=AM
Provedor=PadraoNacional

[1304062]
Nome=Tabatinga
UF=AM
Provedor=PadraoNacional

[1304104]
Nome=Tapaua
UF=AM
Provedor=PadraoNacional

[1304203]
Nome=Tefe
UF=AM
Provedor=Betha

[1304237]
Nome=Tonantins
UF=AM
Provedor=PadraoNacional

[1304260]
Nome=Uarini
UF=AM
Provedor=PadraoNacional

[1304302]
Nome=Urucara
UF=AM
Provedor=PadraoNacional

[1304401]
Nome=Urucurituba
UF=AM
Provedor=PadraoNacional

[1400027]
Nome=Amajari
UF=RR
Provedor=PadraoNacional

[1400050]
Nome=Alto Alegre
UF=RR
Provedor=PadraoNacional

[1400100]
Nome=Boa Vista
UF=RR
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://boavista.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-boavista.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://boavista.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://boavista.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[1400159]
Nome=Bonfim
UF=RR
Provedor=PadraoNacional

[1400175]
Nome=Canta
UF=RR
Provedor=PadraoNacional

[1400209]
Nome=Caracarai
UF=RR
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://caracarai.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-caracarai.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://caracarai.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://caracarai.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[1400233]
Nome=Caroebe
UF=RR
Provedor=PadraoNacional

[1400282]
Nome=Iracema
UF=RR
Provedor=PadraoNacional

[1400308]
Nome=Mucajai
UF=RR
Provedor=PadraoNacional

[1400407]
Nome=Normandia
UF=RR
Provedor=PadraoNacional

[1400456]
Nome=Pacaraima
UF=RR
Provedor=PadraoNacional

[1400472]
Nome=Rorainopolis
UF=RR
Provedor=PadraoNacional

[1400506]
Nome=Sao Joao da Baliza
UF=RR
Provedor=PadraoNacional

[1400605]
Nome=Sao Luiz
UF=RR
Provedor=PadraoNacional

[1400704]
Nome=Uiramuta
UF=RR
Provedor=PadraoNacional

[1500107]
Nome=Abaetetuba
UF=PA
Provedor=PadraoNacional

[1500131]
Nome=Abel Figueiredo
UF=PA
Provedor=PadraoNacional

[1500206]
Nome=Acara
UF=PA
Provedor=PadraoNacional

[1500305]
Nome=Afua
UF=PA
Provedor=PadraoNacional

[1500347]
Nome=Agua Azul do Norte
UF=PA
Provedor=PadraoNacional

[1500404]
Nome=Alenquer
UF=PA
Provedor=PadraoNacional

[1500503]
Nome=Almeirim
UF=PA
Provedor=PadraoNacional

[1500602]
; Inclu�do em 02/12/2022
Nome=Altamira
UF=PA
Provedor=Desenvolve
Versao=2.03
ProRecepcionar=https://altamira.desenvolvecidade.com.br/nfsd/IntegracaoNfsd
HomRecepcionar=https://hml-01-altamira.desenvolvecidade.com.br/nfsd/IntegracaoNfsd

[1500701]
Nome=Anajas
UF=PA
Provedor=PadraoNacional

[1500800]
Nome=Ananindeua
UF=PA
Provedor=Ginfes
;
ProLinkURL=http://ananindeua.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://ananindeua.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[1500859]
Nome=Anapu
UF=PA
Provedor=PadraoNacional

[1500909]
Nome=Augusto Correa
UF=PA
Provedor=PadraoNacional

[1500958]
Nome=Aurora do Para
UF=PA
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/auroradoparapa_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/auroradoparapa_wsnfse_homolog/NfseServices.svc

[1501006]
Nome=Aveiro
UF=PA
Provedor=PadraoNacional

[1501105]
Nome=Bagre
UF=PA
Provedor=PadraoNacional

[1501204]
Nome=Baiao
UF=PA
Provedor=PadraoNacional

[1501253]
Nome=Bannach
UF=PA
Provedor=PadraoNacional

[1501303]
Nome=Barcarena
UF=PA
Provedor=PadraoNacional

[1501402]
Nome=Belem
UF=PA
Provedor=Siat
ProRecepcionar=http://siat.belem.pa.gov.br:8180/WsNFe/LoteRps
HomRecepcionar=http://siat.notahomologa.belem.pa.gov.br:8180/WsNFe/LoteRps
;
ProNameSpace=http://siat.nota.belem.pa.gov.br/WsNFe/LoteRps
HomNameSpace=http://siat.nota.belem.pa.gov.br/WsNFe/LoteRps

[1501451]
Nome=Belterra
UF=PA
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://187.108.203.210:8095/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://187.108.203.210:8095/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1501501]
Nome=Benevides
UF=PA
Provedor=PadraoNacional

[1501576]
Nome=Bom Jesus do Tocantins
UF=PA
Provedor=PadraoNacional

[1501600]
Nome=Bonito
UF=PA
Provedor=PadraoNacional

[1501709]
Nome=Braganca
UF=PA
Provedor=PadraoNacional

[1501725]
Nome=Brasil Novo
UF=PA
Provedor=PadraoNacional

[1501758]
Nome=Brejo Grande do Araguaia
UF=PA
Provedor=PadraoNacional

[1501782]
Nome=Breu Branco
UF=PA
Provedor=PadraoNacional

[1501808]
Nome=Breves
UF=PA
Provedor=PadraoNacional

[1501907]
Nome=Bujaru
UF=PA
Provedor=PadraoNacional

[1501956]
Nome=Cachoeira do Piria
UF=PA
Provedor=PadraoNacional

[1502004]
Nome=Cachoeira do Arari
UF=PA
Provedor=PadraoNacional

[1502103]
Nome=Cameta
UF=PA
Provedor=PadraoNacional

[1502152]
Nome=Canaa Dos Carajas
UF=PA
Provedor=PadraoNacional

[1502202]
Nome=Capanema
UF=PA
Provedor=PadraoNacional

[1502301]
Nome=Capitao Poco
UF=PA
Provedor=PadraoNacional

[1502400]
Nome=Castanhal
UF=PA
Provedor=PadraoNacional

[1502509]
Nome=Chaves
UF=PA
Provedor=PadraoNacional

[1502608]
Nome=Colares
UF=PA
Provedor=PadraoNacional

[1502707]
; Inclu�do em 14/04/2022
Nome=Conceicao do Araguaia
UF=PA
Provedor=ISSIntel
ProNameSpace=http://conceicaodoaraguaia-pa.issintegra.com.br/webservices/abrasf/api
HomNameSpace=http://conceicaodoaraguaia-pa.treino-issintegra.com.br/webservices/abrasf/api
;
ProRecepcionar=https://conceicaodoaraguaia-pa.issintegra.com.br/webservices/abrasf/api
HomRecepcionar=https://conceicaodoaraguaia-pa.treino-issintegra.com.br/webservices/abrasf/api
;
ProSoapAction=http://conceicaodoaraguaia-pa.issintegra.com.br/webservices/abrasf/api/
HomSoapAction=http://conceicaodoaraguaia-pa.treino-issintegra.com.br/webservices/abrasf/api/

[1502756]
Nome=Concordia do Para
UF=PA
Provedor=PadraoNacional

[1502764]
Nome=Cumaru do Norte
UF=PA
Provedor=PadraoNacional

[1502772]
Nome=Curionopolis
UF=PA
Provedor=PadraoNacional

[1502806]
Nome=Curralinho
UF=PA
Provedor=PadraoNacional

[1502855]
Nome=Curua
UF=PA
Provedor=PadraoNacional

[1502905]
Nome=Curuca
UF=PA
Provedor=PadraoNacional

[1502939]
Nome=Dom Eliseu
UF=PA
Provedor=PadraoNacional

[1502954]
Nome=Eldorado Dos Carajas
UF=PA
Provedor=PadraoNacional

[1503002]
Nome=Faro
UF=PA
Provedor=PadraoNacional

[1503044]
Nome=Floresta do Araguaia
UF=PA
Provedor=PadraoNacional

[1503077]
Nome=Garrafao do Norte
UF=PA
Provedor=PadraoNacional

[1503093]
Nome=Goianesia do Para
UF=PA
Provedor=PadraoNacional

[1503101]
Nome=Gurupa
UF=PA
Provedor=PadraoNacional

[1503200]
Nome=Igarape-Acu
UF=PA
Provedor=PadraoNacional

[1503309]
Nome=Igarape-Miri
UF=PA
Provedor=PadraoNacional

[1503408]
Nome=Inhangapi
UF=PA
Provedor=PadraoNacional

[1503457]
Nome=Ipixuna do Para
UF=PA
Provedor=PadraoNacional

[1503507]
Nome=Irituia
UF=PA
Provedor=PadraoNacional

[1503606]
; Atualizado em 06/10/2021
Nome=Itaituba
UF=PA
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://itaituba.tributosmunicipais.net:8110/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://itaituba.tributosmunicipais.net:8110/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1503705]
Nome=Itupiranga
UF=PA
Provedor=PadraoNacional

[1503754]
Nome=Jacareacanga
UF=PA
Provedor=PadraoNacional

[1503804]
Nome=Jacunda
UF=PA
Provedor=PadraoNacional

[1503903]
Nome=Juruti
UF=PA
Provedor=PadraoNacional

[1504000]
Nome=Limoeiro do Ajuru
UF=PA
Provedor=PadraoNacional

[1504059]
Nome=Mae do Rio
UF=PA
Provedor=PadraoNacional

[1504109]
Nome=Magalhaes Barata
UF=PA
Provedor=PadraoNacional

[1504208]
Nome=Maraba
UF=PA
Provedor=PadraoNacional

[1504307]
Nome=Maracana
UF=PA
Provedor=PadraoNacional

[1504406]
Nome=Marapanim
UF=PA
Provedor=PadraoNacional

[1504422]
; Inclu�do em 02/09/2022
Nome=Marituba
UF=PA
Provedor=Actcon
Versao=2.02
;
ProRecepcionar=https://nfse-pa-marituba.portalfacil.com.br/nfseserv/webservice/servicos
HomRecepcionar=https://nfse-pa-marituba.portalfacil.com.br/homologacao/webservice/servicos
;
ProXMLNameSpace=http://nfse-pa-marituba.portalfacil.com.br/nfseserv/schema/nfse_v202.xsd
HomXMLNameSpace=http://nfse-pa-marituba.portalfacil.com.br/homologacao/schema/nfse_v202.xsd
;
ProNameSpace=http://nfse-pa-marituba.portalfacil.com.br/nfseserv/webservice/nfse.wsdl
HomNameSpace=http://nfse-mg-alemparaiba.portalfacil.com.br/homologacao/webservice/nfse.wsdl
;
ProSoapAction=http://nfse-pa-marituba.portalfacil.com.br/nfseserv/webservice/servicos#
HomSoapAction=http://nfse-pa-marituba.portalfacil.com.br/homologacao/webservice/servicos#

[1504455]
Nome=Medicilandia
UF=PA
Provedor=PadraoNacional

[1504505]
Nome=Melgaco
UF=PA
Provedor=PadraoNacional

[1504604]
Nome=Mocajuba
UF=PA
Provedor=PadraoNacional

[1504703]
Nome=Moju
UF=PA
Provedor=PadraoNacional

[1504752]
Nome=Mojui dos Campos
UF=PA
Provedor=PadraoNacional

[1504802]
Nome=Monte Alegre
UF=PA
Provedor=PadraoNacional

[1504901]
Nome=Muana
UF=PA
Provedor=PadraoNacional

[1504950]
Nome=Nova Esperanca do Piria
UF=PA
Provedor=PadraoNacional

[1504976]
Nome=Nova Ipixuna
UF=PA
Provedor=PadraoNacional

[1505007]
Nome=Nova Timboteua
UF=PA
Provedor=PadraoNacional

[1505031]
; Atualizado em 16/03/2022
Nome=Novo Progresso
UF=PA
Provedor=Fiorilli
Versao=2.00
;
ProRecepcionar=http://novoprogresso.tec.br:8071/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://novoprogresso.tec.br:8071/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1505064]
Nome=Novo Repartimento
UF=PA
Provedor=PadraoNacional

[1505106]
Nome=Obidos
UF=PA
Provedor=PadraoNacional

[1505205]
Nome=Oeiras do Para
UF=PA
Provedor=PadraoNacional

[1505304]
Nome=Oriximina
UF=PA
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/oriximina/servicos.asmx

[1505403]
Nome=Ourem
UF=PA
Provedor=PadraoNacional

[1505437]
Nome=Ourilandia do Norte
UF=PA
Provedor=PadraoNacional

[1505486]
Nome=Pacaja
UF=PA
Provedor=PadraoNacional

[1505494]
Nome=Palestina do Para
UF=PA
Provedor=PadraoNacional

[1505502]
Nome=Paragominas
UF=PA
Provedor=PadraoNacional

[1505536]
; Atualizado em 04/05/2022
Nome=Parauapebas
UF=PA
Provedor=Desenvolve
Versao=2.03
ProRecepcionar=https://parauapebas.desenvolvecidade.com.br/nfsd/IntegracaoNfsd
HomRecepcionar=https://hml-03-parauapebas.desenvolvecidade.com.br/nfsd/IntegracaoNfsd

[1505551]
Nome=Pau D Arco
UF=PA
Provedor=PadraoNacional

[1505601]
Nome=Peixe-Boi
UF=PA
Provedor=PadraoNacional

[1505635]
Nome=Picarra
UF=PA
Provedor=PadraoNacional

[1505650]
Nome=Placas
UF=PA
Provedor=PadraoNacional

[1505700]
Nome=Ponta de Pedras
UF=PA
Provedor=PadraoNacional

[1505809]
Nome=Portel
UF=PA
Provedor=PadraoNacional

[1505908]
Nome=Porto de Moz
UF=PA
Provedor=PadraoNacional

[1506005]
Nome=Prainha
UF=PA
Provedor=PadraoNacional

[1506104]
Nome=Primavera
UF=PA
Provedor=PadraoNacional

[1506112]
Nome=Quatipuru
UF=PA
Provedor=PadraoNacional

[1506138]
; Inclu�do em 03/03/2022
Nome=Redencao
UF=PA
Provedor=Bauhaus
ProRecepcionar=*
ProGerarNFSe=https://api-nfse-redencao-pa.prefeituramoderna.com.br/ws/services/gerar
ProConsultarNFSe=https://api-nfse-redencao-pa.prefeituramoderna.com.br/ws/services/consultar
ProCancelarNFSe=https://api-nfse-redencao-pa.prefeituramoderna.com.br/ws/services/cancelar
ProSubstituirNFSe=https://api-nfse-redencao-pa.prefeituramoderna.com.br/ws/services/substituir

[1506161]
; Atualizado em 23/08/2022
Nome=Rio Maria
UF=PA
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://168.181.174.10:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://168.181.174.10:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1506187]
Nome=Rondon do Para
UF=PA
Provedor=PadraoNacional

[1506195]
Nome=Ruropolis
UF=PA
Provedor=PadraoNacional

[1506203]
Nome=Salinopolis
UF=PA
Provedor=PadraoNacional

[1506302]
Nome=Salvaterra
UF=PA
Provedor=PadraoNacional

[1506351]
Nome=Santa Barbara do Para
UF=PA
Provedor=PadraoNacional

[1506401]
Nome=Santa Cruz do Arari
UF=PA
Provedor=PadraoNacional

[1506500]
Nome=Santa Isabel do Para
UF=PA
Provedor=PadraoNacional

[1506559]
Nome=Santa Luzia do Para
UF=PA
Provedor=PadraoNacional

[1506583]
Nome=Santa Maria das Barreiras
UF=PA
Provedor=PadraoNacional

[1506609]
Nome=Santa Maria do Para
UF=PA
Provedor=PadraoNacional

[1506708]
Nome=Santana do Araguaia
UF=PA
Provedor=PadraoNacional

[1506807]
; Atualizado em 08/02/2022
Nome=Santarem
UF=PA
Provedor=SiapSistemas
Versao=2.03
Params=AliasCidade:Santarem
;
ProRecepcionar=https://santarem.siapsistemas.com.br/rps/servlet/arecepcionarloterps
ProConsultarLote=https://santarem.siapsistemas.com.br/rps/servlet/aconsultarloterps
ProCancelarNFSe=https://santarem.siapsistemas.com.br/rps/servlet/acancelarnfse
ProGerarNFSe=https://santarem.siapsistemas.com.br/rps/servlet/agerarnfse
ProRecepcionarSincrono=https://santarem.siapsistemas.com.br/rps/servlet/arecepcionarloterpssincrono
;
HomRecepcionar=https://santarem.siapsistemas.com.br/rpshomologa/servlet/arecepcionarloterps
HomConsultarLote=https://santarem.siapsistemas.com.br/rpshomologa/servlet/aconsultarloterps
HomCancelarNFSe=https://santarem.siapsistemas.com.br/rpshomologa/servlet/acancelarnfse
HomGerarNFSe=https://santarem.siapsistemas.com.br/rpshomologa/servlet/agerarnfse
HomRecepcionarSincrono=https://santarem.siapsistemas.com.br/rpshomologa/servlet/arecepcionarloterpssincrono

[1506906]
Nome=Santarem Novo
UF=PA
Provedor=PadraoNacional

[1507003]
Nome=Santo Antonio do Taua
UF=PA
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/santoantoniodotauapa_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/santoantoniodotauapa_wsnfse_homolog/NfseServices.svc

[1507102]
Nome=Sao Caetano de Odivelas
UF=PA
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/saocaetanodeodivelaspa_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/saocaetanodeodivelaspa_wsnfse_homolog/NfseServices.svc

[1507151]
Nome=Sao Domingos do Araguaia
UF=PA
Provedor=PadraoNacional

[1507201]
Nome=Sao Domingos do Capim
UF=PA
Provedor=PadraoNacional

[1507300]
Nome=Sao Felix do Xingu
UF=PA
Provedor=PadraoNacional

[1507409]
Nome=Sao Francisco do Para
UF=PA
Provedor=PadraoNacional

[1507458]
Nome=Sao Geraldo do Araguaia
UF=PA
Provedor=PadraoNacional

[1507466]
Nome=Sao Joao da Ponta
UF=PA
Provedor=PadraoNacional

[1507474]
Nome=Sao Joao de Pirabas
UF=PA
Provedor=PadraoNacional

[1507508]
Nome=Sao Joao do Araguaia
UF=PA
Provedor=PadraoNacional

[1507607]
Nome=Sao Miguel do Guama
UF=PA
Provedor=PadraoNacional

[1507706]
Nome=Sao Sebastiao da Boa Vista
UF=PA
Provedor=PadraoNacional

[1507755]
Nome=Sapucaia
UF=PA
Provedor=PadraoNacional

[1507805]
Nome=Senador Jose Porfirio
UF=PA
Provedor=PadraoNacional

[1507904]
Nome=Soure
UF=PA
Provedor=PadraoNacional

[1507953]
Nome=Tailandia
UF=PA
Provedor=PadraoNacional

[1507961]
Nome=Terra Alta
UF=PA
Provedor=PadraoNacional

[1507979]
Nome=Terra Santa
UF=PA
Provedor=PadraoNacional

[1508001]
Nome=Tome-Acu
UF=PA
Provedor=PadraoNacional

[1508035]
Nome=Tracuateua
UF=PA
Provedor=PadraoNacional

[1508050]
Nome=Trairao
UF=PA
Provedor=PadraoNacional

[1508084]
; Inclu�do em 03/03/2022
Nome=Tucuma
UF=PA
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://168.232.83.142:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://168.232.83.142:5661/IssWeb-ejb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[1508100]
Nome=Tucurui
UF=PA
Provedor=PadraoNacional

[1508126]
Nome=Ulianopolis
UF=PA
Provedor=PadraoNacional

[1508159]
Nome=Uruara
UF=PA
Provedor=PadraoNacional

[1508209]
Nome=Vigia
UF=PA
Provedor=PadraoNacional

[1508308]
Nome=Viseu
UF=PA
Provedor=PadraoNacional

[1508357]
Nome=Vitoria do Xingu
UF=PA
Provedor=PadraoNacional

[1508407]
; Atualizado em 29/06/2021
Nome=Xinguara
UF=PA
Provedor=ISSIntel
ProNameSpace=http://xinguara-pa.issintegra.com.br/webservices/abrasf/api
HomNameSpace=http://xinguara-pa.treino-issintegra.com.br/webservices/abrasf/api
;
ProRecepcionar=https://xinguara-pa.issintegra.com.br/webservices/abrasf/api
HomRecepcionar=https://xinguara-pa.treino-issintegra.com.br/webservices/abrasf/api
;
ProSoapAction=http://xinguara-pa.issintegra.com.br/webservices/abrasf/api/
HomSoapAction=http://xinguara-pa.treino-issintegra.com.br/webservices/abrasf/api/

[1600055]
Nome=Serra do Navio
UF=AP
Provedor=PadraoNacional

[1600105]
Nome=Amapa
UF=AP
Provedor=PadraoNacional

[1600154]
Nome=Pedra Branca do Amapari
UF=AP
Provedor=PadraoNacional

[1600204]
Nome=Calcoene
UF=AP
Provedor=PadraoNacional

[1600212]
Nome=Cutias
UF=AP
Provedor=PadraoNacional

[1600238]
Nome=Ferreira Gomes
UF=AP
Provedor=PadraoNacional

[1600253]
Nome=Itaubal
UF=AP
Provedor=PadraoNacional

[1600279]
Nome=Laranjal do Jari
UF=AP
Provedor=PadraoNacional

[1600303]
; Atualizado em 04/03/2022
Nome=Macapa
UF=AP
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://macapa.govbr.cloud/NFSe.Portal.Integracao/services.svc
HomRecepcionar=

[1600402]
Nome=Mazagao
UF=AP
Provedor=PadraoNacional

[1600501]
Nome=Oiapoque
UF=AP
Provedor=PadraoNacional

[1600535]
Nome=Porto Grande
UF=AP
Provedor=PadraoNacional

[1600550]
Nome=Pracuuba
UF=AP
Provedor=PadraoNacional

[1600600]
Nome=Santana
UF=AP
Provedor=PadraoNacional

[1600709]
Nome=Tartarugalzinho
UF=AP
Provedor=PadraoNacional

[1600808]
Nome=Vitoria do Jari
UF=AP
Provedor=PadraoNacional

[1700251]
Nome=Abreulandia
UF=TO
Provedor=PadraoNacional

[1700301]
Nome=Aguiarnopolis
UF=TO
Provedor=PadraoNacional

[1700350]
Nome=Alianca do Tocantins
UF=TO
Provedor=PadraoNacional

[1700400]
Nome=Almas
UF=TO
Provedor=PadraoNacional

[1700707]
Nome=Alvorada
UF=TO
Provedor=PadraoNacional

[1701002]
Nome=Ananas
UF=TO
Provedor=PadraoNacional

[1701051]
Nome=Angico
UF=TO
Provedor=PadraoNacional

[1701101]
Nome=Aparecida do Rio Negro
UF=TO
Provedor=PadraoNacional

[1701309]
Nome=Aragominas
UF=TO
Provedor=PadraoNacional

[1701903]
Nome=Araguacema
UF=TO
Provedor=PadraoNacional

[1702000]
Nome=Araguacu
UF=TO
Provedor=PadraoNacional

[1702109]
Nome=Araguaina
UF=TO
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://araguainato.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://araguainato.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[1702158]
Nome=Araguana
UF=TO
Provedor=PadraoNacional

[1702208]
Nome=Araguatins
UF=TO
Provedor=PadraoNacional

[1702307]
Nome=Arapoema
UF=TO
Provedor=PadraoNacional

[1702406]
Nome=Arraias
UF=TO
Provedor=PadraoNacional

[1702554]
Nome=Augustinopolis
UF=TO
Provedor=PadraoNacional

[1702703]
Nome=Aurora do Tocantins
UF=TO
Provedor=PadraoNacional

[1702901]
Nome=Axixa do Tocantins
UF=TO
Provedor=PadraoNacional

[1703008]
Nome=Babaculandia
UF=TO
Provedor=PadraoNacional

[1703057]
Nome=Bandeirantes do Tocantins
UF=TO
Provedor=PadraoNacional

[1703073]
Nome=Barra do Ouro
UF=TO
Provedor=PadraoNacional

[1703107]
Nome=Barrolandia
UF=TO
Provedor=PadraoNacional

[1703206]
Nome=Bernardo Sayao
UF=TO
Provedor=PadraoNacional

[1703305]
Nome=Bom Jesus do Tocantins
UF=TO
Provedor=PadraoNacional

[1703602]
Nome=Brasilandia do Tocantins
UF=TO
Provedor=PadraoNacional

[1703701]
Nome=Brejinho de Nazare
UF=TO
Provedor=PadraoNacional

[1703800]
Nome=Buriti do Tocantins
UF=TO
Provedor=PadraoNacional

[1703826]
Nome=Cachoeirinha
UF=TO
Provedor=PadraoNacional

[1703842]
Nome=Campos Lindos
UF=TO
Provedor=PadraoNacional

[1703867]
Nome=Cariri do Tocantins
UF=TO
Provedor=PadraoNacional

[1703883]
Nome=Carmolandia
UF=TO
Provedor=PadraoNacional

[1703891]
Nome=Carrasco Bonito
UF=TO
Provedor=PadraoNacional

[1703909]
Nome=Caseara
UF=TO
Provedor=PadraoNacional

[1704105]
Nome=Centenario
UF=TO
Provedor=PadraoNacional

[1704600]
Nome=Chapada de Areia
UF=TO
Provedor=PadraoNacional

[1705102]
Nome=Chapada da Natividade
UF=TO
Provedor=PadraoNacional

[1705508]
; Inclu�do em 10/11/2022
Nome=Colinas do Tocantins
UF=TO
Provedor=ISSIntel
ProNameSpace=http://colinasdotocantins-to.issintegra.com.br/webservices/abrasf/api
HomNameSpace=http://colinasdotocantins-to.treino-issintegra.com.br/webservices/abrasf/api
;
ProRecepcionar=https://colinasdotocantins-to.issintegra.com.br/webservices/abrasf/api
HomRecepcionar=https://colinasdotocantins-to.treino-issintegra.com.br/webservices/abrasf/api
;
ProSoapAction=http://colinasdotocantins-to.issintegra.com.br/webservices/abrasf/api/
HomSoapAction=http://colinasdotocantins-to.treino-issintegra.com.br/webservices/abrasf/api/

[1705557]
Nome=Combinado
UF=TO
Provedor=PadraoNacional

[1705607]
Nome=Conceicao do Tocantins
UF=TO
Provedor=PadraoNacional

[1706001]
Nome=Couto Magalhaes
UF=TO
Provedor=PadraoNacional

[1706100]
Nome=Cristalandia
UF=TO
Provedor=PadraoNacional

[1706258]
Nome=Crixas do Tocantins
UF=TO
Provedor=PadraoNacional

[1706506]
Nome=Darcinopolis
UF=TO
Provedor=PadraoNacional

[1707009]
Nome=Dianopolis
UF=TO
Provedor=PadraoNacional

[1707108]
Nome=Divinopolis do Tocantins
UF=TO
Provedor=PadraoNacional

[1707207]
Nome=Dois Irmaos do Tocantins
UF=TO
Provedor=PadraoNacional

[1707306]
Nome=Duere
UF=TO
Provedor=PadraoNacional

[1707405]
Nome=Esperantina
UF=TO
Provedor=PadraoNacional

[1707553]
Nome=Fatima
UF=TO
Provedor=PadraoNacional

[1707652]
Nome=Figueiropolis
UF=TO
Provedor=PadraoNacional

[1707702]
Nome=Filadelfia
UF=TO
Provedor=PadraoNacional

[1708205]
Nome=Formoso do Araguaia
UF=TO
Provedor=PadraoNacional

[1708254]
Nome=Fortaleza do Tabocao
UF=TO
Provedor=PadraoNacional

[1708304]
Nome=Goianorte
UF=TO
Provedor=PadraoNacional

[1709005]
Nome=Goiatins
UF=TO
Provedor=PadraoNacional

[1709302]
Nome=Guarai
UF=TO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://guarai.megasoftarrecadanet.com.br/guarai/ws/nfseSOAP
HomRecepcionar=

[1709500]
; Atualizado em 22/03/2022
Nome=Gurupi
UF=TO
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://gurupito.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://gurupito.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[1709807]
Nome=Ipueiras
UF=TO
Provedor=PadraoNacional

[1710508]
Nome=Itacaja
UF=TO
Provedor=PadraoNacional

[1710706]
Nome=Itaguatins
UF=TO
Provedor=PadraoNacional

[1710904]
Nome=Itapiratins
UF=TO
Provedor=PadraoNacional

[1711100]
Nome=Itapora do Tocantins
UF=TO
Provedor=PadraoNacional

[1711506]
Nome=Jau do Tocantins
UF=TO
Provedor=PadraoNacional

[1711803]
Nome=Juarina
UF=TO
Provedor=PadraoNacional

[1711902]
Nome=Lagoa da Confusao
UF=TO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://lagoadaconfusao.megasoftarrecadanet.com.br/lagoadaconfusao/ws/nfseSOAP
HomRecepcionar=

[1711951]
Nome=Lagoa do Tocantins
UF=TO
Provedor=PadraoNacional

[1712009]
Nome=Lajeado
UF=TO
Provedor=PadraoNacional

[1712157]
Nome=Lavandeira
UF=TO
Provedor=PadraoNacional

[1712405]
Nome=Lizarda
UF=TO
Provedor=PadraoNacional

[1712454]
Nome=Luzinopolis
UF=TO
Provedor=PadraoNacional

[1712504]
Nome=Marianopolis do Tocantins
UF=TO
Provedor=PadraoNacional

[1712702]
Nome=Mateiros
UF=TO
Provedor=PadraoNacional

[1712801]
Nome=Maurilandia do Tocantins
UF=TO
Provedor=PadraoNacional

[1713205]
Nome=Miracema do Tocantins
UF=TO
Provedor=PadraoNacional

[1713304]
Nome=Miranorte
UF=TO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://miranorte.megasoftarrecadanet.com.br/miranorte/ws/nfseSOAP
HomRecepcionar=

[1713601]
Nome=Monte do Carmo
UF=TO
Provedor=PadraoNacional

[1713700]
Nome=Monte Santo do Tocantins
UF=TO
Provedor=PadraoNacional

[1713809]
Nome=Palmeiras do Tocantins
UF=TO
Provedor=PadraoNacional

[1713957]
Nome=Muricilandia
UF=TO
Provedor=PadraoNacional

[1714203]
Nome=Natividade
UF=TO
Provedor=PadraoNacional

[1714302]
Nome=Nazare
UF=TO
Provedor=PadraoNacional

[1714880]
Nome=Nova Olinda
UF=TO
Provedor=PadraoNacional

[1715002]
Nome=Nova Rosalandia
UF=TO
Provedor=PadraoNacional

[1715101]
Nome=Novo Acordo
UF=TO
Provedor=PadraoNacional

[1715150]
Nome=Novo Alegre
UF=TO
Provedor=PadraoNacional

[1715259]
Nome=Novo Jardim
UF=TO
Provedor=PadraoNacional

[1715507]
Nome=Oliveira de Fatima
UF=TO
Provedor=PadraoNacional

[1715705]
Nome=Palmeirante
UF=TO
Provedor=PadraoNacional

[1715754]
Nome=Palmeiropolis
UF=TO
Provedor=PadraoNacional

[1716109]
Nome=Paraiso do Tocantins
UF=TO
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://paraisodotocantinsto.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://paraisodotocantinsto.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[1716208]
Nome=Parana
UF=TO
Provedor=PadraoNacional

[1716307]
Nome=Pau D Arco
UF=TO
Provedor=PadraoNacional

[1716505]
Nome=Pedro Afonso
UF=TO
Provedor=PadraoNacional

[1716604]
Nome=Peixe
UF=TO
Provedor=PadraoNacional

[1716653]
Nome=Pequizeiro
UF=TO
Provedor=PadraoNacional

[1716703]
Nome=Colmeia
UF=TO
Provedor=PadraoNacional

[1717008]
Nome=Pindorama do Tocantins
UF=TO
Provedor=PadraoNacional

[1717206]
Nome=Piraque
UF=TO
Provedor=PadraoNacional

[1717503]
Nome=Pium
UF=TO
Provedor=PadraoNacional

[1717800]
Nome=Ponte Alta do Bom Jesus
UF=TO
Provedor=PadraoNacional

[1717909]
Nome=Ponte Alta do Tocantins
UF=TO
Provedor=PadraoNacional

[1718006]
Nome=Porto Alegre do Tocantins
UF=TO
Provedor=PadraoNacional

[1718204]
Nome=Porto Nacional
UF=TO
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://portonacionalto.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://portonacionalto.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[1718303]
Nome=Praia Norte
UF=TO
Provedor=PadraoNacional

[1718402]
Nome=Presidente Kennedy
UF=TO
Provedor=PadraoNacional

[1718451]
Nome=Pugmil
UF=TO
Provedor=PadraoNacional

[1718501]
Nome=Recursolandia
UF=TO
Provedor=PadraoNacional

[1718550]
Nome=Riachinho
UF=TO
Provedor=PadraoNacional

[1718659]
Nome=Rio da Conceicao
UF=TO
Provedor=PadraoNacional

[1718709]
Nome=Rio Dos Bois
UF=TO
Provedor=PadraoNacional

[1718758]
Nome=Rio Sono
UF=TO
Provedor=PadraoNacional

[1718808]
Nome=Sampaio
UF=TO
Provedor=PadraoNacional

[1718840]
Nome=Sandolandia
UF=TO
Provedor=PadraoNacional

[1718865]
Nome=Santa Fe do Araguaia
UF=TO
Provedor=PadraoNacional

[1718881]
Nome=Santa Maria do Tocantins
UF=TO
Provedor=PadraoNacional

[1718899]
Nome=Santa Rita do Tocantins
UF=TO
Provedor=PadraoNacional

[1718907]
Nome=Santa Rosa do Tocantins
UF=TO
Provedor=PadraoNacional

[1719004]
Nome=Santa Tereza do Tocantins
UF=TO
Provedor=PadraoNacional

[1720002]
Nome=Santa Terezinha do Tocantins
UF=TO
Provedor=PadraoNacional

[1720101]
Nome=Sao Bento do Tocantins
UF=TO
Provedor=PadraoNacional

[1720150]
Nome=Sao Felix do Tocantins
UF=TO
Provedor=PadraoNacional

[1720200]
Nome=Sao Miguel do Tocantins
UF=TO
Provedor=PadraoNacional

[1720259]
Nome=Sao Salvador do Tocantins
UF=TO
Provedor=PadraoNacional

[1720309]
Nome=Sao Sebastiao do Tocantins
UF=TO
Provedor=PadraoNacional

[1720499]
Nome=Sao Valerio da Natividade
UF=TO
Provedor=PadraoNacional

[1720655]
Nome=Silvanopolis
UF=TO
Provedor=PadraoNacional

[1720804]
Nome=Sitio Novo do Tocantins
UF=TO
Provedor=PadraoNacional

[1720853]
Nome=Sucupira
UF=TO
Provedor=PadraoNacional

[1720903]
Nome=Taguatinga
UF=TO
Provedor=PadraoNacional

[1720937]
Nome=Taipas do Tocantins
UF=TO
Provedor=PadraoNacional

[1720978]
Nome=Talisma
UF=TO
Provedor=PadraoNacional

[1721000]
Nome=Palmas
UF=TO
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://palmasto.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://palmasto.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[1721109]
Nome=Tocantinia
UF=TO
Provedor=PadraoNacional

[1721208]
Nome=Tocantinopolis
UF=TO
Provedor=PadraoNacional

[1721257]
Nome=Tupirama
UF=TO
Provedor=PadraoNacional

[1721307]
Nome=Tupiratins
UF=TO
Provedor=PadraoNacional

[1722081]
Nome=Wanderlandia
UF=TO
Provedor=PadraoNacional

[1722107]
Nome=Xambioa
UF=TO
Provedor=PadraoNacional

[2100055]
; Inclu�do em 20/07/2022
Nome=A�ailandia
UF=MA
Provedor=SigISS
ProRecepcionar=https://acailandia.sigiss.com.br/acailandia/ws/sigiss_ws.php
;
ProSoapAction=urn:sigiss_ws

[2100105]
Nome=Afonso Cunha
UF=MA
Provedor=PadraoNacional

[2100154]
Nome=Agua Doce do Maranhao
UF=MA
Provedor=PadraoNacional

[2100204]
Nome=Alcantara
UF=MA
Provedor=WebISS
ProRecepcionar=https://www5.webiss.com.br/alcantarama_wsnfse/NfseServices.svc
HomRecepcionar=https://www5.webiss.com.br/alcantarama_wsnfse_homolog/NfseServices.svc

[2100303]
Nome=Aldeias Altas
UF=MA
Provedor=PadraoNacional

[2100402]
Nome=Altamira do Maranhao
UF=MA
Provedor=PadraoNacional

[2100436]
Nome=Alto Alegre do Maranhao
UF=MA
Provedor=PadraoNacional

[2100477]
Nome=Alto Alegre do Pindare
UF=MA
Provedor=PadraoNacional

[2100501]
; Inclu�do em 04/11/2022
Nome=Alto Parnaiba
UF=MA
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://nfse.adtrcloud.com.br:8086/IssWeb-ejb/IssWebWS/IssWebWS

[2100550]
Nome=Amapa do Maranhao
UF=MA
Provedor=PadraoNacional

[2100600]
Nome=Amarante do Maranhao
UF=MA
Provedor=PadraoNacional

[2100709]
Nome=Anajatuba
UF=MA
Provedor=PadraoNacional

[2100808]
Nome=Anapurus
UF=MA
Provedor=PadraoNacional

[2100832]
Nome=Apicum-Acu
UF=MA
Provedor=PadraoNacional

[2100873]
Nome=Araguana
UF=MA
Provedor=PadraoNacional

[2100907]
Nome=Araioses
UF=MA
Provedor=PadraoNacional

[2100956]
Nome=Arame
UF=MA
Provedor=PadraoNacional

[2101004]
Nome=Arari
UF=MA
Provedor=PadraoNacional

[2101103]
Nome=Axixa
UF=MA
Provedor=PadraoNacional

[2101202]
; Atualizado em 21/09/2021
Nome=Bacabal
UF=MA
Provedor=SigCorp
Versao=2.03
ProRecepcionar=https://abrasfbacabal.sigcorp.com.br/servico.asmx
HomRecepcionar=https://testeabrasfbacabal.sigcorp.com.br/servico.asmx

[2101251]
Nome=Bacabeira
UF=MA
Provedor=PadraoNacional

[2101301]
Nome=Bacuri
UF=MA
Provedor=PadraoNacional

[2101350]
Nome=Bacurituba
UF=MA
Provedor=PadraoNacional

[2101400]
Nome=Balsas
UF=MA
Provedor=CTAConsult
Versao=1.00
ProRecepcionar=http://stm.balsas.d2ti.com.br:80/wsnfselote/RecepcaoNFSePort
ProCancelarNFSe=http://stm.balsas.d2ti.com.br:80/wsnfselote/CancelamentoNFSePort

[2101509]
Nome=Barao de Grajau
UF=MA
Provedor=PadraoNacional

[2101608]
Nome=Barra do Corda
UF=MA
Provedor=PadraoNacional

[2101707]
Nome=Barreirinhas
UF=MA
Provedor=PadraoNacional

[2101731]
Nome=Belagua
UF=MA
Provedor=PadraoNacional

[2101772]
Nome=Bela Vista do Maranhao
UF=MA
Provedor=PadraoNacional

[2101806]
Nome=Benedito Leite
UF=MA
Provedor=PadraoNacional

[2101905]
Nome=Bequimao
UF=MA
Provedor=PadraoNacional

[2101939]
Nome=Bernardo do Mearim
UF=MA
Provedor=PadraoNacional

[2101970]
Nome=Boa Vista do Gurupi
UF=MA
Provedor=PadraoNacional

[2102002]
Nome=Bom Jardim
UF=MA
Provedor=PadraoNacional

[2102036]
Nome=Bom Jesus das Selvas
UF=MA
Provedor=PadraoNacional

[2102077]
Nome=Bom Lugar
UF=MA
Provedor=PadraoNacional

[2102101]
Nome=Brejo
UF=MA
Provedor=PadraoNacional

[2102150]
Nome=Brejo de Areia
UF=MA
Provedor=PadraoNacional

[2102200]
Nome=Buriti
UF=MA
Provedor=PadraoNacional

[2102309]
Nome=Buriti Bravo
UF=MA
Provedor=PadraoNacional

[2102325]
Nome=Buriticupu
UF=MA
Provedor=PadraoNacional

[2102358]
Nome=Buritirana
UF=MA
Provedor=PadraoNacional

[2102374]
Nome=Cachoeira Grande
UF=MA
Provedor=PadraoNacional

[2102408]
Nome=Cajapio
UF=MA
Provedor=PadraoNacional

[2102507]
Nome=Cajari
UF=MA
Provedor=PadraoNacional

[2102556]
Nome=Campestre do Maranhao
UF=MA
Provedor=PadraoNacional

[2102606]
Nome=Candido Mendes
UF=MA
Provedor=PadraoNacional

[2102705]
Nome=Cantanhede
UF=MA
Provedor=PadraoNacional

[2102754]
Nome=Capinzal do Norte
UF=MA
Provedor=PadraoNacional

[2102804]
Nome=Carolina
UF=MA
Provedor=PadraoNacional

[2102903]
Nome=Carutapera
UF=MA
Provedor=PadraoNacional

[2103000]
Nome=Caxias
UF=MA
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://177.105.209.118:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://177.105.209.118:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[2103109]
Nome=Cedral
UF=MA
Provedor=PadraoNacional

[2103125]
Nome=Central do Maranhao
UF=MA
Provedor=PadraoNacional

[2103158]
Nome=Centro do Guilherme
UF=MA
Provedor=PadraoNacional

[2103174]
Nome=Centro Novo do Maranhao
UF=MA
Provedor=PadraoNacional

[2103208]
Nome=Chapadinha
UF=MA
Provedor=PadraoNacional

[2103257]
Nome=Cidelandia
UF=MA
Provedor=PadraoNacional

[2103307]
Nome=Codo
UF=MA
Provedor=PadraoNacional

[2103406]
Nome=Coelho Neto
UF=MA
Provedor=PadraoNacional

[2103505]
Nome=Colinas
UF=MA
Provedor=PadraoNacional

[2103554]
Nome=Conceicao do Lago-Acu
UF=MA
Provedor=PadraoNacional

[2103604]
Nome=Coroata
UF=MA
Provedor=PadraoNacional

[2103703]
Nome=Cururupu
UF=MA
Provedor=PadraoNacional

[2103752]
Nome=Davinopolis
UF=MA
Provedor=PadraoNacional

[2103802]
Nome=Dom Pedro
UF=MA
Provedor=PadraoNacional

[2103901]
Nome=Duque Bacelar
UF=MA
Provedor=PadraoNacional

[2104008]
Nome=Esperantinopolis
UF=MA
Provedor=PadraoNacional

[2104057]
Nome=Estreito
UF=MA
Provedor=PadraoNacional

[2104073]
Nome=Feira Nova do Maranhao
UF=MA
Provedor=PadraoNacional

[2104081]
Nome=Fernando Falcao
UF=MA
Provedor=PadraoNacional

[2104099]
Nome=Formosa da Serra Negra
UF=MA
Provedor=PadraoNacional

[2104107]
Nome=Fortaleza Dos Nogueiras
UF=MA
Provedor=PadraoNacional

[2104206]
Nome=Fortuna
UF=MA
Provedor=PadraoNacional

[2104305]
Nome=Godofredo Viana
UF=MA
Provedor=PadraoNacional

[2104404]
Nome=Goncalves Dias
UF=MA
Provedor=PadraoNacional

[2104503]
Nome=Governador Archer
UF=MA
Provedor=PadraoNacional

[2104552]
Nome=Governador Edison Lobao
UF=MA
Provedor=PadraoNacional

[2104602]
Nome=Governador Eugenio Barros
UF=MA
Provedor=PadraoNacional

[2104628]
Nome=Governador Luiz Rocha
UF=MA
Provedor=PadraoNacional

[2104651]
Nome=Governador Newton Bello
UF=MA
Provedor=PadraoNacional

[2104677]
Nome=Governador Nunes Freire
UF=MA
Provedor=PadraoNacional

[2104701]
Nome=Graca Aranha
UF=MA
Provedor=PadraoNacional

[2104800]
; Inclu�do em 20/05/2022
Nome=Grajau
UF=MA
Provedor=FISSLex
ProRecepcionar=https://grajau.fisslex.com.br/fiss-lex/servlet/aws_recepcionarloterps
ProConsultarSituacao=https://grajau.fisslex.com.br/fiss-lex/servlet/aws_consultarsituacaoloterps
ProConsultarLote=https://grajau.fisslex.com.br/fiss-lex/servlet/aws_consultaloterps
ProConsultarNFSeRps=https://grajau.fisslex.com.br/fiss-lex/servlet/aws_consultanfseporrps
ProConsultarNFSe=https://grajau.fisslex.com.br/fiss-lex/servlet/aws_consultanfse
ProCancelarNFSe=https://grajau.fisslex.com.br/fiss-lex/servlet/aws_cancelarnfse
;
ProLinkURL=https://grajau.fisslex.com.br/fiss-lex/servlet/apnotafiscalurl?%CodVerif%

[2104909]
Nome=Guimaraes
UF=MA
Provedor=PadraoNacional

[2105005]
Nome=Humberto de Campos
UF=MA
Provedor=PadraoNacional

[2105104]
Nome=Icatu
UF=MA
Provedor=PadraoNacional

[2105153]
Nome=Igarape do Meio
UF=MA
Provedor=PadraoNacional

[2105203]
Nome=Igarape Grande
UF=MA
Provedor=PadraoNacional

[2105302]
; Inclu�do em 01/11/2021
Nome=Imperatriz
UF=MA
Provedor=Actcon
Versao=2.02
ProRecepcionar=https://nfse-ma-imperatriz.portalfacil.com.br/nfseserv/webservice/servicos
HomRecepcionar=https://nfse-ma-imperatriz.portalfacil.com.br/homologacao/webservice/servicos
;
ProXMLNameSpace=http://nfse-ma-imperatriz.portalfacil.com.br/nfseserv/schema/nfse_v202.xsd
HomXMLNameSpace=http://nfse-ma-imperatriz.portalfacil.com.br/homologacao/schema/nfse_v202.xsd
;
ProNameSpace=http://nfse-ma-imperatriz.portalfacil.com.br/nfseserv/webservice/nfse.wsdl
HomNameSpace=http://nfse-ma-imperatriz.portalfacil.com.br/homologacao/webservice/nfse.wsdl
;
ProSoapAction=http://nfse-ma-imperatriz.portalfacil.com.br/nfseserv/webservice/servicos#
HomSoapAction=http://nfse-ma-imperatriz.portalfacil.com.br/homologacao/webservice/servicos#

[2105351]
Nome=Itaipava do Grajau
UF=MA
Provedor=PadraoNacional

[2105401]
Nome=Itapecuru Mirim
UF=MA
Provedor=PadraoNacional

[2105427]
Nome=Itinga do Maranhao
UF=MA
Provedor=PadraoNacional

[2105450]
Nome=Jatoba
UF=MA
Provedor=PadraoNacional

[2105476]
Nome=Jenipapo Dos Vieiras
UF=MA
Provedor=PadraoNacional

[2105500]
Nome=Joao Lisboa
UF=MA
Provedor=PadraoNacional

[2105609]
Nome=Joselandia
UF=MA
Provedor=PadraoNacional

[2105658]
Nome=Junco do Maranhao
UF=MA
Provedor=PadraoNacional

[2105708]
Nome=Lago da Pedra
UF=MA
Provedor=PadraoNacional

[2105807]
Nome=Lago do Junco
UF=MA
Provedor=PadraoNacional

[2105906]
Nome=Lago Verde
UF=MA
Provedor=PadraoNacional

[2105922]
Nome=Lagoa do Mato
UF=MA
Provedor=PadraoNacional

[2105948]
Nome=Lago Dos Rodrigues
UF=MA
Provedor=PadraoNacional

[2105963]
Nome=Lagoa Grande do Maranhao
UF=MA
Provedor=PadraoNacional

[2105989]
Nome=Lajeado Novo
UF=MA
Provedor=PadraoNacional

[2106003]
Nome=Lima Campos
UF=MA
Provedor=PadraoNacional

[2106102]
Nome=Loreto
UF=MA
Provedor=PadraoNacional

[2106201]
Nome=Luis Domingues
UF=MA
Provedor=PadraoNacional

[2106300]
Nome=Magalhaes de Almeida
UF=MA
Provedor=PadraoNacional

[2106326]
Nome=Maracacume
UF=MA
Provedor=PadraoNacional

[2106359]
Nome=Maraja do Sena
UF=MA
Provedor=PadraoNacional

[2106375]
Nome=Maranhaozinho
UF=MA
Provedor=PadraoNacional

[2106409]
Nome=Mata Roma
UF=MA
Provedor=PadraoNacional

[2106508]
Nome=Matinha
UF=MA
Provedor=PadraoNacional

[2106607]
Nome=Matoes
UF=MA
Provedor=PadraoNacional

[2106631]
Nome=Matoes do Norte
UF=MA
Provedor=PadraoNacional

[2106672]
Nome=Milagres do Maranhao
UF=MA
Provedor=PadraoNacional

[2106706]
Nome=Mirador
UF=MA
Provedor=PadraoNacional

[2106755]
Nome=Miranda do Norte
UF=MA
Provedor=PadraoNacional

[2106805]
Nome=Mirinzal
UF=MA
Provedor=PadraoNacional

[2106904]
Nome=Moncao
UF=MA
Provedor=PadraoNacional

[2107001]
Nome=Montes Altos
UF=MA
Provedor=PadraoNacional

[2107100]
Nome=Morros
UF=MA
Provedor=PadraoNacional

[2107209]
Nome=Nina Rodrigues
UF=MA
Provedor=PadraoNacional

[2107258]
Nome=Nova Colinas
UF=MA
Provedor=PadraoNacional

[2107308]
Nome=Nova Iorque
UF=MA
Provedor=PadraoNacional

[2107357]
Nome=Nova Olinda do Maranhao
UF=MA
Provedor=PadraoNacional

[2107407]
Nome=Olho D Agua das Cunhas
UF=MA
Provedor=PadraoNacional

[2107456]
Nome=Olinda Nova do Maranhao
UF=MA
Provedor=PadraoNacional

[2107506]
Nome=Paco do Lumiar
UF=MA
Provedor=PadraoNacional

[2107605]
Nome=Palmeirandia
UF=MA
Provedor=PadraoNacional

[2107704]
Nome=Paraibano
UF=MA
Provedor=PadraoNacional

[2107803]
Nome=Parnarama
UF=MA
Provedor=PadraoNacional

[2107902]
Nome=Passagem Franca
UF=MA
Provedor=PadraoNacional

[2108009]
Nome=Pastos Bons
UF=MA
Provedor=PadraoNacional

[2108058]
Nome=Paulino Neves
UF=MA
Provedor=PadraoNacional

[2108108]
Nome=Paulo Ramos
UF=MA
Provedor=PadraoNacional

[2108207]
Nome=Pedreiras
UF=MA
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://mapmpedreiras.dcfiorilli.com.br:1029/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://mapmpedreiras.dcfiorilli.com.br:1029/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[2108256]
Nome=Pedro do Rosario
UF=MA
Provedor=PadraoNacional

[2108306]
Nome=Penalva
UF=MA
Provedor=PadraoNacional

[2108405]
Nome=Peri Mirim
UF=MA
Provedor=PadraoNacional

[2108454]
Nome=Peritoro
UF=MA
Provedor=PadraoNacional

[2108504]
Nome=Pindare-Mirim
UF=MA
Provedor=PadraoNacional

[2108603]
Nome=Pinheiro
UF=MA
Provedor=PadraoNacional

[2108702]
Nome=Pio Xii
UF=MA
Provedor=PadraoNacional

[2108801]
Nome=Pirapemas
UF=MA
Provedor=PadraoNacional

[2108900]
Nome=Pocao de Pedras
UF=MA
Provedor=PadraoNacional

[2109007]
Nome=Porto Franco
UF=MA
Provedor=PadraoNacional

[2109056]
Nome=Porto Rico do Maranhao
UF=MA
Provedor=PadraoNacional

[2109106]
Nome=Presidente Dutra
UF=MA
Provedor=PadraoNacional

[2109205]
Nome=Presidente Juscelino
UF=MA
Provedor=PadraoNacional

[2109239]
Nome=Presidente Medici
UF=MA
Provedor=PadraoNacional

[2109270]
Nome=Presidente Sarney
UF=MA
Provedor=PadraoNacional

[2109304]
Nome=Presidente Vargas
UF=MA
Provedor=PadraoNacional

[2109403]
Nome=Primeira Cruz
UF=MA
Provedor=PadraoNacional

[2109452]
Nome=Raposa
UF=MA
Provedor=PadraoNacional

[2109502]
Nome=Riachao
UF=MA
Provedor=PadraoNacional

[2109551]
Nome=Ribamar Fiquene
UF=MA
Provedor=PadraoNacional

[2109601]
Nome=Rosario
UF=MA
Provedor=PadraoNacional

[2109700]
Nome=Sambaiba
UF=MA
Provedor=PadraoNacional

[2109759]
Nome=Santa Filomena do Maranhao
UF=MA
Provedor=PadraoNacional

[2109809]
Nome=Santa Helena
UF=MA
Provedor=PadraoNacional

[2109908]
Nome=Santa Ines
UF=MA
Provedor=PadraoNacional

[2110005]
Nome=Santa Luzia
UF=MA
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/santaluziama_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/santaluziama_wsnfse_homolog/NfseServices.svc

[2110039]
Nome=Santa Luzia do Parua
UF=MA
Provedor=PadraoNacional

[2110104]
Nome=Santa Quiteria do Maranhao
UF=MA
Provedor=PadraoNacional

[2110203]
Nome=Santa Rita
UF=MA
Provedor=PadraoNacional

[2110237]
Nome=Santana do Maranhao
UF=MA
Provedor=PadraoNacional

[2110278]
Nome=Santo Amaro do Maranhao
UF=MA
Provedor=PadraoNacional

[2110302]
Nome=Santo Antonio Dos Lopes
UF=MA
Provedor=PadraoNacional

[2110401]
Nome=Sao Benedito do Rio Preto
UF=MA
Provedor=PadraoNacional

[2110500]
Nome=Sao Bento
UF=MA
Provedor=PadraoNacional

[2110609]
Nome=Sao Bernardo
UF=MA
Provedor=PadraoNacional

[2110658]
Nome=Sao Domingos do Azeitao
UF=MA
Provedor=PadraoNacional

[2110708]
Nome=Sao Domingos do Maranhao
UF=MA
Provedor=PadraoNacional

[2110807]
Nome=Sao Felix de Balsas
UF=MA
Provedor=PadraoNacional

[2110856]
Nome=Sao Francisco do Brejao
UF=MA
Provedor=PadraoNacional

[2110906]
Nome=Sao Francisco do Maranhao
UF=MA
Provedor=PadraoNacional

[2111003]
Nome=Sao Joao Batista
UF=MA
Provedor=PadraoNacional

[2111029]
Nome=Sao Joao do Caru
UF=MA
Provedor=PadraoNacional

[2111052]
Nome=Sao Joao do Paraiso
UF=MA
Provedor=PadraoNacional

[2111078]
Nome=Sao Joao do Soter
UF=MA
Provedor=PadraoNacional

[2111102]
Nome=Sao Joao Dos Patos
UF=MA
Provedor=PadraoNacional

[2111201]
Nome=Sao Jose de Ribamar
UF=MA
Provedor=PadraoNacional

[2111250]
Nome=Sao Jose Dos Basilios
UF=MA
Provedor=PadraoNacional

[2111300]
Nome=Sao Luis
UF=MA
Provedor=ISSDSF
Versao=1.01
;
ProRecepcionar=https://sistemas.semfaz.saoluis.ma.gov.br/WsNFe2/LoteRps.jws
;
ProNameSpace=http://sistemas.semfaz.saoluis.ma.gov.br/WsNFe2/LoteRps.jws
HomNameSpace=http://sistemas.semfaz.saoluis.ma.gov.br/WsNFe2/LoteRps.jws

[2111409]
Nome=Sao Luis Gonzaga do Maranhao
UF=MA
Provedor=PadraoNacional

[2111508]
Nome=Sao Mateus do Maranhao
UF=MA
Provedor=PadraoNacional

[2111532]
Nome=Sao Pedro da Agua Branca
UF=MA
Provedor=PadraoNacional

[2111573]
Nome=Sao Pedro Dos Crentes
UF=MA
Provedor=PadraoNacional

[2111607]
Nome=Sao Raimundo das Mangabeiras
UF=MA
Provedor=PadraoNacional

[2111631]
Nome=Sao Raimundo do Doca Bezerra
UF=MA
Provedor=PadraoNacional

[2111672]
Nome=Sao Roberto
UF=MA
Provedor=PadraoNacional

[2111706]
Nome=Sao Vicente Ferrer
UF=MA
Provedor=PadraoNacional

[2111722]
Nome=Satubinha
UF=MA
Provedor=PadraoNacional

[2111748]
Nome=Senador Alexandre Costa
UF=MA
Provedor=PadraoNacional

[2111763]
Nome=Senador La Rocque
UF=MA
Provedor=PadraoNacional

[2111789]
Nome=Serrano do Maranhao
UF=MA
Provedor=PadraoNacional

[2111805]
Nome=Sitio Novo
UF=MA
Provedor=PadraoNacional

[2111904]
Nome=Sucupira do Norte
UF=MA
Provedor=PadraoNacional

[2111953]
Nome=Sucupira do Riachao
UF=MA
Provedor=PadraoNacional

[2112001]
Nome=Tasso Fragoso
UF=MA
Provedor=PadraoNacional

[2112100]
Nome=Timbiras
UF=MA
Provedor=PadraoNacional

[2112209]
Nome=Timon
UF=MA
Provedor=ISSIntel
ProNameSpace=http://timon-ma.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://timon-ma.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://timon-ma.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://timon-ma.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://timon-ma.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://timon-ma.treino-issintel.com.br/webservices/abrasf/api/

[2112233]
Nome=Trizidela do Vale
UF=MA
Provedor=PadraoNacional

[2112274]
Nome=Tufilandia
UF=MA
Provedor=PadraoNacional

[2112308]
Nome=Tuntum
UF=MA
Provedor=PadraoNacional

[2112407]
Nome=Turiacu
UF=MA
Provedor=PadraoNacional

[2112456]
Nome=Turilandia
UF=MA
Provedor=PadraoNacional

[2112506]
Nome=Tutoia
UF=MA
Provedor=PadraoNacional

[2112605]
Nome=Urbano Santos
UF=MA
Provedor=PadraoNacional

[2112704]
Nome=Vargem Grande
UF=MA
Provedor=PadraoNacional

[2112803]
Nome=Viana
UF=MA
Provedor=PadraoNacional

[2112852]
Nome=Vila Nova Dos Martirios
UF=MA
Provedor=PadraoNacional

[2112902]
Nome=Vitoria do Mearim
UF=MA
Provedor=PadraoNacional

[2113009]
Nome=Vitorino Freire
UF=MA
Provedor=PadraoNacional

[2114007]
Nome=Ze Doca
UF=MA
Provedor=PadraoNacional

[2200053]
Nome=Acaua
UF=PI
Provedor=PadraoNacional

[2200103]
Nome=Agricolandia
UF=PI
Provedor=PadraoNacional

[2200202]
Nome=Agua Branca
UF=PI
Provedor=PadraoNacional

[2200251]
Nome=Alagoinha do Piaui
UF=PI
Provedor=PadraoNacional

[2200277]
Nome=Alegrete do Piaui
UF=PI
Provedor=PadraoNacional

[2200301]
Nome=Alto Longa
UF=PI
Provedor=PadraoNacional

[2200400]
Nome=Altos
UF=PI
Provedor=PadraoNacional

[2200459]
Nome=Alvorada do Gurgueia
UF=PI
Provedor=PadraoNacional

[2200509]
Nome=Amarante
UF=PI
Provedor=PadraoNacional

[2200608]
Nome=Angical do Piaui
UF=PI
Provedor=PadraoNacional

[2200707]
Nome=Anisio de Abreu
UF=PI
Provedor=PadraoNacional

[2200806]
Nome=Antonio Almeida
UF=PI
Provedor=PadraoNacional

[2200905]
Nome=Aroazes
UF=PI
Provedor=PadraoNacional

[2200954]
Nome=Aroeiras do Itaim
UF=PI
Provedor=PadraoNacional

[2201002]
Nome=Arraial
UF=PI
Provedor=PadraoNacional

[2201051]
Nome=Assuncao do Piaui
UF=PI
Provedor=PadraoNacional

[2201101]
Nome=Avelino Lopes
UF=PI
Provedor=PadraoNacional

[2201150]
Nome=Baixa Grande do Ribeiro
UF=PI
Provedor=PadraoNacional

[2201176]
Nome=Barra D Alcantara
UF=PI
Provedor=PadraoNacional

[2201200]
Nome=Barras
UF=PI
Provedor=PadraoNacional

[2201309]
Nome=Barreiras do Piaui
UF=PI
Provedor=PadraoNacional

[2201408]
Nome=Barro Duro
UF=PI
Provedor=PadraoNacional

[2201507]
Nome=Batalha
UF=PI
Provedor=PadraoNacional

[2201556]
Nome=Bela Vista do Piaui
UF=PI
Provedor=PadraoNacional

[2201572]
Nome=Belem do Piaui
UF=PI
Provedor=PadraoNacional

[2201606]
Nome=Beneditinos
UF=PI
Provedor=PadraoNacional

[2201705]
Nome=Bertolinia
UF=PI
Provedor=PadraoNacional

[2201739]
Nome=Betania do Piaui
UF=PI
Provedor=PadraoNacional

[2201770]
Nome=Boa Hora
UF=PI
Provedor=PadraoNacional

[2201804]
Nome=Bocaina
UF=PI
Provedor=PadraoNacional

[2201903]
Nome=Bom Jesus
UF=PI
Provedor=PadraoNacional

[2201919]
Nome=Bom Principio do Piaui
UF=PI
Provedor=PadraoNacional

[2201929]
Nome=Bonfim do Piaui
UF=PI
Provedor=PadraoNacional

[2201945]
Nome=Boqueirao do Piaui
UF=PI
Provedor=PadraoNacional

[2201960]
Nome=Brasileira
UF=PI
Provedor=PadraoNacional

[2201988]
Nome=Brejo do Piaui
UF=PI
Provedor=PadraoNacional

[2202000]
Nome=Buriti Dos Lopes
UF=PI
Provedor=PadraoNacional

[2202026]
Nome=Buriti Dos Montes
UF=PI
Provedor=PadraoNacional

[2202059]
Nome=Cabeceiras do Piaui
UF=PI
Provedor=PadraoNacional

[2202075]
Nome=Cajazeiras do Piaui
UF=PI
Provedor=PadraoNacional

[2202083]
Nome=Cajueiro da Praia
UF=PI
Provedor=PadraoNacional

[2202091]
Nome=Caldeirao Grande do Piaui
UF=PI
Provedor=PadraoNacional

[2202109]
Nome=Campinas do Piaui
UF=PI
Provedor=PadraoNacional

[2202117]
Nome=Campo Alegre do Fidalgo
UF=PI
Provedor=PadraoNacional

[2202133]
Nome=Campo Grande do Piaui
UF=PI
Provedor=PadraoNacional

[2202174]
Nome=Campo Largo do Piaui
UF=PI
Provedor=PadraoNacional

[2202208]
Nome=Campo Maior
UF=PI
Provedor=PadraoNacional

[2202251]
Nome=Canavieira
UF=PI
Provedor=PadraoNacional

[2202307]
Nome=Canto do Buriti
UF=PI
Provedor=PadraoNacional

[2202406]
Nome=Capitao de Campos
UF=PI
Provedor=PadraoNacional

[2202455]
Nome=Capitao Gervasio Oliveira
UF=PI
Provedor=PadraoNacional

[2202505]
Nome=Caracol
UF=PI
Provedor=PadraoNacional

[2202539]
Nome=Caraubas do Piaui
UF=PI
Provedor=PadraoNacional

[2202554]
Nome=Caridade do Piaui
UF=PI
Provedor=PadraoNacional

[2202604]
Nome=Castelo do Piaui
UF=PI
Provedor=PadraoNacional

[2202653]
Nome=Caxingo
UF=PI
Provedor=PadraoNacional

[2202703]
Nome=Cocal
UF=PI
Provedor=PadraoNacional

[2202711]
Nome=Cocal de Telha
UF=PI
Provedor=PadraoNacional

[2202729]
Nome=Cocal Dos Alves
UF=PI
Provedor=PadraoNacional

[2202737]
Nome=Coivaras
UF=PI
Provedor=PadraoNacional

[2202752]
Nome=Colonia do Gurgueia
UF=PI
Provedor=PadraoNacional

[2202778]
Nome=Colonia do Piaui
UF=PI
Provedor=PadraoNacional

[2202802]
Nome=Conceicao do Caninde
UF=PI
Provedor=PadraoNacional

[2202851]
Nome=Coronel Jose Dias
UF=PI
Provedor=PadraoNacional

[2202901]
Nome=Corrente
UF=PI
Provedor=PadraoNacional

[2203008]
Nome=Cristalandia do Piaui
UF=PI
Provedor=PadraoNacional

[2203107]
Nome=Cristino Castro
UF=PI
Provedor=PadraoNacional

[2203206]
Nome=Curimata
UF=PI
Provedor=PadraoNacional

[2203230]
Nome=Currais
UF=PI
Provedor=PadraoNacional

[2203255]
Nome=Curralinhos
UF=PI
Provedor=PadraoNacional

[2203271]
Nome=Curral Novo do Piaui
UF=PI
Provedor=PadraoNacional

[2203305]
Nome=Demerval Lobao
UF=PI
Provedor=PadraoNacional

[2203354]
Nome=Dirceu Arcoverde
UF=PI
Provedor=PadraoNacional

[2203404]
Nome=Dom Expedito Lopes
UF=PI
Provedor=PadraoNacional

[2203420]
Nome=Domingos Mourao
UF=PI
Provedor=PadraoNacional

[2203453]
Nome=Dom Inocencio
UF=PI
Provedor=PadraoNacional

[2203503]
Nome=Elesbao Veloso
UF=PI
Provedor=PadraoNacional

[2203602]
Nome=Eliseu Martins
UF=PI
Provedor=PadraoNacional

[2203701]
Nome=Esperantina
UF=PI
Provedor=PadraoNacional

[2203750]
Nome=Fartura do Piaui
UF=PI
Provedor=PadraoNacional

[2203800]
Nome=Flores do Piaui
UF=PI
Provedor=PadraoNacional

[2203859]
Nome=Floresta do Piaui
UF=PI
Provedor=PadraoNacional

[2203909]
Nome=Floriano
UF=PI
Provedor=PadraoNacional

[2204006]
Nome=Francinopolis
UF=PI
Provedor=PadraoNacional

[2204105]
Nome=Francisco Ayres
UF=PI
Provedor=PadraoNacional

[2204154]
Nome=Francisco Macedo
UF=PI
Provedor=PadraoNacional

[2204204]
Nome=Francisco Santos
UF=PI
Provedor=PadraoNacional

[2204303]
Nome=Fronteiras
UF=PI
Provedor=PadraoNacional

[2204352]
Nome=Geminiano
UF=PI
Provedor=PadraoNacional

[2204402]
Nome=Gilbues
UF=PI
Provedor=PadraoNacional

[2204501]
Nome=Guadalupe
UF=PI
Provedor=PadraoNacional

[2204550]
Nome=Guaribas
UF=PI
Provedor=PadraoNacional

[2204600]
Nome=Hugo Napoleao
UF=PI
Provedor=PadraoNacional

[2204659]
Nome=Ilha Grande
UF=PI
Provedor=PadraoNacional

[2204709]
Nome=Inhuma
UF=PI
Provedor=PadraoNacional

[2204808]
Nome=Ipiranga do Piaui
UF=PI
Provedor=PadraoNacional

[2204907]
Nome=Isaias Coelho
UF=PI
Provedor=PadraoNacional

[2205003]
Nome=Itainopolis
UF=PI
Provedor=PadraoNacional

[2205102]
Nome=Itaueira
UF=PI
Provedor=PadraoNacional

[2205151]
Nome=Jacobina do Piaui
UF=PI
Provedor=PadraoNacional

[2205201]
Nome=Jaicos
UF=PI
Provedor=PadraoNacional

[2205250]
Nome=Jardim do Mulato
UF=PI
Provedor=PadraoNacional

[2205276]
Nome=Jatoba do Piaui
UF=PI
Provedor=PadraoNacional

[2205300]
Nome=Jerumenha
UF=PI
Provedor=PadraoNacional

[2205359]
Nome=Joao Costa
UF=PI
Provedor=PadraoNacional

[2205409]
Nome=Joaquim Pires
UF=PI
Provedor=PadraoNacional

[2205458]
Nome=Joca Marques
UF=PI
Provedor=PadraoNacional

[2205508]
Nome=Jose de Freitas
UF=PI
Provedor=PadraoNacional

[2205516]
Nome=Juazeiro do Piaui
UF=PI
Provedor=PadraoNacional

[2205524]
Nome=Julio Borges
UF=PI
Provedor=PadraoNacional

[2205532]
Nome=Jurema
UF=PI
Provedor=PadraoNacional

[2205540]
Nome=Lagoinha do Piaui
UF=PI
Provedor=PadraoNacional

[2205557]
Nome=Lagoa Alegre
UF=PI
Provedor=PadraoNacional

[2205565]
Nome=Lagoa do Barro do Piaui
UF=PI
Provedor=PadraoNacional

[2205573]
Nome=Lagoa de Sao Francisco
UF=PI
Provedor=PadraoNacional

[2205581]
Nome=Lagoa do Piaui
UF=PI
Provedor=PadraoNacional

[2205599]
Nome=Lagoa do Sitio
UF=PI
Provedor=PadraoNacional

[2205607]
Nome=Landri Sales
UF=PI
Provedor=PadraoNacional

[2205706]
; Inclu�do em 06/10/2021
Nome=Lu�s Correia
UF=PI
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://45.184.27.5:3075/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://45.184.27.5:3075/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[2205805]
Nome=Luzilandia
UF=PI
Provedor=PadraoNacional

[2205854]
Nome=Madeiro
UF=PI
Provedor=PadraoNacional

[2205904]
Nome=Manoel Emidio
UF=PI
Provedor=PadraoNacional

[2205953]
Nome=Marcolandia
UF=PI
Provedor=PadraoNacional

[2206001]
Nome=Marcos Parente
UF=PI
Provedor=PadraoNacional

[2206050]
Nome=Massape do Piaui
UF=PI
Provedor=PadraoNacional

[2206100]
Nome=Matias Olimpio
UF=PI
Provedor=PadraoNacional

[2206209]
Nome=Miguel Alves
UF=PI
Provedor=PadraoNacional

[2206308]
Nome=Miguel Leao
UF=PI
Provedor=PadraoNacional

[2206357]
Nome=Milton Brandao
UF=PI
Provedor=PadraoNacional

[2206407]
Nome=Monsenhor Gil
UF=PI
Provedor=PadraoNacional

[2206506]
Nome=Monsenhor Hipolito
UF=PI
Provedor=PadraoNacional

[2206605]
Nome=Monte Alegre do Piaui
UF=PI
Provedor=PadraoNacional

[2206654]
Nome=Morro Cabeca No Tempo
UF=PI
Provedor=PadraoNacional

[2206670]
Nome=Morro do Chapeu do Piaui
UF=PI
Provedor=PadraoNacional

[2206696]
Nome=Murici Dos Portelas
UF=PI
Provedor=PadraoNacional

[2206704]
Nome=Nazare do Piaui
UF=PI
Provedor=PadraoNacional

[2206720]
Nome=Nazaria
UF=PI
Provedor=PadraoNacional

[2206753]
Nome=Nossa Senhora de Nazare
UF=PI
Provedor=PadraoNacional

[2206803]
Nome=Nossa Senhora Dos Remedios
UF=PI
Provedor=PadraoNacional

[2206902]
Nome=Novo Oriente do Piaui
UF=PI
Provedor=PadraoNacional

[2206951]
Nome=Novo Santo Antonio
UF=PI
Provedor=PadraoNacional

[2207009]
Nome=Oeiras
UF=PI
Provedor=ISSIntel
ProNameSpace=http://oeiras-pi.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://oeiras-pi.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://oeiras-pi.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://oeiras-pi.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://oeiras-pi.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://oeiras-pi.treino-issintel.com.br/webservices/abrasf/api/

[2207108]
Nome=Olho D Agua do Piaui
UF=PI
Provedor=PadraoNacional

[2207207]
Nome=Padre Marcos
UF=PI
Provedor=PadraoNacional

[2207306]
Nome=Paes Landim
UF=PI
Provedor=PadraoNacional

[2207355]
Nome=Pajeu do Piaui
UF=PI
Provedor=PadraoNacional

[2207405]
Nome=Palmeira do Piaui
UF=PI
Provedor=PadraoNacional

[2207504]
Nome=Palmeirais
UF=PI
Provedor=PadraoNacional

[2207553]
Nome=Paqueta
UF=PI
Provedor=PadraoNacional

[2207603]
Nome=Parnagua
UF=PI
Provedor=PadraoNacional

[2207702]
; Inclu�do em 06/10/2021
Nome=Parna�ba
UF=PI
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://notafiscal.parnaiba.pi.gov.br:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://notafiscal.parnaiba.pi.gov.br:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[2207751]
Nome=Passagem Franca do Piaui
UF=PI
Provedor=PadraoNacional

[2207777]
Nome=Patos do Piaui
UF=PI
Provedor=PadraoNacional

[2207793]
Nome=Pau D Arco do Piaui
UF=PI
Provedor=PadraoNacional

[2207801]
Nome=Paulistana
UF=PI
Provedor=PadraoNacional

[2207850]
Nome=Pavussu
UF=PI
Provedor=PadraoNacional

[2207900]
Nome=Pedro Ii
UF=PI
Provedor=PadraoNacional

[2207934]
Nome=Pedro Laurentino
UF=PI
Provedor=PadraoNacional

[2207959]
Nome=Nova Santa Rita
UF=PI
Provedor=PadraoNacional

[2208007]
Nome=Picos
UF=PI
Provedor=ISSIntel
ProNameSpace=http://picos-pi.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://picos.pi.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://picos-pi.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://picos.pi.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://picos-pi.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://picos.pi.treino-issintel.com.br/webservices/abrasf/api/

[2208106]
Nome=Pimenteiras
UF=PI
Provedor=PadraoNacional

[2208205]
Nome=Pio Ix
UF=PI
Provedor=PadraoNacional

[2208304]
Nome=Piracuruca
UF=PI
Provedor=PadraoNacional

[2208403]
Nome=Piripiri
UF=PI
Provedor=PadraoNacional

[2208502]
Nome=Porto
UF=PI
Provedor=PadraoNacional

[2208551]
Nome=Porto Alegre do Piaui
UF=PI
Provedor=PadraoNacional

[2208601]
Nome=Prata do Piaui
UF=PI
Provedor=PadraoNacional

[2208650]
Nome=Queimada Nova
UF=PI
Provedor=PadraoNacional

[2208700]
Nome=Redencao do Gurgueia
UF=PI
Provedor=PadraoNacional

[2208809]
Nome=Regeneracao
UF=PI
Provedor=PadraoNacional

[2208858]
Nome=Riacho Frio
UF=PI
Provedor=PadraoNacional

[2208874]
Nome=Ribeira do Piaui
UF=PI
Provedor=PadraoNacional

[2208908]
Nome=Ribeiro Goncalves
UF=PI
Provedor=PadraoNacional

[2209005]
Nome=Rio Grande do Piaui
UF=PI
Provedor=PadraoNacional

[2209104]
Nome=Santa Cruz do Piaui
UF=PI
Provedor=PadraoNacional

[2209153]
Nome=Santa Cruz Dos Milagres
UF=PI
Provedor=PadraoNacional

[2209203]
Nome=Santa Filomena
UF=PI
Provedor=PadraoNacional

[2209302]
Nome=Santa Luz
UF=PI
Provedor=PadraoNacional

[2209351]
Nome=Santana do Piaui
UF=PI
Provedor=PadraoNacional

[2209377]
Nome=Santa Rosa do Piaui
UF=PI
Provedor=PadraoNacional

[2209401]
Nome=Santo Antonio de Lisboa
UF=PI
Provedor=PadraoNacional

[2209450]
Nome=Santo Antonio Dos Milagres
UF=PI
Provedor=PadraoNacional

[2209500]
Nome=Santo Inacio do Piaui
UF=PI
Provedor=PadraoNacional

[2209559]
Nome=Sao Braz do Piaui
UF=PI
Provedor=PadraoNacional

[2209609]
Nome=Sao Felix do Piaui
UF=PI
Provedor=PadraoNacional

[2209658]
Nome=Sao Francisco de Assis do Piaui
UF=PI
Provedor=PadraoNacional

[2209708]
Nome=Sao Francisco do Piaui
UF=PI
Provedor=PadraoNacional

[2209757]
Nome=Sao Goncalo do Gurgueia
UF=PI
Provedor=PadraoNacional

[2209807]
Nome=Sao Goncalo do Piaui
UF=PI
Provedor=PadraoNacional

[2209856]
Nome=Sao Joao da Canabrava
UF=PI
Provedor=PadraoNacional

[2209872]
Nome=Sao Joao da Fronteira
UF=PI
Provedor=PadraoNacional

[2209906]
Nome=Sao Joao da Serra
UF=PI
Provedor=PadraoNacional

[2209955]
Nome=Sao Joao da Varjota
UF=PI
Provedor=PadraoNacional

[2209971]
Nome=Sao Joao do Arraial
UF=PI
Provedor=PadraoNacional

[2210003]
Nome=Sao Joao do Piaui
UF=PI
Provedor=PadraoNacional

[2210052]
Nome=Sao Jose do Divino
UF=PI
Provedor=PadraoNacional

[2210102]
Nome=Sao Jose do Peixe
UF=PI
Provedor=PadraoNacional

[2210201]
Nome=Sao Jose do Piaui
UF=PI
Provedor=PadraoNacional

[2210300]
Nome=Sao Juliao
UF=PI
Provedor=PadraoNacional

[2210359]
Nome=Sao Lourenco do Piaui
UF=PI
Provedor=PadraoNacional

[2210375]
Nome=Sao Luis do Piaui
UF=PI
Provedor=PadraoNacional

[2210383]
Nome=Sao Miguel da Baixa Grande
UF=PI
Provedor=PadraoNacional

[2210391]
Nome=Sao Miguel do Fidalgo
UF=PI
Provedor=PadraoNacional

[2210409]
Nome=Sao Miguel do Tapuio
UF=PI
Provedor=PadraoNacional

[2210508]
Nome=Sao Pedro do Piaui
UF=PI
Provedor=PadraoNacional

[2210607]
Nome=Sao Raimundo Nonato
UF=PI
Provedor=PadraoNacional

[2210623]
Nome=Sebastiao Barros
UF=PI
Provedor=PadraoNacional

[2210631]
Nome=Sebastiao Leal
UF=PI
Provedor=PadraoNacional

[2210656]
Nome=Sigefredo Pacheco
UF=PI
Provedor=PadraoNacional

[2210706]
Nome=Simoes
UF=PI
Provedor=PadraoNacional

[2210805]
Nome=Simplicio Mendes
UF=PI
Provedor=PadraoNacional

[2210904]
Nome=Socorro do Piaui
UF=PI
Provedor=PadraoNacional

[2210938]
Nome=Sussuapara
UF=PI
Provedor=PadraoNacional

[2210953]
Nome=Tamboril do Piaui
UF=PI
Provedor=PadraoNacional

[2210979]
Nome=Tanque do Piaui
UF=PI
Provedor=PadraoNacional

[2211001]
Nome=Teresina
UF=PI
Provedor=ISSDSF
;
ProRecepcionar=https://www.issdigitalthe.com.br/WsNFe2/LoteRps.jws
;
ProNameSpace=http://proces.wsnfe2.dsfnet.com.br
HomNameSpace=http://proces.wsnfe2.dsfnet.com.br

[2211100]
Nome=Uniao
UF=PI
Provedor=PadraoNacional

[2211209]
Nome=Urucui
UF=PI
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://177.129.224.58:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://177.129.224.58:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[2211308]
Nome=Valenca do Piaui
UF=PI
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/valencadopiauipi_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/valencadopiauipi_wsnfse_homolog/NfseServices.svc

[2211357]
Nome=Varzea Branca
UF=PI
Provedor=PadraoNacional

[2211407]
Nome=Varzea Grande
UF=PI
Provedor=PadraoNacional

[2211506]
Nome=Vera Mendes
UF=PI
Provedor=PadraoNacional

[2211605]
Nome=Vila Nova do Piaui
UF=PI
Provedor=PadraoNacional

[2211704]
Nome=Wall Ferraz
UF=PI
Provedor=PadraoNacional

[2300101]
Nome=Abaiara
UF=CE
Provedor=PadraoNacional

[2300150]
Nome=Acarape
UF=CE
Provedor=PadraoNacional

[2300200]
Nome=Acarau
UF=CE
Provedor=PadraoNacional

[2300309]
Nome=Acopiara
UF=CE
Provedor=PadraoNacional

[2300408]
Nome=Aiuaba
UF=CE
Provedor=PadraoNacional

[2300507]
Nome=Alcantaras
UF=CE
Provedor=PadraoNacional

[2300606]
Nome=Altaneira
UF=CE
Provedor=PadraoNacional

[2300705]
Nome=Alto Santo
UF=CE
Provedor=PadraoNacional

[2300754]
Nome=Amontada
UF=CE
Provedor=PadraoNacional

[2300804]
Nome=Antonina do Norte
UF=CE
Provedor=PadraoNacional

[2300903]
Nome=Apuiares
UF=CE
Provedor=PadraoNacional

[2301000]
Nome=Aquiraz
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wsaqz/Nfes

[2301109]
Nome=Aracati
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wsarq/Nfes

[2301208]
Nome=Aracoiaba
UF=CE
Provedor=PadraoNacional

[2301257]
Nome=Ararenda
UF=CE
Provedor=PadraoNacional

[2301307]
Nome=Araripe
UF=CE
Provedor=PadraoNacional

[2301406]
Nome=Aratuba
UF=CE
Provedor=PadraoNacional

[2301505]
Nome=Arneiroz
UF=CE
Provedor=PadraoNacional

[2301604]
Nome=Assare
UF=CE
Provedor=PadraoNacional

[2301703]
Nome=Aurora
UF=CE
Provedor=PadraoNacional

[2301802]
Nome=Baixio
UF=CE
Provedor=PadraoNacional

[2301851]
Nome=Banabuiu
UF=CE
Provedor=PadraoNacional

[2301901]
Nome=Barbalha
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wsbar/Nfes

[2301950]
Nome=Barreira
UF=CE
Provedor=PadraoNacional

[2302008]
Nome=Barro
UF=CE
Provedor=PadraoNacional

[2302057]
Nome=Barroquinha
UF=CE
Provedor=PadraoNacional

[2302107]
Nome=Baturite
UF=CE
Provedor=PadraoNacional

[2302206]
Nome=Beberibe
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wsbeb/Nfes

[2302305]
Nome=Bela Cruz
UF=CE
Provedor=PadraoNacional

[2302404]
Nome=Boa Viagem
UF=CE
Provedor=PadraoNacional

[2302503]
Nome=Brejo Santo
UF=CE
Provedor=PadraoNacional

[2302602]
Nome=Camocim
UF=CE
Provedor=PadraoNacional

[2302701]
Nome=Campos Sales
UF=CE
Provedor=PadraoNacional

[2302800]
Nome=Caninde
UF=CE
Provedor=PadraoNacional

[2302909]
Nome=Capistrano
UF=CE
Provedor=PadraoNacional

[2303006]
Nome=Caridade
UF=CE
Provedor=PadraoNacional

[2303105]
Nome=Carire
UF=CE
Provedor=PadraoNacional

[2303204]
Nome=Caririacu
UF=CE
Provedor=PadraoNacional

[2303303]
Nome=Carius
UF=CE
Provedor=PadraoNacional

[2303402]
Nome=Carnaubal
UF=CE
Provedor=PadraoNacional

[2303501]
Nome=Cascavel
UF=CE
Provedor=PadraoNacional

[2303600]
Nome=Catarina
UF=CE
Provedor=PadraoNacional

[2303659]
Nome=Catunda
UF=CE
Provedor=PadraoNacional

[2303709]
Nome=Caucaia
UF=CE
Provedor=PadraoNacional

[2303808]
Nome=Cedro
UF=CE
Provedor=PadraoNacional

[2303907]
Nome=Chaval
UF=CE
Provedor=PadraoNacional

[2303931]
Nome=Choro
UF=CE
Provedor=PadraoNacional

[2303956]
Nome=Chorozinho
UF=CE
Provedor=PadraoNacional

[2304004]
Nome=Coreau
UF=CE
Provedor=PadraoNacional

[2304103]
Nome=Crateus
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wscra/Nfes

[2304202]
Nome=Crato
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wscrt/Nfes

[2304236]
Nome=Croata
UF=CE
Provedor=PadraoNacional

[2304251]
Nome=Cruz
UF=CE
Provedor=PadraoNacional

[2304269]
Nome=Deputado Irapuan Pinheiro
UF=CE
Provedor=PadraoNacional

[2304277]
Nome=Erere
UF=CE
Provedor=PadraoNacional

[2304285]
Nome=Eusebio
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wseus/Nfes

[2304301]
Nome=Farias Brito
UF=CE
Provedor=PadraoNacional

[2304350]
Nome=Forquilha
UF=CE
Provedor=PadraoNacional

[2304400]
Nome=Fortaleza
UF=CE
Provedor=ISSFortaleza
ProRecepcionar=https://iss.fortaleza.ce.gov.br/grpfor-iss/ServiceGinfesImplService
HomRecepcionar=http://isshomo.sefin.fortaleza.ce.gov.br/grpfor-iss/ServiceGinfesImplService
;
ProLinkURL=http://fortaleza.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://fortaleza.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[2304459]
Nome=Fortim
UF=CE
Provedor=PadraoNacional

[2304509]
Nome=Frecheirinha
UF=CE
Provedor=PadraoNacional

[2304608]
Nome=General Sampaio
UF=CE
Provedor=PadraoNacional

[2304657]
Nome=Graca
UF=CE
Provedor=PadraoNacional

[2304707]
Nome=Granja
UF=CE
Provedor=PadraoNacional

[2304806]
Nome=Granjeiro
UF=CE
Provedor=PadraoNacional

[2304905]
Nome=Groairas
UF=CE
Provedor=PadraoNacional

[2304954]
Nome=Guaiuba
UF=CE
Provedor=PadraoNacional

[2305001]
Nome=Guaraciaba do Norte
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wsgua/Nfes

[2305100]
Nome=Guaramiranga
UF=CE
Provedor=PadraoNacional

[2305209]
Nome=Hidrolandia
UF=CE
Provedor=PadraoNacional

[2305233]
Nome=Horizonte
UF=CE
Provedor=PadraoNacional

[2305266]
Nome=Ibaretama
UF=CE
Provedor=PadraoNacional

[2305308]
Nome=Ibiapina
UF=CE
Provedor=PadraoNacional

[2305332]
Nome=Ibicuitinga
UF=CE
Provedor=PadraoNacional

[2305357]
Nome=Icapui
UF=CE
Provedor=PadraoNacional

[2305407]
Nome=Ico
UF=CE
Provedor=PadraoNacional

[2305506]
Nome=Iguatu
UF=CE
Provedor=PadraoNacional

[2305605]
Nome=Independencia
UF=CE
Provedor=PadraoNacional

[2305654]
Nome=Ipaporanga
UF=CE
Provedor=PadraoNacional

[2305704]
Nome=Ipaumirim
UF=CE
Provedor=PadraoNacional

[2305803]
Nome=Ipu
UF=CE
Provedor=PadraoNacional

[2305902]
Nome=Ipueiras
UF=CE
Provedor=PadraoNacional

[2306009]
Nome=Iracema
UF=CE
Provedor=PadraoNacional

[2306108]
Nome=Iraucuba
UF=CE
Provedor=PadraoNacional

[2306207]
Nome=Itaicaba
UF=CE
Provedor=PadraoNacional

[2306256]
; Atualizado em 28/12/2022
Nome=Itaitinga
UF=CE
Provedor=SSInformatica
Versao=2.03
ProRecepcionar=https://ws-itaitinga.ssinformatica.net/ws/nfse.wsdl
HomRecepcionar=https://sattre.ssinformatica.net/ws/nfse.wsdl

[2306306]
Nome=Itapage
UF=CE
Provedor=PadraoNacional

[2306405]
Nome=Itapipoca
UF=CE
Provedor=PadraoNacional

[2306504]
Nome=Itapiuna
UF=CE
Provedor=PadraoNacional

[2306553]
Nome=Itarema
UF=CE
Provedor=PadraoNacional

[2306603]
Nome=Itatira
UF=CE
Provedor=PadraoNacional

[2306702]
Nome=Jaguaretama
UF=CE
Provedor=PadraoNacional

[2306801]
Nome=Jaguaribara
UF=CE
Provedor=PadraoNacional

[2306900]
Nome=Jaguaribe
UF=CE
Provedor=PadraoNacional

[2307007]
Nome=Jaguaruana
UF=CE
Provedor=PadraoNacional

[2307106]
Nome=Jardim
UF=CE
Provedor=PadraoNacional

[2307205]
Nome=Jati
UF=CE
Provedor=PadraoNacional

[2307254]
Nome=Jijoca de Jericoacoara
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wsjij/Nfes

[2307304]
; Atualizado em 25/11/2022
Nome=Juazeiro do Norte
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wsjun/Nfes

[2307403]
Nome=Jucas
UF=CE
Provedor=PadraoNacional

[2307502]
Nome=Lavras da Mangabeira
UF=CE
Provedor=PadraoNacional

[2307601]
Nome=Limoeiro do Norte
UF=CE
Provedor=PadraoNacional

[2307635]
Nome=Madalena
UF=CE
Provedor=PadraoNacional

[2307650]
Nome=Maracanau
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wsmar/Nfes

[2307700]
Nome=Maranguape
UF=CE
Provedor=PadraoNacional

[2307809]
Nome=Marco
UF=CE
Provedor=PadraoNacional

[2307908]
Nome=Martinopole
UF=CE
Provedor=PadraoNacional

[2308005]
Nome=Massape
UF=CE
Provedor=PadraoNacional

[2308104]
Nome=Mauriti
UF=CE
Provedor=PadraoNacional

[2308203]
Nome=Meruoca
UF=CE
Provedor=PadraoNacional

[2308302]
Nome=Milagres
UF=CE
Provedor=PadraoNacional

[2308351]
Nome=Milha
UF=CE
Provedor=PadraoNacional

[2308377]
Nome=Miraima
UF=CE
Provedor=PadraoNacional

[2308401]
Nome=Missao Velha
UF=CE
Provedor=PadraoNacional

[2308500]
Nome=Mombaca
UF=CE
Provedor=PadraoNacional

[2308609]
Nome=Monsenhor Tabosa
UF=CE
Provedor=PadraoNacional

[2308708]
Nome=Morada Nova
UF=CE
Provedor=PadraoNacional

[2308807]
Nome=Moraujo
UF=CE
Provedor=PadraoNacional

[2308906]
Nome=Morrinhos
UF=CE
Provedor=PadraoNacional

[2309003]
Nome=Mucambo
UF=CE
Provedor=PadraoNacional

[2309102]
Nome=Mulungu
UF=CE
Provedor=PadraoNacional

[2309201]
Nome=Nova Olinda
UF=CE
Provedor=PadraoNacional

[2309300]
Nome=Nova Russas
UF=CE
Provedor=PadraoNacional

[2309409]
Nome=Novo Oriente
UF=CE
Provedor=PadraoNacional

[2309458]
Nome=Ocara
UF=CE
Provedor=PadraoNacional

[2309508]
Nome=Oros
UF=CE
Provedor=PadraoNacional

[2309607]
Nome=Pacajus
UF=CE
Provedor=PadraoNacional

[2309706]
Nome=Pacatuba
UF=CE
Provedor=PadraoNacional

[2309805]
Nome=Pacoti
UF=CE
Provedor=PadraoNacional

[2309904]
Nome=Pacuja
UF=CE
Provedor=PadraoNacional

[2310001]
Nome=Palhano
UF=CE
Provedor=PadraoNacional

[2310100]
Nome=Palmacia
UF=CE
Provedor=PadraoNacional

[2310209]
Nome=Paracuru
UF=CE
Provedor=PadraoNacional

[2310258]
Nome=Paraipaba
UF=CE
Provedor=PadraoNacional

[2310308]
Nome=Parambu
UF=CE
Provedor=PadraoNacional

[2310407]
Nome=Paramoti
UF=CE
Provedor=PadraoNacional

[2310506]
Nome=Pedra Branca
UF=CE
Provedor=PadraoNacional

[2310605]
Nome=Penaforte
UF=CE
Provedor=PadraoNacional

[2310704]
Nome=Pentecoste
UF=CE
Provedor=PadraoNacional

[2310803]
Nome=Pereiro
UF=CE
Provedor=PadraoNacional

[2310852]
Nome=Pindoretama
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wspin/Nfes

[2310902]
Nome=Piquet Carneiro
UF=CE
Provedor=PadraoNacional

[2310951]
Nome=Pires Ferreira
UF=CE
Provedor=PadraoNacional

[2311009]
Nome=Poranga
UF=CE
Provedor=PadraoNacional

[2311108]
Nome=Porteiras
UF=CE
Provedor=PadraoNacional

[2311207]
Nome=Potengi
UF=CE
Provedor=PadraoNacional

[2311231]
Nome=Potiretama
UF=CE
Provedor=PadraoNacional

[2311264]
Nome=Quiterianopolis
UF=CE
Provedor=PadraoNacional

[2311306]
Nome=Quixada
UF=CE
Provedor=PadraoNacional

[2311355]
Nome=Quixelo
UF=CE
Provedor=PadraoNacional

[2311405]
Nome=Quixeramobim
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wsqxb/Nfes

[2311504]
Nome=Quixere
UF=CE
Provedor=PadraoNacional

[2311603]
Nome=Redencao
UF=CE
Provedor=PadraoNacional

[2311702]
Nome=Reriutaba
UF=CE
Provedor=PadraoNacional

[2311801]
Nome=Russas
UF=CE
Provedor=PadraoNacional

[2311900]
Nome=Saboeiro
UF=CE
Provedor=PadraoNacional

[2311959]
Nome=Salitre
UF=CE
Provedor=PadraoNacional

[2312007]
Nome=Santana do Acarau
UF=CE
Provedor=PadraoNacional

[2312106]
Nome=Santana do Cariri
UF=CE
Provedor=PadraoNacional

[2312205]
Nome=Santa Quiteria
UF=CE
Provedor=PadraoNacional

[2312304]
Nome=Sao Benedito
UF=CE
Provedor=PadraoNacional

[2312403]
Nome=Sao Goncalo do Amarante
UF=CE
Provedor=PadraoNacional

[2312502]
Nome=Sao Joao do Jaguaribe
UF=CE
Provedor=PadraoNacional

[2312601]
Nome=Sao Luis do Curu
UF=CE
Provedor=PadraoNacional

[2312700]
Nome=Senador Pompeu
UF=CE
Provedor=PadraoNacional

[2312809]
Nome=Senador Sa
UF=CE
Provedor=PadraoNacional

[2312908]
Nome=Sobral
UF=CE
Provedor=PadraoNacional

[2313005]
Nome=Solonopole
UF=CE
Provedor=PadraoNacional

[2313104]
Nome=Tabuleiro do Norte
UF=CE
Provedor=PadraoNacional

[2313203]
Nome=Tamboril
UF=CE
Provedor=PadraoNacional

[2313252]
Nome=Tarrafas
UF=CE
Provedor=PadraoNacional

[2313302]
Nome=Taua
UF=CE
Provedor=SpeedGov
ProRecepcionar=http://www.speedgov.com.br/wstau/Nfes

[2313351]
Nome=Tejucuoca
UF=CE
Provedor=PadraoNacional

[2313401]
Nome=Tiangua
UF=CE
Provedor=PadraoNacional

[2313500]
Nome=Trairi
UF=CE
Provedor=PadraoNacional

[2313559]
Nome=Tururu
UF=CE
Provedor=PadraoNacional

[2313609]
Nome=Ubajara
UF=CE
Provedor=PadraoNacional

[2313708]
Nome=Umari
UF=CE
Provedor=PadraoNacional

[2313757]
Nome=Umirim
UF=CE
Provedor=PadraoNacional

[2313807]
Nome=Uruburetama
UF=CE
Provedor=PadraoNacional

[2313906]
Nome=Uruoca
UF=CE
Provedor=PadraoNacional

[2313955]
Nome=Varjota
UF=CE
Provedor=PadraoNacional

[2314003]
Nome=Varzea Alegre
UF=CE
Provedor=PadraoNacional

[2314102]
Nome=Vicosa do Ceara
UF=CE
Provedor=PadraoNacional

[2400109]
Nome=Acari
UF=RN
Provedor=PadraoNacional

[2400208]
Nome=Acu
UF=RN
Provedor=PadraoNacional

[2400307]
Nome=Afonso Bezerra
UF=RN
Provedor=PadraoNacional

[2400406]
Nome=Agua Nova
UF=RN
Provedor=PadraoNacional

[2400505]
Nome=Alexandria
UF=RN
Provedor=PadraoNacional

[2400604]
Nome=Almino Afonso
UF=RN
Provedor=PadraoNacional

[2400703]
Nome=Alto do Rodrigues
UF=RN
Provedor=PadraoNacional

[2400802]
Nome=Angicos
UF=RN
Provedor=PadraoNacional

[2400901]
Nome=Antonio Martins
UF=RN
Provedor=PadraoNacional

[2401008]
Nome=Apodi
UF=RN
Provedor=PadraoNacional

[2401107]
Nome=Areia Branca
UF=RN
Provedor=PadraoNacional

[2401206]
Nome=Ares
UF=RN
Provedor=PadraoNacional

[2401305]
Nome=Augusto Severo
UF=RN
Provedor=PadraoNacional

[2401404]
Nome=Baia Formosa
UF=RN
Provedor=PadraoNacional

[2401453]
Nome=Barauna
UF=RN
Provedor=PadraoNacional

[2401503]
Nome=Barcelona
UF=RN
Provedor=PadraoNacional

[2401602]
Nome=Bento Fernandes
UF=RN
Provedor=PadraoNacional

[2401651]
Nome=Bodo
UF=RN
Provedor=PadraoNacional

[2401701]
Nome=Bom Jesus
UF=RN
Provedor=PadraoNacional

[2401800]
Nome=Brejinho
UF=RN
Provedor=PadraoNacional

[2401859]
Nome=Caicara do Norte
UF=RN
Provedor=PadraoNacional

[2401909]
Nome=Caicara do Rio do Vento
UF=RN
Provedor=PadraoNacional

[2402006]
Nome=Caico
UF=RN
Provedor=PadraoNacional

[2402105]
Nome=Campo Redondo
UF=RN
Provedor=PadraoNacional

[2402204]
Nome=Canguaretama
UF=RN
Provedor=PadraoNacional

[2402303]
Nome=Caraubas
UF=RN
Provedor=PadraoNacional

[2402402]
Nome=Carnauba Dos dantas
UF=RN
Provedor=PadraoNacional

[2402501]
Nome=Carnaubais
UF=RN
Provedor=PadraoNacional

[2402600]
Nome=Ceara-Mirim
UF=RN
Provedor=PadraoNacional

[2402709]
Nome=Cerro Cora
UF=RN
Provedor=PadraoNacional

[2402808]
Nome=Coronel Ezequiel
UF=RN
Provedor=PadraoNacional

[2402907]
Nome=Coronel Joao Pessoa
UF=RN
Provedor=PadraoNacional

[2403004]
Nome=Cruzeta
UF=RN
Provedor=PadraoNacional

[2403103]
Nome=Currais Novos
UF=RN
Provedor=PadraoNacional

[2403202]
Nome=Doutor Severiano
UF=RN
Provedor=PadraoNacional

[2403251]
Nome=Parnamirim
UF=RN
Provedor=Tinus
Versao=1.01
ProRecepcionar=http://www.tinus.com.br/csp/parnamirim/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/parnamirim/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/parnamirim/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/parnamirim/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/parnamirim/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/parnamirim/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/parnamirim/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/parnamirim/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testepar/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testepar/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testepar/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testepar/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testepar/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testepar/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testepar/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testepar/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2403301]
Nome=Encanto
UF=RN
Provedor=PadraoNacional

[2403400]
Nome=Equador
UF=RN
Provedor=PadraoNacional

[2403509]
Nome=Espirito Santo
UF=RN
Provedor=PadraoNacional

[2403608]
Nome=Extremoz
UF=RN
Provedor=PadraoNacional

[2403707]
Nome=Felipe Guerra
UF=RN
Provedor=PadraoNacional

[2403756]
Nome=Fernando Pedroza
UF=RN
Provedor=PadraoNacional

[2403806]
Nome=Florania
UF=RN
Provedor=PadraoNacional

[2403905]
Nome=Francisco Dantas
UF=RN
Provedor=PadraoNacional

[2404002]
Nome=Frutuoso Gomes
UF=RN
Provedor=PadraoNacional

[2404101]
Nome=Galinhos
UF=RN
Provedor=PadraoNacional

[2404200]
Nome=Goianinha
UF=RN
Provedor=PadraoNacional

[2404309]
Nome=Governador Dix-Sept Rosado
UF=RN
Provedor=PadraoNacional

[2404408]
Nome=Grossos
UF=RN
Provedor=PadraoNacional

[2404507]
Nome=Guamare
UF=RN
Provedor=PadraoNacional

[2404606]
Nome=Ielmo Marinho
UF=RN
Provedor=PadraoNacional

[2404705]
Nome=Ipanguacu
UF=RN
Provedor=PadraoNacional

[2404804]
Nome=Ipueira
UF=RN
Provedor=PadraoNacional

[2404853]
Nome=Itaja
UF=RN
Provedor=PadraoNacional

[2404903]
Nome=Itau
UF=RN
Provedor=PadraoNacional

[2405009]
Nome=Jacana
UF=RN
Provedor=PadraoNacional

[2405108]
Nome=Jandaira
UF=RN
Provedor=PadraoNacional

[2405207]
Nome=Janduis
UF=RN
Provedor=PadraoNacional

[2405306]
Nome=Januario Cicco
UF=RN
Provedor=PadraoNacional

[2405405]
Nome=Japi
UF=RN
Provedor=PadraoNacional

[2405504]
Nome=Jardim de Angicos
UF=RN
Provedor=PadraoNacional

[2405603]
Nome=Jardim de Piranhas
UF=RN
Provedor=PadraoNacional

[2405702]
Nome=Jardim do Serido
UF=RN
Provedor=PadraoNacional

[2405801]
Nome=Joao Camara
UF=RN
Provedor=PadraoNacional

[2405900]
Nome=Joao Dias
UF=RN
Provedor=PadraoNacional

[2406007]
Nome=Jose da Penha
UF=RN
Provedor=PadraoNacional

[2406106]
Nome=Jucurutu
UF=RN
Provedor=PadraoNacional

[2406155]
Nome=Jundia
UF=RN
Provedor=PadraoNacional

[2406205]
Nome=Lagoa D Anta
UF=RN
Provedor=PadraoNacional

[2406304]
Nome=Lagoa de Pedras
UF=RN
Provedor=PadraoNacional

[2406403]
Nome=Lagoa de Velhos
UF=RN
Provedor=PadraoNacional

[2406502]
Nome=Lagoa Nova
UF=RN
Provedor=PadraoNacional

[2406601]
Nome=Lagoa Salgada
UF=RN
Provedor=PadraoNacional

[2406700]
Nome=Lajes
UF=RN
Provedor=PadraoNacional

[2406809]
Nome=Lajes Pintadas
UF=RN
Provedor=PadraoNacional

[2406908]
Nome=Lucrecia
UF=RN
Provedor=PadraoNacional

[2407005]
Nome=Luis Gomes
UF=RN
Provedor=PadraoNacional

[2407104]
Nome=Macaiba
UF=RN
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/macaiba/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/macaiba/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/macaiba/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/macaiba/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/macaiba/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/macaiba/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/macaiba/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/macaiba/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testemac/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testemac/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testemac/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testemac/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testemac/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testemac/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testemac/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testemac/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2407203]
Nome=Macau
UF=RN
Provedor=PadraoNacional

[2407252]
Nome=Major Sales
UF=RN
Provedor=PadraoNacional

[2407302]
Nome=Marcelino Vieira
UF=RN
Provedor=PadraoNacional

[2407401]
Nome=Martins
UF=RN
Provedor=PadraoNacional

[2407500]
Nome=Maxaranguape
UF=RN
Provedor=PadraoNacional

[2407609]
Nome=Messias Targino
UF=RN
Provedor=PadraoNacional

[2407708]
Nome=Montanhas
UF=RN
Provedor=PadraoNacional

[2407807]
Nome=Monte Alegre
UF=RN
Provedor=PadraoNacional

[2407906]
Nome=Monte das Gameleiras
UF=RN
Provedor=PadraoNacional

[2408003]
Nome=Mossoro
UF=RN
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/mossoro/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/mossoro/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/mossoro/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/mossoro/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/mossoro/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/mossoro/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/mossoro/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/mossoro/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testemos/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testemos/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testemos/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testemos/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testemos/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testemos/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testemos/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testemos/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2408102]
Nome=Natal
UF=RN
Provedor=ISSNatal
ProRecepcionar=https://wsnfsev1.natal.rn.gov.br:8444/axis2/services/NfseWSServiceV1/
HomRecepcionar=https://wsnfsev1homologacao.natal.rn.gov.br:8443/axis2/services/NfseWSServiceV1/
;
ProLinkURL=https://directa.natal.rn.gov.br/form.jsp?sys=DIR&action=openform&formID=464567977&align=0&mode=-1&goto=-1&filter=&scrolling=no&insc=%InscMunic%&nfse=%NumeroNFSe%&codV=%CodVerif%
HomLinkURL=https://directa.natal.rn.gov.br/form.jsp?sys=DIR&action=openform&formID=464567977&align=0&mode=-1&goto=-1&filter=&scrolling=no&insc=%InscMunic%&nfse=%NumeroNFSe%&codV=%CodVerif%

[2408201]
Nome=Nisia Floresta
UF=RN
Provedor=PadraoNacional

[2408300]
Nome=Nova Cruz
UF=RN
Provedor=PadraoNacional

[2408409]
Nome=Olho-D Agua do Borges
UF=RN
Provedor=PadraoNacional

[2408508]
Nome=Ouro Branco
UF=RN
Provedor=PadraoNacional

[2408607]
Nome=Parana
UF=RN
Provedor=PadraoNacional

[2408706]
Nome=Parau
UF=RN
Provedor=PadraoNacional

[2408805]
Nome=Parazinho
UF=RN
Provedor=PadraoNacional

[2408904]
Nome=Parelhas
UF=RN
Provedor=PadraoNacional

[2408953]
Nome=Rio do Fogo
UF=RN
Provedor=PadraoNacional

[2409100]
Nome=Passa E Fica
UF=RN
Provedor=PadraoNacional

[2409209]
Nome=Passagem
UF=RN
Provedor=PadraoNacional

[2409308]
Nome=Patu
UF=RN
Provedor=PadraoNacional

[2409332]
Nome=Santa Maria
UF=RN
Provedor=PadraoNacional

[2409407]
Nome=Pau Dos Ferros
UF=RN
Provedor=PadraoNacional

[2409506]
Nome=Pedra Grande
UF=RN
Provedor=PadraoNacional

[2409605]
Nome=Pedra Preta
UF=RN
Provedor=PadraoNacional

[2409704]
Nome=Pedro Avelino
UF=RN
Provedor=PadraoNacional

[2409803]
Nome=Pedro Velho
UF=RN
Provedor=PadraoNacional

[2409902]
Nome=Pendencias
UF=RN
Provedor=PadraoNacional

[2410009]
Nome=Piloes
UF=RN
Provedor=PadraoNacional

[2410108]
Nome=Poco Branco
UF=RN
Provedor=PadraoNacional

[2410207]
Nome=Portalegre
UF=RN
Provedor=PadraoNacional

[2410256]
Nome=Porto do Mangue
UF=RN
Provedor=PadraoNacional

[2410306]
Nome=Presidente Juscelino
UF=RN
Provedor=PadraoNacional

[2410405]
Nome=Pureza
UF=RN
Provedor=PadraoNacional

[2410504]
Nome=Rafael Fernandes
UF=RN
Provedor=PadraoNacional

[2410603]
Nome=Rafael Godeiro
UF=RN
Provedor=PadraoNacional

[2410702]
Nome=Riacho da Cruz
UF=RN
Provedor=PadraoNacional

[2410801]
Nome=Riacho de Santana
UF=RN
Provedor=PadraoNacional

[2410900]
Nome=Riachuelo
UF=RN
Provedor=PadraoNacional

[2411007]
Nome=Rodolfo Fernandes
UF=RN
Provedor=CIGA

[2411056]
Nome=Tibau
UF=RN
Provedor=PadraoNacional

[2411106]
Nome=Ruy Barbosa
UF=RN
Provedor=PadraoNacional

[2411205]
Nome=Santa Cruz
UF=RN
Provedor=PadraoNacional

[2411403]
Nome=Santana do Matos
UF=RN
Provedor=PadraoNacional

[2411429]
Nome=Santana do Serido
UF=RN
Provedor=PadraoNacional

[2411502]
Nome=Santo Antonio
UF=RN
Provedor=PadraoNacional

[2411601]
Nome=Sao Bento do Norte
UF=RN
Provedor=PadraoNacional

[2411700]
Nome=Sao Bento do Trairi
UF=RN
Provedor=PadraoNacional

[2411809]
Nome=Sao Fernando
UF=RN
Provedor=PadraoNacional

[2411908]
Nome=Sao Francisco do Oeste
UF=RN
Provedor=PadraoNacional

[2412005]
Nome=Sao Goncalo do Amarante
UF=RN
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/saogoncalo/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/saogoncalo/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/saogoncalo/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/saogoncalo/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/saogoncalo/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/saogoncalo/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/saogoncalo/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/saogoncalo/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testegon/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testegon/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testegon/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testegon/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testegon/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testegon/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testegon/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testegon/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2412104]
Nome=Sao Joao do Sabugi
UF=RN
Provedor=PadraoNacional

[2412203]
Nome=Sao Jose de Mipibu
UF=RN
Provedor=PadraoNacional

[2412302]
Nome=Sao Jose do Campestre
UF=RN
Provedor=PadraoNacional

[2412401]
Nome=Sao Jose do Serido
UF=RN
Provedor=PadraoNacional

[2412500]
Nome=Sao Miguel
UF=RN
Provedor=PadraoNacional

[2412559]
Nome=Sao Miguel do Gostoso
UF=RN
Provedor=PadraoNacional

[2412609]
Nome=Sao Paulo do Potengi
UF=RN
Provedor=PadraoNacional

[2412708]
Nome=Sao Pedro
UF=RN
Provedor=PadraoNacional

[2412807]
Nome=Sao Rafael
UF=RN
Provedor=PadraoNacional

[2412906]
Nome=Sao Tome
UF=RN
Provedor=PadraoNacional

[2413003]
Nome=Sao Vicente
UF=RN
Provedor=PadraoNacional

[2413102]
Nome=Senador Eloi de Souza
UF=RN
Provedor=PadraoNacional

[2413201]
Nome=Senador Georgino Avelino
UF=RN
Provedor=PadraoNacional

[2413300]
Nome=Serra de Sao Bento
UF=RN
Provedor=PadraoNacional

[2413359]
Nome=Serra do Mel
UF=RN
Provedor=PadraoNacional

[2413409]
Nome=Serra Negra do Norte
UF=RN
Provedor=PadraoNacional

[2413508]
Nome=Serrinha
UF=RN
Provedor=PadraoNacional

[2413557]
Nome=Serrinha Dos Pintos
UF=RN
Provedor=PadraoNacional

[2413607]
Nome=Severiano Melo
UF=RN
Provedor=PadraoNacional

[2413706]
Nome=Sitio Novo
UF=RN
Provedor=PadraoNacional

[2413805]
Nome=Taboleiro Grande
UF=RN
Provedor=PadraoNacional

[2413904]
Nome=Taipu
UF=RN
Provedor=PadraoNacional

[2414001]
Nome=Tangara
UF=RN
Provedor=PadraoNacional

[2414100]
Nome=Tenente Ananias
UF=RN
Provedor=PadraoNacional

[2414159]
Nome=Tenente Laurentino Cruz
UF=RN
Provedor=PadraoNacional

[2414209]
Nome=Tibau do Sul
UF=RN
Provedor=PadraoNacional

[2414308]
Nome=Timbauba Dos Batistas
UF=RN
Provedor=PadraoNacional

[2414407]
Nome=Touros
UF=RN
Provedor=PadraoNacional

[2414456]
Nome=Triunfo Potiguar
UF=RN
Provedor=PadraoNacional

[2414506]
Nome=Umarizal
UF=RN
Provedor=PadraoNacional

[2414605]
Nome=Upanema
UF=RN
Provedor=PadraoNacional

[2414704]
Nome=Varzea
UF=RN
Provedor=PadraoNacional

[2414753]
Nome=Venha-Ver
UF=RN
Provedor=PadraoNacional

[2414803]
Nome=Vera Cruz
UF=RN
Provedor=PadraoNacional

[2414902]
Nome=Vicosa
UF=RN
Provedor=PadraoNacional

[2415008]
Nome=Vila Flor
UF=RN
Provedor=PadraoNacional

[2500106]
Nome=Agua Branca
UF=PB
Provedor=PadraoNacional

[2500205]
Nome=Aguiar
UF=PB
Provedor=PadraoNacional

[2500304]
Nome=Alagoa Grande
UF=PB
Provedor=PadraoNacional

[2500403]
Nome=Alagoa Nova
UF=PB
Provedor=PadraoNacional

[2500502]
Nome=Alagoinha
UF=PB
Provedor=PadraoNacional

[2500536]
Nome=Alcantil
UF=PB
Provedor=PadraoNacional

[2500577]
Nome=Algodao de Jandaira
UF=PB
Provedor=PadraoNacional

[2500601]
Nome=Alhandra
UF=PB
Provedor=PadraoNacional

[2500700]
Nome=Sao Joao do Rio do Peixe
UF=PB
Provedor=PadraoNacional

[2500734]
Nome=Amparo
UF=PB
Provedor=PadraoNacional

[2500775]
Nome=Aparecida
UF=PB
Provedor=PadraoNacional

[2500809]
Nome=Aracagi
UF=PB
Provedor=PadraoNacional

[2500908]
Nome=Arara
UF=PB
Provedor=PadraoNacional

[2501005]
Nome=Araruna
UF=PB
Provedor=PadraoNacional

[2501104]
Nome=Areia
UF=PB
Provedor=PadraoNacional

[2501153]
Nome=Areia de Baraunas
UF=PB
Provedor=PadraoNacional

[2501203]
Nome=Areial
UF=PB
Provedor=PadraoNacional

[2501302]
Nome=Aroeiras
UF=PB
Provedor=PadraoNacional

[2501351]
Nome=Assuncao
UF=PB
Provedor=PadraoNacional

[2501401]
Nome=Baia da Traicao
UF=PB
Provedor=PadraoNacional

[2501500]
Nome=Bananeiras
UF=PB
Provedor=PadraoNacional

[2501534]
Nome=Barauna
UF=PB
Provedor=PadraoNacional

[2501575]
Nome=Barra de Santana
UF=PB
Provedor=PadraoNacional

[2501609]
Nome=Barra de Santa Rosa
UF=PB
Provedor=PadraoNacional

[2501708]
Nome=Barra de Sao Miguel
UF=PB
Provedor=PadraoNacional

[2501807]
Nome=Bayeux
UF=PB
Provedor=PadraoNacional

[2501906]
Nome=Belem
UF=PB
Provedor=PadraoNacional

[2502003]
Nome=Belem do Brejo do Cruz
UF=PB
Provedor=PadraoNacional

[2502052]
Nome=Bernardino Batista
UF=PB
Provedor=PadraoNacional

[2502102]
Nome=Boa Ventura
UF=PB
Provedor=PadraoNacional

[2502151]
Nome=Boa Vista
UF=PB
Provedor=PadraoNacional

[2502201]
Nome=Bom Jesus
UF=PB
Provedor=PadraoNacional

[2502300]
Nome=Bom Sucesso
UF=PB
Provedor=PadraoNacional

[2502409]
Nome=Bonito de Santa Fe
UF=PB
Provedor=PadraoNacional

[2502508]
Nome=Boqueirao
UF=PB
Provedor=PadraoNacional

[2502607]
Nome=Igaracy
UF=PB
Provedor=PadraoNacional

[2502706]
Nome=Borborema
UF=PB
Provedor=PadraoNacional

[2502805]
Nome=Brejo do Cruz
UF=PB
Provedor=PadraoNacional

[2502904]
Nome=Brejo Dos Santos
UF=PB
Provedor=PadraoNacional

[2503001]
Nome=Caapora
UF=PB
Provedor=PadraoNacional

[2503100]
Nome=Cabaceiras
UF=PB
Provedor=PadraoNacional

[2503209]
Nome=Cabedelo
UF=PB
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/cabedelo/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/cabedelo/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/cabedelo/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/cabedelo/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/cabedelo/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/cabedelo/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/cabedelo/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/cabedelo/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testecbd/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testecbd/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testecbd/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testecbd/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testecbd/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testecbd/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testecbd/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testecbd/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2503308]
Nome=Cachoeira Dos Indios
UF=PB
Provedor=PadraoNacional

[2503407]
Nome=Cacimba de Areia
UF=PB
Provedor=PadraoNacional

[2503506]
Nome=Cacimba de Dentro
UF=PB
Provedor=PadraoNacional

[2503555]
Nome=Cacimbas
UF=PB
Provedor=PadraoNacional

[2503605]
Nome=Caicara
UF=PB
Provedor=PadraoNacional

[2503704]
Nome=Cajazeiras
UF=PB
Provedor=PadraoNacional

[2503753]
Nome=Cajazeirinhas
UF=PB
Provedor=PadraoNacional

[2503803]
Nome=Caldas Brandao
UF=PB
Provedor=PadraoNacional

[2503902]
Nome=Camalau
UF=PB
Provedor=PadraoNacional

[2504009]
Nome=Campina Grande
UF=PB
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://campinagrandepb.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://campinagrandepb.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[2504033]
Nome=Capim
UF=PB
Provedor=PadraoNacional

[2504074]
Nome=Caraubas
UF=PB
Provedor=PadraoNacional

[2504108]
Nome=Carrapateira
UF=PB
Provedor=PadraoNacional

[2504157]
Nome=Casserengue
UF=PB
Provedor=PadraoNacional

[2504207]
Nome=Catingueira
UF=PB
Provedor=PadraoNacional

[2504306]
Nome=Catole do Rocha
UF=PB
Provedor=PadraoNacional

[2504355]
Nome=Caturite
UF=PB
Provedor=PadraoNacional

[2504405]
Nome=Conceicao
UF=PB
Provedor=PadraoNacional

[2504504]
Nome=Condado
UF=PB
Provedor=PadraoNacional

[2504603]
Nome=Conde
UF=PB
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://conde.aossoftware.com.br:8888/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://conde.aossoftware.com.br:8888/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[2504702]
Nome=Congo
UF=PB
Provedor=PadraoNacional

[2504801]
Nome=Coremas
UF=PB
Provedor=PadraoNacional

[2504850]
Nome=Coxixola
UF=PB
Provedor=PadraoNacional

[2504900]
Nome=Cruz do Espirito Santo
UF=PB
Provedor=PadraoNacional

[2505006]
Nome=Cubati
UF=PB
Provedor=PadraoNacional

[2505105]
Nome=Cuite
UF=PB
Provedor=PadraoNacional

[2505204]
Nome=Cuitegi
UF=PB
Provedor=PadraoNacional

[2505238]
Nome=Cuite de Mamanguape
UF=PB
Provedor=PadraoNacional

[2505279]
Nome=Curral de Cima
UF=PB
Provedor=PadraoNacional

[2505303]
Nome=Curral Velho
UF=PB
Provedor=PadraoNacional

[2505352]
Nome=Damiao
UF=PB
Provedor=PadraoNacional

[2505402]
Nome=Desterro
UF=PB
Provedor=PadraoNacional

[2505501]
Nome=Vista Serrana
UF=PB
Provedor=PadraoNacional

[2505600]
Nome=Diamante
UF=PB
Provedor=PadraoNacional

[2505709]
Nome=Dona Ines
UF=PB
Provedor=PadraoNacional

[2505808]
Nome=Duas Estradas
UF=PB
Provedor=PadraoNacional

[2505907]
Nome=Emas
UF=PB
Provedor=PadraoNacional

[2506004]
Nome=Esperanca
UF=PB
Provedor=PadraoNacional

[2506103]
Nome=Fagundes
UF=PB
Provedor=PadraoNacional

[2506202]
Nome=Frei Martinho
UF=PB
Provedor=PadraoNacional

[2506251]
Nome=Gado Bravo
UF=PB
Provedor=PadraoNacional

[2506301]
Nome=Guarabira
UF=PB
Provedor=PadraoNacional

[2506400]
Nome=Gurinhem
UF=PB
Provedor=PadraoNacional

[2506509]
Nome=Gurjao
UF=PB
Provedor=PadraoNacional

[2506608]
Nome=Ibiara
UF=PB
Provedor=PadraoNacional

[2506707]
Nome=Imaculada
UF=PB
Provedor=PadraoNacional

[2506806]
Nome=Inga
UF=PB
Provedor=PadraoNacional

[2506905]
Nome=Itabaiana
UF=PB
Provedor=PadraoNacional

[2507002]
Nome=Itaporanga
UF=PB
Provedor=PadraoNacional

[2507101]
Nome=Itapororoca
UF=PB
Provedor=PadraoNacional

[2507200]
Nome=Itatuba
UF=PB
Provedor=PadraoNacional

[2507309]
Nome=Jacarau
UF=PB
Provedor=PadraoNacional

[2507408]
Nome=Jerico
UF=PB
Provedor=PadraoNacional

[2507507]
Nome=Joao Pessoa
UF=PB
Provedor=SisPMJP
Versao=2.02
ProRecepcionar=https://sispmjp.joaopessoa.pb.gov.br:8443/sispmjp/NfseWSService
HomRecepcionar=https://nfsehomolog.joaopessoa.pb.gov.br:8443/sispmjp/NfseWSService

[2507606]
Nome=Juarez Tavora
UF=PB
Provedor=PadraoNacional

[2507705]
Nome=Juazeirinho
UF=PB
Provedor=PadraoNacional

[2507804]
Nome=Junco do Serido
UF=PB
Provedor=PadraoNacional

[2507903]
Nome=Juripiranga
UF=PB
Provedor=PadraoNacional

[2508000]
Nome=Juru
UF=PB
Provedor=PadraoNacional

[2508109]
Nome=Lagoa
UF=PB
Provedor=PadraoNacional

[2508208]
Nome=Lagoa de Dentro
UF=PB
Provedor=PadraoNacional

[2508307]
Nome=Lagoa Seca
UF=PB
Provedor=PadraoNacional

[2508406]
Nome=Lastro
UF=PB
Provedor=PadraoNacional

[2508505]
Nome=Livramento
UF=PB
Provedor=PadraoNacional

[2508554]
Nome=Logradouro
UF=PB
Provedor=PadraoNacional

[2508604]
Nome=Lucena
UF=PB
Provedor=PadraoNacional

[2508703]
Nome=Mae D Agua
UF=PB
Provedor=PadraoNacional

[2508802]
Nome=Malta
UF=PB
Provedor=PadraoNacional

[2508901]
Nome=Mamanguape
UF=PB
Provedor=PadraoNacional

[2509008]
Nome=Manaira
UF=PB
Provedor=PadraoNacional

[2509057]
Nome=Marcacao
UF=PB
Provedor=PadraoNacional

[2509107]
Nome=Mari
UF=PB
Provedor=PadraoNacional

[2509156]
Nome=Marizopolis
UF=PB
Provedor=PadraoNacional

[2509206]
Nome=Massaranduba
UF=PB
Provedor=PadraoNacional

[2509305]
Nome=Mataraca
UF=PB
Provedor=PadraoNacional

[2509339]
Nome=Matinhas
UF=PB
Provedor=PadraoNacional

[2509370]
Nome=Mato Grosso
UF=PB
Provedor=PadraoNacional

[2509396]
Nome=Matureia
UF=PB
Provedor=PadraoNacional

[2509404]
Nome=Mogeiro
UF=PB
Provedor=PadraoNacional

[2509503]
Nome=Montadas
UF=PB
Provedor=PadraoNacional

[2509602]
Nome=Monte Horebe
UF=PB
Provedor=PadraoNacional

[2509701]
Nome=Monteiro
UF=PB
Provedor=PadraoNacional

[2509800]
Nome=Mulungu
UF=PB
Provedor=PadraoNacional

[2509909]
Nome=Natuba
UF=PB
Provedor=PadraoNacional

[2510006]
Nome=Nazarezinho
UF=PB
Provedor=PadraoNacional

[2510105]
Nome=Nova Floresta
UF=PB
Provedor=PadraoNacional

[2510204]
Nome=Nova Olinda
UF=PB
Provedor=PadraoNacional

[2510303]
Nome=Nova Palmeira
UF=PB
Provedor=PadraoNacional

[2510402]
Nome=Olho D Agua
UF=PB
Provedor=PadraoNacional

[2510501]
Nome=Olivedos
UF=PB
Provedor=PadraoNacional

[2510600]
Nome=Ouro Velho
UF=PB
Provedor=PadraoNacional

[2510659]
Nome=Parari
UF=PB
Provedor=PadraoNacional

[2510709]
Nome=Passagem
UF=PB
Provedor=PadraoNacional

[2510808]
Nome=Patos
UF=PB
Provedor=PadraoNacional

[2510907]
Nome=Paulista
UF=PB
Provedor=PadraoNacional

[2511004]
Nome=Pedra Branca
UF=PB
Provedor=PadraoNacional

[2511103]
Nome=Pedra Lavrada
UF=PB
Provedor=PadraoNacional

[2511202]
Nome=Pedras de Fogo
UF=PB
Provedor=PadraoNacional

[2511301]
Nome=Pianco
UF=PB
Provedor=PadraoNacional

[2511400]
Nome=Picui
UF=PB
Provedor=PadraoNacional

[2511509]
Nome=Pilar
UF=PB
Provedor=PadraoNacional

[2511608]
; Inclu�do em 04/01/2023
Nome=Piloes
UF=PB
Provedor=PublicSoft
Versao=2.03
ProRecepcionar=http://api.publicsoft.com.br:443/api/
HomRecepcionar=http://api.publicsoft.com.br:443/api/

[2511707]
Nome=Piloezinhos
UF=PB
Provedor=PadraoNacional

[2511806]
Nome=Pirpirituba
UF=PB
Provedor=PadraoNacional

[2511905]
Nome=Pitimbu
UF=PB
Provedor=PadraoNacional

[2512002]
Nome=Pocinhos
UF=PB
Provedor=PadraoNacional

[2512036]
Nome=Poco Dantas
UF=PB
Provedor=PadraoNacional

[2512077]
Nome=Poco de Jose de Moura
UF=PB
Provedor=PadraoNacional

[2512101]
Nome=Pombal
UF=PB
Provedor=PadraoNacional

[2512200]
Nome=Prata
UF=PB
Provedor=PadraoNacional

[2512309]
Nome=Princesa Isabel
UF=PB
Provedor=PadraoNacional

[2512408]
Nome=Puxinana
UF=PB
Provedor=PadraoNacional

[2512507]
Nome=Queimadas
UF=PB
Provedor=PadraoNacional

[2512606]
Nome=Quixaba
UF=PB
Provedor=PadraoNacional

[2512705]
Nome=Remigio
UF=PB
Provedor=PadraoNacional

[2512721]
Nome=Pedro Regis
UF=PB
Provedor=PadraoNacional

[2512747]
Nome=Riachao
UF=PB
Provedor=PadraoNacional

[2512754]
Nome=Riachao do Bacamarte
UF=PB
Provedor=PadraoNacional

[2512762]
Nome=Riachao do Poco
UF=PB
Provedor=PadraoNacional

[2512788]
Nome=Riacho de Santo Antonio
UF=PB
Provedor=PadraoNacional

[2512804]
Nome=Riacho Dos Cavalos
UF=PB
Provedor=PadraoNacional

[2512903]
Nome=Rio Tinto
UF=PB
Provedor=PadraoNacional

[2513000]
Nome=Salgadinho
UF=PB
Provedor=PadraoNacional

[2513109]
Nome=Salgado de Sao Felix
UF=PB
Provedor=PadraoNacional

[2513158]
Nome=Santa Cecilia
UF=PB
Provedor=PadraoNacional

[2513208]
Nome=Santa Cruz
UF=PB
Provedor=PadraoNacional

[2513307]
Nome=Santa Helena
UF=PB
Provedor=PadraoNacional

[2513356]
Nome=Santa Ines
UF=PB
Provedor=PadraoNacional

[2513406]
Nome=Santa Luzia
UF=PB
Provedor=PadraoNacional

[2513505]
Nome=Santana de Mangueira
UF=PB
Provedor=PadraoNacional

[2513604]
Nome=Santana Dos Garrotes
UF=PB
Provedor=PadraoNacional

[2513653]
Nome=Santarem
UF=PB
Provedor=Ginfes
;
ProLinkURL=http://santarem.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://santarem.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[2513703]
Nome=Santa Rita
UF=PB
Provedor=PadraoNacional

[2513802]
Nome=Santa Teresinha
UF=PB
Provedor=PadraoNacional

[2513851]
Nome=Santo Andre
UF=PB
Provedor=PadraoNacional

[2513901]
Nome=Sao Bento
UF=PB
Provedor=PadraoNacional

[2513927]
Nome=Sao Bentinho
UF=PB
Provedor=PadraoNacional

[2513943]
Nome=Sao Domingos do Cariri
UF=PB
Provedor=PadraoNacional

[2513968]
Nome=Sao Domingos
UF=PB
Provedor=PadraoNacional

[2513984]
Nome=Sao Francisco
UF=PB
Provedor=PadraoNacional

[2514008]
Nome=Sao Joao do Cariri
UF=PB
Provedor=PadraoNacional

[2514107]
Nome=Sao Joao do Tigre
UF=PB
Provedor=PadraoNacional

[2514206]
Nome=Sao Jose da Lagoa Tapada
UF=PB
Provedor=PadraoNacional

[2514305]
Nome=Sao Jose de Caiana
UF=PB
Provedor=PadraoNacional

[2514404]
Nome=Sao Jose de Espinharas
UF=PB
Provedor=PadraoNacional

[2514453]
Nome=Sao Jose Dos Ramos
UF=PB
Provedor=PadraoNacional

[2514503]
Nome=Sao Jose de Piranhas
UF=PB
Provedor=PadraoNacional

[2514552]
Nome=Sao Jose de Princesa
UF=PB
Provedor=PadraoNacional

[2514602]
Nome=Sao Jose do Bonfim
UF=PB
Provedor=PadraoNacional

[2514651]
Nome=Sao Jose do Brejo do Cruz
UF=PB
Provedor=PadraoNacional

[2514701]
Nome=Sao Jose do Sabugi
UF=PB
Provedor=PadraoNacional

[2514800]
Nome=Sao Jose Dos Cordeiros
UF=PB
Provedor=PadraoNacional

[2514909]
Nome=Sao Mamede
UF=PB
Provedor=PadraoNacional

[2515005]
Nome=Sao Miguel de Taipu
UF=PB
Provedor=PadraoNacional

[2515104]
Nome=Sao Sebastiao de Lagoa de Roca
UF=PB
Provedor=PadraoNacional

[2515203]
Nome=Sao Sebastiao do Umbuzeiro
UF=PB
Provedor=PadraoNacional

[2515302]
Nome=Sape
UF=PB
Provedor=PadraoNacional

[2515401]
Nome=Serido
UF=PB
Provedor=PadraoNacional

[2515500]
Nome=Serra Branca
UF=PB
Provedor=PadraoNacional

[2515609]
Nome=Serra da Raiz
UF=PB
Provedor=PadraoNacional

[2515708]
Nome=Serra Grande
UF=PB
Provedor=PadraoNacional

[2515807]
Nome=Serra Redonda
UF=PB
Provedor=PadraoNacional

[2515906]
Nome=Serraria
UF=PB
Provedor=PadraoNacional

[2515930]
Nome=Sertaozinho
UF=PB
Provedor=PadraoNacional

[2515971]
Nome=Sobrado
UF=PB
Provedor=PadraoNacional

[2516003]
Nome=Solanea
UF=PB
Provedor=PadraoNacional

[2516102]
Nome=Soledade
UF=PB
Provedor=PadraoNacional

[2516151]
Nome=Sossego
UF=PB
Provedor=PadraoNacional

[2516201]
Nome=Sousa
UF=PB
Provedor=PadraoNacional

[2516300]
Nome=Sume
UF=PB
Provedor=PadraoNacional

[2516409]
Nome=Campo de Santana
UF=PB
Provedor=PadraoNacional

[2516508]
Nome=Taperoa
UF=PB
Provedor=PadraoNacional

[2516607]
Nome=Tavares
UF=PB
Provedor=PadraoNacional

[2516706]
Nome=Teixeira
UF=PB
Provedor=PadraoNacional

[2516755]
Nome=Tenorio
UF=PB
Provedor=PadraoNacional

[2516805]
Nome=Triunfo
UF=PB
Provedor=PadraoNacional

[2516904]
Nome=Uirauna
UF=PB
Provedor=PadraoNacional

[2517001]
Nome=Umbuzeiro
UF=PB
Provedor=PadraoNacional

[2517100]
Nome=Varzea
UF=PB
Provedor=PadraoNacional

[2517209]
Nome=Vieiropolis
UF=PB
Provedor=PadraoNacional

[2517407]
Nome=Zabele
UF=PB
Provedor=PadraoNacional

[2600054]
Nome=Abreu E Lima
UF=PE
Provedor=PadraoNacional

[2600104]
Nome=Afogados da Ingazeira
UF=PE
Provedor=PadraoNacional

[2600203]
Nome=Afranio
UF=PE
Provedor=PadraoNacional

[2600302]
Nome=Agrestina
UF=PE
Provedor=PadraoNacional

[2600401]
Nome=Agua Preta
UF=PE
Provedor=PadraoNacional

[2600500]
Nome=Aguas Belas
UF=PE
Provedor=PadraoNacional

[2600609]
Nome=Alagoinha
UF=PE
Provedor=PadraoNacional

[2600708]
Nome=Alianca
UF=PE
Provedor=PadraoNacional

[2600807]
Nome=Altinho
UF=PE
Provedor=PadraoNacional

[2600906]
Nome=Amaraji
UF=PE
Provedor=PadraoNacional

[2601003]
Nome=Angelim
UF=PE
Provedor=PadraoNacional

[2601052]
Nome=Aracoiaba
UF=PE
Provedor=PadraoNacional

[2601102]
Nome=Araripina
UF=PE
Provedor=PadraoNacional

[2601201]
Nome=Arcoverde
UF=PE
Provedor=PadraoNacional

[2601300]
Nome=Barra de Guabiraba
UF=PE
Provedor=PadraoNacional

[2601409]
Nome=Barreiros
UF=PE
Provedor=PadraoNacional

[2601508]
Nome=Belem de Maria
UF=PE
Provedor=PadraoNacional

[2601607]
Nome=Belem de Sao Francisco
UF=PE
Provedor=PadraoNacional

[2601706]
Nome=Belo Jardim
UF=PE
Provedor=PadraoNacional

[2601805]
Nome=Betania
UF=PE
Provedor=PadraoNacional

[2601904]
; Inclu�do em 20/10/2022
Nome=Bezerros
UF=PE
Provedor=Tributus
Versao=2.04
ProRecepcionar=https://www.tributosmunicipais.com.br/nfse/api/
HomRecepcionar=https://www.tributosmunicipais.com.br/nfse/api/

[2602001]
Nome=Bodoco
UF=PE
Provedor=PadraoNacional

[2602100]
Nome=Bom Conselho
UF=PE
Provedor=PadraoNacional

[2602209]
Nome=Bom Jardim
UF=PE
Provedor=PadraoNacional

[2602308]
Nome=Bonito
UF=PE
Provedor=PadraoNacional

[2602407]
Nome=Brejao
UF=PE
Provedor=PadraoNacional

[2602506]
Nome=Brejinho
UF=PE
Provedor=PadraoNacional

[2602605]
Nome=Brejo da Madre de Deus
UF=PE
Provedor=PadraoNacional

[2602704]
Nome=Buenos Aires
UF=PE
Provedor=PadraoNacional

[2602803]
Nome=Buique
UF=PE
Provedor=PadraoNacional

[2602902]
Nome=Cabo de Santo Agostinho
UF=PE
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/cabo/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/cabo/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/cabo/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/cabo/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/cabo/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/cabo/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/cabo/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/cabo/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testecab/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testecab/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testecab/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testecab/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testecab/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testecab/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testecab/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testecab/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2603009]
Nome=Cabrobo
UF=PE
Provedor=PadraoNacional

[2603108]
Nome=Cachoeirinha
UF=PE
Provedor=PadraoNacional

[2603207]
Nome=Caetes
UF=PE
Provedor=PadraoNacional

[2603306]
Nome=Calcado
UF=PE
Provedor=PadraoNacional

[2603405]
Nome=Calumbi
UF=PE
Provedor=PadraoNacional

[2603454]
Nome=Camaragibe
UF=PE
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/camaragibe/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/camaragibe/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/camaragibe/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/camaragibe/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/camaragibe/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/camaragibe/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/camaragibe/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/camaragibe/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testecam/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testecam/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testecam/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testecam/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testecam/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testecam/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testecam/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testecam/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2603504]
Nome=Camocim de Sao Felix
UF=PE
Provedor=PadraoNacional

[2603603]
Nome=Camutanga
UF=PE
Provedor=PadraoNacional

[2603702]
Nome=Canhotinho
UF=PE
Provedor=PadraoNacional

[2603801]
Nome=Capoeiras
UF=PE
Provedor=PadraoNacional

[2603900]
Nome=Carnaiba
UF=PE
Provedor=PadraoNacional

[2603926]
Nome=Carnaubeira da Penha
UF=PE
Provedor=PadraoNacional

[2604007]
Nome=Carpina
UF=PE
Provedor=PadraoNacional

[2604106]
Nome=Caruaru
UF=PE
Provedor=Ginfes
;
ProLinkURL=http://caruaru.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://caruaru.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[2604155]
Nome=Casinhas
UF=PE
Provedor=PadraoNacional

[2604205]
Nome=Catende
UF=PE
Provedor=PadraoNacional

[2604304]
Nome=Cedro
UF=PE
Provedor=PadraoNacional

[2604403]
Nome=Cha de Alegria
UF=PE
Provedor=PadraoNacional

[2604502]
Nome=Cha Grande
UF=PE
Provedor=PadraoNacional

[2604601]
Nome=Condado
UF=PE
Provedor=PadraoNacional

[2604700]
Nome=Correntes
UF=PE
Provedor=PadraoNacional

[2604809]
Nome=Cortes
UF=PE
Provedor=PadraoNacional

[2604908]
Nome=Cumaru
UF=PE
Provedor=PadraoNacional

[2605004]
Nome=Cupira
UF=PE
Provedor=PadraoNacional

[2605103]
Nome=Custodia
UF=PE
Provedor=PadraoNacional

[2605152]
Nome=Dormentes
UF=PE
Provedor=PadraoNacional

[2605202]
Nome=Escada
UF=PE
Provedor=PadraoNacional

[2605301]
Nome=Exu
UF=PE
Provedor=PadraoNacional

[2605400]
Nome=Feira Nova
UF=PE
Provedor=PadraoNacional

[2605459]
Nome=Fernando de Noronha
UF=PE
Provedor=PadraoNacional

[2605509]
Nome=Ferreiros
UF=PE
Provedor=PadraoNacional

[2605608]
Nome=Flores
UF=PE
Provedor=PadraoNacional

[2605707]
Nome=Floresta
UF=PE
Provedor=PadraoNacional

[2605806]
Nome=Frei Miguelinho
UF=PE
Provedor=PadraoNacional

[2605905]
Nome=Gameleira
UF=PE
Provedor=PadraoNacional

[2606002]
Nome=Garanhuns
UF=PE
Provedor=PadraoNacional

[2606101]
Nome=Gloria do Goita
UF=PE
Provedor=PadraoNacional

[2606200]
Nome=Goiana
UF=PE
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/goiana/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/goiana/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/goiana/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/goiana/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/goiana/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/goiana/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/goiana/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/goiana/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testegoi/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testegoi/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testegoi/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testegoi/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testegoi/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testegoi/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testegoi/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testegoi/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2606309]
Nome=Granito
UF=PE
Provedor=PadraoNacional

[2606408]
Nome=Gravata
UF=PE
Provedor=PadraoNacional

[2606507]
Nome=Iati
UF=PE
Provedor=PadraoNacional

[2606606]
Nome=Ibimirim
UF=PE
Provedor=PadraoNacional

[2606705]
Nome=Ibirajuba
UF=PE
Provedor=PadraoNacional

[2606804]
Nome=Igarassu
UF=PE
Provedor=PadraoNacional

[2606903]
Nome=Iguaraci
UF=PE
Provedor=PadraoNacional

[2607000]
Nome=Inaja
UF=PE
Provedor=PadraoNacional

[2607109]
Nome=Ingazeira
UF=PE
Provedor=PadraoNacional

[2607208]
Nome=Ipojuca
UF=PE
Provedor=PadraoNacional

[2607307]
Nome=Ipubi
UF=PE
Provedor=PadraoNacional

[2607406]
Nome=Itacuruba
UF=PE
Provedor=PadraoNacional

[2607505]
Nome=Itaiba
UF=PE
Provedor=PadraoNacional

[2607604]
Nome=Ilha de Itamaraca
UF=PE
Provedor=PadraoNacional

[2607653]
Nome=Itambe
UF=PE
Provedor=PadraoNacional

[2607703]
Nome=Itapetim
UF=PE
Provedor=PadraoNacional

[2607752]
Nome=Itapissuma
UF=PE
Provedor=PadraoNacional

[2607802]
Nome=Itaquitinga
UF=PE
Provedor=PadraoNacional

[2607901]
Nome=Jaboatao dos Guararapes
UF=PE
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/jaboatao/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/jaboatao/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/jaboatao/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/jaboatao/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/jaboatao/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/jaboatao/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/jaboatao/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/jaboatao/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testejab/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testejab/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testejab/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testejab/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testejab/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testejab/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testejab/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testejab/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2607950]
Nome=Jaqueira
UF=PE
Provedor=PadraoNacional

[2608008]
Nome=Jatauba
UF=PE
Provedor=PadraoNacional

[2608057]
Nome=Jatoba
UF=PE
Provedor=PadraoNacional

[2608107]
Nome=Joao Alfredo
UF=PE
Provedor=PadraoNacional

[2608206]
Nome=Joaquim Nabuco
UF=PE
Provedor=PadraoNacional

[2608255]
Nome=Jucati
UF=PE
Provedor=PadraoNacional

[2608305]
Nome=Jupi
UF=PE
Provedor=PadraoNacional

[2608404]
Nome=Jurema
UF=PE
Provedor=PadraoNacional

[2608453]
Nome=Lagoa do Carro
UF=PE
Provedor=PadraoNacional

[2608503]
Nome=Lagoa do Itaenga
UF=PE
Provedor=PadraoNacional

[2608602]
Nome=Lagoa do Ouro
UF=PE
Provedor=PadraoNacional

[2608701]
Nome=Lagoa Dos Gatos
UF=PE
Provedor=PadraoNacional

[2608750]
Nome=Lagoa Grande
UF=PE
Provedor=PadraoNacional

[2608800]
Nome=Lajedo
UF=PE
Provedor=PadraoNacional

[2608909]
Nome=Limoeiro
UF=PE
Provedor=PadraoNacional

[2609006]
Nome=Macaparana
UF=PE
Provedor=PadraoNacional

[2609105]
Nome=Machados
UF=PE
Provedor=PadraoNacional

[2609154]
Nome=Manari
UF=PE
Provedor=PadraoNacional

[2609204]
Nome=Maraial
UF=PE
Provedor=PadraoNacional

[2609303]
Nome=Mirandiba
UF=PE
Provedor=PadraoNacional

[2609402]
Nome=Moreno
UF=PE
Provedor=PadraoNacional

[2609501]
Nome=Nazare da Mata
UF=PE
Provedor=PadraoNacional

[2609600]
Nome=Olinda
UF=PE
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/olinda/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/olinda/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/olinda/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/olinda/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/olinda/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/olinda/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/olinda/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/olinda/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testeoli/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testeoli/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testeoli/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testeoli/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testeoli/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testeoli/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testeoli/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testeoli/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2609709]
Nome=Orobo
UF=PE
Provedor=PadraoNacional

[2609808]
Nome=Oroco
UF=PE
Provedor=PadraoNacional

[2609907]
Nome=Ouricuri
UF=PE
Provedor=PadraoNacional

[2610004]
Nome=Palmares
UF=PE
Provedor=PadraoNacional

[2610103]
Nome=Palmeirina
UF=PE
Provedor=PadraoNacional

[2610202]
Nome=Panelas
UF=PE
Provedor=PadraoNacional

[2610301]
Nome=Paranatama
UF=PE
Provedor=PadraoNacional

[2610400]
Nome=Parnamirim
UF=PE
Provedor=PadraoNacional

[2610509]
Nome=Passira
UF=PE
Provedor=PadraoNacional

[2610608]
Nome=Paudalho
UF=PE
Provedor=PadraoNacional

[2610707]
; Inclu�do em 18/05/2022
Nome=Paulista
UF=PE
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/Paulista/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/Paulista/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/Paulista/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/Paulista/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/Paulista/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/Paulista/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/Paulista/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/Paulista/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testepau/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testepau/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testepau/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testepau/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testepau/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testepau/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testepau/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testepau/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2610806]
Nome=Pedra
UF=PE
Provedor=PadraoNacional

[2610905]
Nome=Pesqueira
UF=PE
Provedor=PadraoNacional

[2611002]
Nome=Petrolandia
UF=PE
Provedor=PadraoNacional

[2611101]
Nome=Petrolina
UF=PE
Provedor=EL
Versao=2.04
ProRecepcionar=http://pe-petrolina-pm-nfs-backend.cloud.el.com.br/nfse/NfseWSService
HomRecepcionar=http://177.11.214.253:7081/ELNfse-0.0.1-SNAPSHOT/NfseWSService

[2611200]
Nome=Pocao
UF=PE
Provedor=PadraoNacional

[2611309]
Nome=Pombos
UF=PE
Provedor=PadraoNacional

[2611408]
Nome=Primavera
UF=PE
Provedor=PadraoNacional

[2611507]
Nome=Quipapa
UF=PE
Provedor=PadraoNacional

[2611533]
Nome=Quixaba
UF=PE
Provedor=PadraoNacional

[2611606]
Nome=Recife
UF=PE
Provedor=ISSRecife
ProRecepcionar=https://nfse.recife.pe.gov.br/WSNacional/nfse_v01.asmx
HomRecepcionar=
;
ProLinkURL=https://nfse.recife.pe.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://nfse.recife.pe.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%

[2611705]
Nome=Riacho das Almas
UF=PE
Provedor=PadraoNacional

[2611804]
Nome=Ribeirao
UF=PE
Provedor=PadraoNacional

[2611903]
Nome=Rio Formoso
UF=PE
Provedor=PadraoNacional

[2612000]
Nome=Saire
UF=PE
Provedor=PadraoNacional

[2612109]
Nome=Salgadinho
UF=PE
Provedor=PadraoNacional

[2612208]
Nome=Salgueiro
UF=PE
Provedor=PadraoNacional

[2612307]
Nome=Saloa
UF=PE
Provedor=PadraoNacional

[2612406]
Nome=Sanharo
UF=PE
Provedor=PadraoNacional

[2612455]
Nome=Santa Cruz
UF=PE
Provedor=PadraoNacional

[2612471]
Nome=Santa Cruz da Baixa Verde
UF=PE
Provedor=PadraoNacional

[2612505]
Nome=Santa Cruz do Capibaribe
UF=PE
Provedor=PadraoNacional

[2612554]
Nome=Santa Filomena
UF=PE
Provedor=PadraoNacional

[2612604]
Nome=Santa Maria da Boa Vista
UF=PE
Provedor=PadraoNacional

[2612703]
Nome=Santa Maria do Cambuca
UF=PE
Provedor=PadraoNacional

[2612802]
Nome=Santa Terezinha
UF=PE
Provedor=PadraoNacional

[2612901]
Nome=Sao Benedito do Sul
UF=PE
Provedor=PadraoNacional

[2613008]
Nome=Sao Bento do Una
UF=PE
Provedor=PadraoNacional

[2613107]
Nome=Sao Caitano
UF=PE
Provedor=PadraoNacional

[2613206]
Nome=Sao Joao
UF=PE
Provedor=PadraoNacional

[2613305]
Nome=Sao Joaquim do Monte
UF=PE
Provedor=PadraoNacional

[2613404]
Nome=Sao Jose da Coroa Grande
UF=PE
Provedor=PadraoNacional

[2613503]
Nome=Sao Jose do Belmonte
UF=PE
Provedor=PadraoNacional

[2613602]
Nome=Sao Jose do Egito
UF=PE
Provedor=PadraoNacional

[2613701]
Nome=Sao Lourenco da Mata
UF=PE
Provedor=PadraoNacional

[2613800]
Nome=Sao Vicente Ferrer
UF=PE
Provedor=PadraoNacional

[2613909]
Nome=Serra Talhada
UF=PE
Provedor=PadraoNacional

[2614006]
Nome=Serrita
UF=PE
Provedor=PadraoNacional

[2614105]
Nome=Sertania
UF=PE
Provedor=PadraoNacional

[2614204]
Nome=Sirinhaem
UF=PE
Provedor=PadraoNacional

[2614303]
Nome=Moreilandia
UF=PE
Provedor=PadraoNacional

[2614402]
Nome=Solidao
UF=PE
Provedor=PadraoNacional

[2614501]
Nome=Surubim
UF=PE
Provedor=PadraoNacional

[2614600]
Nome=Tabira
UF=PE
Provedor=PadraoNacional

[2614709]
Nome=Tacaimbo
UF=PE
Provedor=PadraoNacional

[2614808]
Nome=Tacaratu
UF=PE
Provedor=PadraoNacional

[2614857]
Nome=Tamandare
UF=PE
Provedor=PadraoNacional

[2615003]
Nome=Taquaritinga do Norte
UF=PE
Provedor=PadraoNacional

[2615102]
Nome=Terezinha
UF=PE
Provedor=PadraoNacional

[2615201]
Nome=Terra Nova
UF=PE
Provedor=PadraoNacional

[2615300]
Nome=Timbauba
UF=PE
Provedor=PadraoNacional

[2615409]
Nome=Toritama
UF=PE
Provedor=PadraoNacional

[2615508]
Nome=Tracunhaem
UF=PE
Provedor=PadraoNacional

[2615607]
Nome=Trindade
UF=PE
Provedor=PadraoNacional

[2615706]
Nome=Triunfo
UF=PE
Provedor=PadraoNacional

[2615805]
Nome=Tupanatinga
UF=PE
Provedor=PadraoNacional

[2615904]
Nome=Tuparetama
UF=PE
Provedor=PadraoNacional

[2616001]
Nome=Venturosa
UF=PE
Provedor=PadraoNacional

[2616100]
Nome=Verdejante
UF=PE
Provedor=PadraoNacional

[2616183]
Nome=Vertente do Lerio
UF=PE
Provedor=PadraoNacional

[2616209]
Nome=Vertentes
UF=PE
Provedor=PadraoNacional

[2616308]
Nome=Vicencia
UF=PE
Provedor=PadraoNacional

[2616407]
; Inclu�do em 26/09/2021
Nome=Vitoria de Santo Antao
UF=PE
Provedor=Tinus
ProRecepcionar=http://www.tinus.com.br/csp/vitoria/WSNFSE.RecepcionarLoteRps.cls
ProConsultarSituacao=http://www.tinus.com.br/csp/vitoria/WSNFSE.ConsultarSituacaoLoteRps.cls
ProConsultarLote=http://www.tinus.com.br/csp/vitoria/WSNFSE.ConsultarLoteRps.cls
ProConsultarNFSeRps=http://www.tinus.com.br/csp/vitoria/WSNFSE.ConsultarNfsePorRps.cls
ProConsultarNFSe=http://www.tinus.com.br/csp/vitoria/WSNFSE.ConsultarNfse.cls
ProCancelarNFSe=http://www.tinus.com.br/csp/vitoria/WSNFSE.CancelarNfse.cls
ProGerarNFSe=http://www.tinus.com.br/csp/vitoria/WSNFSE.GerarNfse.cls
ProRecepcionarSincrono=http://www.tinus.com.br/csp/vitoria/WSNFSE.RecepcionarLoteRpsSincrono.cls
;
HomRecepcionar=http://www2.tinus.com.br/csp/testevit/WSNFSE.RecepcionarLoteRps.cls
HomConsultarSituacao=http://www2.tinus.com.br/csp/testevit/WSNFSE.ConsultarSituacaoLoteRps.cls
HomConsultarLote=http://www2.tinus.com.br/csp/testevit/WSNFSE.ConsultarLoteRps.cls
HomConsultarNFSeRps=http://www2.tinus.com.br/csp/testevit/WSNFSE.ConsultarNfsePorRps.cls
HomConsultarNFSe=http://www2.tinus.com.br/csp/testevit/WSNFSE.ConsultarNfse.cls
HomCancelarNFSe=http://www2.tinus.com.br/csp/testevit/WSNFSE.CancelarNfse.cls
HomGerarNFSe=http://www2.tinus.com.br/csp/testevit/WSNFSE.GerarNfse.cls
HomRecepcionarSincrono=http://www2.tinus.com.br/csp/testevit/WSNFSE.RecepcionarLoteRpsSincrono.cls

[2616506]
Nome=Xexeu
UF=PE
Provedor=PadraoNacional

[2700102]
Nome=Agua Branca
UF=AL
Provedor=PadraoNacional

[2700201]
Nome=Anadia
UF=AL
Provedor=PadraoNacional

[2700300]
Nome=Arapiraca
UF=AL
Provedor=Abaco
ProRecepcionar=https://www.e-nfs.com.br/arapiraca/servlet/arecepcionarloterps
ProConsultarSituacao=https://www.e-nfs.com.br/arapiraca/servlet/aconsultarsituacaoloterps
ProConsultarLote=https://www.e-nfs.com.br/arapiraca/servlet/aconsultarloterps
ProConsultarNFSeRps=https://www.e-nfs.com.br/arapiraca/servlet/aconsultarnfseporrps
ProConsultarNFSe=https://www.e-nfs.com.br/arapiraca/servlet/aconsultarnfse
ProCancelarNFSe=https://www.e-nfs.com.br/arapiraca/servlet/acancelarnfse
;
HomRecepcionar=https://enfs-hom.abaco.com.br/arapiraca/servlet/arecepcionarloterps
HomConsultarSituacao=https://enfs-hom.abaco.com.br/arapiraca/servlet/aconsultarsituacaoloterps
HomConsultarLote=https://enfs-hom.abaco.com.br/arapiraca/servlet/aconsultarloterps
HomConsultarNFSeRps=https://enfs-hom.abaco.com.br/arapiraca/servlet/aconsultarnfseporrps
HomConsultarNFSe=https://enfs-hom.abaco.com.br/arapiraca/servlet/aconsultarnfse
HomCancelarNFSe=https://enfs-hom.abaco.com.br/arapiraca/servlet/acancelarnfse
;
ProLinkURL=https://www.e-nfs.com.br/arapiraca/servlet/wvalidarautenticidadenfse?%Cnpj%,%ValorServico%,%NumeroNFSe%,%CodVerif%
HomLinkURL=https://enfs-hom.abaco.com.br/arapiraca/servlet/wvalidarautenticidadenfse?%Cnpj%,%ValorServico%,%NumeroNFSe%,%CodVerif%

[2700409]
Nome=Atalaia
UF=AL
Provedor=PadraoNacional

[2700508]
Nome=Barra de Santo Antonio
UF=AL
Provedor=PadraoNacional

[2700607]
Nome=Barra de Sao Miguel
UF=AL
Provedor=PadraoNacional

[2700706]
Nome=Batalha
UF=AL
Provedor=PadraoNacional

[2700805]
Nome=Belem
UF=AL
Provedor=PadraoNacional

[2700904]
Nome=Belo Monte
UF=AL
Provedor=PadraoNacional

[2701001]
Nome=Boca da Mata
UF=AL
Provedor=PadraoNacional

[2701100]
Nome=Branquinha
UF=AL
Provedor=PadraoNacional

[2701209]
Nome=Cacimbinhas
UF=AL
Provedor=PadraoNacional

[2701308]
Nome=Cajueiro
UF=AL
Provedor=PadraoNacional

[2701357]
Nome=Campestre
UF=AL
Provedor=PadraoNacional

[2701407]
Nome=Campo Alegre
UF=AL
Provedor=PadraoNacional

[2701506]
Nome=Campo Grande
UF=AL
Provedor=PadraoNacional

[2701605]
Nome=Canapi
UF=AL
Provedor=PadraoNacional

[2701704]
Nome=Capela
UF=AL
Provedor=PadraoNacional

[2701803]
Nome=Carneiros
UF=AL
Provedor=PadraoNacional

[2701902]
Nome=Cha Preta
UF=AL
Provedor=PadraoNacional

[2702009]
Nome=Coite do Noia
UF=AL
Provedor=PadraoNacional

[2702108]
Nome=Colonia Leopoldina
UF=AL
Provedor=PadraoNacional

[2702207]
Nome=Coqueiro Seco
UF=AL
Provedor=PadraoNacional

[2702306]
Nome=Coruripe
UF=AL
Provedor=Betha

[2702355]
Nome=Craibas
UF=AL
Provedor=PadraoNacional

[2702405]
; Inclu�do em 13/07/2022
Nome=Delmiro Gouveia
UF=AL
Provedor=Tributus
Versao=2.04
ProRecepcionar=https://www.tributosmunicipais.com.br/nfse/api/
HomRecepcionar=https://www.tributosmunicipais.com.br/nfse/api/

[2702504]
Nome=Dois Riachos
UF=AL
Provedor=PadraoNacional

[2702553]
Nome=Estrela de Alagoas
UF=AL
Provedor=PadraoNacional

[2702603]
Nome=Feira Grande
UF=AL
Provedor=PadraoNacional

[2702702]
Nome=Feliz Deserto
UF=AL
Provedor=PadraoNacional

[2702801]
Nome=Flexeiras
UF=AL
Provedor=PadraoNacional

[2702900]
Nome=Girau do Ponciano
UF=AL
Provedor=PadraoNacional

[2703007]
Nome=Ibateguara
UF=AL
Provedor=PadraoNacional

[2703106]
Nome=Igaci
UF=AL
Provedor=PadraoNacional

[2703205]
Nome=Igreja Nova
UF=AL
Provedor=PadraoNacional

[2703304]
Nome=Inhapi
UF=AL
Provedor=PadraoNacional

[2703403]
Nome=Jacare Dos Homens
UF=AL
Provedor=PadraoNacional

[2703502]
Nome=Jacuipe
UF=AL
Provedor=PadraoNacional

[2703601]
Nome=Japaratinga
UF=AL
Provedor=PadraoNacional

[2703700]
Nome=Jaramataia
UF=AL
Provedor=PadraoNacional

[2703759]
Nome=Jequia da Praia
UF=AL
Provedor=PadraoNacional

[2703809]
Nome=Joaquim Gomes
UF=AL
Provedor=PadraoNacional

[2703908]
Nome=Jundia
UF=AL
Provedor=PadraoNacional

[2704005]
Nome=Junqueiro
UF=AL
Provedor=PadraoNacional

[2704104]
Nome=Lagoa da Canoa
UF=AL
Provedor=PadraoNacional

[2704203]
Nome=Limoeiro de Anadia
UF=AL
Provedor=PadraoNacional

[2704302]
Nome=Maceio
UF=AL
Provedor=Ginfes
;
ProLinkURL=http://maceio.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://maceio.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[2704401]
Nome=Major Isidoro
UF=AL
Provedor=PadraoNacional

[2704500]
Nome=Maragogi
UF=AL
Provedor=PadraoNacional

[2704609]
Nome=Maravilha
UF=AL
Provedor=PadraoNacional

[2704708]
Nome=Marechal Deodoro
UF=AL
Provedor=Ginfes
;
ProLinkURL=http://marechaldeodoro.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://marechaldeodoro.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[2704807]
Nome=Maribondo
UF=AL
Provedor=PadraoNacional

[2704906]
Nome=Mar Vermelho
UF=AL
Provedor=PadraoNacional

[2705002]
Nome=Mata Grande
UF=AL
Provedor=PadraoNacional

[2705101]
Nome=Matriz de Camaragibe
UF=AL
Provedor=PadraoNacional

[2705200]
Nome=Messias
UF=AL
Provedor=PadraoNacional

[2705309]
Nome=Minador do Negrao
UF=AL
Provedor=PadraoNacional

[2705408]
Nome=Monteiropolis
UF=AL
Provedor=PadraoNacional

[2705507]
Nome=Murici
UF=AL
Provedor=PadraoNacional

[2705606]
Nome=Novo Lino
UF=AL
Provedor=PadraoNacional

[2705705]
Nome=Olho D Agua das Flores
UF=AL
Provedor=PadraoNacional

[2705804]
Nome=Olho D Agua do Casado
UF=AL
Provedor=PadraoNacional

[2705903]
Nome=Olho D Agua Grande
UF=AL
Provedor=PadraoNacional

[2706000]
Nome=Olivenca
UF=AL
Provedor=PadraoNacional

[2706109]
Nome=Ouro Branco
UF=AL
Provedor=PadraoNacional

[2706208]
Nome=Palestina
UF=AL
Provedor=PadraoNacional

[2706307]
Nome=Palmeira Dos Indios
UF=AL
Provedor=PadraoNacional

[2706406]
Nome=Pao de Acucar
UF=AL
Provedor=PadraoNacional

[2706422]
Nome=Pariconha
UF=AL
Provedor=PadraoNacional

[2706448]
Nome=Paripueira
UF=AL
Provedor=PadraoNacional

[2706505]
Nome=Passo de Camaragibe
UF=AL
Provedor=PadraoNacional

[2706604]
Nome=Paulo Jacinto
UF=AL
Provedor=PadraoNacional

[2706703]
Nome=Penedo
UF=AL
Provedor=PadraoNacional

[2706802]
Nome=Piacabucu
UF=AL
Provedor=PadraoNacional

[2706901]
Nome=Pilar
UF=AL
Provedor=PadraoNacional

[2707008]
Nome=Pindoba
UF=AL
Provedor=PadraoNacional

[2707107]
Nome=Piranhas
UF=AL
Provedor=PadraoNacional

[2707206]
Nome=Poco das Trincheiras
UF=AL
Provedor=PadraoNacional

[2707305]
Nome=Porto Calvo
UF=AL
Provedor=PadraoNacional

[2707404]
Nome=Porto de Pedras
UF=AL
Provedor=PadraoNacional

[2707503]
Nome=Porto Real do Colegio
UF=AL
Provedor=PadraoNacional

[2707602]
Nome=Quebrangulo
UF=AL
Provedor=PadraoNacional

[2707701]
Nome=Rio Largo
UF=AL
Provedor=Betha

[2707800]
Nome=Roteiro
UF=AL
Provedor=PadraoNacional

[2707909]
Nome=Santa Luzia do Norte
UF=AL
Provedor=PadraoNacional

[2708006]
Nome=Santana do Ipanema
UF=AL
Provedor=DBSeller
ProRecepcionar=https://santanadoipanema.nfse.srv.br/webservice/index/producao
HomRecepcionar=https://santanadoipanema.nfse.srv.br/webservice/index/homologacao
;
ProNameSpace=https://santanadoipanema.nfse.srv.br/webservice/index/producao
HomNameSpace=https://santanadoipanema.nfse.srv.br/webservice/index/homologacao

[2708105]
Nome=Santana do Mundau
UF=AL
Provedor=PadraoNacional

[2708204]
Nome=Sao Bras
UF=AL
Provedor=PadraoNacional

[2708303]
Nome=Sao Jose da Laje
UF=AL
Provedor=PadraoNacional

[2708402]
Nome=Sao Jose da Tapera
UF=AL
Provedor=PadraoNacional

[2708501]
Nome=Sao Luis do Quitunde
UF=AL
Provedor=PadraoNacional

[2708600]
Nome=Sao Miguel Dos Campos
UF=AL
Provedor=PadraoNacional

[2708709]
Nome=Sao Miguel Dos Milagres
UF=AL
Provedor=PadraoNacional

[2708808]
Nome=Sao Sebastiao
UF=AL
Provedor=PadraoNacional

[2708907]
Nome=Satuba
UF=AL
Provedor=PadraoNacional

[2708956]
Nome=Senador Rui Palmeira
UF=AL
Provedor=PadraoNacional

[2709004]
Nome=Tanque D Arca
UF=AL
Provedor=PadraoNacional

[2709103]
Nome=Taquarana
UF=AL
Provedor=PadraoNacional

[2709152]
Nome=Teotonio Vilela
UF=AL
Provedor=PadraoNacional

[2709202]
Nome=Traipu
UF=AL
Provedor=PadraoNacional

[2709301]
Nome=Uniao Dos Palmares
UF=AL
Provedor=PadraoNacional

[2709400]
Nome=Vicosa
UF=AL
Provedor=PadraoNacional

[2800100]
Nome=Amparo de Sao Francisco
UF=SE
Provedor=PadraoNacional

[2800209]
Nome=Aquidaba
UF=SE
Provedor=PadraoNacional

[2800308]
Nome=Aracaju
UF=SE
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://aracajuse.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://aracajuse.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[2800407]
Nome=Araua
UF=SE
Provedor=PadraoNacional

[2800506]
Nome=Areia Branca
UF=SE
Provedor=PadraoNacional

[2800605]
Nome=Barra dos Coqueiros
UF=SE
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://barradoscoqueirosse.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://barradoscoqueirosse.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[2800670]
Nome=Boquim
UF=SE
Provedor=PadraoNacional

[2800704]
Nome=Brejo Grande
UF=SE
Provedor=PadraoNacional

[2801009]
Nome=Campo do Brito
UF=SE
Provedor=WebISS
ProRecepcionar=https://www3.webiss.com.br/campodobritose_wsnfse/NfseServices.svc
HomRecepcionar=https://www3.webiss.com.br/campodobritose_wsnfse_homolog/NfseServices.svc

[2801108]
Nome=Canhoba
UF=SE
Provedor=PadraoNacional

[2801207]
Nome=Caninde de Sao Francisco
UF=SE
Provedor=PadraoNacional

[2801306]
Nome=Capela
UF=SE
Provedor=PadraoNacional

[2801405]
Nome=Carira
UF=SE
Provedor=PadraoNacional

[2801504]
Nome=Carmopolis
UF=SE
Provedor=PadraoNacional

[2801603]
Nome=Cedro de Sao Joao
UF=SE
Provedor=PadraoNacional

[2801702]
Nome=Cristinapolis
UF=SE
Provedor=PadraoNacional

[2801900]
Nome=Cumbe
UF=SE
Provedor=PadraoNacional

[2802007]
Nome=Divina Pastora
UF=SE
Provedor=PadraoNacional

[2802106]
Nome=Estancia
UF=SE
Provedor=WebISS
ProRecepcionar=https://www3.webiss.com.br/estanciase_wsnfse/NfseServices.svc
HomRecepcionar=https://www3.webiss.com.br/estanciase_wsnfse_homolog/NfseServices.svc

[2802205]
Nome=Feira Nova
UF=SE
Provedor=PadraoNacional

[2802304]
Nome=Frei Paulo
UF=SE
Provedor=PadraoNacional

[2802403]
Nome=Gararu
UF=SE
Provedor=PadraoNacional

[2802502]
Nome=General Maynard
UF=SE
Provedor=PadraoNacional

[2802601]
Nome=Gracho Cardoso
UF=SE
Provedor=PadraoNacional

[2802700]
Nome=Ilha das Flores
UF=SE
Provedor=PadraoNacional

[2802809]
Nome=Indiaroba
UF=SE
Provedor=PadraoNacional

[2802908]
Nome=Itabaiana
UF=SE
Provedor=PadraoNacional

[2803005]
Nome=Itabaianinha
UF=SE
Provedor=PadraoNacional

[2803104]
Nome=Itabi
UF=SE
Provedor=PadraoNacional

[2803203]
Nome=Itaporanga D Ajuda
UF=SE
Provedor=PadraoNacional

[2803302]
Nome=Japaratuba
UF=SE
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/japaratubase_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/japaratubase_wsnfse_homolog/NfseServices.svc

[2803401]
Nome=Japoata
UF=SE
Provedor=PadraoNacional

[2803500]
Nome=Lagarto
UF=SE
Provedor=Tributus
Versao=2.04
ProRecepcionar=https://www.tributosmunicipais.com.br/nfse/api/
HomRecepcionar=https://www.tributosmunicipais.com.br/nfse/api/

[2803609]
Nome=Laranjeiras
UF=SE
Provedor=PadraoNacional

[2803708]
Nome=Macambira
UF=SE
Provedor=PadraoNacional

[2803807]
Nome=Malhada Dos Bois
UF=SE
Provedor=PadraoNacional

[2803906]
Nome=Malhador
UF=SE
Provedor=PadraoNacional

[2804003]
Nome=Maruim
UF=SE
Provedor=PadraoNacional

[2804102]
Nome=Moita Bonita
UF=SE
Provedor=PadraoNacional

[2804201]
Nome=Monte Alegre de Sergipe
UF=SE
Provedor=PadraoNacional

[2804300]
Nome=Muribeca
UF=SE
Provedor=PadraoNacional

[2804409]
Nome=Neopolis
UF=SE
Provedor=PadraoNacional

[2804458]
Nome=Nossa Senhora Aparecida
UF=SE
Provedor=PadraoNacional

[2804508]
Nome=Nossa Senhora da Gloria
UF=SE
Provedor=PadraoNacional

[2804607]
Nome=Nossa Senhora das Dores
UF=SE
Provedor=PadraoNacional

[2804706]
Nome=Nossa Senhora de Lourdes
UF=SE
Provedor=PadraoNacional

[2804805]
Nome=Nossa Senhora do Socorro
UF=SE
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://nossasenhoradosocorrose.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://nossasenhoradosocorrose.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[2804904]
Nome=Pacatuba
UF=SE
Provedor=PadraoNacional

[2805000]
Nome=Pedra Mole
UF=SE
Provedor=PadraoNacional

[2805109]
Nome=Pedrinhas
UF=SE
Provedor=PadraoNacional

[2805208]
Nome=Pinhao
UF=SE
Provedor=PadraoNacional

[2805307]
Nome=Pirambu
UF=SE
Provedor=PadraoNacional

[2805406]
Nome=Poco Redondo
UF=SE
Provedor=PadraoNacional

[2805505]
Nome=Poco Verde
UF=SE
Provedor=PadraoNacional

[2805604]
Nome=Porto da Folha
UF=SE
Provedor=PadraoNacional

[2805703]
Nome=Propria
UF=SE
Provedor=PadraoNacional

[2805802]
Nome=Riachao do Dantas
UF=SE
Provedor=PadraoNacional

[2805901]
Nome=Riachuelo
UF=SE
Provedor=PadraoNacional

[2806008]
Nome=Ribeiropolis
UF=SE
Provedor=PadraoNacional

[2806107]
Nome=Rosario do Catete
UF=SE
Provedor=PadraoNacional

[2806206]
Nome=Salgado
UF=SE
Provedor=PadraoNacional

[2806305]
Nome=Santa Luzia do Itanhy
UF=SE
Provedor=PadraoNacional

[2806404]
Nome=Santana do Sao Francisco
UF=SE
Provedor=PadraoNacional

[2806503]
Nome=Santa Rosa de Lima
UF=SE
Provedor=PadraoNacional

[2806602]
Nome=Santo Amaro das Brotas
UF=SE
Provedor=PadraoNacional

[2806701]
Nome=Sao Cristovao
UF=SE
Provedor=PadraoNacional

[2806800]
Nome=Sao Domingos
UF=SE
Provedor=PadraoNacional

[2806909]
Nome=Sao Francisco
UF=SE
Provedor=PadraoNacional

[2807006]
Nome=Sao Miguel do Aleixo
UF=SE
Provedor=PadraoNacional

[2807105]
Nome=Simao Dias
UF=SE
Provedor=PadraoNacional

[2807204]
Nome=Siriri
UF=SE
Provedor=PadraoNacional

[2807303]
Nome=Telha
UF=SE
Provedor=PadraoNacional

[2807402]
Nome=Tobias Barreto
UF=SE
Provedor=PadraoNacional

[2807501]
Nome=Tomar do Geru
UF=SE
Provedor=PadraoNacional

[2807600]
Nome=Umbauba
UF=SE
Provedor=PadraoNacional

[2900108]
Nome=Abaira
UF=BA
Provedor=PadraoNacional

[2900207]
Nome=Abare
UF=BA
Provedor=PadraoNacional

[2900306]
Nome=Acajutiba
UF=BA
Provedor=PadraoNacional

[2900355]
Nome=Adustina
UF=BA
Provedor=PadraoNacional

[2900405]
Nome=Agua Fria
UF=BA
Provedor=PadraoNacional

[2900504]
Nome=Erico Cardoso
UF=BA
Provedor=PadraoNacional

[2900603]
Nome=Aiquara
UF=BA
Provedor=PadraoNacional

[2900702]
Nome=Alagoinhas
UF=BA
Provedor=PadraoNacional

[2900801]
Nome=Alcobaca
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://alcobaca.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-alcobaca.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://alcobaca.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://alcobaca.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2900900]
Nome=Almadina
UF=BA
Provedor=PadraoNacional

[2901007]
Nome=Amargosa
UF=BA
Provedor=WebISS
ProRecepcionar=https://www1.webiss.com.br/amargosaba_wsnfse/NfseServices.svc
HomRecepcionar=https://www1.webiss.com.br/amargosaba_wsnfse_homolog/NfseServices.svc

[2901106]
Nome=Amelia Rodrigues
UF=BA
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/ameliarodriguesba_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/ameliarodriguesba_wsnfse_homolog/NfseServices.svc

[2901155]
Nome=America Dourada
UF=BA
Provedor=PadraoNacional

[2901205]
Nome=Anage
UF=BA
Provedor=PadraoNacional

[2901304]
Nome=Andarai
UF=BA
Provedor=PadraoNacional

[2901353]
Nome=Andorinha
UF=BA
Provedor=PadraoNacional

[2901403]
Nome=Angical
UF=BA
Provedor=PadraoNacional

[2901502]
Nome=Anguera
UF=BA
Provedor=PadraoNacional

[2901601]
Nome=Antas
UF=BA
Provedor=PadraoNacional

[2901700]
Nome=Antonio Cardoso
UF=BA
Provedor=PadraoNacional

[2901809]
Nome=Antonio Goncalves
UF=BA
Provedor=PadraoNacional

[2901908]
Nome=Apora
UF=BA
Provedor=PadraoNacional

[2901957]
Nome=Apuarema
UF=BA
Provedor=PadraoNacional

[2902005]
Nome=Aracatu
UF=BA
Provedor=PadraoNacional

[2902054]
Nome=Aracas
UF=BA
Provedor=PadraoNacional

[2902104]
Nome=Araci
UF=BA
Provedor=PadraoNacional

[2902203]
Nome=Aramari
UF=BA
Provedor=PadraoNacional

[2902252]
Nome=Arataca
UF=BA
Provedor=PadraoNacional

[2902302]
Nome=Aratuipe
UF=BA
Provedor=PadraoNacional

[2902401]
Nome=Aurelino Leal
UF=BA
Provedor=PadraoNacional

[2902500]
Nome=Baianopolis
UF=BA
Provedor=PadraoNacional

[2902609]
Nome=Baixa Grande
UF=BA
Provedor=PadraoNacional

[2902658]
Nome=Banzae
UF=BA
Provedor=PadraoNacional

[2902708]
Nome=Barra
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://barra.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-barra.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://barra.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://barra.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2902807]
Nome=Barra da Estiva
UF=BA
Provedor=PadraoNacional

[2902906]
Nome=Barra do Choca
UF=BA
Provedor=PadraoNacional

[2903003]
Nome=Barra do Mendes
UF=BA
Provedor=PadraoNacional

[2903102]
Nome=Barra do Rocha
UF=BA
Provedor=PadraoNacional

[2903201]
Nome=Barreiras
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://barreiras.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-barreiras.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://barreiras.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://barreiras.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2903235]
Nome=Barro Alto
UF=BA
Provedor=PadraoNacional

[2903276]
Nome=Barrocas
UF=BA
Provedor=PadraoNacional

[2903300]
Nome=Barro Preto
UF=BA
Provedor=PadraoNacional

[2903409]
Nome=Belmonte
UF=BA
Provedor=PadraoNacional

[2903508]
Nome=Belo Campo
UF=BA
Provedor=PadraoNacional

[2903607]
Nome=Biritinga
UF=BA
Provedor=PadraoNacional

[2903706]
Nome=Boa Nova
UF=BA
Provedor=PadraoNacional

[2903805]
Nome=Boa Vista do Tupim
UF=BA
Provedor=PadraoNacional

[2903904]
Nome=Bom Jesus da Lapa
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://bjlapa.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-bjlapa.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://bjlapa.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://bjlapa.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2903953]
Nome=Bom Jesus da Serra
UF=BA
Provedor=PadraoNacional

[2904001]
Nome=Boninal
UF=BA
Provedor=PadraoNacional

[2904050]
Nome=Bonito
UF=BA
Provedor=PadraoNacional

[2904100]
Nome=Boquira
UF=BA
Provedor=PadraoNacional

[2904209]
Nome=Botupora
UF=BA
Provedor=PadraoNacional

[2904308]
Nome=Brejoes
UF=BA
Provedor=PadraoNacional

[2904407]
Nome=Brejolandia
UF=BA
Provedor=PadraoNacional

[2904506]
Nome=Brotas de Macaubas
UF=BA
Provedor=PadraoNacional

[2904605]
Nome=Brumado
UF=BA
Provedor=PadraoNacional

[2904704]
Nome=Buerarema
UF=BA
Provedor=PadraoNacional

[2904753]
Nome=Buritirama
UF=BA
Provedor=PadraoNacional

[2904803]
Nome=Caatiba
UF=BA
Provedor=PadraoNacional

[2904852]
Nome=Cabaceiras do Paraguacu
UF=BA
Provedor=PadraoNacional

[2904902]
Nome=Cachoeira
UF=BA
Provedor=PadraoNacional

[2905008]
Nome=Cacule
UF=BA
Provedor=PadraoNacional

[2905107]
Nome=Caem
UF=BA
Provedor=PadraoNacional

[2905156]
Nome=Caetanos
UF=BA
Provedor=PadraoNacional

[2905206]
Nome=Caetite
UF=BA
Provedor=PadraoNacional

[2905305]
Nome=Cafarnaum
UF=BA
Provedor=PadraoNacional

[2905404]
Nome=Cairu
UF=BA
Provedor=PadraoNacional

[2905503]
Nome=Caldeirao Grande
UF=BA
Provedor=PadraoNacional

[2905602]
Nome=Camacan
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://camacan.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-camacan.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://camacan.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://camacan.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2905701]
Nome=Camacari
UF=BA
Provedor=PadraoNacional

[2905800]
Nome=Camamu
UF=BA
Provedor=PadraoNacional

[2905909]
Nome=Campo Alegre de Lourdes
UF=BA
Provedor=PadraoNacional

[2906006]
Nome=Campo Formoso
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://campoformoso.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-campoformoso.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://campoformoso.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://campoformoso.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2906105]
Nome=Canapolis
UF=BA
Provedor=PadraoNacional

[2906204]
Nome=Canarana
UF=BA
Provedor=PadraoNacional

[2906303]
Nome=Canavieiras
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://canavieiras.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-canavieiras.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://canavieiras.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://canavieiras.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2906402]
Nome=Candeal
UF=BA
Provedor=PadraoNacional

[2906501]
Nome=Candeias
UF=BA
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://www4.webiss.com.br/candeiasba_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/candeiasba_wsnfse_homolog/NfseServices.svc

[2906600]
Nome=Candiba
UF=BA
Provedor=PadraoNacional

[2906709]
Nome=Candido Sales
UF=BA
Provedor=PadraoNacional

[2906808]
Nome=Cansancao
UF=BA
Provedor=PadraoNacional

[2906824]
Nome=Canudos
UF=BA
Provedor=PadraoNacional

[2906857]
Nome=Capela do Alto Alegre
UF=BA
Provedor=PadraoNacional

[2906873]
Nome=Capim Grosso
UF=BA
Provedor=PadraoNacional

[2906899]
Nome=Caraibas
UF=BA
Provedor=PadraoNacional

[2906907]
Nome=Caravelas
UF=BA
Provedor=PadraoNacional

[2907004]
Nome=Cardeal da Silva
UF=BA
Provedor=PadraoNacional

[2907103]
Nome=Carinhanha
UF=BA
Provedor=PadraoNacional

[2907202]
Nome=Casa Nova
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://casanova.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-casanova.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://casanova.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://casanova.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2907301]
Nome=Castro Alves
UF=BA
Provedor=Betha

[2907400]
Nome=Catolandia
UF=BA
Provedor=PadraoNacional

[2907509]
Nome=Catu
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://catu.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-catu.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://catu.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://catu.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2907558]
Nome=Caturama
UF=BA
Provedor=PadraoNacional

[2907608]
Nome=Central
UF=BA
Provedor=PadraoNacional

[2907707]
Nome=Chorrocho
UF=BA
Provedor=PadraoNacional

[2907806]
Nome=Cicero Dantas
UF=BA
Provedor=PadraoNacional

[2907905]
Nome=Cipo
UF=BA
Provedor=PadraoNacional

[2908002]
Nome=Coaraci
UF=BA
Provedor=PadraoNacional

[2908101]
Nome=Cocos
UF=BA
Provedor=PadraoNacional

[2908200]
Nome=Conceicao da Feira
UF=BA
Provedor=PadraoNacional

[2908309]
Nome=Conceicao do Almeida
UF=BA
Provedor=PadraoNacional

[2908408]
Nome=Conceicao do Coite
UF=BA
Provedor=PadraoNacional

[2908507]
Nome=Conceicao do Jacuipe
UF=BA
Provedor=PadraoNacional

[2908606]
Nome=Conde
UF=BA
Provedor=PadraoNacional

[2908705]
Nome=Condeuba
UF=BA
Provedor=PadraoNacional

[2908804]
Nome=Contendas do Sincora
UF=BA
Provedor=PadraoNacional

[2908903]
Nome=Coracao de Maria
UF=BA
Provedor=PadraoNacional

[2909000]
Nome=Cordeiros
UF=BA
Provedor=PadraoNacional

[2909109]
Nome=Coribe
UF=BA
Provedor=PadraoNacional

[2909208]
Nome=Coronel Joao Sa
UF=BA
Provedor=PadraoNacional

[2909307]
Nome=Correntina
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://correntina.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-correntina.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://correntina.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://correntina.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2909406]
Nome=Cotegipe
UF=BA
Provedor=PadraoNacional

[2909505]
Nome=Cravolandia
UF=BA
Provedor=PadraoNacional

[2909604]
Nome=Crisopolis
UF=BA
Provedor=PadraoNacional

[2909703]
Nome=Cristopolis
UF=BA
Provedor=PadraoNacional

[2909802]
; Inclu�do em 21/06/2022
Nome=Cruz Das Almas
UF=BA
Provedor=Fisco
Versao=2.03
ProRecepcionar=https://www.fisco.net.br/wsnfseabrasf/ServicosNFSEAbrasf.asmx

[2909901]
Nome=Curaca
UF=BA
Provedor=PadraoNacional

[2910008]
Nome=Dario Meira
UF=BA
Provedor=PadraoNacional

[2910057]
Nome=Dias D Avila
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://diasdavila.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-diasdavila.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://diasdavila.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://diasdavila.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2910107]
Nome=Dom Basilio
UF=BA
Provedor=PadraoNacional

[2910206]
Nome=Dom Macedo Costa
UF=BA
Provedor=PadraoNacional

[2910305]
Nome=Elisio Medrado
UF=BA
Provedor=PadraoNacional

[2910404]
Nome=Encruzilhada
UF=BA
Provedor=PadraoNacional

[2910503]
Nome=Entre Rios
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://entrerios.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-entrerios.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://entrerios.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://entrerios.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2910602]
Nome=Esplanada
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://esplanada.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-esplanada.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://esplanada.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://esplanada.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2910701]
Nome=Euclides da Cunha
UF=BA
Provedor=PadraoNacional

[2910727]
Nome=Eunapolis
UF=BA
Provedor=ISSIntel
ProNameSpace=http://eunapolis-ba.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://eunapolis-ba.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://eunapolis-ba.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://eunapolis-ba.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://eunapolis-ba.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://eunapolis-ba.treino-issintel.com.br/webservices/abrasf/api/

[2910750]
Nome=Fatima
UF=BA
Provedor=PadraoNacional

[2910776]
Nome=Feira da Mata
UF=BA
Provedor=PadraoNacional

[2910800]
; Atualizado em 15/09/2022
Nome=Feira de Santana
UF=BA
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://feiradesantanaba.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://feiradesantanaba.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[2910859]
Nome=Filadelfia
UF=BA
Provedor=PadraoNacional

[2910909]
Nome=Firmino Alves
UF=BA
Provedor=PadraoNacional

[2911006]
Nome=Floresta Azul
UF=BA
Provedor=PadraoNacional

[2911105]
Nome=Formosa do Rio Preto
UF=BA
Provedor=PadraoNacional

[2911204]
Nome=Gandu
UF=BA
Provedor=PadraoNacional

[2911253]
Nome=Gaviao
UF=BA
Provedor=PadraoNacional

[2911303]
Nome=Gentio do Ouro
UF=BA
Provedor=PadraoNacional

[2911402]
Nome=Gloria
UF=BA
Provedor=PadraoNacional

[2911501]
Nome=Gongogi
UF=BA
Provedor=PadraoNacional

[2911600]
Nome=Governador Mangabeira
UF=BA
Provedor=PadraoNacional

[2911659]
Nome=Guajeru
UF=BA
Provedor=PadraoNacional

[2911709]
Nome=Guanambi
UF=BA
Provedor=ISSIntel
ProNameSpace=http://guanambi-ba.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://guanambi-ba.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://guanambi-ba.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://guanambi-ba.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://guanambi-ba.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://guanambi-ba.treino-issintel.com.br/webservices/abrasf/api/

[2911808]
Nome=Guaratinga
UF=BA
Provedor=PadraoNacional

[2911857]
Nome=Heliopolis
UF=BA
Provedor=PadraoNacional

[2911907]
Nome=Iacu
UF=BA
Provedor=PadraoNacional

[2912004]
Nome=Ibiassuce
UF=BA
Provedor=PadraoNacional

[2912103]
Nome=Ibicarai
UF=BA
Provedor=PadraoNacional

[2912202]
Nome=Ibicoara
UF=BA
Provedor=PadraoNacional

[2912301]
Nome=Ibicui
UF=BA
Provedor=PadraoNacional

[2912400]
Nome=Ibipeba
UF=BA
Provedor=PadraoNacional

[2912509]
Nome=Ibipitanga
UF=BA
Provedor=PadraoNacional

[2912608]
Nome=Ibiquera
UF=BA
Provedor=PadraoNacional

[2912707]
Nome=Ibirapitanga
UF=BA
Provedor=PadraoNacional

[2912806]
Nome=Ibirapua
UF=BA
Provedor=PadraoNacional

[2912905]
Nome=Ibirataia
UF=BA
Provedor=PadraoNacional

[2913002]
Nome=Ibitiara
UF=BA
Provedor=PadraoNacional

[2913101]
Nome=Ibitita
UF=BA
Provedor=PadraoNacional

[2913200]
Nome=Ibotirama
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://ibotirama.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-ibotirama.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://ibotirama.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://ibotirama.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2913309]
Nome=Ichu
UF=BA
Provedor=PadraoNacional

[2913408]
Nome=Igapora
UF=BA
Provedor=PadraoNacional

[2913457]
Nome=Igrapiuna
UF=BA
Provedor=PadraoNacional

[2913507]
Nome=Iguai
UF=BA
Provedor=PadraoNacional

[2913606]
; Inclu�do em 28/10/2022
Nome=Ilheus
UF=BA
Provedor=MetropolisWeb
ProRecepcionar=http://ilheus.metropolisweb.com.br:9091/webservicenfse/nfse/services
HomRecepcionar=http://ilheus.metropolisweb.com.br:9091/webservicenfsehomologa/nfse/services

[2913705]
Nome=Inhambupe
UF=BA
Provedor=PadraoNacional

[2913804]
Nome=Ipecaeta
UF=BA
Provedor=PadraoNacional

[2913903]
Nome=Ipiau
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://ipiau.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-ipiau.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://ipiau.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://ipiau.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2914000]
Nome=Ipira
UF=BA
Provedor=PadraoNacional

[2914109]
Nome=Ipupiara
UF=BA
Provedor=PadraoNacional

[2914208]
Nome=Irajuba
UF=BA
Provedor=PadraoNacional

[2914307]
Nome=Iramaia
UF=BA
Provedor=PadraoNacional

[2914406]
Nome=Iraquara
UF=BA
Provedor=PadraoNacional

[2914505]
Nome=Irara
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://irara.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-irara.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://irara.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://irara.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2914604]
; Inclu�do em 29/11/2021
; Atualizado em 14/02/2022
Nome=Irece
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://irece.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-irece.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://irece.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://irece.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2914653]
Nome=Itabela
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://itabela.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-itabela.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://itabela.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://itabela.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2914703]
Nome=Itaberaba
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://itaberaba.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-itaberaba.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://itaberaba.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://itaberaba.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2914802]
Nome=Itabuna
UF=BA
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://itabunaba.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://itabunaba.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[2914901]
Nome=Itacare
UF=BA
Provedor=PadraoNacional

[2915007]
Nome=Itaete
UF=BA
Provedor=Betha

[2915106]
Nome=Itagi
UF=BA
Provedor=Betha

[2915205]
Nome=Itagiba
UF=BA
Provedor=PadraoNacional

[2915304]
Nome=Itagimirim
UF=BA
Provedor=PadraoNacional

[2915353]
Nome=Itaguacu da Bahia
UF=BA
Provedor=PadraoNacional

[2915403]
Nome=Itaju do Colonia
UF=BA
Provedor=PadraoNacional

[2915502]
Nome=Itajuipe
UF=BA
Provedor=PadraoNacional

[2915601]
Nome=Itamaraju
UF=BA
Provedor=PadraoNacional

[2915700]
Nome=Itamari
UF=BA
Provedor=PadraoNacional

[2915809]
Nome=Itambe
UF=BA
Provedor=PadraoNacional

[2915908]
Nome=Itanagra
UF=BA
Provedor=PadraoNacional

[2916005]
Nome=Itanhem
UF=BA
Provedor=PadraoNacional

[2916104]
Nome=Itaparica
UF=BA
Provedor=PadraoNacional

[2916203]
Nome=Itape
UF=BA
Provedor=PadraoNacional

[2916302]
Nome=Itapebi
UF=BA
Provedor=PadraoNacional

[2916401]
Nome=Itapetinga
UF=BA
Provedor=WebISS
ProRecepcionar=https://www5.webiss.com.br/itapetingaba_wsnfse/NfseServices.svc
HomRecepcionar=https://www5.webiss.com.br/itapetingaba_wsnfse_homolog/NfseServices.svc

[2916500]
Nome=Itapicuru
UF=BA
Provedor=PadraoNacional

[2916609]
Nome=Itapitanga
UF=BA
Provedor=PadraoNacional

[2916708]
Nome=Itaquara
UF=BA
Provedor=PadraoNacional

[2916807]
Nome=Itarantim
UF=BA
Provedor=PadraoNacional

[2916856]
Nome=Itatim
UF=BA
Provedor=PadraoNacional

[2916906]
Nome=Itirucu
UF=BA
Provedor=PadraoNacional

[2917003]
Nome=Itiuba
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://itiuba.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-itiuba.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://itiuba.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://itiuba.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2917102]
Nome=Itororo
UF=BA
Provedor=PadraoNacional

[2917201]
Nome=Ituacu
UF=BA
Provedor=PadraoNacional

[2917300]
Nome=Itubera
UF=BA
Provedor=PadraoNacional

[2917334]
Nome=Iuiu
UF=BA
Provedor=PadraoNacional

[2917359]
Nome=Jaborandi
UF=BA
Provedor=PadraoNacional

[2917409]
Nome=Jacaraci
UF=BA
Provedor=PadraoNacional

[2917508]
Nome=Jacobina
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://jacobina.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-jacobina.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://jacobina.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://jacobina.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2917607]
Nome=Jaguaquara
UF=BA
Provedor=Betha

[2917706]
Nome=Jaguarari
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://jaguarari.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-jaguarari.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://jaguarari.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://jaguarari.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2917805]
Nome=Jaguaripe
UF=BA
Provedor=PadraoNacional

[2917904]
Nome=Jandaira
UF=BA
Provedor=PadraoNacional

[2918001]
Nome=Jequie
UF=BA
Provedor=PadraoNacional

[2918100]
Nome=Jeremoabo
UF=BA
Provedor=PadraoNacional

[2918209]
Nome=Jiquirica
UF=BA
Provedor=PadraoNacional

[2918308]
Nome=Jitauna
UF=BA
Provedor=PadraoNacional

[2918357]
Nome=Joao Dourado
UF=BA
Provedor=PadraoNacional

[2918407]
Nome=Juazeiro
UF=BA
Provedor=MetropolisWeb
ProRecepcionar=http://issjuazeiro.metropolisweb.com.br:9090/webservicenfse/nfse/services
HomRecepcionar=http://issjuazeiro.metropolisweb.com.br:9090/webservicenfsehomologa/nfse/services

[2918456]
Nome=Jucurucu
UF=BA
Provedor=PadraoNacional

[2918506]
Nome=Jussara
UF=BA
Provedor=PadraoNacional

[2918555]
Nome=Jussari
UF=BA
Provedor=PadraoNacional

[2918605]
Nome=Jussiape
UF=BA
Provedor=PadraoNacional

[2918704]
Nome=Lafaiete Coutinho
UF=BA
Provedor=PadraoNacional

[2918753]
Nome=Lagoa Real
UF=BA
Provedor=PadraoNacional

[2918803]
Nome=Laje
UF=BA
Provedor=PadraoNacional

[2918902]
Nome=Lajedao
UF=BA
Provedor=PadraoNacional

[2919009]
Nome=Lajedinho
UF=BA
Provedor=PadraoNacional

[2919058]
Nome=Lajedo do Tabocal
UF=BA
Provedor=PadraoNacional

[2919108]
Nome=Lamarao
UF=BA
Provedor=PadraoNacional

[2919157]
Nome=Lapao
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://lapao.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-lapao.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://lapao.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://lapao.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2919207]
Nome=Lauro de Freitas
UF=BA
Provedor=MetropolisWeb
ProRecepcionar=http://lftributos.metropolisweb.com.br:9090/webservicenfse/nfse/services
HomRecepcionar=http://lftributos.metropolisweb.com.br:9090/webservicenfsehomologa/nfse/services

[2919306]
Nome=Lencois
UF=BA
Provedor=Betha

[2919405]
Nome=Licinio de Almeida
UF=BA
Provedor=PadraoNacional

[2919504]
Nome=Livramento de Nossa Senhora
UF=BA
Provedor=PadraoNacional

[2919553]
; Atualizado em 14/12/2021
Nome=Luiz Eduardo Magalhaes
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://luiseduardomagalhaes.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-luiseduardomagalhaes.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://luiseduardomagalhaes.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://luiseduardomagalhaes.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2919603]
Nome=Macajuba
UF=BA
Provedor=PadraoNacional

[2919702]
Nome=Macarani
UF=BA
Provedor=PadraoNacional

[2919801]
Nome=Macaubas
UF=BA
Provedor=PadraoNacional

[2919900]
Nome=Macurure
UF=BA
Provedor=PadraoNacional

[2919926]
Nome=Madre de Deus
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://madre.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-madre.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://madre.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://madre.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2919959]
Nome=Maetinga
UF=BA
Provedor=PadraoNacional

[2920007]
Nome=Maiquinique
UF=BA
Provedor=PadraoNacional

[2920106]
Nome=Mairi
UF=BA
Provedor=PadraoNacional

[2920205]
Nome=Malhada
UF=BA
Provedor=PadraoNacional

[2920304]
Nome=Malhada de Pedras
UF=BA
Provedor=PadraoNacional

[2920403]
Nome=Manoel Vitorino
UF=BA
Provedor=PadraoNacional

[2920452]
Nome=Mansidao
UF=BA
Provedor=PadraoNacional

[2920502]
Nome=Maracas
UF=BA
Provedor=Betha

[2920601]
Nome=Maragogipe
UF=BA
Provedor=PadraoNacional

[2920700]
Nome=Marau
UF=BA
Provedor=PadraoNacional

[2920809]
Nome=Marcionilio Souza
UF=BA
Provedor=PadraoNacional

[2920908]
Nome=Mascote
UF=BA
Provedor=PadraoNacional

[2921005]
Nome=Mata de Sao Joao
UF=BA
Provedor=PadraoNacional

[2921054]
Nome=Matina
UF=BA
Provedor=PadraoNacional

[2921104]
Nome=Medeiros Neto
UF=BA
Provedor=PadraoNacional

[2921203]
Nome=Miguel Calmon
UF=BA
Provedor=PadraoNacional

[2921302]
Nome=Milagres
UF=BA
Provedor=PadraoNacional

[2921401]
Nome=Mirangaba
UF=BA
Provedor=PadraoNacional

[2921450]
Nome=Mirante
UF=BA
Provedor=PadraoNacional

[2921500]
Nome=Monte Santo
UF=BA
Provedor=PadraoNacional

[2921609]
Nome=Morpara
UF=BA
Provedor=PadraoNacional

[2921708]
Nome=Morro do Chapeu
UF=BA
Provedor=PadraoNacional

[2921807]
Nome=Mortugaba
UF=BA
Provedor=PadraoNacional

[2921906]
Nome=Mucuge
UF=BA
Provedor=PadraoNacional

[2922003]
Nome=Mucuri
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://mucuri.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-mucuri.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://mucuri.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://mucuri.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2922052]
Nome=Mulungu do Morro
UF=BA
Provedor=PadraoNacional

[2922102]
Nome=Mundo Novo
UF=BA
Provedor=PadraoNacional

[2922201]
Nome=Muniz Ferreira
UF=BA
Provedor=PadraoNacional

[2922250]
Nome=Muquem de Sao Francisco
UF=BA
Provedor=PadraoNacional

[2922300]
Nome=Muritiba
UF=BA
Provedor=PadraoNacional

[2922409]
Nome=Mutuipe
UF=BA
Provedor=PadraoNacional

[2922508]
Nome=Nazare
UF=BA
Provedor=PadraoNacional

[2922607]
Nome=Nilo Pecanha
UF=BA
Provedor=PadraoNacional

[2922656]
Nome=Nordestina
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://nordestina.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-nordestina.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://nordestina.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://nordestina.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2922706]
Nome=Nova Canaa
UF=BA
Provedor=PadraoNacional

[2922730]
Nome=Nova Fatima
UF=BA
Provedor=PadraoNacional

[2922755]
Nome=Nova Ibia
UF=BA
Provedor=PadraoNacional

[2922805]
Nome=Nova Itarana
UF=BA
Provedor=PadraoNacional

[2922854]
Nome=Nova Redencao
UF=BA
Provedor=PadraoNacional

[2922904]
Nome=Nova Soure
UF=BA
Provedor=PadraoNacional

[2923001]
Nome=Nova Vicosa
UF=BA
Provedor=Betha

[2923035]
Nome=Novo Horizonte
UF=BA
Provedor=PadraoNacional

[2923050]
Nome=Novo Triunfo
UF=BA
Provedor=PadraoNacional

[2923100]
Nome=Olindina
UF=BA
Provedor=PadraoNacional

[2923209]
Nome=Oliveira Dos Brejinhos
UF=BA
Provedor=PadraoNacional

[2923308]
Nome=Ouricangas
UF=BA
Provedor=PadraoNacional

[2923357]
Nome=Ourolandia
UF=BA
Provedor=PadraoNacional

[2923407]
Nome=Palmas de Monte Alto
UF=BA
Provedor=PadraoNacional

[2923506]
Nome=Palmeiras
UF=BA
Provedor=PadraoNacional

[2923605]
Nome=Paramirim
UF=BA
Provedor=PadraoNacional

[2923704]
Nome=Paratinga
UF=BA
Provedor=PadraoNacional

[2923803]
Nome=Paripiranga
UF=BA
Provedor=PadraoNacional

[2923902]
Nome=Pau Brasil
UF=BA
Provedor=PadraoNacional

[2924009]
Nome=Paulo Afonso
UF=BA
Provedor=PadraoNacional

[2924058]
Nome=Pe de Serra
UF=BA
Provedor=PadraoNacional

[2924108]
Nome=Pedrao
UF=BA
Provedor=PadraoNacional

[2924207]
Nome=Pedro Alexandre
UF=BA
Provedor=PadraoNacional

[2924306]
Nome=Piata
UF=BA
Provedor=PadraoNacional

[2924405]
Nome=Pilao Arcado
UF=BA
Provedor=PadraoNacional

[2924504]
Nome=Pindai
UF=BA
Provedor=Betha

[2924603]
Nome=Pindobacu
UF=BA
Provedor=PadraoNacional

[2924652]
Nome=Pintadas
UF=BA
Provedor=PadraoNacional

[2924678]
Nome=Pirai do Norte
UF=BA
Provedor=PadraoNacional

[2924702]
Nome=Piripa
UF=BA
Provedor=PadraoNacional

[2924801]
; Inclu�do em 10/10/2022
Nome=Piritiba
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://piritiba.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-piritiba.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://piritiba.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://piritiba.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2924900]
Nome=Planaltino
UF=BA
Provedor=PadraoNacional

[2925006]
Nome=Planalto
UF=BA
Provedor=PadraoNacional

[2925105]
Nome=Pocoes
UF=BA
Provedor=PadraoNacional

[2925204]
Nome=Pojuca
UF=BA
Provedor=WebISS
ProRecepcionar=https://www.webiss.com.br/bapojuca_wsnfse/NfseServices.svc
HomRecepcionar=https://www.webiss.com.br/bapojuca_wsnfse_homolog/NfseServices.svc

[2925253]
Nome=Ponto Novo
UF=BA
Provedor=PadraoNacional

[2925303]
; Atualizado em 30/03/2022
Nome=Porto Seguro
UF=BA
Provedor=ISSIntel
ProNameSpace=http://portoseguro-ba.issintegra.com.br/webservices/abrasf/api
HomNameSpace=http://portoseguro-ba.treino-issintegra.com.br/webservices/abrasf/api
;
ProRecepcionar=https://portoseguro-ba.issintegra.com.br/webservices/abrasf/api
HomRecepcionar=https://portoseguro-ba.treino-issintegra.com.br/webservices/abrasf/api
;
ProSoapAction=http://portoseguro-ba.issintegra.com.br/webservices/abrasf/api/
HomSoapAction=http://portoseguro-ba.treino-issintegra.com.br/webservices/abrasf/api/

[2925402]
Nome=Potiragua
UF=BA
Provedor=PadraoNacional

[2925501]
; Inclu�do em 26/05/2022
Nome=Prado
UF=BA
Provedor=EL
Versao=2.04
ProRecepcionar=https://ba-prado-pm-nfs-backend.cloud.el.com.br/producao05/NfseWSService

[2925600]
Nome=Presidente Dutra
UF=BA
Provedor=PadraoNacional

[2925709]
Nome=Presidente Janio Quadros
UF=BA
Provedor=PadraoNacional

[2925758]
Nome=Presidente Tancredo Neves
UF=BA
Provedor=PadraoNacional

[2925808]
Nome=Queimadas
UF=BA
Provedor=PadraoNacional

[2925907]
Nome=Quijingue
UF=BA
Provedor=PadraoNacional

[2925931]
Nome=Quixabeira
UF=BA
Provedor=PadraoNacional

[2925956]
Nome=Rafael Jambeiro
UF=BA
Provedor=PadraoNacional

[2926004]
Nome=Remanso
UF=BA
Provedor=PadraoNacional

[2926103]
Nome=Retirolandia
UF=BA
Provedor=PadraoNacional

[2926202]
Nome=Riachao das Neves
UF=BA
Provedor=PadraoNacional

[2926301]
Nome=Riachao do Jacuipe
UF=BA
Provedor=PadraoNacional

[2926400]
Nome=Riacho de Santana
UF=BA
Provedor=PadraoNacional

[2926509]
Nome=Ribeira do Amparo
UF=BA
Provedor=PadraoNacional

[2926608]
Nome=Ribeira do Pombal
UF=BA
Provedor=PadraoNacional

[2926657]
Nome=Ribeirao do Largo
UF=BA
Provedor=PadraoNacional

[2926707]
Nome=Rio de Contas
UF=BA
Provedor=PadraoNacional

[2926806]
Nome=Rio do Antonio
UF=BA
Provedor=PadraoNacional

[2926905]
Nome=Rio do Pires
UF=BA
Provedor=PadraoNacional

[2927002]
Nome=Rio Real
UF=BA
Provedor=PadraoNacional

[2927101]
Nome=Rodelas
UF=BA
Provedor=PadraoNacional

[2927200]
Nome=Ruy Barbosa
UF=BA
Provedor=PadraoNacional

[2927309]
Nome=Salinas da Margarida
UF=BA
Provedor=PadraoNacional

[2927408]
Nome=Salvador
UF=BA
Provedor=ISSSalvador
ProRecepcionar=https://nfse.salvador.ba.gov.br/rps/ENVIOLOTERPS/EnvioLoteRPS.svc
ProConsultarSituacao=https://nfse.salvador.ba.gov.br/rps/CONSULTASITUACAOLOTERPS/ConsultaSituacaoLoteRPS.svc
ProConsultarLote=https://nfse.salvador.ba.gov.br/rps/CONSULTALOTERPS/ConsultaLoteRPS.svc
ProConsultarNFSeRps=https://nfse.salvador.ba.gov.br/rps/CONSULTANFSERPS/ConsultaNfseRPS.svc
ProConsultarNFSe=https://nfse.salvador.ba.gov.br/rps/CONSULTANFSE/ConsultaNfse.svc
;
HomRecepcionar=https://notahml.salvador.ba.gov.br/rps/ENVIOLOTERPS/EnvioLoteRPS.svc
HomConsultarSituacao=https://notahml.salvador.ba.gov.br/rps/CONSULTASITUACAOLOTERPS/ConsultaSituacaoLoteRPS.svc
HomConsultarLote=https://notahml.salvador.ba.gov.br/rps/CONSULTALOTERPS/ConsultaLoteRPS.svc
HomConsultarNFSeRps=https://notahml.salvador.ba.gov.br/rps/CONSULTANFSERPS/ConsultaNfseRPS.svc
HomConsultarNFSe=https://notahml.salvador.ba.gov.br/rps/CONSULTANFSE/ConsultaNfse.svc

[2927507]
Nome=Santa Barbara
UF=BA
Provedor=PadraoNacional

[2927606]
Nome=Santa Brigida
UF=BA
Provedor=PadraoNacional

[2927705]
Nome=Santa Cruz Cabralia
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://santacruzcabralia.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-santacruzcabralia.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://santacruzcabralia.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://santacruzcabralia.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2927804]
Nome=Santa Cruz da Vitoria
UF=BA
Provedor=PadraoNacional

[2927903]
Nome=Santa Ines
UF=BA
Provedor=PadraoNacional

[2928000]
Nome=Santaluz
UF=BA
Provedor=PadraoNacional

[2928059]
Nome=Santa Luzia
UF=BA
Provedor=PadraoNacional

[2928109]
Nome=Santa Maria da Vitoria
UF=BA
Provedor=PadraoNacional

[2928208]
Nome=Santana
UF=BA
Provedor=PadraoNacional

[2928307]
Nome=Santanopolis
UF=BA
Provedor=PadraoNacional

[2928406]
Nome=Santa Rita de Cassia
UF=BA
Provedor=PadraoNacional

[2928505]
Nome=Santa Teresinha
UF=BA
Provedor=PadraoNacional

[2928604]
Nome=Santo Amaro
UF=BA
Provedor=PadraoNacional

[2928703]
Nome=Santo Antonio de Jesus
UF=BA
Provedor=PadraoNacional

[2928802]
Nome=Santo Estevao
UF=BA
Provedor=PadraoNacional

[2928901]
Nome=Sao Desiderio
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://saodesiderio.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-saodesiderio.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://saodesiderio.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://saodesiderio.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2928950]
Nome=Sao Domingos
UF=BA
Provedor=PadraoNacional

[2929008]
Nome=Sao Felix
UF=BA
Provedor=PadraoNacional

[2929057]
Nome=Sao Felix do Coribe
UF=BA
Provedor=PadraoNacional

[2929107]
Nome=Sao Felipe
UF=BA
Provedor=PadraoNacional

[2929206]
Nome=Sao Francisco do Conde
UF=BA
Provedor=PadraoNacional

[2929255]
Nome=Sao Gabriel
UF=BA
Provedor=PadraoNacional

[2929305]
Nome=Sao Goncalo Dos Campos
UF=BA
Provedor=PadraoNacional

[2929354]
Nome=Sao Jose da Vitoria
UF=BA
Provedor=PadraoNacional

[2929370]
Nome=Sao Jose do Jacuipe
UF=BA
Provedor=PadraoNacional

[2929404]
Nome=Sao Miguel das Matas
UF=BA
Provedor=PadraoNacional

[2929503]
Nome=Sao Sebastiao do Passe
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://saosebastiaodopasse.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-saosebastiaodopasse.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://saosebastiaodopasse.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://saosebastiaodopasse.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2929602]
Nome=Sapeacu
UF=BA
Provedor=PadraoNacional

[2929701]
Nome=Satiro Dias
UF=BA
Provedor=PadraoNacional

[2929750]
Nome=Saubara
UF=BA
Provedor=PadraoNacional

[2929800]
Nome=Saude
UF=BA
Provedor=PadraoNacional

[2929909]
Nome=Seabra
UF=BA
Provedor=PadraoNacional

[2930006]
Nome=Sebastiao Laranjeiras
UF=BA
Provedor=PadraoNacional

[2930105]
; Atualizado em 01/02/2022
Nome=Senhor do Bonfim
UF=BA
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://senhordobonfimba.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://senhordobonfimba.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[2930154]
Nome=Serra do Ramalho
UF=BA
Provedor=PadraoNacional

[2930204]
Nome=Sento Se
UF=BA
Provedor=PadraoNacional

[2930303]
Nome=Serra Dourada
UF=BA
Provedor=PadraoNacional

[2930402]
Nome=Serra Preta
UF=BA
Provedor=PadraoNacional

[2930501]
Nome=Serrinha
UF=BA
Provedor=PadraoNacional

[2930600]
Nome=Serrolandia
UF=BA
Provedor=PadraoNacional

[2930709]
Nome=Simoes Filho
UF=BA
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://simoesfilhoba.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://simoesfilhoba.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[2930758]
Nome=Sitio do Mato
UF=BA
Provedor=PadraoNacional

[2930766]
Nome=Sitio do Quinto
UF=BA
Provedor=PadraoNacional

[2930774]
Nome=Sobradinho
UF=BA
Provedor=PadraoNacional

[2930808]
Nome=Souto Soares
UF=BA
Provedor=PadraoNacional

[2930907]
Nome=Tabocas do Brejo Velho
UF=BA
Provedor=PadraoNacional

[2931004]
Nome=Tanhacu
UF=BA
Provedor=PadraoNacional

[2931053]
Nome=Tanque Novo
UF=BA
Provedor=PadraoNacional

[2931103]
Nome=Tanquinho
UF=BA
Provedor=PadraoNacional

[2931202]
Nome=Taperoa
UF=BA
Provedor=PadraoNacional

[2931301]
Nome=Tapiramuta
UF=BA
Provedor=PadraoNacional

[2931350]
Nome=Teixeira de Freitas
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://teixeiradefreitas.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-teixeiradefreitas.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://teixeiradefreitas.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://teixeiradefreitas.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2931400]
Nome=Teodoro Sampaio
UF=BA
Provedor=PadraoNacional

[2931509]
Nome=Teofilandia
UF=BA
Provedor=PadraoNacional

[2931608]
Nome=Teolandia
UF=BA
Provedor=PadraoNacional

[2931707]
Nome=Terra Nova
UF=BA
Provedor=PadraoNacional

[2931806]
Nome=Tremedal
UF=BA
Provedor=PadraoNacional

[2931905]
Nome=Tucano
UF=BA
Provedor=PadraoNacional

[2932002]
Nome=Uaua
UF=BA
Provedor=PadraoNacional

[2932101]
Nome=Ubaira
UF=BA
Provedor=PadraoNacional

[2932200]
Nome=Ubaitaba
UF=BA
Provedor=PadraoNacional

[2932309]
Nome=Ubata
UF=BA
Provedor=PadraoNacional

[2932408]
Nome=Uibai
UF=BA
Provedor=PadraoNacional

[2932457]
Nome=Umburanas
UF=BA
Provedor=PadraoNacional

[2932507]
Nome=Una
UF=BA
Provedor=EL
ProRecepcionar=https://ba-una-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://ba-una-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://ba-una-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[2932606]
Nome=Urandi
UF=BA
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/urandiba_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/urandiba_wsnfse_homolog/NfseServices.svc

[2932705]
Nome=Urucuca
UF=BA
Provedor=PadraoNacional

[2932804]
Nome=Utinga
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://utinga.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-utinga.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://utinga.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://utinga.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2932903]
Nome=Valenca
UF=BA
Provedor=PadraoNacional

[2933000]
Nome=Valente
UF=BA
Provedor=PadraoNacional

[2933059]
Nome=Varzea da Roca
UF=BA
Provedor=PadraoNacional

[2933109]
Nome=Varzea do Poco
UF=BA
Provedor=PadraoNacional

[2933158]
Nome=Varzea Nova
UF=BA
Provedor=PadraoNacional

[2933174]
Nome=Varzedo
UF=BA
Provedor=PadraoNacional

[2933208]
Nome=Vera Cruz
UF=BA
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://veracruz.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-veracruz.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://veracruz.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://veracruz.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[2933257]
Nome=Vereda
UF=BA
Provedor=PadraoNacional

[2933307]
; Atualizado em 30/06/2022
Nome=Vitoria da Conquista
UF=BA
Provedor=EL
Versao=2.04
ProRecepcionar=https://nfe.pmvc.ba.gov.br/el-nfse/NfseWSService
HomRecepcionar=

[2933406]
Nome=Wagner
UF=BA
Provedor=PadraoNacional

[2933455]
Nome=Wanderley
UF=BA
Provedor=PadraoNacional

[2933505]
Nome=Wenceslau Guimaraes
UF=BA
Provedor=PadraoNacional

[2933604]
Nome=Xique-Xique
UF=BA
Provedor=PadraoNacional

[3100104]
Nome=Abadia Dos Dourados
UF=MG
Provedor=PadraoNacional

[3100203]
Nome=Abaete
UF=MG
Provedor=PadraoNacional

[3100302]
Nome=Abre Campo
UF=MG
Provedor=PadraoNacional

[3100401]
Nome=Acaiaca
UF=MG
Provedor=PadraoNacional

[3100500]
Nome=Acucena
UF=MG
Provedor=PadraoNacional

[3100609]
Nome=Agua Boa
UF=MG
Provedor=PadraoNacional

[3100708]
Nome=Agua Comprida
UF=MG
Provedor=PadraoNacional

[3100807]
Nome=Aguanil
UF=MG
Provedor=PadraoNacional

[3100906]
Nome=Aguas Formosas
UF=MG
Provedor=PadraoNacional

[3101003]
Nome=Aguas Vermelhas
UF=MG
Provedor=PadraoNacional

[3101102]
Nome=Aimores
UF=MG
Provedor=PadraoNacional

[3101201]
Nome=Aiuruoca
UF=MG
Provedor=PadraoNacional

[3101300]
Nome=Alagoa
UF=MG
Provedor=PadraoNacional

[3101409]
; Inclu�do em 07/07/2022
Nome=Albertina
UF=MG
Provedor=Siappa
ProRecepcionar=https://app.siappa.com.br/issqn_albertina/servlet/com.issqnwebev3v2.aws_gera_nfse_token
ProConsultarNFSe=https://app.siappa.com.br/issqn_albertina/servlet/com.issqnwebev3v2.aws_consulta_nfse_token
ProCancelarNFSe=https://app.siappa.com.br/issqn_albertina/servlet/com.issqnwebev3v2.aws_cancela_nfse_token
ProGerarToken=https://app.siappa.com.br/issqn_albertina/servlet/com.issqnwebev3v2.aws_gera_token
;
HomRecepcionar=https://app.siappa.com.br/issqn_albertina/servlet/com.issqnwebev3v2.aws_gera_nfse_token
HomConsultarNFSe=https://app.siappa.com.br/issqn_albertina/servlet/com.issqnwebev3v2.aws_consulta_nfse_token
HomCancelarNFSe=https://app.siappa.com.br/issqn_albertina/servlet/com.issqnwebev3v2.aws_cancela_nfse_token
HomGerarToken=https://app.siappa.com.br/issqn_albertina/servlet/com.issqnwebev3v2.aws_gera_token

[3101508]
; Atualizado em 09/12/2021
Nome=Alem Paraiba
UF=MG
Provedor=Actcon
Versao=2.02
;
ProRecepcionar=https://nfse-mg-alemparaiba.portalfacil.com.br/nfseserv/webservice/servicos
HomRecepcionar=https://nfse-mg-alemparaiba.portalfacil.com.br/homologacao/webservice/servicos
;
ProXMLNameSpace=http://nfse-mg-alemparaiba.portalfacil.com.br/nfseserv/schema/nfse_v202.xsd
HomXMLNameSpace=http://nfse-mg-alemparaiba.portalfacil.com.br/homologacao/schema/nfse_v202.xsd
;
ProNameSpace=http://nfse-mg-alemparaiba.portalfacil.com.br/nfseserv/webservice/nfse.wsdl
HomNameSpace=http://nfse-mg-alemparaiba.portalfacil.com.br/homologacao/webservice/nfse.wsdl
;
ProSoapAction=http://nfse-mg-alemparaiba.portalfacil.com.br/nfseserv/webservice/servicos#
HomSoapAction=http://nfse-mg-alemparaiba.portalfacil.com.br/homologacao/webservice/servicos#

[3101607]
Nome=Alfenas
UF=MG
Provedor=Betha

[3101631]
Nome=Alfredo Vasconcelos
UF=MG
Provedor=PadraoNacional

[3101706]
Nome=Almenara
UF=MG
Provedor=PadraoNacional

[3101805]
Nome=Alpercata
UF=MG
Provedor=PadraoNacional

[3101904]
; Inclu�do em 01/10/2021
Nome=Alpinopolis
UF=MG
Provedor=eReceita
Versao=2.02
ProRecepcionar=https://webservice.ereceita.net.br/ws/alpinopolismg/wsProducao.php
HomRecepcionar=https://www3.ereceita.net.br/ereceita/rpp/ws/alpinopolismg/wsHomologacao.php
;
ProLinkURL=http://server21.alpinopolis.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true
HomLinkURL=http://server21.alpinopolis.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true

[3102001]
Nome=Alterosa
UF=MG
Provedor=Betha

[3102050]
Nome=Alto Caparao
UF=MG
Provedor=PadraoNacional

[3102100]
Nome=Alto Rio Doce
UF=MG
Provedor=PadraoNacional

[3102209]
Nome=Alvarenga
UF=MG
Provedor=PadraoNacional

[3102308]
Nome=Alvinopolis
UF=MG
Provedor=PadraoNacional

[3102407]
Nome=Alvorada de Minas
UF=MG
Provedor=PadraoNacional

[3102506]
Nome=Amparo do Serra
UF=MG
Provedor=PadraoNacional

[3102605]
Nome=Andradas
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/andradas
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/andradas

[3102704]
Nome=Cachoeira de Pajeu
UF=MG
Provedor=PadraoNacional

[3102803]
Nome=Andrelandia
UF=MG
Provedor=PadraoNacional

[3102852]
Nome=Angelandia
UF=MG
Provedor=PadraoNacional

[3102902]
Nome=Antonio Carlos
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://antoniocarlos.nfiss.com.br/soap/
;
ProLinkURL=https://antoniocarlos.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_antoniocarlos.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3103009]
Nome=Antonio Dias
UF=MG
Provedor=PadraoNacional

[3103108]
Nome=Antonio Prado de Minas
UF=MG
Provedor=PadraoNacional

[3103207]
Nome=Aracai
UF=MG
Provedor=PadraoNacional

[3103306]
Nome=Aracitaba
UF=MG
Provedor=PadraoNacional

[3103405]
; Atualizado em 29/12/2021
Nome=Aracuai
UF=MG
Provedor=Actcon
Versao=2.02
Params=DataEmissao:Date
;
ProRecepcionar=https://nfsearacuai.portalfacil.com.br/nfseserv/webservice/servicos
HomRecepcionar=http://nfsearacuai.portalfacil.com.br/homologacao/webservice/servicos
;
ProXMLNameSpace=http://nfsearacuai.portalfacil.com.br/nfseserv/schema/nfse_v202.xsd
HomXMLNameSpace=http://nfsearacuai.portalfacil.com.br/homologacao/schema/nfse_v202.xsd
;
ProNameSpace=http://nfsearacuai.portalfacil.com.br/nfseserv/webservice/nfse.wsdl
HomNameSpace=http://nfsearacuai.portalfacil.com.br/homologacao/webservice/nfse.wsdl
;
ProSoapAction=http://nfsearacuai.portalfacil.com.br/nfseserv/webservice/servicos#
HomSoapAction=http://nfsearacuai.portalfacil.com.br/homologacao/webservice/servicos#

[3103504]
Nome=Araguari
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/arag
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/arag

[3103603]
Nome=Arantina
UF=MG
Provedor=PadraoNacional

[3103702]
Nome=Araponga
UF=MG
Provedor=PadraoNacional

[3103751]
Nome=Arapora
UF=MG
Provedor=PadraoNacional

[3103801]
Nome=Arapua
UF=MG
Provedor=PadraoNacional

[3103900]
Nome=Araujos
UF=MG
Provedor=PadraoNacional

[3104007]
Nome=Araxa
UF=MG
Provedor=Governa
Params=VersaoArquivo:4|VersaoImpressao:5
;
ProRecepcionar=http://201.62.57.11:9090/WebServicearaxa/esiat.asmx

[3104106]
Nome=Arceburgo
UF=MG
Provedor=PadraoNacional

[3104205]
Nome=Arcos
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://arcosmg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://arcosmg.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3104304]
Nome=Areado
UF=MG
Provedor=PadraoNacional

[3104403]
Nome=Argirita
UF=MG
Provedor=PadraoNacional

[3104452]
Nome=Aricanduva
UF=MG
Provedor=PadraoNacional

[3104502]
Nome=Arinos
UF=MG
Provedor=PadraoNacional

[3104601]
Nome=Astolfo Dutra
UF=MG
Provedor=PadraoNacional

[3104700]
Nome=Ataleia
UF=MG
Provedor=PadraoNacional

[3104809]
Nome=Augusto de Lima
UF=MG
Provedor=PadraoNacional

[3104908]
Nome=Baependi
UF=MG
Provedor=PadraoNacional

[3105004]
Nome=Baldim
UF=MG
Provedor=PadraoNacional

[3105103]
Nome=Bambui
UF=MG
Provedor=NFSeBrasil

[3105202]
Nome=Bandeira
UF=MG
Provedor=PadraoNacional

[3105301]
Nome=Bandeira do Sul
UF=MG
Provedor=Betha

[3105400]
Nome=Barao de Cocais
UF=MG
Provedor=PadraoNacional

[3105509]
Nome=Barao de Monte Alto
UF=MG
Provedor=PadraoNacional

[3105608]
Nome=Barbacena
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://barbacenamg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://barbacenamg.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3105707]
Nome=Barra Longa
UF=MG
Provedor=PadraoNacional

[3105905]
; Atualizado em 11/06/2021
Nome=Barroso
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://barroso.nfiss.com.br/soap/
;
ProLinkURL=https://barroso.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_barroso.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3106002]
Nome=Bela Vista de Minas
UF=MG
Provedor=PadraoNacional

[3106101]
Nome=Belmiro Braga
UF=MG
Provedor=PadraoNacional

[3106200]
Nome=Belo Horizonte
UF=MG
Provedor=BHISS
ProRecepcionar=https://bhissdigital.pbh.gov.br/bhiss-ws/nfse
HomRecepcionar=https://bhisshomologa.pbh.gov.br/bhiss-ws/nfse

[3106309]
Nome=Belo Oriente
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/beor
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/beor

[3106408]
Nome=Belo Vale
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://belovale.nfiss.com.br/soap/
;
ProLinkURL=https://belovale.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_belovale.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3106507]
Nome=Berilo
UF=MG
Provedor=PadraoNacional

[3106606]
Nome=Bertopolis
UF=MG
Provedor=PadraoNacional

[3106655]
Nome=Berizal
UF=MG
Provedor=PadraoNacional

[3106705]
Nome=Betim
UF=MG
Provedor=Ginfes
;
ProLinkURL=http://betim.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://betim.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3106804]
Nome=Bias Fortes
UF=MG
Provedor=PadraoNacional

[3106903]
Nome=Bicas
UF=MG
Provedor=PadraoNacional

[3107000]
Nome=Biquinhas
UF=MG
Provedor=PadraoNacional

[3107109]
Nome=Boa Esperanca
UF=MG
Provedor=ISSIntel
ProNameSpace=http://boaesperanca-mg.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://boaesperanca-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://boaesperanca-mg.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://boaesperanca-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://boaesperanca-mg.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://boaesperanca-mg.treino-issintel.com.br/webservices/abrasf/api/

[3107208]
Nome=Bocaina de Minas
UF=MG
Provedor=PadraoNacional

[3107307]
; Inclu�do em 12/08/2021
Nome=Bocaiuva
UF=MG
Provedor=Sintese
Versao=2.04
ProRecepcionar=https://bocaiuva.sintesetecnologia.com.br/nfsews/NfseWS
HomRecepcionar=http://homologacao.sintesetecnologia.com.br/nfsews/NfseWS

[3107406]
; Atualizado em 23/02/2022
Nome=Bom Despacho
UF=MG
Provedor=IPM
Versao=1.01
ProRecepcionar=https://ws-bomdespacho.atende.net:7443/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes

[3107505]
Nome=Bom Jardim de Minas
UF=MG
Provedor=PadraoNacional

[3107604]
Nome=Bom Jesus da Penha
UF=MG
Provedor=PadraoNacional

[3107703]
Nome=Bom Jesus do Amparo
UF=MG
Provedor=PadraoNacional

[3107802]
Nome=Bom Jesus do Galho
UF=MG
Provedor=PadraoNacional

[3107901]
Nome=Bom Repouso
UF=MG
Provedor=PadraoNacional

[3108008]
Nome=Bom Sucesso
UF=MG
Provedor=PadraoNacional

[3108107]
Nome=Bonfim
UF=MG
Provedor=PadraoNacional

[3108206]
Nome=Bonfinopolis de Minas
UF=MG
Provedor=PadraoNacional

[3108255]
Nome=Bonito de Minas
UF=MG
Provedor=PadraoNacional

[3108305]
Nome=Borda da Mata
UF=MG
Provedor=PadraoNacional

[3108404]
Nome=Botelhos
UF=MG
Provedor=Betha

[3108503]
Nome=Botumirim
UF=MG
Provedor=PadraoNacional

[3108552]
Nome=Brasilandia de Minas
UF=MG
Provedor=PadraoNacional

[3108602]
Nome=Brasilia de Minas
UF=MG
Provedor=PadraoNacional

[3108701]
Nome=Bras Pires
UF=MG
Provedor=PadraoNacional

[3108800]
Nome=Braunas
UF=MG
Provedor=PadraoNacional

[3108909]
Nome=Brasopolis
UF=MG
Provedor=PadraoNacional

[3109006]
Nome=Brumadinho
UF=MG
Provedor=EL
ProRecepcionar=https://mg-brumadinho-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://mg-brumadinho-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://mg-brumadinho-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3109105]
Nome=Bueno Brandao
UF=MG
Provedor=PadraoNacional

[3109204]
Nome=Buenopolis
UF=MG
Provedor=PadraoNacional

[3109253]
Nome=Bugre
UF=MG
Provedor=PadraoNacional

[3109303]
Nome=Buritis
UF=MG
Provedor=PadraoNacional

[3109402]
Nome=Buritizeiro
UF=MG
Provedor=PadraoNacional

[3109451]
Nome=Cabeceira Grande
UF=MG
Provedor=PadraoNacional

[3109501]
Nome=Cabo Verde
UF=MG
Provedor=PadraoNacional

[3109600]
Nome=Cachoeira da Prata
UF=MG
Provedor=PadraoNacional

[3109709]
Nome=Cachoeira de Minas
UF=MG
Provedor=PadraoNacional

[3109808]
Nome=Cachoeira Dourada
UF=MG
Provedor=PadraoNacional

[3109907]
Nome=Caetanopolis
UF=MG
Provedor=PadraoNacional

[3110004]
Nome=Caete
UF=MG
Provedor=PadraoNacional

[3110103]
Nome=Caiana
UF=MG
Provedor=PadraoNacional

[3110202]
Nome=Cajuri
UF=MG
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/cajurimg_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/cajurimg_wsnfse_homolog/NfseServices.svc

[3110301]
Nome=Caldas
UF=MG
Provedor=PadraoNacional

[3110400]
Nome=Camacho
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://camacho.nfiss.com.br/soap/
;
ProLinkURL=https://camacho.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_camacho.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3110509]
Nome=Camanducaia
UF=MG
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://www.servicosweb.com.br:9039/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://www.servicosweb.com.br:9039/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3110608]
Nome=Cambui
UF=MG
Provedor=PadraoNacional

[3110707]
Nome=Cambuquira
UF=MG
Provedor=PadraoNacional

[3110806]
Nome=Campanario
UF=MG
Provedor=PadraoNacional

[3110905]
Nome=Campanha
UF=MG
Provedor=PadraoNacional

[3111002]
Nome=Campestre
UF=MG
Provedor=NFSeBrasil

[3111101]
; Inclu�do em 09/06/2022
Nome=Campina Verde
UF=MG
Provedor=Horus
Params=AliasCidade:campinaverde
;
ProRecepcionar=http://campinaverde.horusdm.com.br/service

[3111150]
Nome=Campo Azul
UF=MG
Provedor=PadraoNacional

[3111200]
; Atualizado em 26/08/2021
Nome=Campo Belo
UF=MG
Provedor=IPM
Versao=1.01
ProRecepcionar=https://campobelo.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[3111309]
Nome=Campo do Meio
UF=MG
Provedor=PadraoNacional

[3111408]
Nome=Campo Florido
UF=MG
Provedor=PadraoNacional

[3111507]
; Inclu�do em 14/04/2022
Nome=Campos Altos
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://camposaltosmg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://camposaltosmg.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3111606]
Nome=Campos Gerais
UF=MG
Provedor=PadraoNacional

[3111705]
Nome=Canaa
UF=MG
Provedor=PadraoNacional

[3111804]
Nome=Canapolis
UF=MG
Provedor=PadraoNacional

[3111903]
Nome=Cana Verde
UF=MG
Provedor=PadraoNacional

[3112000]
Nome=Candeias
UF=MG
Provedor=PadraoNacional

[3112059]
Nome=Cantagalo
UF=MG
Provedor=PadraoNacional

[3112109]
Nome=Caparao
UF=MG
Provedor=PadraoNacional

[3112208]
Nome=Capela Nova
UF=MG
Provedor=PadraoNacional

[3112307]
Nome=Capelinha
UF=MG
Provedor=PadraoNacional

[3112406]
Nome=Capetinga
UF=MG
Provedor=PadraoNacional

[3112505]
Nome=Capim Branco
UF=MG
Provedor=ISSIntel
ProNameSpace=http://capimbranco-mg.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://capimbranco-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://capimbranco-mg.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://capimbranco-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://capimbranco-mg.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://capimbranco-mg.treino-issintel.com.br/webservices/abrasf/api/

[3112604]
Nome=Capinopolis
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/capinop
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/capinop

[3112653]
Nome=Capitao Andrade
UF=MG
Provedor=PadraoNacional

[3112703]
Nome=Capitao Eneas
UF=MG
Provedor=PadraoNacional

[3112802]
Nome=Capitolio
UF=MG
Provedor=PadraoNacional

[3112901]
Nome=Caputira
UF=MG
Provedor=PadraoNacional

[3113008]
Nome=Carai
UF=MG
Provedor=PadraoNacional

[3113107]
Nome=Caranaiba
UF=MG
Provedor=PadraoNacional

[3113206]
Nome=Carandai
UF=MG
Provedor=PadraoNacional

[3113305]
Nome=Carangola
UF=MG
Provedor=ISSIntel
ProNameSpace=http://carangola-mg.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://carangola-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://carangola-mg.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://carangola-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://carangola-mg.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://carangola-mg.treino-issintel.com.br/webservices/abrasf/api/

[3113404]
Nome=Caratinga
UF=MG
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://187.63.193.135/nfse.portal.integracao/services.svc
HomRecepcionar=http://187.63.193.135/nfse.portal.integracao.teste/services.svc

[3113503]
Nome=Carbonita
UF=MG
Provedor=PadraoNacional

[3113602]
Nome=Careacu
UF=MG
Provedor=PadraoNacional

[3113701]
Nome=Carlos Chagas
UF=MG
Provedor=PadraoNacional

[3113800]
Nome=Carmesia
UF=MG
Provedor=PadraoNacional

[3113909]
Nome=Carmo da Cachoeira
UF=MG
Provedor=PadraoNacional

[3114006]
Nome=Carmo da Mata
UF=MG
Provedor=PadraoNacional

[3114105]
Nome=Carmo de Minas
UF=MG
Provedor=PadraoNacional

[3114204]
Nome=Carmo do Cajuru
UF=MG
Provedor=Betha

[3114303]
Nome=Carmo do Paranaiba
UF=MG
Provedor=PadraoNacional

[3114402]
Nome=Carmo do Rio Claro
UF=MG
Provedor=ISSIntel
ProNameSpace=http://carmodorioclaro-mg.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://carmodorioclaro-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://carmodorioclaro-mg.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://carmodorioclaro-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://carmodorioclaro-mg.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://carmodorioclaro-mg.treino-issintel.com.br/webservices/abrasf/api/

[3114501]
Nome=Carmopolis de Minas
UF=MG
Provedor=PadraoNacional

[3114550]
Nome=Carneirinho
UF=MG
Provedor=PadraoNacional

[3114600]
Nome=Carrancas
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://carrancas.nfiss.com.br/soap/
;
ProLinkURL=https://carrancas.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_carrancas.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3114709]
Nome=Carvalhopolis
UF=MG
Provedor=PadraoNacional

[3114808]
Nome=Carvalhos
UF=MG
Provedor=PadraoNacional

[3114907]
Nome=Casa Grande
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://casagrande.nfiss.com.br/soap/
;
ProLinkURL=https://casagrande.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_casagrande.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3115003]
Nome=Cascalho Rico
UF=MG
Provedor=PadraoNacional

[3115102]
Nome=Cassia
UF=MG
Provedor=PadraoNacional

[3115201]
Nome=Conceicao da Barra de Minas
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://conceicaodabarrademinas.nfiss.com.br/soap/
;
ProLinkURL=https://conceicaodabarrademinas.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_conceicaodabarrademinas.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3115300]
Nome=Cataguases
UF=MG
Provedor=VersaTecnologia
Versao=2.02
Params=URLProducao:nfse.cataguases.mg.gov.br|URLHomologacao:homologacaocataguases.agilistecnologia.com.br
;
ProRecepcionar=http://nfse.cataguases.mg.gov.br/webservices/2.02/servicos
HomRecepcionar=http://homologacaocataguases.agilistecnologia.com.br/webservices/2.02/servicos
;
ProNameSpace=http://nfse.cataguases.mg.gov.br/webservices/2.02/nfse_v202.xsd
HomNameSpace=http://homologacaocataguases.agilistecnologia.com.br/webservices/2.02/nfse_v202.xsd
;
ProXMLNameSpace=http://nfse.cataguases.mg.gov.br/webservices/2.02/nfse_v202.xsd
HomXMLNameSpace=http://nfse.cataguases.mg.gov.br/webservices/2.02/nfse_v202.xsd

[3115359]
Nome=Catas Altas
UF=MG
Provedor=PadraoNacional

[3115409]
Nome=Catas Altas da Noruega
UF=MG
Provedor=PadraoNacional

[3115458]
Nome=Catuji
UF=MG
Provedor=PadraoNacional

[3115474]
Nome=Catuti
UF=MG
Provedor=PadraoNacional

[3115508]
Nome=Caxambu
UF=MG
Provedor=PadraoNacional

[3115607]
Nome=Cedro do Abaete
UF=MG
Provedor=PadraoNacional

[3115706]
Nome=Central de Minas
UF=MG
Provedor=PadraoNacional

[3115805]
Nome=Centralina
UF=MG
Provedor=PadraoNacional

[3115904]
Nome=Chacara
UF=MG
Provedor=PadraoNacional

[3116001]
Nome=Chale
UF=MG
Provedor=PadraoNacional

[3116100]
Nome=Chapada do Norte
UF=MG
Provedor=PadraoNacional

[3116159]
Nome=Chapada Gaucha
UF=MG
Provedor=PadraoNacional

[3116209]
Nome=Chiador
UF=MG
Provedor=PadraoNacional

[3116308]
Nome=Cipotanea
UF=MG
Provedor=PadraoNacional

[3116407]
Nome=Claraval
UF=MG
Provedor=PadraoNacional

[3116506]
Nome=Claro Dos Pocoes
UF=MG
Provedor=PadraoNacional

[3116605]
Nome=Claudio
UF=MG
Provedor=Betha
Versao=2.02
ProRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-ws/nfseWS
HomRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-test-ws/nfseWS

[3116704]
Nome=Coimbra
UF=MG
Provedor=PadraoNacional

[3116803]
Nome=Coluna
UF=MG
Provedor=PadraoNacional

[3116902]
; Inclu�do em 09/06/2022
Nome=Comendador Gomes
UF=MG
Provedor=Horus
Params=AliasCidade:comendadorgomes
;
ProRecepcionar=http://comendadorgomes.horusdm.com.br/service

[3117009]
Nome=Comercinho
UF=MG
Provedor=PadraoNacional

[3117108]
Nome=Conceicao da Aparecida
UF=MG
Provedor=PadraoNacional

[3117207]
Nome=Conceicao das Pedras
UF=MG
Provedor=PadraoNacional

[3117306]
Nome=Conceicao das Alagoas
UF=MG
Provedor=PadraoNacional

[3117405]
Nome=Conceicao de Ipanema
UF=MG
Provedor=PadraoNacional

[3117504]
Nome=Conceicao do Mato Dentro
UF=MG
Provedor=Ginfes
;
ProLinkURL=http://conceicaodomatodentro.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://conceicaodomatodentro.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3117603]
Nome=Conceicao do Para
UF=MG
Provedor=PadraoNacional

[3117702]
Nome=Conceicao do Rio Verde
UF=MG
Provedor=PadraoNacional

[3117801]
Nome=Conceicao dos Ouros
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://conceicaodosouros.nfiss.com.br/soap/
;
ProLinkURL=https://conceicaodosouros.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_conceicaodosouros.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3117836]
Nome=Conego Marinho
UF=MG
Provedor=PadraoNacional

[3117876]
Nome=Confins
UF=MG
Provedor=EL
ProRecepcionar=https://mg-confins-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://mg-confins-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://mg-confins-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3117900]
Nome=Congonhal
UF=MG
Provedor=PadraoNacional

[3118007]
Nome=Congonhas
UF=MG
Provedor=Betha

[3118106]
Nome=Congonhas do Norte
UF=MG
Provedor=PadraoNacional

[3118205]
Nome=Conquista
UF=MG
Provedor=PadraoNacional

[3118304]
; Atualizado em 29/03/2022
Nome=Conselheiro Lafaiete
UF=MG
Provedor=Betha

[3118403]
Nome=Conselheiro Pena
UF=MG
Provedor=PadraoNacional

[3118502]
Nome=Consolacao
UF=MG
Provedor=PadraoNacional

[3118601]
Nome=Contagem
UF=MG
Provedor=Ginfes
;
ProLinkURL=http://contagem.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://contagem.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3118700]
Nome=Coqueiral
UF=MG
Provedor=Betha

[3118809]
Nome=Coracao de Jesus
UF=MG
Provedor=PadraoNacional

[3118908]
Nome=Cordisburgo
UF=MG
Provedor=PadraoNacional

[3119005]
Nome=Cordislandia
UF=MG
Provedor=PadraoNacional

[3119104]
Nome=Corinto
UF=MG
Provedor=PadraoNacional

[3119203]
Nome=Coroaci
UF=MG
Provedor=PadraoNacional

[3119302]
; Inclu�do em 14/09/2021
Nome=Coromandel
UF=MG
Provedor=eReceita
Versao=2.02
ProRecepcionar=http://webservice.ereceita.net.br/ws/coromandelmg/wsProducao.php
HomRecepcionar=http://webservice.ereceita.net.br/ws/coromandelmg/wsHomologacao.php
;
ProLinkURL=http://server21.coromandel.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true
HomLinkURL=http://server21.coromandel.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true

[3119401]
Nome=Coronel Fabriciano
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/fabriciano
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/fabriciano

[3119500]
Nome=Coronel Murta
UF=MG
Provedor=PadraoNacional

[3119609]
Nome=Coronel Pacheco
UF=MG
Provedor=PadraoNacional

[3119708]
Nome=Coronel Xavier Chaves
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://coronelxavierchaves.nfiss.com.br/soap/
;
ProLinkURL=https://coronelxavierchaves.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_coronelxavierchaves.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3119807]
Nome=Corrego Danta
UF=MG
Provedor=PadraoNacional

[3119906]
Nome=Corrego do Bom Jesus
UF=MG
Provedor=PadraoNacional

[3119955]
Nome=Corrego Fundo
UF=MG
Provedor=PadraoNacional

[3120003]
Nome=Corrego Novo
UF=MG
Provedor=PadraoNacional

[3120102]
Nome=Couto de Magalhaes de Minas
UF=MG
Provedor=PadraoNacional

[3120151]
Nome=Crisolita
UF=MG
Provedor=PadraoNacional

[3120201]
Nome=Cristais
UF=MG
Provedor=PadraoNacional

[3120300]
Nome=Cristalia
UF=MG
Provedor=PadraoNacional

[3120409]
Nome=Cristiano Otoni
UF=MG
Provedor=PadraoNacional

[3120508]
Nome=Cristina
UF=MG
Provedor=PadraoNacional

[3120607]
Nome=Crucilandia
UF=MG
Provedor=PadraoNacional

[3120706]
Nome=Cruzeiro da Fortaleza
UF=MG
Provedor=PadraoNacional

[3120805]
Nome=Cruzilia
UF=MG
Provedor=PadraoNacional

[3120839]
Nome=Cuparaque
UF=MG
Provedor=PadraoNacional

[3120870]
Nome=Curral de Dentro
UF=MG
Provedor=PadraoNacional

[3120904]
Nome=Curvelo
UF=MG
Provedor=NFSeBrasil

[3121001]
Nome=Datas
UF=MG
Provedor=PadraoNacional

[3121100]
Nome=Delfim Moreira
UF=MG
Provedor=PadraoNacional

[3121209]
; Inclu�do em 09/06/2022
Nome=Delfinopolis
UF=MG
Provedor=Horus
Params=AliasCidade:delfinopolis
;
ProRecepcionar=http://delfinopolis.horusdm.com.br/service

[3121258]
Nome=Delta
UF=MG
Provedor=Betha

[3121308]
Nome=Descoberto
UF=MG
Provedor=PadraoNacional

[3121407]
Nome=Desterro de Entre Rios
UF=MG
Provedor=PadraoNacional

[3121506]
Nome=Desterro do Melo
UF=MG
Provedor=PadraoNacional

[3121605]
Nome=Diamantina
UF=MG
Provedor=PadraoNacional

[3121704]
Nome=Diogo de Vasconcelos
UF=MG
Provedor=PadraoNacional

[3121803]
Nome=Dionisio
UF=MG
Provedor=PadraoNacional

[3121902]
Nome=Divinesia
UF=MG
Provedor=PadraoNacional

[3122009]
Nome=Divino
UF=MG
Provedor=PadraoNacional

[3122108]
Nome=Divino das Laranjeiras
UF=MG
Provedor=PadraoNacional

[3122207]
Nome=Divinolandia de Minas
UF=MG
Provedor=PadraoNacional

[3122306]
Nome=Divinopolis
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/div
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/div

[3122355]
Nome=Divisa Alegre
UF=MG
Provedor=PadraoNacional

[3122405]
Nome=Divisa Nova
UF=MG
Provedor=PadraoNacional

[3122454]
Nome=Divisopolis
UF=MG
Provedor=PadraoNacional

[3122470]
Nome=Dom Bosco
UF=MG
Provedor=PadraoNacional

[3122504]
Nome=Dom Cavati
UF=MG
Provedor=PadraoNacional

[3122603]
Nome=Dom Joaquim
UF=MG
Provedor=PadraoNacional

[3122702]
Nome=Dom Silverio
UF=MG
Provedor=PadraoNacional

[3122801]
Nome=Dom Vicoso
UF=MG
Provedor=PadraoNacional

[3122900]
Nome=Dona Eusebia
UF=MG
Provedor=PadraoNacional

[3123007]
Nome=Dores de Campos
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://doresdecampos.nfiss.com.br/soap/
;
ProLinkURL=https://doresdecampos.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_doresdecampos.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3123106]
Nome=Dores de Guanhaes
UF=MG
Provedor=PadraoNacional

[3123205]
Nome=Dores do Indaia
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/dores
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/dores

[3123304]
Nome=Dores do Turvo
UF=MG
Provedor=Adm
Versao=2.01
ProRecepcionar=http://ws.admnotafiscal.com.br/2
HomRecepcionar=http://wshomologacao.admnotafiscal.com.br/2
;
ProNameSpace=http://ws.admnotafiscal.com.br/2/nfse.wsdl
HomNameSpace=http://wshomologacao.admnotafiscal.com.br/2/nfse.wsdl
;
ProSoapAction=http://ws.admnotafiscal.com.br/2/
HomSoapAction=http://wshomologacao.admnotafiscal.com.br/2/

[3123403]
Nome=Doresopolis
UF=MG
Provedor=PadraoNacional

[3123502]
Nome=Douradoquara
UF=MG
Provedor=PadraoNacional

[3123528]
Nome=Durande
UF=MG
Provedor=PadraoNacional

[3123601]
Nome=Eloi Mendes
UF=MG
Provedor=PadraoNacional

[3123700]
Nome=Engenheiro Caldas
UF=MG
Provedor=PadraoNacional

[3123809]
Nome=Engenheiro Navarro
UF=MG
Provedor=PadraoNacional

[3123858]
Nome=Entre Folhas
UF=MG
Provedor=PadraoNacional

[3123908]
Nome=Entre Rios de Minas
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://entreriosdeminas.nfiss.com.br/soap/
;
ProLinkURL=https://entreriosdeminas.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_entreriosdeminas.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3124005]
Nome=Ervalia
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://ervalia.nfiss.com.br/soap/
;
ProLinkURL=https://ervalia.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_ervalia.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3124104]
Nome=Esmeraldas
UF=MG
Provedor=PadraoNacional

[3124203]
Nome=Espera Feliz
UF=MG
Provedor=PadraoNacional

[3124302]
Nome=Espinosa
UF=MG
Provedor=PadraoNacional

[3124401]
Nome=Espirito Santo do Dourado
UF=MG
Provedor=PadraoNacional

[3124500]
Nome=Estiva
UF=MG
Provedor=PadraoNacional

[3124609]
Nome=Estrela Dalva
UF=MG
Provedor=PadraoNacional

[3124708]
Nome=Estrela do Indaia
UF=MG
Provedor=PadraoNacional

[3124807]
Nome=Estrela do Sul
UF=MG
Provedor=PadraoNacional

[3124906]
Nome=Eugenopolis
UF=MG
Provedor=PadraoNacional

[3125002]
Nome=Ewbank da Camara
UF=MG
Provedor=PadraoNacional

[3125101]
Nome=Extrema
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://extremamg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://extremamg.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3125200]
Nome=Fama
UF=MG
Provedor=PadraoNacional

[3125309]
Nome=Faria Lemos
UF=MG
Provedor=PadraoNacional

[3125408]
Nome=Felicio Dos Santos
UF=MG
Provedor=PadraoNacional

[3125507]
Nome=Sao Goncalo do Rio Preto
UF=MG
Provedor=PadraoNacional

[3125606]
Nome=Felisburgo
UF=MG
Provedor=PadraoNacional

[3125705]
Nome=Felixlandia
UF=MG
Provedor=PadraoNacional

[3125804]
Nome=Fernandes Tourinho
UF=MG
Provedor=PadraoNacional

[3125903]
Nome=Ferros
UF=MG
Provedor=PadraoNacional

[3125952]
Nome=Fervedouro
UF=MG
Provedor=PadraoNacional

[3126000]
Nome=Florestal
UF=MG
Provedor=PadraoNacional

[3126109]
Nome=Formiga
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://formigamg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://formigamg.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3126208]
Nome=Formoso
UF=MG
Provedor=PadraoNacional

[3126307]
Nome=Fortaleza de Minas
UF=MG
Provedor=PadraoNacional

[3126406]
Nome=Fortuna de Minas
UF=MG
Provedor=PadraoNacional

[3126505]
Nome=Francisco Badaro
UF=MG
Provedor=PadraoNacional

[3126604]
Nome=Francisco Dumont
UF=MG
Provedor=PadraoNacional

[3126703]
Nome=Francisco Sa
UF=MG
Provedor=PadraoNacional

[3126752]
Nome=Franciscopolis
UF=MG
Provedor=PadraoNacional

[3126802]
Nome=Frei Gaspar
UF=MG
Provedor=PadraoNacional

[3126901]
Nome=Frei Inocencio
UF=MG
Provedor=PadraoNacional

[3126950]
Nome=Frei Lagonegro
UF=MG
Provedor=PadraoNacional

[3127008]
; Inclu�do em 08/06/2022
Nome=Fronteira
UF=MG
Provedor=Horus
Params=AliasCidade:fronteira
;
ProRecepcionar=http://fronteira.horusdm.com.br/service

[3127057]
Nome=Fronteira Dos Vales
UF=MG
Provedor=PadraoNacional

[3127073]
Nome=Fruta de Leite
UF=MG
Provedor=PadraoNacional

[3127107]
; Atualizado em 19/07/2021
Nome=Frutal
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/frutal
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/frutal

[3127206]
Nome=Funilandia
UF=MG
Provedor=PadraoNacional

[3127305]
Nome=Galileia
UF=MG
Provedor=PadraoNacional

[3127339]
Nome=Gameleiras
UF=MG
Provedor=PadraoNacional

[3127354]
Nome=Glaucilandia
UF=MG
Provedor=PadraoNacional

[3127370]
Nome=Goiabeira
UF=MG
Provedor=PadraoNacional

[3127388]
Nome=Goiana
UF=MG
Provedor=PadraoNacional

[3127404]
Nome=Goncalves
UF=MG
Provedor=PadraoNacional

[3127503]
Nome=Gonzaga
UF=MG
Provedor=PadraoNacional

[3127602]
Nome=Gouveia
UF=MG
Provedor=PadraoNacional

[3127701]
; Atualizado em 07/12/2021
Nome=Governador Valadares
UF=MG
Provedor=SigISS
ProRecepcionar=https://valadares.sigiss.com.br/valadares/ws/sigiss_ws.php
HomRecepcionar=https://testevaladares.sigiss.com.br/testevaladares/ws/sigiss_ws.php
;
ProSoapAction=urn:sigiss_ws

[3127800]
Nome=Grao Mogol
UF=MG
Provedor=PadraoNacional

[3127909]
Nome=Grupiara
UF=MG
Provedor=PadraoNacional

[3128006]
Nome=Guanhaes
UF=MG
Provedor=EL
ProRecepcionar=https://mg-guanhaes-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://mg-guanhaes-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://mg-guanhaes-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3128105]
Nome=Guape
UF=MG
Provedor=ISSIntel
ProNameSpace=http://guape-mg.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://guape-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://guape-mg.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://guape-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://guape-mg.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://guape-mg.treino-issintel.com.br/webservices/abrasf/api/

[3128204]
Nome=Guaraciaba
UF=MG
Provedor=PadraoNacional

[3128253]
Nome=Guaraciama
UF=MG
Provedor=PadraoNacional

[3128303]
Nome=Guaranesia
UF=MG
Provedor=Betha

[3128402]
Nome=Guarani
UF=MG
Provedor=PadraoNacional

[3128501]
Nome=Guarara
UF=MG
Provedor=PadraoNacional

[3128600]
Nome=Guarda-Mor
UF=MG
Provedor=PadraoNacional

[3128709]
Nome=Guaxupe
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/guax
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/guax

[3128808]
Nome=Guidoval
UF=MG
Provedor=PadraoNacional

[3128907]
Nome=Guimarania
UF=MG
Provedor=PadraoNacional

[3129004]
Nome=Guiricema
UF=MG
Provedor=PadraoNacional

[3129103]
Nome=Gurinhata
UF=MG
Provedor=PadraoNacional

[3129202]
Nome=Heliodora
UF=MG
Provedor=PadraoNacional

[3129301]
Nome=Iapu
UF=MG
Provedor=PadraoNacional

[3129400]
Nome=Ibertioga
UF=MG
Provedor=PadraoNacional

[3129509]
Nome=Ibia
UF=MG
Provedor=PadraoNacional

[3129608]
Nome=Ibiai
UF=MG
Provedor=PadraoNacional

[3129657]
Nome=Ibiracatu
UF=MG
Provedor=PadraoNacional

[3129707]
Nome=Ibiraci
UF=MG
Provedor=PadraoNacional

[3129806]
Nome=Ibirite
UF=MG
Provedor=PadraoNacional

[3129905]
Nome=Ibitiura de Minas
UF=MG
Provedor=PadraoNacional

[3130002]
Nome=Ibituruna
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://ibituruna.nfiss.com.br/soap/
;
ProLinkURL=https://ibituruna.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_ibituruna.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3130051]
Nome=Icarai de Minas
UF=MG
Provedor=PadraoNacional

[3130101]
Nome=Igarape
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/igarape
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/igarape

[3130200]
Nome=Igaratinga
UF=MG
Provedor=Betha

[3130309]
; Atualizado em 28/07/2022
Nome=Iguatama
UF=MG
Provedor=SimplISS
ProRecepcionar=http://wsiguatama.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsiguatama.simplissweb.com.br/nfseservice.svc

[3130408]
Nome=Ijaci
UF=MG
Provedor=PadraoNacional

[3130507]
Nome=Ilicinea
UF=MG
Provedor=PadraoNacional

[3130556]
Nome=Imbe de Minas
UF=MG
Provedor=PadraoNacional

[3130606]
Nome=Inconfidentes
UF=MG
Provedor=PadraoNacional

[3130655]
Nome=Indaiabira
UF=MG
Provedor=PadraoNacional

[3130705]
Nome=Indianopolis
UF=MG
Provedor=PadraoNacional

[3130804]
Nome=Ingai
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://ingai.nfiss.com.br/soap/
;
ProLinkURL=https://ingai.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_ingai.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3130903]
Nome=Inhapim
UF=MG
Provedor=PadraoNacional

[3131000]
Nome=Inhauma
UF=MG
Provedor=PadraoNacional

[3131109]
Nome=Inimutaba
UF=MG
Provedor=PadraoNacional

[3131158]
Nome=Ipaba
UF=MG
Provedor=PadraoNacional

[3131208]
Nome=Ipanema
UF=MG
Provedor=PadraoNacional

[3131307]
; Atualizado em 02/03/2022
Nome=Ipatinga
UF=MG
Provedor=SigCorp
Versao=2.03
ProRecepcionar=https://abrasfipatinga.sigbancos.com.br/servico.asmx
HomRecepcionar=https://testeabrasfipatinga.sigbancos.com.br/servico.asmx

[3131406]
Nome=Ipiacu
UF=MG
Provedor=PadraoNacional

[3131505]
Nome=Ipuiuna
UF=MG
Provedor=PadraoNacional

[3131604]
Nome=Irai de Minas
UF=MG
Provedor=PadraoNacional

[3131703]
; Atualizado em 26/04/2022
Nome=Itabira
UF=MG
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://itabira.govbr.cloud/nfse.portal.integracao/services.svc
HomRecepcionar=

[3131802]
Nome=Itabirinha
UF=MG
Provedor=PadraoNacional

[3131901]
Nome=Itabirito
UF=MG
Provedor=PadraoNacional

[3132008]
Nome=Itacambira
UF=MG
Provedor=PadraoNacional

[3132107]
Nome=Itacarambi
UF=MG
Provedor=PadraoNacional

[3132206]
Nome=Itaguara
UF=MG
Provedor=PadraoNacional

[3132305]
Nome=Itaipe
UF=MG
Provedor=PadraoNacional

[3132404]
; Atualizado em 28/01/2022
Nome=Itajuba
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/itj
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/itj

[3132503]
Nome=Itamarandiba
UF=MG
Provedor=PadraoNacional

[3132602]
Nome=Itamarati de Minas
UF=MG
Provedor=PadraoNacional

[3132701]
Nome=Itambacuri
UF=MG
Provedor=PadraoNacional

[3132800]
Nome=Itambe do Mato Dentro
UF=MG
Provedor=PadraoNacional

[3132909]
Nome=Itamogi
UF=MG
Provedor=PadraoNacional

[3133006]
Nome=Itamonte
UF=MG
Provedor=PadraoNacional

[3133105]
Nome=Itanhandu
UF=MG
Provedor=PadraoNacional

[3133204]
Nome=Itanhomi
UF=MG
Provedor=PadraoNacional

[3133303]
Nome=Itaobim
UF=MG
Provedor=EL
ProRecepcionar=https://mg-itaobim-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://mg-itaobim-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://mg-itaobim-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3133402]
Nome=Itapagipe
UF=MG
Provedor=PadraoNacional

[3133501]
Nome=Itapecerica
UF=MG
Provedor=PadraoNacional

[3133600]
Nome=Itapeva
UF=MG
Provedor=Betha

[3133709]
Nome=Itatiaiucu
UF=MG
Provedor=Betha

[3133758]
Nome=Itau de Minas
UF=MG
Provedor=Betha

[3133808]
; Atualizado em 29/11/2021
Nome=Itauna
UF=MG
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/itauna/servicos.asmx

[3133907]
Nome=Itaverava
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://itaverava.nfiss.com.br/soap/
;
ProLinkURL=https://itaverava.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_itaverava.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3134004]
Nome=Itinga
UF=MG
Provedor=PadraoNacional

[3134103]
Nome=Itueta
UF=MG
Provedor=PadraoNacional

[3134202]
Nome=Ituiutaba
UF=MG
Provedor=SmarAPD
Versao=2.04
ProRecepcionar=http://201.48.3.165:9083/tbw/services/nfseSOAP
HomRecepcionar=http://201.72.16.150/abrasf/services/nfseSOAP
;
ProLinkURL=http://suporte.ituiutuba.mg.gov.br:9083/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%
HomLinkURL=http://suporte.ituiutuba.mg.gov.br:9083/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%

[3134301]
Nome=Itumirim
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://itumirim.nfiss.com.br/soap/
;
ProLinkURL=https://itumirim.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_itumirim.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3134400]
Nome=Iturama
UF=MG
Provedor=Governa
Params=VersaoArquivo:1|VersaoImpressao:3
;
ProRecepcionar=http://200.233.183.165/wsgoverna/esiat.asmx

[3134509]
Nome=Itutinga
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://itutinga.nfiss.com.br/soap/
;
ProLinkURL=https://itutinga.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_itutinga.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3134608]
Nome=Jaboticatubas
UF=MG
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/jaboticatubasmg_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/jaboticatubasmg_wsnfse_homolog/NfseServices.svc

[3134707]
Nome=Jacinto
UF=MG
Provedor=PadraoNacional

[3134806]
Nome=Jacui
UF=MG
Provedor=PadraoNacional

[3134905]
Nome=Jacutinga
UF=MG
Provedor=PadraoNacional

[3135001]
Nome=Jaguaracu
UF=MG
Provedor=PadraoNacional

[3135050]
; Inclu�do em 22/09/2022
Nome=Jaiba
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://jaibamg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://jaibamg.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3135076]
Nome=Jampruca
UF=MG
Provedor=PadraoNacional

[3135100]
Nome=Janauba
UF=MG
Provedor=NFSeBrasil

[3135209]
; Inclu�do em 22/11/2022
Nome=Januaria
UF=MG
Provedor=Sintese
Versao=2.04
ProRecepcionar=https://januaria.sintesetecnologia.com.br/nfsews/NfseWS
HomRecepcionar=https://homologacao.sintesetecnologia.com.br/nfsews/NfseWS

[3135308]
Nome=Japaraiba
UF=MG
Provedor=PadraoNacional

[3135357]
Nome=Japonvar
UF=MG
Provedor=PadraoNacional

[3135407]
Nome=Jeceaba
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://jeceaba.nfiss.com.br/soap/
;
ProLinkURL=https://jeceaba.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_jeceaba.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3135456]
Nome=Jenipapo de Minas
UF=MG
Provedor=PadraoNacional

[3135506]
Nome=Jequeri
UF=MG
Provedor=PadraoNacional

[3135605]
Nome=Jequitai
UF=MG
Provedor=PadraoNacional

[3135704]
Nome=Jequitiba
UF=MG
Provedor=PadraoNacional

[3135803]
Nome=Jequitinhonha
UF=MG
Provedor=PadraoNacional

[3135902]
Nome=Jesuania
UF=MG
Provedor=PadraoNacional

[3136009]
Nome=Joaima
UF=MG
Provedor=PadraoNacional

[3136108]
Nome=Joanesia
UF=MG
Provedor=PadraoNacional

[3136207]
Nome=Joao Monlevade
UF=MG
Provedor=SimplISS
ProRecepcionar=http://wsjoaomonlevade.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsjoaomonlevade.com.br/nfseservice.svc

[3136306]
Nome=Joao Pinheiro
UF=MG
Provedor=PadraoNacional

[3136405]
Nome=Joaquim Felicio
UF=MG
Provedor=PadraoNacional

[3136504]
Nome=Jordania
UF=MG
Provedor=PadraoNacional

[3136520]
Nome=Jose Goncalves de Minas
UF=MG
Provedor=PadraoNacional

[3136553]
Nome=Jose Raydan
UF=MG
Provedor=PadraoNacional

[3136579]
Nome=Josenopolis
UF=MG
Provedor=PadraoNacional

[3136603]
Nome=Nova Uniao
UF=MG
Provedor=PadraoNacional

[3136652]
Nome=Juatuba
UF=MG
Provedor=PadraoNacional

[3136702]
Nome=Juiz de Fora
UF=MG
Provedor=fintelISS
Versao=2.00
ProRecepcionar=https://nfse.pjf.mg.gov.br:4431/WebService.asmx
HomRecepcionar=https://nfse.homologacao.pjf.mg.gov.br:4432/WebService.asmx

[3136801]
Nome=Juramento
UF=MG
Provedor=PadraoNacional

[3136900]
Nome=Juruaia
UF=MG
Provedor=PadraoNacional

[3136959]
Nome=Juvenilia
UF=MG
Provedor=PadraoNacional

[3137007]
Nome=Ladainha
UF=MG
Provedor=PadraoNacional

[3137106]
Nome=Lagamar
UF=MG
Provedor=PadraoNacional

[3137205]
; Atualizado em 11/06/2021
Nome=Lagoa da Prata
UF=MG
Provedor=Betha

[3137304]
Nome=Lagoa Dos Patos
UF=MG
Provedor=PadraoNacional

[3137403]
Nome=Lagoa Dourada
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://lagoadourada.nfiss.com.br/soap/
;
ProLinkURL=https://lagoadourada.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_lagoadourada.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3137502]
Nome=Lagoa Formosa
UF=MG
Provedor=PadraoNacional

[3137536]
Nome=Lagoa Grande
UF=MG
Provedor=PadraoNacional

[3137601]
Nome=Lagoa Santa
UF=MG
Provedor=Ginfes
;
ProLinkURL=http://lagoasanta.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://lagoasanta.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3137700]
Nome=Lajinha
UF=MG
Provedor=PadraoNacional

[3137809]
Nome=Lambari
UF=MG
Provedor=PadraoNacional

[3137908]
Nome=Lamim
UF=MG
Provedor=PadraoNacional

[3138005]
Nome=Laranjal
UF=MG
Provedor=PadraoNacional

[3138104]
Nome=Lassance
UF=MG
Provedor=PadraoNacional

[3138203]
Nome=Lavras
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/lavr
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/lavr

[3138302]
Nome=Leandro Ferreira
UF=MG
Provedor=PadraoNacional

[3138351]
Nome=Leme do Prado
UF=MG
Provedor=PadraoNacional

[3138401]
Nome=Leopoldina
UF=MG
Provedor=Actcon
Versao=2.01
;
ProRecepcionar=https://nfeleopoldina.portalfacil.com.br/nfseserv/webservice/servicos
HomRecepcionar=https://nfeleopoldina.portalfacil.com.br/homologacao/webservice/servicos
;
ProXMLNameSpace=http://nfeleopoldina.portalfacil.com.br/nfseserv/schema/nfse_v201.xsd
HomXMLNameSpace=http://nfeleopoldina.portalfacil.com.br/homologacao/schema/nfse_v201.xsd
;
ProNameSpace=http://nfeleopoldina.portalfacil.com.br/nfseserv/webservice/nfse.wsdl
HomNameSpace=http://nfeleopoldina.portalfacil.com.br/homologacao/webservice/nfse.wsdl
;
ProSoapAction=http://nfeleopoldina.portalfacil.com.br/nfseserv/webservice/servicos#
HomSoapAction=http://nfeleopoldina.portalfacil.com.br/homologacao/webservice/servicos#

[3138500]
Nome=Liberdade
UF=MG
Provedor=PadraoNacional

[3138609]
Nome=Lima Duarte
UF=MG
Provedor=PadraoNacional

[3138625]
Nome=Limeira do Oeste
UF=MG
Provedor=PadraoNacional

[3138658]
Nome=Lontra
UF=MG
Provedor=PadraoNacional

[3138674]
Nome=Luisburgo
UF=MG
Provedor=PadraoNacional

[3138682]
Nome=Luislandia
UF=MG
Provedor=PadraoNacional

[3138708]
Nome=Luminarias
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://luminarias.nfiss.com.br/soap/
;
ProLinkURL=https://luminarias.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_luminarias.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3138807]
; Atualizado em 11/06/2021
Nome=Luz
UF=MG
Provedor=Betha

[3138906]
Nome=Machacalis
UF=MG
Provedor=PadraoNacional

[3139003]
Nome=Machado
UF=MG
Provedor=PadraoNacional

[3139102]
Nome=Madre de Deus de Minas
UF=MG
Provedor=PadraoNacional

[3139201]
Nome=Malacacheta
UF=MG
Provedor=PadraoNacional

[3139250]
Nome=Mamonas
UF=MG
Provedor=PadraoNacional

[3139300]
Nome=Manga
UF=MG
Provedor=PadraoNacional

[3139409]
Nome=Manhuacu
UF=MG
Provedor=EL
ProRecepcionar=https://mg-manhuacu-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://mg-manhuacu-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://mg-manhuacu-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3139508]
Nome=Manhumirim
UF=MG
Provedor=PadraoNacional

[3139607]
Nome=Mantena
UF=MG
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/mantena/servicos.asmx

[3139706]
Nome=Maravilhas
UF=MG
Provedor=PadraoNacional

[3139805]
; Inclu�do em 01/06/2021
Nome=Mar de Espanha
UF=MG
Provedor=Futurize
Versao=2.02
ProRecepcionar=https://mardeespanhamg.nfse-futurize.com.br/webservice/prod
HomRecepcionar=

[3139904]
; Inclu�do em 04/10/2022
Nome=Maria da Fe
UF=MG
Provedor=Futurize
Versao=2.02
ProRecepcionar=https://mariadafemg.nfse-futurize.com.br/webservice/prod
HomRecepcionar=https://mariadafemg.nfse-futurize.com.br/webservice/homo

[3140001]
Nome=Mariana
UF=MG
Provedor=Betha

[3140100]
Nome=Marilac
UF=MG
Provedor=PadraoNacional

[3140159]
Nome=Mario Campos
UF=MG
Provedor=PadraoNacional

[3140209]
Nome=Maripa de Minas
UF=MG
Provedor=PadraoNacional

[3140308]
Nome=Marlieria
UF=MG
Provedor=PadraoNacional

[3140407]
Nome=Marmelopolis
UF=MG
Provedor=PadraoNacional

[3140506]
Nome=Martinho Campos
UF=MG
Provedor=NotaInteligente
Versao=2.00
ProRecepcionar=https://martinhocampos-mg.notainteligente.com/api/action
HomRecepcionar=https://treino-martinhocampos-mg.notainteligente.com/api/action
;
ProNameSpace=https://martinhocampos-mg.notainteligente.com/api/wsdl
HomNameSpace=https://treino-martinhocampos-mg.notainteligente.com/api/wsdl

[3140530]
Nome=Martins Soares
UF=MG
Provedor=PadraoNacional

[3140555]
Nome=Mata Verde
UF=MG
Provedor=PadraoNacional

[3140605]
Nome=Materlandia
UF=MG
Provedor=PadraoNacional

[3140704]
Nome=Mateus Leme
UF=MG
Provedor=PadraoNacional

[3140803]
Nome=Matias Barbosa
UF=MG
Provedor=Futurize
Versao=2.02
ProRecepcionar=https://matiasbarbosamg.nfse-futurize.com.br/webservice/prod
HomRecepcionar=https://matiasbarbosamg.nfse-futurize.com.br/webservice/homo

[3140852]
Nome=Matias Cardoso
UF=MG
Provedor=PadraoNacional

[3140902]
Nome=Matipo
UF=MG
Provedor=PadraoNacional

[3141009]
Nome=Mato Verde
UF=MG
Provedor=PadraoNacional

[3141108]
Nome=Matozinhos
UF=MG
Provedor=NFSeBrasil

[3141207]
Nome=Matutina
UF=MG
Provedor=PadraoNacional

[3141306]
Nome=Medeiros
UF=MG
Provedor=PadraoNacional

[3141405]
Nome=Medina
UF=MG
Provedor=PadraoNacional

[3141504]
Nome=Mendes Pimentel
UF=MG
Provedor=PadraoNacional

[3141603]
Nome=Merces
UF=MG
Provedor=PadraoNacional

[3141702]
Nome=Mesquita
UF=MG
Provedor=PadraoNacional

[3141801]
Nome=Minas Novas
UF=MG
Provedor=PadraoNacional

[3141900]
Nome=Minduri
UF=MG
Provedor=PadraoNacional

[3142007]
Nome=Mirabela
UF=MG
Provedor=PadraoNacional

[3142106]
Nome=Miradouro
UF=MG
Provedor=PadraoNacional

[3142205]
Nome=Mirai
UF=MG
Provedor=PadraoNacional

[3142254]
Nome=Miravania
UF=MG
Provedor=PadraoNacional

[3142304]
Nome=Moeda
UF=MG
Provedor=PadraoNacional

[3142403]
Nome=Moema
UF=MG
Provedor=PadraoNacional

[3142502]
Nome=Monjolos
UF=MG
Provedor=PadraoNacional

[3142601]
Nome=Monsenhor Paulo
UF=MG
Provedor=PadraoNacional

[3142700]
Nome=Montalvania
UF=MG
Provedor=PadraoNacional

[3142809]
Nome=Monte Alegre de Minas
UF=MG
Provedor=PadraoNacional

[3142908]
Nome=Monte Azul
UF=MG
Provedor=PadraoNacional

[3143005]
Nome=Monte Belo
UF=MG
Provedor=PadraoNacional

[3143104]
; Atualizado em 23/08/2022
Nome=Monte Carmelo
UF=MG
Provedor=eReceita
Versao=2.02
ProRecepcionar=https://webservice.ereceita.net.br/ws/montecarmelomg/wsProducao.php
HomRecepcionar=https://webservice.ereceita.net.br/ws/montecarmelomg/wsHomologacao.php

[3143153]
Nome=Monte Formoso
UF=MG
Provedor=PadraoNacional

[3143203]
Nome=Monte Santo de Minas
UF=MG
Provedor=PadraoNacional

[3143302]
; Atualizado em 29/11/2021
Nome=Montes Claros
UF=MG
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://nota.montesclaros.mg.gov.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://notateste.montesclaros.mg.gov.br/nfse.portal.integracao.teste/services.svc

[3143401]
Nome=Monte Siao
UF=MG
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://200.98.66.118:9028/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://200.98.66.118:9028/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3143450]
Nome=Montezuma
UF=MG
Provedor=PadraoNacional

[3143500]
Nome=Morada Nova de Minas
UF=MG
Provedor=PadraoNacional

[3143609]
Nome=Morro da Garca
UF=MG
Provedor=PadraoNacional

[3143708]
Nome=Morro do Pilar
UF=MG
Provedor=PadraoNacional

[3143807]
Nome=Munhoz
UF=MG
Provedor=PadraoNacional

[3143906]
Nome=Muriae
UF=MG
Provedor=Ginfes
;
ProLinkURL=http://muriae.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://muriae.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3144003]
Nome=Mutum
UF=MG
Provedor=PadraoNacional

[3144102]
Nome=Muzambinho
UF=MG
Provedor=PadraoNacional

[3144201]
Nome=Nacip Raydan
UF=MG
Provedor=PadraoNacional

[3144300]
Nome=Nanuque
UF=MG
Provedor=PadraoNacional

[3144359]
Nome=Naque
UF=MG
Provedor=PadraoNacional

[3144375]
Nome=Natalandia
UF=MG
Provedor=PadraoNacional

[3144409]
Nome=Natercia
UF=MG
Provedor=PadraoNacional

[3144508]
Nome=Nazareno
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://nazareno.nfiss.com.br/soap/
;
ProLinkURL=https://nazareno.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_nazareno.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3144607]
Nome=Nepomuceno
UF=MG
Provedor=Betha

[3144656]
Nome=Ninheira
UF=MG
Provedor=PadraoNacional

[3144672]
Nome=Nova Belem
UF=MG
Provedor=PadraoNacional

[3144706]
Nome=Nova Era
UF=MG
Provedor=PadraoNacional

[3144805]
Nome=Nova Lima
UF=MG
Provedor=Abaco
Versao=2.04
ProRecepcionar=https://www.e-nfs.com.br/e-nfs_novalima/servlet/aa24_recepcionarloterps
ProConsultarLote=https://www.e-nfs.com.br/e-nfs_novalima/servlet/aa24_consultarloterps
ProConsultarNFSeRps=https://www.e-nfs.com.br/e-nfs_novalima/servlet/aa24_consultarnfseporrps
ProConsultarNFSe=https://www.e-nfs.com.br/e-nfs_novalima/servlet/aa24_consultarnfse
ProCancelarNFSe=https://www.e-nfs.com.br/e-nfs_novalima/servlet/aa24_cancelarnfse
ProGerarNFSe=https://www.e-nfs.com.br/e-nfs_novalima/servlet/aa24_gerarnfse
ProRecepcionarSincrono=https://www.e-nfs.com.br/e-nfs_novalima/servlet/aa24_recepcionarloterpssincrono
ProSubstituirNFSe=https://www.e-nfs.com.br/e-nfs_novalima/servlet/aa24_substituirnfse
;
HomRecepcionar=https://enfs-hom.abaco.com.br/novalima/servlet/aa24_recepcionarloterps
HomConsultarLote=https://enfs-hom.abaco.com.br/novalima/servlet/aa24_consultarloterps
HomConsultarNFSeRps=https://enfs-hom.abaco.com.br/novalima/servlet/aa24_consultarnfseporrps
HomConsultarNFSe=https://enfs-hom.abaco.com.br/novalima/servlet/aa24_consultarnfse
HomCancelarNFSe=https://enfs-hom.abaco.com.br/novalima/servlet/aa24_cancelarnfse
HomGerarNFSe=https://enfs-hom.abaco.com.br/novalima/servlet/aa24_gerarnfse
HomRecepcionarSincrono=https://enfs-hom.abaco.com.br/novalima/servlet/aa24_recepcionarloterpssincrono
HomSubstituirNFSe=https://enfs-hom.abaco.com.br/novalima/servlet/aa24_substituirnfse

[3144904]
Nome=Nova Modica
UF=MG
Provedor=PadraoNacional

[3145000]
Nome=Nova Ponte
UF=MG
Provedor=PadraoNacional

[3145059]
Nome=Nova Porteirinha
UF=MG
Provedor=PadraoNacional

[3145109]
Nome=Nova Resende
UF=MG
Provedor=PadraoNacional

[3145208]
Nome=Nova Serrana
UF=MG
Provedor=SigCorp
Versao=2.03
ProRecepcionar=http://abrasfnovaserrana.sigbancos.com.br/servico.asmx
HomRecepcionar=http://testeabrasfnovaserrana.sigbancos.com.br/servico.asmx

[3145307]
Nome=Novo Cruzeiro
UF=MG
Provedor=PadraoNacional

[3145356]
Nome=Novo Oriente de Minas
UF=MG
Provedor=PadraoNacional

[3145372]
Nome=Novorizonte
UF=MG
Provedor=PadraoNacional

[3145406]
Nome=Olaria
UF=MG
Provedor=PadraoNacional

[3145455]
Nome=Olhos-D Agua
UF=MG
Provedor=PadraoNacional

[3145505]
Nome=Olimpio Noronha
UF=MG
Provedor=PadraoNacional

[3145604]
Nome=Oliveira
UF=MG
Provedor=IPM

[3145703]
Nome=Oliveira Fortes
UF=MG
Provedor=PadraoNacional

[3145802]
Nome=Onca de Pitangui
UF=MG
Provedor=PadraoNacional

[3145851]
Nome=Oratorios
UF=MG
Provedor=PadraoNacional

[3145877]
Nome=Orizania
UF=MG
Provedor=PadraoNacional

[3145901]
Nome=Ouro Branco
UF=MG
Provedor=Betha

[3146008]
Nome=Ouro Fino
UF=MG
Provedor=PadraoNacional

[3146107]
Nome=Ouro Preto
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/ouroPreto
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/ouroPreto

[3146206]
Nome=Ouro Verde de Minas
UF=MG
Provedor=PadraoNacional

[3146255]
Nome=Padre Carvalho
UF=MG
Provedor=PadraoNacional

[3146305]
; Inclu�do em 03/08/2021
Nome=Padre Paraiso
UF=MG
Provedor=NFSeBrasil

[3146404]
Nome=Paineiras
UF=MG
Provedor=PadraoNacional

[3146503]
Nome=Pains
UF=MG
Provedor=PadraoNacional

[3146552]
Nome=Pai Pedro
UF=MG
Provedor=PadraoNacional

[3146602]
Nome=Paiva
UF=MG
Provedor=PadraoNacional

[3146701]
Nome=Palma
UF=MG
Provedor=PadraoNacional

[3146750]
Nome=Palmopolis
UF=MG
Provedor=PadraoNacional

[3146909]
Nome=Papagaios
UF=MG
Provedor=PadraoNacional

[3147006]
Nome=Paracatu
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/pctu
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/pctu

[3147105]
; Atualizado em 20/10/2022
Nome=Para de Minas
UF=MG
Provedor=ISSDigital
Versao=2.00
ProRecepcionar=https://parademinas.quasar.srv.br:8444/nfe/snissdigitalsvc
HomRecepcionar=https://parademinas.quasar.srv.br:8444/nfe/snissdigitalsvc

[3147204]
Nome=Paraguacu
UF=MG
Provedor=PadraoNacional

[3147303]
Nome=Paraisopolis
UF=MG
Provedor=PadraoNacional

[3147402]
Nome=Paraopeba
UF=MG
Provedor=PadraoNacional

[3147501]
Nome=Passabem
UF=MG
Provedor=PadraoNacional

[3147600]
Nome=Passa Quatro
UF=MG
Provedor=PadraoNacional

[3147709]
Nome=Passa Tempo
UF=MG
Provedor=PadraoNacional

[3147808]
Nome=Passa-Vinte
UF=MG
Provedor=PadraoNacional

[3147907]
; Atualizado em 17/09/2021
Nome=Passos
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://passosmg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://passosmg.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3147956]
Nome=Patis
UF=MG
Provedor=PadraoNacional

[3148004]
; Atualizado em 28/10/2022
Nome=Patos de Minas
UF=MG
Provedor=Governa
Params=VersaoArquivo:4|VersaoImpressao:5
;
ProRecepcionar=http://187.72.229.145:8089/webservice/eSiat.asmx

[3148103]
Nome=Patrocinio
UF=MG
Provedor=SimplISS
ProRecepcionar=http://wspatrocinio.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wspatrocinio.simplissweb.com.br/nfseservice.svc

[3148202]
Nome=Patrocinio do Muriae
UF=MG
Provedor=PadraoNacional

[3148301]
Nome=Paula Candido
UF=MG
Provedor=PadraoNacional

[3148400]
Nome=Paulistas
UF=MG
Provedor=PadraoNacional

[3148509]
Nome=Pavao
UF=MG
Provedor=PadraoNacional

[3148608]
Nome=Pecanha
UF=MG
Provedor=PadraoNacional

[3148707]
Nome=Pedra Azul
UF=MG
Provedor=PadraoNacional

[3148756]
Nome=Pedra Bonita
UF=MG
Provedor=PadraoNacional

[3148806]
Nome=Pedra do Anta
UF=MG
Provedor=PadraoNacional

[3148905]
Nome=Pedra do Indaia
UF=MG
Provedor=PadraoNacional

[3149002]
Nome=Pedra Dourada
UF=MG
Provedor=PadraoNacional

[3149101]
Nome=Pedralva
UF=MG
Provedor=PadraoNacional

[3149150]
Nome=Pedras de Maria da Cruz
UF=MG
Provedor=PadraoNacional

[3149200]
Nome=Pedrinopolis
UF=MG
Provedor=PadraoNacional

[3149309]
Nome=Pedro Leopoldo
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/pl
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/pl

[3149408]
Nome=Pedro Teixeira
UF=MG
Provedor=PadraoNacional

[3149507]
Nome=Pequeri
UF=MG
Provedor=PadraoNacional

[3149606]
Nome=Pequi
UF=MG
Provedor=Betha

[3149705]
Nome=Perdigao
UF=MG
Provedor=PadraoNacional

[3149804]
Nome=Perdizes
UF=MG
Provedor=PadraoNacional

[3149903]
Nome=Perdoes
UF=MG
Provedor=NotaInteligente
Versao=2.00
ProRecepcionar=https://perdoes-mg.notainteligente.com/api/action
HomRecepcionar=https://treino-perdoes-mg.notainteligente.com/api/action
;
ProNameSpace=https://perdoes-mg.notainteligente.com/api/wsdl
HomNameSpace=https://treino-perdoes-mg.notainteligente.com/api/wsdl

[3149952]
Nome=Periquito
UF=MG
Provedor=PadraoNacional

[3150000]
Nome=Pescador
UF=MG
Provedor=PadraoNacional

[3150109]
Nome=Piau
UF=MG
Provedor=PadraoNacional

[3150158]
Nome=Piedade de Caratinga
UF=MG
Provedor=PadraoNacional

[3150208]
Nome=Piedade de Ponte Nova
UF=MG
Provedor=PadraoNacional

[3150307]
Nome=Piedade do Rio Grande
UF=MG
Provedor=PadraoNacional

[3150406]
Nome=Piedade Dos Gerais
UF=MG
Provedor=PadraoNacional

[3150505]
Nome=Pimenta
UF=MG
Provedor=PadraoNacional

[3150539]
Nome=Pingo-D Agua
UF=MG
Provedor=PadraoNacional

[3150570]
Nome=Pintopolis
UF=MG
Provedor=PadraoNacional

[3150604]
Nome=Piracema
UF=MG
Provedor=PadraoNacional

[3150703]
; Atualizado em 11/06/2021
Nome=Pirajuba
UF=MG
Provedor=Betha

[3150802]
Nome=Piranga
UF=MG
Provedor=PadraoNacional

[3150901]
Nome=Pirangucu
UF=MG
Provedor=PadraoNacional

[3151008]
Nome=Piranguinho
UF=MG
Provedor=PadraoNacional

[3151107]
; Inclu�do em 07/07/2022
Nome=Pirapetinga
UF=MG
Provedor=Siappa
ProRecepcionar=https://app.siappa.com.br/issqn_pirapetinga/servlet/com.issqnwebev3v2.aws_gera_nfse_token
ProConsultarNFSe=https://app.siappa.com.br/issqn_pirapetinga/servlet/com.issqnwebev3v2.aws_consulta_nfse_token
ProCancelarNFSe=https://app.siappa.com.br/issqn_pirapetinga/servlet/com.issqnwebev3v2.aws_cancela_nfse_token
ProGerarToken=https://app.siappa.com.br/issqn_pirapetinga/servlet/com.issqnwebev3v2.aws_gera_token
;
HomRecepcionar=https://app.siappa.com.br/issqn_pirapetinga/servlet/com.issqnwebev3v2.aws_gera_nfse_token
HomConsultarNFSe=https://app.siappa.com.br/issqn_pirapetinga/servlet/com.issqnwebev3v2.aws_consulta_nfse_token
HomCancelarNFSe=https://app.siappa.com.br/issqn_pirapetinga/servlet/com.issqnwebev3v2.aws_cancela_nfse_token
HomGerarToken=https://app.siappa.com.br/issqn_pirapetinga/servlet/com.issqnwebev3v2.aws_gera_token

[3151206]
Nome=Pirapora
UF=MG
Provedor=PadraoNacional

[3151305]
Nome=Pirauba
UF=MG
Provedor=PadraoNacional

[3151404]
Nome=Pitangui
UF=MG
Provedor=PadraoNacional

[3151503]
Nome=Piumhi
UF=MG
Provedor=ISSIntel
ProNameSpace=http://piumhi-mg.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://piumhi-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://piumhi-mg.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://piumhi-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://piumhi-mg.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://piumhi-mg.treino-issintel.com.br/webservices/abrasf/api/

[3151602]
Nome=Planura
UF=MG
Provedor=Betha

[3151701]
Nome=Poco Fundo
UF=MG
Provedor=Betha

[3151800]
Nome=Pocos de Caldas
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/pocos
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/pocos

[3151909]
Nome=Pocrane
UF=MG
Provedor=PadraoNacional

[3152006]
Nome=Pompeu
UF=MG
Provedor=eReceita
Versao=2.02
ProRecepcionar=http://webservice.ereceita.net.br/ws/pompeu/wsProducao.php
HomRecepcionar=http://webservice.ereceita.net.br/ws/pompeu/wsHomologacao.php
;
ProLinkURL=http://server21.pompeu.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true
HomLinkURL=http://server21.pompeu.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true

[3152105]
Nome=Ponte Nova
UF=MG
Provedor=NFSeBrasil

[3152131]
Nome=Ponto Chique
UF=MG
Provedor=PadraoNacional

[3152170]
Nome=Ponto Dos Volantes
UF=MG
Provedor=PadraoNacional

[3152204]
Nome=Porteirinha
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://porteirinhamg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://porteirinhamg.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3152303]
Nome=Porto Firme
UF=MG
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/portofirmemg_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/portofirmemg_wsnfse_homolog/NfseServices.svc

[3152402]
Nome=Pote
UF=MG
Provedor=PadraoNacional

[3152501]
; Atualizado em 27/12/2022
Nome=Pouso Alegre
UF=MG
Provedor=SigCorp
Versao=2.04
;
ProRecepcionar=https://abrasfpousoalegre.meumunicipio.online/ws
HomRecepcionar=https://testepousoalegre.meumunicipio.online/abrasf/ws
;
ProNameSpace=https://abrasfpousoalegre.meumunicipio.online/ws
HomNameSpace=https://testepousoalegreabrasf.meumunicipio.online/ws

[3152600]
Nome=Pouso Alto
UF=MG
Provedor=ISSIntel
ProNameSpace=http://pousoalto-mg.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://pousoalto-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://pousoalto-mg.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://pousoalto-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://pousoalto-mg.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://pousoalto-mg.treino-issintel.com.br/webservices/abrasf/api/

[3152709]
Nome=Prados
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://prados.nfiss.com.br/soap/
;
ProLinkURL=https://prados.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_prados.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3152808]
Nome=Prata
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/prata
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/prata

[3152907]
Nome=Pratapolis
UF=MG
Provedor=PadraoNacional

[3153004]
Nome=Pratinha
UF=MG
Provedor=PadraoNacional

[3153103]
Nome=Presidente Bernardes
UF=MG
Provedor=PadraoNacional

[3153202]
Nome=Presidente Juscelino
UF=MG
Provedor=PadraoNacional

[3153301]
Nome=Presidente Kubitschek
UF=MG
Provedor=PadraoNacional

[3153400]
Nome=Presidente Olegario
UF=MG
Provedor=PadraoNacional

[3153509]
Nome=Alto Jequitiba
UF=MG
Provedor=PadraoNacional

[3153608]
Nome=Prudente de Morais
UF=MG
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/prudentedemoraismg_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/prudentedemoraismg_wsnfse_homolog/NfseServices.svc

[3153707]
Nome=Quartel Geral
UF=MG
Provedor=PadraoNacional

[3153806]
Nome=Queluzito
UF=MG
Provedor=PadraoNacional

[3153905]
Nome=Raposos
UF=MG
Provedor=ISSIntel
ProNameSpace=http://raposos-mg.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://raposos-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://raposos-mg.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://raposos-mg.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://raposos-mg.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://raposos-mg.treino-issintel.com.br/webservices/abrasf/api/

[3154002]
Nome=Raul Soares
UF=MG
Provedor=PadraoNacional

[3154101]
Nome=Recreio
UF=MG
Provedor=PadraoNacional

[3154150]
Nome=Reduto
UF=MG
Provedor=PadraoNacional

[3154200]
Nome=Resende Costa
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://resendecosta.nfiss.com.br/soap/
;
ProLinkURL=https://resendecosta.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_resendecosta.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3154309]
Nome=Resplendor
UF=MG
Provedor=PadraoNacional

[3154408]
Nome=Ressaquinha
UF=MG
Provedor=PadraoNacional

[3154457]
Nome=Riachinho
UF=MG
Provedor=PadraoNacional

[3154507]
Nome=Riacho Dos Machados
UF=MG
Provedor=PadraoNacional

[3154606]
; Atualizado em 20/10/2022
Nome=Ribeirao das Neves
UF=MG
Provedor=ISSDigital
Versao=2.00
ProRecepcionar=https://issqn.ribeiraodasneves.quasar.srv.br/nfe/snissdigitalsvc
HomRecepcionar=https://issqn.ribeiraodasneves.quasar.srv.br/nfe/snissdigitalsvc

[3154705]
Nome=Ribeirao Vermelho
UF=MG
Provedor=PadraoNacional

[3154804]
Nome=Rio Acima
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://rioacima.nfiss.com.br/soap/
;
ProLinkURL=https://rioacima.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_rioacima.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3154903]
Nome=Rio Casca
UF=MG
Provedor=PadraoNacional

[3155009]
Nome=Rio Doce
UF=MG
Provedor=PadraoNacional

[3155108]
Nome=Rio do Prado
UF=MG
Provedor=PadraoNacional

[3155207]
Nome=Rio Espera
UF=MG
Provedor=PadraoNacional

[3155306]
Nome=Rio Manso
UF=MG
Provedor=PadraoNacional

[3155405]
Nome=Rio Novo
UF=MG
Provedor=PadraoNacional

[3155504]
Nome=Rio Paranaiba
UF=MG
Provedor=PadraoNacional

[3155603]
Nome=Rio Pardo de Minas
UF=MG
Provedor=PadraoNacional

[3155702]
Nome=Rio Piracicaba
UF=MG
Provedor=WebISS
ProRecepcionar=https://www3.webiss.com.br/riopiracicabamg_wsnfse/NfseServices.svc
HomRecepcionar=https://www3.webiss.com.br/riopiracicabamg_wsnfse_homolog/NfseServices.svc

[3155801]
Nome=Rio Pomba
UF=MG
Provedor=PadraoNacional

[3155900]
Nome=Rio Preto
UF=MG
Provedor=PadraoNacional

[3156007]
Nome=Rio Vermelho
UF=MG
Provedor=PadraoNacional

[3156106]
Nome=Ritapolis
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://ritapolis.nfiss.com.br/soap/
;
ProLinkURL=https://ritapolis.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_ritapolis.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3156205]
Nome=Rochedo de Minas
UF=MG
Provedor=PadraoNacional

[3156304]
Nome=Rodeiro
UF=MG
Provedor=PadraoNacional

[3156403]
Nome=Romaria
UF=MG
Provedor=PadraoNacional

[3156452]
Nome=Rosario da Limeira
UF=MG
Provedor=PadraoNacional

[3156502]
Nome=Rubelita
UF=MG
Provedor=PadraoNacional

[3156601]
Nome=Rubim
UF=MG
Provedor=PadraoNacional

[3156700]
; Atualizado em 20/10/2022
Nome=Sabara
UF=MG
Provedor=ISSDigital
Versao=2.00
ProRecepcionar=http://sabara.supernova.com.br:8091/nfe/snissdigitalsvc
HomRecepcionar=http://sabara.supernova.com.br:8091/nfe/snissdigitalsvc

[3156809]
Nome=Sabinopolis
UF=MG
Provedor=PadraoNacional

[3156908]
; Atualizado em 11/06/2021
Nome=Sacramento
UF=MG
Provedor=Betha

[3157005]
Nome=Salinas
UF=MG
Provedor=PadraoNacional

[3157104]
Nome=Salto da Divisa
UF=MG
Provedor=PadraoNacional

[3157203]
Nome=Santa Barbara
UF=MG
Provedor=WebISS
ProRecepcionar=https://www3.webiss.com.br/santabarbaramg_wsnfse/NfseServices.svc
HomRecepcionar=https://www3.webiss.com.br/santabarbaramg_wsnfse_homolog/NfseServices.svc

[3157252]
Nome=Santa Barbara do Leste
UF=MG
Provedor=PadraoNacional

[3157278]
Nome=Santa Barbara do Monte Verde
UF=MG
Provedor=PadraoNacional

[3157302]
Nome=Santa Barbara do Tugurio
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://santabarbaradotugurio.nfiss.com.br/soap/
;
ProLinkURL=https://santabarbaradotugurio.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_santabarbaradotugurio.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3157336]
Nome=Santa Cruz de Minas
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://santacruzdeminas.nfiss.com.br/soap/
;
ProLinkURL=https://santacruzdeminas.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_santacruzdeminas.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3157377]
Nome=Santa Cruz de Salinas
UF=MG
Provedor=PadraoNacional

[3157401]
Nome=Santa Cruz do Escalvado
UF=MG
Provedor=PadraoNacional

[3157500]
Nome=Santa Efigenia de Minas
UF=MG
Provedor=PadraoNacional

[3157609]
Nome=Santa Fe de Minas
UF=MG
Provedor=PadraoNacional

[3157658]
Nome=Santa Helena de Minas
UF=MG
Provedor=PadraoNacional

[3157708]
Nome=Santa Juliana
UF=MG
Provedor=PadraoNacional

[3157807]
; Atualizado em 29/04/2022
Nome=Santa Luzia
UF=MG
Provedor=Etherium
Versao=2.03
ProRecepcionar=https://santaluziaabrasf.meumunicipio.digital/servico.asmx
HomRecepcionar=https://testeabrasfsantaluzia.meumunicipio.digital/servico.asmx

[3157906]
Nome=Santa Margarida
UF=MG
Provedor=PadraoNacional

[3158003]
Nome=Santa Maria de Itabira
UF=MG
Provedor=PadraoNacional

[3158102]
Nome=Santa Maria do Salto
UF=MG
Provedor=PadraoNacional

[3158201]
Nome=Santa Maria do Suacui
UF=MG
Provedor=PadraoNacional

[3158300]
Nome=Santana da Vargem
UF=MG
Provedor=PadraoNacional

[3158409]
Nome=Santana de Cataguases
UF=MG
Provedor=PadraoNacional

[3158508]
Nome=Santana de Pirapama
UF=MG
Provedor=PadraoNacional

[3158607]
Nome=Santana do Deserto
UF=MG
Provedor=PadraoNacional

[3158706]
Nome=Santana do Garambeu
UF=MG
Provedor=PadraoNacional

[3158805]
Nome=Santana do Jacare
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://santanadojacare.nfiss.com.br/soap/
;
ProLinkURL=https://santanadojacare.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_santanadojacare.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3158904]
Nome=Santana do Manhuacu
UF=MG
Provedor=PadraoNacional

[3158953]
Nome=Santana do Paraiso
UF=MG
Provedor=PadraoNacional

[3159001]
Nome=Santana do Riacho
UF=MG
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/santanadoriachomg_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/santanadoriachomg_wsnfse_homolog/NfseServices.svc

[3159100]
Nome=Santana dos Montes
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://santanadosmontes.nfiss.com.br/soap/
;
ProLinkURL=https://santanadosmontes.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_santanadosmontes.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3159209]
Nome=Santa Rita de Caldas
UF=MG
Provedor=PadraoNacional

[3159308]
Nome=Santa Rita de Jacutinga
UF=MG
Provedor=PadraoNacional

[3159357]
Nome=Santa Rita de Minas
UF=MG
Provedor=PadraoNacional

[3159407]
Nome=Santa Rita de Ibitipoca
UF=MG
Provedor=PadraoNacional

[3159506]
Nome=Santa Rita do Itueto
UF=MG
Provedor=PadraoNacional

[3159605]
Nome=Santa Rita do Sapucai
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://santaritadosapucai.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://santaritadosapucai.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3159704]
Nome=Santa Rosa da Serra
UF=MG
Provedor=PadraoNacional

[3159803]
Nome=Santa Vitoria
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/santaVit
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/santaVit

[3159902]
Nome=Santo Antonio do Amparo
UF=MG
Provedor=Betha

[3160009]
Nome=Santo Antonio do Aventureiro
UF=MG
Provedor=PadraoNacional

[3160108]
Nome=Santo Antonio do Grama
UF=MG
Provedor=PadraoNacional

[3160207]
Nome=Santo Antonio do Itambe
UF=MG
Provedor=PadraoNacional

[3160306]
Nome=Santo Antonio do Jacinto
UF=MG
Provedor=PadraoNacional

[3160405]
; Atualizado em 15/09/2022
Nome=Santo Antonio do Monte
UF=MG
Provedor=IPM
Versao=1.01
ProRecepcionar=https://santoantoniodomonte.atende.net/?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://santoantoniodomonte.atende.net/?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1

[3160454]
Nome=Santo Antonio do Retiro
UF=MG
Provedor=PadraoNacional

[3160504]
Nome=Santo Antonio do Rio Abaixo
UF=MG
Provedor=PadraoNacional

[3160603]
Nome=Santo Hipolito
UF=MG
Provedor=PadraoNacional

[3160702]
; Inclu�do em 28/05/2021
Nome=Santos Dumont
UF=MG
Provedor=ADPM
Versao=2.03
ProRecepcionar=https://api.redemunicipal.com.br/serversoap/NfseWSService
HomRecepcionar=http://200.251.30.48:8080/serversoap/NfseWSService

[3160801]
Nome=Sao Bento Abade
UF=MG
Provedor=PadraoNacional

[3160900]
Nome=Sao Bras do Suacui
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://saobrasdosuacui.nfiss.com.br/soap/
;
ProLinkURL=https://saobrasdosuacui.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_saobrasdosuacui.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3160959]
; Inclu�do em 02/12/2022
Nome=Sao Domingos das Dores
UF=MG
Provedor=Futurize
Versao=2.02
ProRecepcionar=https://saodomingosdasdoresmg.nfse-futurize.com.br/webservice/prod
HomRecepcionar=https://saodomingosdasdoresmg.nfse-futurize.com.br/webservice/homo

[3161007]
Nome=Sao Domingos do Prata
UF=MG
Provedor=PadraoNacional

[3161056]
Nome=Sao Felix de Minas
UF=MG
Provedor=PadraoNacional

[3161106]
Nome=Sao Francisco
UF=MG
Provedor=eReceita
Versao=2.02
ProRecepcionar=http://webservice.ereceita.net.br/ws/saofranciscomg/wsProducao.php
HomRecepcionar=http://webservice.ereceita.net.br/ws/saofranciscomg/wsHomologacao.php
;
ProLinkURL=http://server21.saofranciscomg.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true
HomLinkURL=http://server21.saofranciscomg.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true

[3161205]
Nome=Sao Francisco de Paula
UF=MG
Provedor=PadraoNacional

[3161304]
Nome=Sao Francisco de Sales
UF=MG
Provedor=PadraoNacional

[3161403]
Nome=Sao Francisco do Gloria
UF=MG
Provedor=PadraoNacional

[3161502]
; Atualizado em 29/12/2021
Nome=Sao Geraldo
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://saogeraldo.nfiss.com.br/soap/
HomRecepcionar=https://homologasaogeraldo.nfiss.com.br/soap/
;
ProLinkURL=https://saogeraldo.nfiss.com.br/?Meio=qr&N=%NumeroNFSe%&C=%Cnpj%&T=N&K=%CodVerif%
HomLinkURL=https://homologasaogeraldo.nfiss.com.br/?Meio=qr&N=%NumeroNFSe%&C=%Cnpj%&T=N&K=%CodVerif%

[3161601]
Nome=Sao Geraldo da Piedade
UF=MG
Provedor=PadraoNacional

[3161650]
Nome=Sao Geraldo do Baixio
UF=MG
Provedor=PadraoNacional

[3161700]
Nome=Sao Goncalo do Abaete
UF=MG
Provedor=PadraoNacional

[3161809]
Nome=Sao Goncalo do Para
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://saogoncalodoparamg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://saogoncalodoparamg.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3161908]
Nome=Sao Goncalo do Rio Abaixo
UF=MG
Provedor=PadraoNacional

[3162005]
Nome=Sao Goncalo do Sapucai
UF=MG
Provedor=PadraoNacional

[3162104]
Nome=Sao Gotardo
UF=MG
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/saogotardomg_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/saogotardomg_wsnfse_homolog/NfseServices.svc

[3162203]
Nome=Sao Joao Batista do Gloria
UF=MG
Provedor=PadraoNacional

[3162252]
Nome=Sao Joao da Lagoa
UF=MG
Provedor=PadraoNacional

[3162302]
Nome=Sao Joao da Mata
UF=MG
Provedor=PadraoNacional

[3162401]
Nome=Sao Joao da Ponte
UF=MG
Provedor=PadraoNacional

[3162450]
Nome=Sao Joao das Missoes
UF=MG
Provedor=PadraoNacional

[3162500]
; Atualizado em 28/10/2022
Nome=Sao Joao Del Rei
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://saojoaodelrei.nfiss.com.br/soap/
HomRecepcionar=https://homologasaojoaodelrei.nfiss.com.br/soap/
;
ProLinkURL=https://saojoaodelrei.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_saojoaodelrei.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3162559]
Nome=Sao Joao do Manhuacu
UF=MG
Provedor=PadraoNacional

[3162575]
Nome=Sao Joao do Manteninha
UF=MG
Provedor=PadraoNacional

[3162609]
Nome=Sao Joao do Oriente
UF=MG
Provedor=PadraoNacional

[3162658]
Nome=Sao Joao do Pacui
UF=MG
Provedor=PadraoNacional

[3162708]
Nome=Sao Joao do Paraiso
UF=MG
Provedor=PadraoNacional

[3162807]
Nome=Sao Joao Evangelista
UF=MG
Provedor=PadraoNacional

[3162906]
Nome=Sao Joao Nepomuceno
UF=MG
Provedor=PadraoNacional

[3162922]
Nome=Sao Joaquim de Bicas
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/sjbicas
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/sjbicas

[3162948]
Nome=Sao Jose da Barra
UF=MG
Provedor=PadraoNacional

[3162955]
Nome=Sao Jose da Lapa
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/sjl
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/sjl

[3163003]
Nome=Sao Jose da Safira
UF=MG
Provedor=PadraoNacional

[3163102]
Nome=Sao Jose da Varginha
UF=MG
Provedor=PadraoNacional

[3163201]
Nome=Sao Jose do Alegre
UF=MG
Provedor=PadraoNacional

[3163300]
Nome=Sao Jose do Divino
UF=MG
Provedor=PadraoNacional

[3163409]
Nome=Sao Jose do Goiabal
UF=MG
Provedor=PadraoNacional

[3163508]
Nome=Sao Jose do Jacuri
UF=MG
Provedor=PadraoNacional

[3163607]
Nome=Sao Jose do Mantimento
UF=MG
Provedor=PadraoNacional

[3163706]
; Inclu�do em 19/01/2022
Nome=Sao Lourenco
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://saolourencomg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://saolourencomg.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3163805]
Nome=Sao Miguel do Anta
UF=MG
Provedor=PadraoNacional

[3163904]
Nome=Sao Pedro da Uniao
UF=MG
Provedor=PadraoNacional

[3164001]
Nome=Sao Pedro Dos Ferros
UF=MG
Provedor=PadraoNacional

[3164100]
Nome=Sao Pedro do Suacui
UF=MG
Provedor=PadraoNacional

[3164209]
Nome=Sao Romao
UF=MG
Provedor=PadraoNacional

[3164308]
Nome=Sao Roque de Minas
UF=MG
Provedor=PadraoNacional

[3164407]
Nome=Sao Sebastiao da Bela Vista
UF=MG
Provedor=PadraoNacional

[3164431]
Nome=Sao Sebastiao da Vargem Alegre
UF=MG
Provedor=PadraoNacional

[3164472]
Nome=Sao Sebastiao do Anta
UF=MG
Provedor=PadraoNacional

[3164506]
Nome=Sao Sebastiao do Maranhao
UF=MG
Provedor=PadraoNacional

[3164605]
Nome=Sao Sebastiao do Oeste
UF=MG
Provedor=Betha

[3164704]
Nome=Sao Sebastiao do Paraiso
UF=MG
Provedor=eReceita
Versao=2.02
ProRecepcionar=http://webservice.ereceita.net.br/ws/ssparaiso/wsProducao.php
HomRecepcionar=http://webservice.ereceita.net.br/ws/ssparaiso/wsHomologacao.php
;
ProLinkURL=http://server21.ssparaiso.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true
HomLinkURL=http://server21.ssparaiso.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true

[3164803]
Nome=Sao Sebastiao do Rio Preto
UF=MG
Provedor=PadraoNacional

[3164902]
Nome=Sao Sebastiao do Rio Verde
UF=MG
Provedor=PadraoNacional

[3165008]
Nome=Sao Tiago
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://saotiago.nfiss.com.br/soap/
;
ProLinkURL=https://saotiago.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_saotiago.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3165107]
Nome=Sao Tomas de Aquino
UF=MG
Provedor=PadraoNacional

[3165206]
Nome=Sao Thome das Letras
UF=MG
Provedor=PadraoNacional

[3165305]
Nome=Sao Vicente de Minas
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://saovicentedeminas.nfiss.com.br/soap/
;
ProLinkURL=https://saovicentedeminas.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_saovicentedeminas.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3165404]
Nome=Sapucai-Mirim
UF=MG
Provedor=PadraoNacional

[3165503]
Nome=Sardoa
UF=MG
Provedor=PadraoNacional

[3165537]
Nome=Sarzedo
UF=MG
Provedor=PadraoNacional

[3165552]
Nome=Setubinha
UF=MG
Provedor=PadraoNacional

[3165560]
Nome=Sem-Peixe
UF=MG
Provedor=PadraoNacional

[3165578]
Nome=Senador Amaral
UF=MG
Provedor=PadraoNacional

[3165602]
Nome=Senador Cortes
UF=MG
Provedor=PadraoNacional

[3165701]
Nome=Senador Firmino
UF=MG
Provedor=PadraoNacional

[3165800]
Nome=Senador Jose Bento
UF=MG
Provedor=PadraoNacional

[3165909]
Nome=Senador Modestino Goncalves
UF=MG
Provedor=PadraoNacional

[3166006]
Nome=Senhora de Oliveira
UF=MG
Provedor=PadraoNacional

[3166105]
Nome=Senhora do Porto
UF=MG
Provedor=PadraoNacional

[3166204]
Nome=Senhora Dos Remedios
UF=MG
Provedor=PadraoNacional

[3166303]
Nome=Sericita
UF=MG
Provedor=PadraoNacional

[3166402]
Nome=Seritinga
UF=MG
Provedor=PadraoNacional

[3166501]
Nome=Serra Azul de Minas
UF=MG
Provedor=PadraoNacional

[3166600]
Nome=Serra da Saudade
UF=MG
Provedor=PadraoNacional

[3166709]
Nome=Serra Dos Aimores
UF=MG
Provedor=PadraoNacional

[3166808]
Nome=Serra do Salitre
UF=MG
Provedor=PadraoNacional

[3166907]
Nome=Serrania
UF=MG
Provedor=Betha

[3166956]
Nome=Serranopolis de Minas
UF=MG
Provedor=PadraoNacional

[3167004]
Nome=Serranos
UF=MG
Provedor=PadraoNacional

[3167103]
Nome=Serro
UF=MG
Provedor=PadraoNacional

[3167202]
; Atualizado em 29/12/2021
Nome=Sete Lagoas
UF=MG
Provedor=Actcon
Versao=2.02
Params=DataEmissao:Date
;
ProRecepcionar=https://nfsesetelagoas.portalfacil.com.br/nfseserv/webservice/servicos
HomRecepcionar=https://homologacaosetelagoas.portalfacil.com.br/homologacao/webservice/servicos
;
ProXMLNameSpace=http://nfsesetelagoas.portalfacil.com.br/nfseserv/schema/nfse_v202.xsd
HomXMLNameSpace=http://homologacaosetelagoas.portalfacil.com.br/homologacao/schema/nfse_v202.xsd
;
ProNameSpace=http://nfsesetelagoas.portalfacil.com.br/nfseserv/webservice/nfse.wsdl
HomNameSpace=http://homologacaosetelagoas.portalfacil.com.br/homologacao/webservice/nfse.wsdl
;
ProSoapAction=http://nfsesetelagoas.portalfacil.com.br/nfseserv/webservice/servicos#
HomSoapAction=http://homologacaosetelagoas.portalfacil.com.br/homologacao/webservice/servicos#

[3167301]
Nome=Silveirania
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://silveirania.nfiss.com.br/soap/
;
ProLinkURL=https://silveirania.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_silveirania.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3167400]
Nome=Silvianopolis
UF=MG
Provedor=PadraoNacional

[3167509]
Nome=Simao Pereira
UF=MG
Provedor=PadraoNacional

[3167608]
Nome=Simonesia
UF=MG
Provedor=PadraoNacional

[3167707]
Nome=Sobralia
UF=MG
Provedor=PadraoNacional

[3167806]
Nome=Soledade de Minas
UF=MG
Provedor=PadraoNacional

[3167905]
Nome=Tabuleiro
UF=MG
Provedor=PadraoNacional

[3168002]
Nome=Taiobeiras
UF=MG
Provedor=PadraoNacional

[3168051]
Nome=Taparuba
UF=MG
Provedor=PadraoNacional

[3168101]
Nome=Tapira
UF=MG
Provedor=Betha

[3168200]
Nome=Tapirai
UF=MG
Provedor=PadraoNacional

[3168309]
Nome=Taquaracu de Minas
UF=MG
Provedor=PadraoNacional

[3168408]
Nome=Tarumirim
UF=MG
Provedor=PadraoNacional

[3168507]
Nome=Teixeiras
UF=MG
Provedor=PadraoNacional

[3168606]
Nome=Teofilo Otoni
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/ton
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/ton

[3168705]
Nome=Timoteo
UF=MG
Provedor=PadraoNacional

[3168804]
Nome=Tiradentes
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://tiradentes.nfiss.com.br/soap/
;
ProLinkURL=https://tiradentes.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_tiradentes.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3168903]
Nome=Tiros
UF=MG
Provedor=PadraoNacional

[3169000]
Nome=Tocantins
UF=MG
Provedor=PadraoNacional

[3169059]
Nome=Tocos do Moji
UF=MG
Provedor=PadraoNacional

[3169109]
Nome=Toledo
UF=MG
Provedor=PadraoNacional

[3169208]
Nome=Tombos
UF=MG
Provedor=PadraoNacional

[3169307]
Nome=Tres Coracoes
UF=MG
Provedor=EL
ProRecepcionar=https://mg-trescoracoes-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://mg-trescoracoes-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://mg-trescoracoes-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3169356]
Nome=Tres Marias
UF=MG
Provedor=NFSeBrasil

[3169406]
Nome=Tres Pontas
UF=MG
Provedor=PadraoNacional

[3169505]
; Inclu�do em 22/03/2022
; Atualizado em 22/04/2022
Nome=Tumiritinga
UF=MG
Provedor=Sintese
Versao=2.04
ProRecepcionar=https://tumiritinga.sintesetecnologia.com.br/nfsews/NfseWS
HomRecepcionar=https://homologacao.sintesetecnologia.com.br/nfsews/NfseWS

[3169604]
Nome=Tupaciguara
UF=MG
Provedor=PadraoNacional

[3169703]
Nome=Turmalina
UF=MG
Provedor=PadraoNacional

[3169802]
Nome=Turvolandia
UF=MG
Provedor=PadraoNacional

[3169901]
Nome=Uba
UF=MG
Provedor=VersaTecnologia
Versao=2.01
Params=URLProducao:nfe.uba.mg.gov.br|URLHomologacao:homologacaouba.versatecnologia.com.br
;
ProRecepcionar=http://nfe.uba.mg.gov.br/webservice/servicos
HomRecepcionar=http://homologacaouba.versatecnologia.com.br/webservice/servicos
;
ProNameSpace=http://nfe.uba.mg.gov.br/webservice/schema/nfse_v201.xsd
HomNameSpace=http://homologacaouba.versatecnologia.com.br/webservice/schema/nfse_v201.xsd
;
ProXMLNameSpace=http://nfe.uba.mg.gov.br/schema/nfse_v201.xsd
HomXMLNameSpace=http://nfe.uba.mg.gov.br/schema/nfse_v201.xsd

[3170008]
Nome=Ubai
UF=MG
Provedor=PadraoNacional

[3170057]
Nome=Ubaporanga
UF=MG
Provedor=PadraoNacional

[3170107]
Nome=Uberaba
UF=MG
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://uberabamg.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx

[3170206]
Nome=Uberlandia
UF=MG
Provedor=ISSDSF
;
ProRecepcionar=https://udigital.uberlandia.mg.gov.br/WsNFe2/LoteRps.jws
;
ProNameSpace=http://udigital.uberlandia.mg.gov.br/WsNFe2/LoteRps.jws
HomNameSpace=http://udigital.uberlandia.mg.gov.br/WsNFe2/LoteRps.jws

[3170305]
Nome=Umburatiba
UF=MG
Provedor=PadraoNacional

[3170404]
Nome=Unai
UF=MG
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/unai
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/unai

[3170438]
Nome=Uniao de Minas
UF=MG
Provedor=PadraoNacional

[3170479]
Nome=Uruana de Minas
UF=MG
Provedor=PadraoNacional

[3170503]
Nome=Urucania
UF=MG
Provedor=PadraoNacional

[3170529]
Nome=Urucuia
UF=MG
Provedor=PadraoNacional

[3170578]
Nome=Vargem Alegre
UF=MG
Provedor=PadraoNacional

[3170602]
Nome=Vargem Bonita
UF=MG
Provedor=PadraoNacional

[3170651]
Nome=Vargem Grande do Rio Pardo
UF=MG
Provedor=PadraoNacional

[3170701]
Nome=Varginha
UF=MG
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/mg.varginha/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/mg.varginha/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/mg.varginha/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/mg.varginha/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3170750]
Nome=Varjao de Minas
UF=MG
Provedor=PadraoNacional

[3170800]
; Atualizado em 18/11/2022
Nome=Varzea da Palma
UF=MG
Provedor=Sintese
Versao=2.04
ProRecepcionar=https://varzeadapalma.sintesetecnologia.com.br/nfsews/NfseWS
HomRecepcionar=http://homologacao.sintesetecnologia.com.br/nfsews/NfseWS

[3170909]
Nome=Varzelandia
UF=MG
Provedor=PadraoNacional

[3171006]
Nome=Vazante
UF=MG
Provedor=PadraoNacional

[3171030]
Nome=Verdelandia
UF=MG
Provedor=PadraoNacional

[3171071]
Nome=Veredinha
UF=MG
Provedor=PadraoNacional

[3171105]
Nome=Verissimo
UF=MG
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/verissimomg_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/verissimomg_wsnfse_homolog/NfseServices.svc

[3171154]
Nome=Vermelho Novo
UF=MG
Provedor=PadraoNacional

[3171204]
Nome=Vespasiano
UF=MG
Provedor=NFSeBrasil

[3171303]
Nome=Vicosa
UF=MG
Provedor=eReceita
Versao=2.02
ProRecepcionar=http://webservice.ereceita.net.br/ws/vicosa/wsProducao.php
HomRecepcionar=http://webservice.ereceita.net.br/ws/vicosa/wsHomologacao.php
;
ProLinkURL=http://server21.vicosa.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true
HomLinkURL=http://server21.vicosa.mg.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true

[3171402]
Nome=Vieiras
UF=MG
Provedor=PadraoNacional

[3171501]
Nome=Mathias Lobato
UF=MG
Provedor=PadraoNacional

[3171600]
Nome=Virgem da Lapa
UF=MG
Provedor=PadraoNacional

[3171709]
Nome=Virginia
UF=MG
Provedor=PadraoNacional

[3171808]
Nome=Virginopolis
UF=MG
Provedor=PadraoNacional

[3171907]
Nome=Virgolandia
UF=MG
Provedor=PadraoNacional

[3172004]
; Atualizado em 29/12/2021
Nome=Visconde do Rio Branco
UF=MG
Provedor=SH3
Versao=2.00
ProRecepcionar=https://viscondedoriobranco.nfiss.com.br/soap/
HomRecepcionar=https://homologaviscondedoriobranco.nfiss.com.br/soap/
;
ProLinkURL=https://viscondedoriobranco.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologaviscondedoriobranco.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3172103]
Nome=Volta Grande
UF=MG
Provedor=PadraoNacional

[3172202]
Nome=Wenceslau Braz
UF=MG
Provedor=PadraoNacional

[3200102]
Nome=Afonso Claudio
UF=ES
Provedor=ISSIntel
ProNameSpace=http://afonsoclaudio-es.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://afonsoclaudio-es.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://afonsoclaudio-es.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://afonsoclaudio-es.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://afonsoclaudio-es.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://afonsoclaudio-es.treino-issintel.com.br/webservices/abrasf/api/

[3200136]
; Inclu�do em 10/05/2021
Nome=Aguia Branca
UF=ES
Provedor=EL
ProRecepcionar=https://es-aguiabranca-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-aguiabranca-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-aguiabranca-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3200169]
Nome=Agua Doce do Norte
UF=ES
Provedor=PadraoNacional

[3200201]
Nome=Alegre
UF=ES
Provedor=PadraoNacional

[3200300]
; Atualizado em 13/05/2022
Nome=Alfredo Chaves
UF=ES
Provedor=EL
ProRecepcionar=https://es-alfredochaves-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-alfredochaves-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-alfredochaves-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3200359]
Nome=Alto Rio Novo
UF=ES
Provedor=PadraoNacional

[3200409]
; Atualizado em 06/10/2021
Nome=Anchieta
UF=ES
Provedor=EL
ProRecepcionar=http://servicos.anchieta.es.gov.br:9090/nfse/RpsServiceService
HomRecepcionar=
;
ProLinkURL=http://servicos.anchieta.es.gov.br:9090/nfse/paginas/sistema/autenticacao.jsf?cpfCnpj=%Cnpj%&chave=%
HomLinkURL=http://servicos.anchieta.es.gov.br:9090/nfse/paginas/sistema/autenticacao.jsf?cpfCnpj=%Cnpj%&chave=%

[3200508]
Nome=Apiaca
UF=ES
Provedor=PadraoNacional

[3200607]
Nome=Aracruz
UF=ES
Provedor=EL
ProRecepcionar=https://es-aracruz-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=http://nfe.pma.es.gov.br:8080/nfse/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=http://nfe.pma.es.gov.br:8080/nfse/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3200706]
Nome=Atilio Vivacqua
UF=ES
Provedor=Betha

[3200805]
Nome=Baixo Guandu
UF=ES
Provedor=PadraoNacional

[3200904]
Nome=Barra de Sao Francisco
UF=ES
Provedor=PadraoNacional

[3201001]
Nome=Boa Esperanca
UF=ES
Provedor=PadraoNacional

[3201100]
Nome=Bom Jesus do Norte
UF=ES
Provedor=PadraoNacional

[3201159]
Nome=Brejetuba
UF=ES
Provedor=Betha

[3201209]
; Atualizado em 14/09/2021
Nome=Cachoeiro do Itapemirim
UF=ES
Provedor=EL
Versao=2.04
ProRecepcionar=https://notafse-backend.cachoeiro.es.gov.br:443/nfse/NfseWSService
HomRecepcionar=http://nfsehomologacao.cachoeiro.es.gov.br:8188/nfse-cachoeirodeitapemirim-es/NfseWSService

[3201308]
; Atualizado em 27/05/2021
Nome=Cariacica
UF=ES
Provedor=SmarAPD
Versao=2.03
ProRecepcionar=http://servicos.cariacica.es.gov.br:8080/tbw/services/Abrasf23
HomRecepcionar=http://servicos.cariacica.es.gov.br:8080/tbwhomologacao/services/Abrasf23
;
ProLinkURL=
HomLinkURL=

[3201407]
Nome=Castelo
UF=ES
Provedor=PadraoNacional

[3201506]
Nome=Colatina
UF=ES
Provedor=EL
ProRecepcionar=https://es-colatina-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-colatina-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-colatina-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3201605]
Nome=Conceicao da Barra
UF=ES
Provedor=PadraoNacional

[3201704]
Nome=Conceicao do Castelo
UF=ES
Provedor=PadraoNacional

[3201803]
Nome=Divino de Sao Lourenco
UF=ES
Provedor=PadraoNacional

[3201902]
Nome=Domingos Martins
UF=ES
Provedor=EL
ProRecepcionar=https://es-domingosmartins-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-domingosmartins-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-domingosmartins-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3202009]
Nome=Dores do Rio Preto
UF=ES
Provedor=PadraoNacional

[3202108]
Nome=Ecoporanga
UF=ES
Provedor=PadraoNacional

[3202207]
Nome=Fundao
UF=ES
Provedor=PadraoNacional

[3202256]
Nome=Governador Lindenberg
UF=ES
Provedor=PadraoNacional

[3202306]
Nome=Guacui
UF=ES
Provedor=PadraoNacional

[3202405]
Nome=Guarapari
UF=ES
Provedor=SmarAPD
ProRecepcionar=http://servicos-pmg.guarapari.es.gov.br:9999/tbw/services/WSEntrada
ProConsultarSituacao=http://servicos-pmg.guarapari.es.gov.br:9999/tbw/services/WSEntrada
ProConsultarLote=http://servicos-pmg.guarapari.es.gov.br:9999/tbw/services/WSSaida
ProConsultarNFSeRps=http://servicos-pmg.guarapari.es.gov.br:9999/tbw/services/WSSaida
ProConsultarNFSe=http://servicos-pmg.guarapari.es.gov.br:9999/tbw/services/WSSaida
ProCancelarNFSe=http://servicos-pmg.guarapari.es.gov.br:9999/tbw/services/WSEntrada
ProGerarNFSe=http://servicos-pmg.guarapari.es.gov.br:9999/tbw/services/WSEntrada
ProRecepcionarSincrono=http://servicos-pmg.guarapari.es.gov.br:9999/tbw/services/WSEntrada
ProSubstituirNFSe=http://servicos-pmg.guarapari.es.gov.br:9999/tbw/services/WSEntrada
;
HomRecepcionar=http://servicos-pmg.guarapari.es.gov.br:9999/tbwhomolog/services/WSEntrada
HomConsultarSituacao=http://servicos-pmg.guarapari.es.gov.br:9999/tbwhomolog/services/WSEntrada
HomConsultarLote=http://servicos-pmg.guarapari.es.gov.br:9999/tbwhomolog/services/WSSaida
HomConsultarNFSeRps=http://servicos-pmg.guarapari.es.gov.br:9999/tbwhomolog/services/WSSaida
HomConsultarNFSe=http://servicos-pmg.guarapari.es.gov.br:9999/tbwhomolog/services/WSSaida
HomCancelarNFSe=http://servicos-pmg.guarapari.es.gov.br:9999/tbwhomolog/services/WSEntrada
HomGerarNFSe=http://servicos-pmg.guarapari.es.gov.br:9999/tbwhomolog/services/WSEntrada
HomRecepcionarSincrono=http://servicos-pmg.guarapari.es.gov.br:9999/tbwhomolog/services/WSEntrada
HomSubstituirNFSe=http://servicos-pmg.guarapari.es.gov.br:9999/tbwhomolog/services/WSEntrada
;
ProLinkURL=http://servicos-pmg.guarapari.es.gov.br:9999/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%
HomLinkURL=http://servicos-pmg.guarapari.es.gov.br:9999/tbwhomolog/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%

[3202454]
; Inclu�do em 25/05/2022
Nome=Ibatiba
UF=ES
Provedor=EL
ProRecepcionar=https://es-ibatiba-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-ibatiba-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-ibatiba-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3202504]
Nome=Ibiracu
UF=ES
Provedor=PadraoNacional

[3202553]
Nome=Ibitirama
UF=ES
Provedor=PadraoNacional

[3202603]
Nome=Iconha
UF=ES
Provedor=EL
ProRecepcionar=https://es-iconha-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-iconha-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-iconha-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3202652]
Nome=Irupi
UF=ES
Provedor=PadraoNacional

[3202702]
Nome=Itaguacu
UF=ES
Provedor=PadraoNacional

[3202801]
Nome=Itapemirim
UF=ES
Provedor=PadraoNacional

[3202900]
Nome=Itarana
UF=ES
Provedor=PadraoNacional

[3203007]
; Inclu�do em 25/05/2022
Nome=Iuna
UF=ES
Provedor=EL
ProRecepcionar=https://es-iuna-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-iuna-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-iuna-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3203056]
Nome=Jaguare
UF=ES
Provedor=PadraoNacional

[3203106]
Nome=Jeronimo Monteiro
UF=ES
Provedor=PadraoNacional

[3203130]
Nome=Joao Neiva
UF=ES
Provedor=PadraoNacional

[3203163]
Nome=Laranja da Terra
UF=ES
Provedor=PadraoNacional

[3203205]
; Atualizado em 03/12/2021
Nome=Linhares
UF=ES
Provedor=EL
ProRecepcionar=https://notafiscal.linhares.es.gov.br/el-nfse/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://notafiscal.linhares.es.gov.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://notafiscal.linhares.es.gov.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3203304]
Nome=Mantenopolis
UF=ES
Provedor=PadraoNacional

[3203320]
; Inclu�do em 10/05/2021
Nome=Marataizes
UF=ES
Provedor=EL
ProRecepcionar=https://es-marataizes-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-marataizes-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-marataizes-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3203346]
Nome=Marechal Floriano
UF=ES
Provedor=EL
ProRecepcionar=https://es-marechalfloriano-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-marechalfloriano-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-marechalfloriano-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3203353]
Nome=Marilandia
UF=ES
Provedor=PadraoNacional

[3203403]
Nome=Mimoso do Sul
UF=ES
Provedor=PadraoNacional

[3203502]
Nome=Montanha
UF=ES
Provedor=PadraoNacional

[3203601]
Nome=Mucurici
UF=ES
Provedor=PadraoNacional

[3203700]
Nome=Muniz Freire
UF=ES
Provedor=PadraoNacional

[3203809]
Nome=Muqui
UF=ES
Provedor=PadraoNacional

[3203908]
Nome=Nova Venecia
UF=ES
Provedor=EL
ProRecepcionar=https://es-novavenecia-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-novavenecia-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-novavenecia-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3204005]
Nome=Pancas
UF=ES
Provedor=PadraoNacional

[3204054]
Nome=Pedro Canario
UF=ES
Provedor=PadraoNacional

[3204104]
; Inclu�do em 22/07/2022
Nome=Pinheiros
UF=ES
Provedor=EL
ProRecepcionar=	http://es-pinheiros-pm-nfs.cloud.el.com.br:80/RpsServiceService
HomRecepcionar=
;
ProLinkURL=http://es-pinheiros-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=http://es-pinheiros-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3204203]
Nome=Piuma
UF=ES
Provedor=PadraoNacional

[3204252]
Nome=Ponto Belo
UF=ES
Provedor=PadraoNacional

[3204302]
Nome=Presidente Kennedy
UF=ES
Provedor=EL
ProRecepcionar=https://es-presidentekennedy-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-presidentekennedy-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-presidentekennedy-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3204351]
Nome=Rio Bananal
UF=ES
Provedor=PadraoNacional

[3204401]
Nome=Rio Novo do Sul
UF=ES
Provedor=PadraoNacional

[3204500]
Nome=Santa Leopoldina
UF=ES
Provedor=PadraoNacional

[3204559]
Nome=Santa Maria de Jetiba
UF=ES
Provedor=EL
ProRecepcionar=https://es-santamariadejetiba-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-santamariadejetiba-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-santamariadejetiba-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3204609]
Nome=Santa Teresa
UF=ES
Provedor=PadraoNacional

[3204658]
Nome=Sao Domingos do Norte
UF=ES
Provedor=PadraoNacional

[3204708]
Nome=Sao Gabriel da Palha
UF=ES
Provedor=ISSIntel
ProNameSpace=http://saogabrieldapalha-es.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://saogabrieldapalha-es.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://saogabrieldapalha-es.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://saogabrieldapalha-es.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://saogabrieldapalha-es.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://saogabrieldapalha-es.treino-issintel.com.br/webservices/abrasf/api/

[3204807]
Nome=Sao Jose do Calcado
UF=ES
Provedor=PadraoNacional

[3204906]
Nome=Sao Mateus
UF=ES
Provedor=EL
ProRecepcionar=https://es-saomateus-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-saomateus-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-saomateus-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3204955]
Nome=Sao Roque do Canaa
UF=ES
Provedor=PadraoNacional

[3205002]
; Atualizado em 27/05/2021
Nome=Serra
UF=ES
Provedor=SmarAPD
ProRecepcionar=http://apps.serra.es.gov.br:8080/tbw/services/WSEntrada
ProConsultarSituacao=http://apps.serra.es.gov.br:8080/tbw/services/WSEntrada
ProConsultarLote=http://apps.serra.es.gov.br:8080/tbw/services/WSSaida
ProConsultarNFSeRps=http://apps.serra.es.gov.br:8080/tbw/services/WSSaida
ProConsultarNFSe=http://apps.serra.es.gov.br:8080/tbw/services/WSSaida
ProCancelarNFSe=http://apps.serra.es.gov.br:8080/tbw/services/WSEntrada
ProGerarNFSe=http://apps.serra.es.gov.br:8080/tbw/services/WSEntrada
ProRecepcionarSincrono=http://apps.serra.es.gov.br:8080/tbw/services/WSEntrada
ProSubstituirNFSe=http://apps.serra.es.gov.br:8080/tbw/services/WSEntrada
;
HomRecepcionar=http://apps.serra.es.gov.br:8080/tbwavaliacao/services/WSEntrada
HomConsultarSituacao=http://apps.serra.es.gov.br:8080/tbwavaliacao/services/WSEntrada
HomConsultarLote=http://apps.serra.es.gov.br:8080/tbwavaliacao/services/WSSaida
HomConsultarNFSeRps=http://apps.serra.es.gov.br:8080/tbwavaliacao/services/WSSaida
HomConsultarNFSe=http://apps.serra.es.gov.br:8080/tbwavaliacao/services/WSSaida
HomCancelarNFSe=http://apps.serra.es.gov.br:8080/tbwavaliacao/services/WSEntrada
HomGerarNFSe=http://apps.serra.es.gov.br:8080/tbwavaliacao/services/WSEntrada
HomRecepcionarSincrono=http://apps.serra.es.gov.br:8080/tbwavaliacao/services/WSEntrada
HomSubstituirNFSe=http://apps.serra.es.gov.br:8080/tbwavaliacao/services/WSEntrada
;
ProLinkURL=http://apps.serra.es.gov.br:8080/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%
HomLinkURL=http://apps.serra.es.gov.br:8080/tbwavaliacao/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%

[3205010]
Nome=Sooretama
UF=ES
Provedor=PadraoNacional

[3205036]
; Inclu�do em 10/05/2021
; Atualizado em 28/10/2022
Nome=Vargem Alta
UF=ES
Provedor=EL
Versao=2.04
ProRecepcionar=https://es-vargemalta-pm-nfs-backend.cloud.el.com.br/producao/NfseWSService
HomRecepcionar=
;
ProLinkURL=https://es-vargemalta-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-vargemalta-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3205069]
Nome=Venda Nova do Imigrante
UF=ES
Provedor=EL
ProRecepcionar=https://es-vendanovadoimigrante-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-vendanovadoimigrante-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-vendanovadoimigrante-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3205101]
; Inclu�do em 20/05/2022
Nome=Viana
UF=ES
Provedor=EL
ProRecepcionar=https://es-viana-pm-nfs.cloud.el.com.br/RpsServiceService
HomRecepcionar=
;
ProLinkURL=https://es-viana-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%
HomLinkURL=https://es-viana-pm-nfs.cloud.el.com.br/paginas/sistema/autenticacaoNota.jsf?cpfCnpj=%Cnpj%&chave=%CodVerif%

[3205150]
Nome=Vila Pavao
UF=ES
Provedor=PadraoNacional

[3205176]
Nome=Vila Valerio
UF=ES
Provedor=PadraoNacional

[3205200]
; Atualizado em 28/10/2022
Nome=Vila Velha
UF=ES
Provedor=SmarAPD
Versao=2.03
ProRecepcionar=https://tributacao.vilavelha.es.gov.br/tbw/services/Abrasf23
HomRecepcionar=
;
ProLinkURL=http://tributacao.vilavelha.es.gov.br/tbw/loginWeb.jsp?execobj=NFSENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%CodVerif%
HomLinkURL=

[3205309]
; Atualizado em 25/11/2022
Nome=Vitoria
UF=ES
Provedor=ISSVitoria
Versao=2.00
ProRecepcionar=https://wsnfse.vitoria.es.gov.br/producao/NotaFiscalService.asmx
HomRecepcionar=https://wsnfse.vitoria.es.gov.br/homologacao/NotaFiscalService.asmx
;
ProLinkURL=http://nfse.vitoria.es.gov.br/Aberto/exibenfe.cfm?key=%CodVerif%&num=%NumeroNFSe%
HomLinkURL=http://nfse.vitoria.es.gov.br/Aberto/exibenfe.cfm?key=%CodVerif%&num=%NumeroNFSe%

[3300100]
; Atualizado em 01/12/2022
Nome=Angra dos Reis
UF=RJ
Provedor=Tiplan
Versao=2.03
ProRecepcionar=https://www.spe.angra.rj.gov.br/nfse/WSNacional2/nfse.asmx
HomRecepcionar=https://angrahomologacao.nfe.com.br/nfse/wsnacional2/nfse.asmx
;
ProLinkURL=https://www.spe.angra.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://www.spe.angra.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%

[3300159]
Nome=Aperibe
UF=RJ
Provedor=PadraoNacional

[3300209]
Nome=Araruama
UF=RJ
Provedor=Betha

[3300225]
Nome=Areal
UF=RJ
Provedor=Betha

[3300233]
Nome=Armacao dos Buzios
UF=RJ
Provedor=ModernizacaoPublica
Versao=2.02
ProRecepcionar=http://notabuzios.modernizacaopublica.com.br:8041/nfe/webservices/NFEServices.jws
HomRecepcionar=http://notabuzios.modernizacaopublica.com.br:3082/homologacao/webservices/NFEServices.jws

[3300258]
Nome=Arraial do Cabo
UF=RJ
Provedor=PadraoNacional

[3300308]
Nome=Barra do Pirai
UF=RJ
Provedor=PadraoNacional

[3300407]
; Atualizado em 22/02/2022
Nome=Barra Mansa
UF=RJ
Provedor=ISSNet
Params=NaoDividir100:
;
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/barramansa/servicos.asmx

[3300456]
Nome=Belford Roxo
UF=RJ
Provedor=ModernizacaoPublica
Versao=2.02
ProRecepcionar=http://sis-nfse.prefeituradebelfordroxo.rj.gov.br:8052/nfe/webservices/NFEServices.jws
HomRecepcionar=http://notabelford.modernizacaopublica.com.br:8054/homologacao/webservices/NFEServices.jws

[3300506]
Nome=Bom Jardim
UF=RJ
Provedor=PadraoNacional

[3300605]
Nome=Bom Jesus do Itabapoana
UF=RJ
Provedor=PadraoNacional

[3300704]
Nome=Cabo Frio
UF=RJ
Provedor=SigCorp
Versao=2.03
ProRecepcionar=http://abrasfcabofrio.sigcorp.com.br/servico.asmx
HomRecepcionar=http://testeabrasfcabofrio.sigcorp.com.br/servico.asmx

[3300803]
; Atualizado em 11/06/2021
Nome=Cachoeiras de Macacu
UF=RJ
Provedor=Betha

[3300902]
Nome=Cambuci
UF=RJ
Provedor=PadraoNacional

[3300936]
Nome=Carapebus
UF=RJ
Provedor=SH3
Versao=2.00
ProRecepcionar=https://carapebus.nfiss.com.br/soap/
;
ProLinkURL=https://carapebus.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_carapebus.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3300951]
Nome=Comendador Levy Gasparian
UF=RJ
Provedor=SH3
Versao=2.00
ProRecepcionar=https://comendadorlevygasparian.nfiss.com.br/soap/
;
ProLinkURL=https://comendadorlevygasparian.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_comendadorlevygasparian.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3301009]
Nome=Campos Dos Goytacazes
UF=RJ
Provedor=Ginfes
;
ProLinkURL=http://camposdosgoytacazes.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://camposdosgoytacazes.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3301108]
Nome=Cantagalo
UF=RJ
Provedor=PadraoNacional

[3301157]
Nome=Cardoso Moreira
UF=RJ
Provedor=PadraoNacional

[3301207]
Nome=Carmo
UF=RJ
Provedor=WebISS
ProRecepcionar=https://www4.webiss.com.br/carmorj_wsnfse/NfseServices.svc
HomRecepcionar=https://www4.webiss.com.br/carmorj_wsnfse_homolog/NfseServices.svc

[3301306]
; Atualizado em 11/06/2021
Nome=Casimiro de Abreu
UF=RJ
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/casimirodeabreu/servicos.asmx

[3301405]
Nome=Conceicao de Macabu
UF=RJ
Provedor=SH3
Versao=2.00
ProRecepcionar=https://conceicaodemacabu.nfiss.com.br/soap/
;
ProLinkURL=https://conceicaodemacabu.nfiss.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://homologa_conceicaodemacabu.nfiss.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3301504]
; Atualizado em 20/09/2022
Nome=Cordeiro
UF=RJ
Provedor=SigISSWeb
ProRecepcionar=https://wscordeiro.sigissweb.com/

[3301603]
Nome=Duas Barras
UF=RJ
Provedor=PadraoNacional

[3301702]
Nome=Duque de Caxias
UF=RJ
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/duquedecaxias/servicos.asmx

[3301801]
Nome=Engenheiro Paulo de Frontin
UF=RJ
Provedor=Betha

[3301850]
Nome=Guapimirim
UF=RJ
Provedor=PadraoNacional

[3301876]
; Inclu�do em 07/06/2022
; Atualizado em 20/10/2022
Nome=Iguaba Grande
UF=RJ
Provedor=ISSDigital
Versao=2.00
ProRecepcionar=https://iguaba.supernova.com.br:8443/nfe/snissdigitalsvc
HomRecepcionar=https://iguaba.supernova.com.br:8443/nfe/snissdigitalsvc

[3301900]
Nome=Itaborai
UF=RJ
Provedor=Ginfes
;
ProLinkURL=http://itaborai.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://itaborai.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3302007]
Nome=Itaguai
UF=RJ
Provedor=Tiplan
ProRecepcionar=https://spe.itaguai.rj.gov.br/nfse/WSNacional/nfse.asmx
HomRecepcionar=https://spe.itaguai.rj.gov.br/nfse/WSNacional/nfse.asmx
;
ProLinkURL=https://spe.itaguai.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://spe.itaguai.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%

[3302056]
Nome=Italva
UF=RJ
Provedor=PadraoNacional

[3302106]
Nome=Itaocara
UF=RJ
Provedor=PadraoNacional

[3302205]
; Atualizado em 08/03/2022
Nome=Itaperuna
UF=RJ
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://18.230.147.90/nfse.portal.integracao/services.svc
HomRecepcionar=http://18.230.147.90/nfse.portal.integracao.teste/services.svc

[3302254]
Nome=Itatiaia
UF=RJ
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/itatiaia/servicos.asmx

[3302270]
Nome=Japeri
UF=RJ
Provedor=PadraoNacional

[3302304]
Nome=Laje do Muriae
UF=RJ
Provedor=PadraoNacional

[3302403]
Nome=Macae
UF=RJ
Provedor=Tiplan
ProRecepcionar=https://spe.macae.rj.gov.br/nfse/WSNacional/nfse.asmx
HomRecepcionar=https://spe.macae.rj.gov.br/nfse/WSNacional/nfse.asmx
;
ProLinkURL=https://spe.macae.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://spe.macae.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%

[3302452]
Nome=Macuco
UF=RJ
Provedor=PadraoNacional

[3302502]
Nome=Mage
UF=RJ
Provedor=Betha
Versao=2.02
ProRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-ws/nfseWS
HomRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-test-ws/nfseWS

[3302601]
Nome=Mangaratiba
UF=RJ
Provedor=Tiplan
ProRecepcionar=https://spe.mangaratiba.rj.gov.br/nfse/WSNacional/nfse.asmx
HomRecepcionar=https://spe.mangaratiba.rj.gov.br/nfse/WSNacional/nfse.asmx
;
ProLinkURL=https://spe.mangaratiba.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://spe.mangaratiba.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%

[3302700]
; Atualizado em 10/10/2022
Nome=Marica
UF=RJ
Provedor=DBSeller
Versao=2.04
ProRecepcionar=https://nota.marica.rj.gov.br/webservice/index/producao
HomRecepcionar=https://nota.marica.rj.gov.br:82/webservice/index/homologacao
;
ProNameSpace=https://nota.marica.rj.gov.br/webservice/index/producao
HomNameSpace=https://nota.marica.rj.gov.br:82/webservice/index/homologacao

[3302809]
Nome=Mendes
UF=RJ
Provedor=Betha

[3302858]
Nome=Mesquita
UF=RJ
Provedor=ModernizacaoPublica
Versao=2.02
ProRecepcionar=http://sis-nfe.mesquita.rj.gov.br:8040/nfe/webservices/NFEServices.jws
HomRecepcionar=http://notamesquita.modernizacaopublica.com.br:8038/homologacao/webservices/NFEServices.jws

[3302908]
Nome=Miguel Pereira
UF=RJ
Provedor=WebISS
ProRecepcionar=https://www1.webiss.com.br/miguelpereirarj_wsnfse/NfseServices.svc
HomRecepcionar=https://www1.webiss.com.br/miguelpereirarj_wsnfse_homolog/NfseServices.svc

[3303005]
Nome=Miracema
UF=RJ
Provedor=PadraoNacional

[3303104]
Nome=Natividade
UF=RJ
Provedor=PadraoNacional

[3303203]
Nome=Nilopolis
UF=RJ
Provedor=PadraoNacional

[3303302]
Nome=Niteroi
UF=RJ
Provedor=Tiplan
Versao=2.03
ProRecepcionar=https://nfse.niteroi.rj.gov.br/nfse/wsnacional2/nfse.asmx
HomRecepcionar=https://niteroihomologacao.nfe.com.br/nfse/wsnacional2/nfse.asmx

[3303401]
Nome=Nova Friburgo
UF=RJ
Provedor=EL
Versao=2.04
ProRecepcionar=http://rj-novafriburgo-pm-nfs.cloud.el.com.br/NfseWSService
HomRecepcionar=http://rj-novafriburgo-pm-nfs.cloud.el.com.br/NfseWSService

[3303500]
; Atualizado em 27/09/2022
Nome=Nova Iguacu
UF=RJ
Provedor=ISSDSF
;
ProRecepcionar=http://www.nfse.novaiguacu.rj.gov.br/WsNFe2/LoteRps.jws
HomRecepcionar=https://testcert.novaiguacu.rj.gov.br/WsNFe2/LoteRps.jws
;
ProNameSpace=http://www.nfse.novaiguacu.rj.gov.br/WsNFe2/LoteRps.jws
HomNameSpace=https://testcert.novaiguacu.rj.gov.br/WsNFe2/LoteRps.jws
;
ProLinkURL=http://nfse.novaiguacu.rj.gov.br/nfse/QRCode.php?cnpj=%Cnpj%&nota=%NumeroNFSe%&codigo=%CodVerif%
HomLinkURL=http://nfse.novaiguacu.rj.gov.br/nfse/QRCode.php?cnpj=%Cnpj%&nota=%NumeroNFSe%&codigo=%CodVerif%

[3303609]
Nome=Paracambi
UF=RJ
Provedor=fintelISS
Versao=2.02
ProRecepcionar=https://iss.paracambi.rj.gov.br:4431/WebService.asmx
HomRecepcionar=https://iss.paracambi.rj.gov.br:4432/Homologacao/WebService.asmx
;
ProXMLNameSpace=http://iss.paracambi.rj.gov.br/Arquivos/nfseV202.xsd

[3303708]
Nome=Paraiba do Sul
UF=RJ
Provedor=PadraoNacional

[3303807]
Nome=Parati
UF=RJ
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://186.237.171.226:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://186.237.171.226:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3303856]
; Atualizado em 30/11/2022
Nome=Paty do Alferes
UF=RJ
Provedor=DBSeller
Versao=2.04
ProRecepcionar=http://nfse.patydoalferes.rj.gov.br/webservice/index/producao
HomRecepcionar=http://hom.nfse.patydoalferes.rj.gov.br/webservice/index/producao 
;
ProNameSpace=https://nota.patydoalferes.rj.gov.br/webservice/index/producao
HomNameSpace=http://hom.nfse.patydoalferes.rj.gov.br/webservice/index/producao

[3303906]
Nome=Petropolis
UF=RJ
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/rj.petropolis/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/rj.petropolis/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/rj.petropolis/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/rj.petropolis/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3303955]
Nome=Pinheiral
UF=RJ
Provedor=Betha

[3304003]
; Inclu�do em 13/12/2022
Nome=Pira�
UF=RJ
Provedor=Tiplan
ProRecepcionar=https://nfse.pirai.rj.gov.br/WSNacional/nfse.asmx
HomRecepcionar=https://nfse.pirai.rj.gov.br/WSNacional/nfse.asmx
;
ProLinkURL=https://nfse.pirai.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://nfse.pirai.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%

[3304102]
Nome=Porciuncula
UF=RJ
Provedor=PadraoNacional

[3304110]
Nome=Porto Real
UF=RJ
Provedor=WebISS
ProRecepcionar=https://www1.webiss.com.br/rjportoreal_wsnfse/NfseServices.svc
HomRecepcionar=https://www1.webiss.com.br/rjportoreal_wsnfse_homolog/NfseServices.svc

[3304128]
Nome=Quatis
UF=RJ
Provedor=ModernizacaoPublica
Versao=2.02
ProRecepcionar=http://sis-nfse.quatis.rj.gov.br:8061/nfe/webservices/NFEServices.jws
HomRecepcionar=http://sishomologacao.quatis.rj.gov.br:8064/homologacao/webservices/NFEServices.jws

[3304144]
Nome=Queimados
UF=RJ
Provedor=WebISS
ProRecepcionar=https://www1.webiss.com.br/queimadosrj_wsnfse/NfseServices.svc
HomRecepcionar=https://www1.webiss.com.br/queimadosrj_wsnfse_homolog/NfseServices.svc

[3304151]
Nome=Quissama
UF=RJ
Provedor=PadraoNacional

[3304201]
; Atualizado em 11/06/2021
Nome=Resende
UF=RJ
Provedor=Betha

[3304300]
; Atualizado em 11/06/2021
Nome=Rio Bonito
UF=RJ
Provedor=Betha

[3304409]
Nome=Rio Claro
UF=RJ
Provedor=PadraoNacional

[3304508]
Nome=Rio das Flores
UF=RJ
Provedor=Betha

[3304524]
Nome=Rio das Ostras
UF=RJ
Provedor=Tiplan
ProRecepcionar=https://spe.riodasostras.rj.gov.br/nfse/WSNacional/nfse.asmx
HomRecepcionar=https://spe.riodasostras.rj.gov.br/nfse/WSNacional/nfse.asmx
;
ProLinkURL=https://spe.riodasostras.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://spe.riodasostras.rj.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%

[3304557]
; Atualizado em 29/03/2022
Nome=Rio de Janeiro
UF=RJ
Provedor=ISSRio
ProRecepcionar=https://notacarioca.rio.gov.br/WSNacional/nfse.asmx
HomRecepcionar=https://notacariocahom.rio.gov.br/WSNacional/nfse.asmx
;
ProLinkURL=https://notacarioca.rio.gov.br/nfse.aspx?inscricao=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://notacariocahom.rio.gov.br/nfse.aspx?inscricao=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%

[3304607]
Nome=Santa Maria Madalena
UF=RJ
Provedor=WebISS
ProRecepcionar=https://www3.webiss.com.br/santamariamadalenarj_wsnfse/NfseServices.svc
HomRecepcionar=https://www3.webiss.com.br/santamariamadalenarj_wsnfse_homolog/NfseServices.svc

[3304706]
; Atualizado em 21/01/2022
Nome=Santo Antonio de Padua
UF=RJ
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://54.232.94.124/NFSe.Portal.integracao/services.svc
HomRecepcionar=http://54.232.94.124/NFSe.Portal.integracao/services.svc

[3304755]
Nome=Sao Francisco de Itabapoana
UF=RJ
Provedor=PadraoNacional

[3304805]
Nome=Sao Fidelis
UF=RJ
Provedor=PadraoNacional

[3304904]
; Atualizado em 19/10/2021
Nome=Sao Goncalo
UF=RJ
Provedor=SimplISS
Versao=2.03
ProRecepcionar=https://wssaogoncalo.simplissweb.com.br/nfseservice.svc
HomRecepcionar=https://wshomologacaoabrasf1.simplissweb.com.br/nfseservice.svc

[3305000]
Nome=Sao Joao da Barra
UF=RJ
Provedor=WebISS
ProRecepcionar=https://www3.webiss.com.br/saojoaodabarrarj_wsnfse/NfseServices.svc
HomRecepcionar=https://www3.webiss.com.br/saojoaodabarrarj_wsnfse_homolog/NfseServices.svc

[3305109]
Nome=Sao Joao de Meriti
UF=RJ
Provedor=SigISS
ProRecepcionar=https://saojoaodemeriti.sigiss.com.br/saojoaodemeriti/ws/sigiss_ws.php
HomRecepcionar=https://testesaojoaodemeriti.sigiss.com.br/testesaojoaodemeriti/ws/sigiss_ws.php
;
ProSoapAction=urn:sigiss_ws

[3305133]
Nome=Sao Jose de Uba
UF=RJ
Provedor=PadraoNacional

[3305158]
Nome=Sao Jose do Vale do Rio Preto
UF=RJ
Provedor=Betha

[3305208]
; Inclu�do em 18/05/2022
Nome=Sao Pedro da Aldeia
UF=RJ
Provedor=ModernizacaoPublica
HomRecepcionar=http://notapmspa.modernizacaopublica.com.br:8037
ProRecepcionar=http://webservice.pmspa.rj.gov.br:3080/nfe/webservices/NFEServices.jws

[3305307]
Nome=Sao Sebastiao do Alto
UF=RJ
Provedor=PadraoNacional

[3305406]
Nome=Sapucaia
UF=RJ
Provedor=PadraoNacional

[3305505]
Nome=Saquarema
UF=RJ
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://201.18.231.99/nfse.portal.integracao/services.svc
HomRecepcionar=http://201.18.231.99/nfse.portal.integracao.teste/services.svc

[3305554]
Nome=Seropedica
UF=RJ
Provedor=PadraoNacional

[3305604]
Nome=Silva Jardim
UF=RJ
Provedor=WebISS
ProRecepcionar=https://www3.webiss.com.br/silvajardimrj_wsnfse/NfseServices.svc
HomRecepcionar=https://www3.webiss.com.br/silvajardimrj_wsnfse_homolog/NfseServices.svc

[3305703]
Nome=Sumidouro
UF=RJ
Provedor=PadraoNacional

[3305752]
Nome=Tangua
UF=RJ
Provedor=PadraoNacional

[3305802]
Nome=Teresopolis
UF=RJ
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://teresopolisrj.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://teresopolisrj.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[3305901]
Nome=Trajano de Morais
UF=RJ
Provedor=WebISS
ProRecepcionar=https://www1.webiss.com.br/trajanodemoraesrj_wsnfse/NfseServices.svc
HomRecepcionar=https://www1.webiss.com.br/trajanodemoraesrj_wsnfse_homolog/NfseServices.svc

[3306008]
; Inclu�do em 15/06/2021
Nome=Tres Rios
UF=RJ
Provedor=FGMaiss

[3306107]
Nome=Valenca
UF=RJ
Provedor=Betha

[3306156]
Nome=Varre-Sai
UF=RJ
Provedor=PadraoNacional

[3306206]
; Inclu�do em 24/05/2022
Nome=Vassouras
UF=RJ
Provedor=CTA
Versao=2.00
ProRecepcionar=https://prefeituradevassouras.online/wsnfse/
HomRecepcionar=https://prefeituradevassouras.online/wsnfse/

[3306305]
; Atualizado em 19/10/2021
Nome=Volta Redonda
UF=RJ
Provedor=SimplISS
Versao=2.03
ProRecepcionar=https://wsvoltaredonda.simplissweb.com.br/nfseservice.svc
HomRecepcionar=https://wshomologacaoabrasf1.simplissweb.com.br/nfseservice.svc

[3500105]
Nome=Adamantina
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=http://adamantina.4rtec.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=http://adamantina.4rtec.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=http://adamantina.4rtec.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=http://adamantina.4rtec.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=http://adamantina.4rtec.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=http://adamantina.4rtec.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=http://adamantina.4rtec.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=http://adamantina.4rtec.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://adamantina.4rtec.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://adamantina.4rtec.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3500204]
Nome=Adolfo
UF=SP
Provedor=PadraoNacional

[3500303]
Nome=Aguai
UF=SP
Provedor=Betha

[3500402]
Nome=Aguas da Prata
UF=SP
Provedor=PadraoNacional

[3500501]
Nome=Aguas de Lindoia
UF=SP
Provedor=PadraoNacional

[3500550]
Nome=Aguas de Santa Barbara
UF=SP
Provedor=PadraoNacional

[3500600]
Nome=Aguas de Sao Pedro
UF=SP
Provedor=PadraoNacional

[3500709]
; Inclu�do em 24/02/2022
Nome=Agudos
UF=SP
Provedor=AssessorPublico
ProRecepcionar=https://servicos.agudos.sp.gov.br/issonline/servlet/anfse

[3500758]
Nome=Alambari
UF=SP
Provedor=PadraoNacional

[3500808]
Nome=Alfredo Marcondes
UF=SP
Provedor=PadraoNacional

[3500907]
Nome=Altair
UF=SP
Provedor=PadraoNacional

[3501004]
Nome=Altinopolis
UF=SP
Provedor=PadraoNacional

[3501103]
Nome=Alto Alegre
UF=SP
Provedor=PadraoNacional

[3501152]
Nome=Aluminio
UF=SP
Provedor=PadraoNacional

[3501202]
Nome=Alvares Florence
UF=SP
Provedor=PadraoNacional

[3501301]
Nome=Alvares Machado
UF=SP
Provedor=PadraoNacional

[3501400]
Nome=Alvaro de Carvalho
UF=SP
Provedor=PadraoNacional

[3501509]
Nome=Alvinlandia
UF=SP
Provedor=PadraoNacional

[3501608]
; Atualizado em 06/10/2022
Nome=Americana
UF=SP
Provedor=Tiplan
Versao=2.03
ProRecepcionar=https://nfse.americana.sp.gov.br/nfse/wsnacional2/nfse.asmx
HomRecepcionar=https://americanahomologacao.nfe.com.br/nfse/wsnacional2/nfse.asmx
;
ProLinkURL=https://nfse.americana.sp.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://nfse.americana.sp.gov.br/nfse.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%

[3501707]
Nome=Americo Brasiliense
UF=SP
Provedor=PadraoNacional

[3501806]
Nome=Americo de Campos
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://189.108.31.114:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://189.108.31.114:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3501905]
; Atualizado em 20/08/2021
Nome=Amparo
UF=SP
Provedor=Giap
ProRecepcionar=http://webservice.giap.com.br/WSNfsesAmparo/nfseresources/ws/v2/emissao
ProConsultarNFSeRps=http://webservice.giap.com.br/WSNfsesAmparo/nfseresources/ws/consulta
ProCancelarNFSe=http://webservice.giap.com.br/WSNfsesAmparo/nfseresources/ws/v2/cancela
;
HomRecepcionar=http://webservice.giap.com.br/WSNfsesAmparo/nfseresources/ws/v2/emissao/simula
HomConsultarNFSeRps=http://webservice.giap.com.br/WSNfsesAmparo/nfseresources/ws/consulta
HomCancelarNFSe=http://webservice.giap.com.br/WSNfsesAmparo/nfseresources/ws/v2/cancela

[3502002]
Nome=Analandia
UF=SP
Provedor=Betha

[3502101]
; Atualizado em 15/07/2022
Nome=Andradina
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=https://andradina.4rtec.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=https://andradina.4rtec.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=https://andradina.4rtec.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=https://andradina.4rtec.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=https://andradina.4rtec.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=https://andradina.4rtec.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=https://andradina.4rtec.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=https://andradina.4rtec.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://andradina.4rtec.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://andradina.4rtec.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3502200]
; Inclu�do em 28/12/2022
Nome=Angatuba
UF=SP
Provedor=iiBrasil
Versao=2.04
ProRecepcionar=https://api.iibr.com.br/3502200/1/soap/producao/rps
HomRecepcionar=https://api.iibr.com.br/3502200/1/soap/homologacao/rps

[3502309]
Nome=Anhembi
UF=SP
Provedor=PadraoNacional

[3502408]
Nome=Anhumas
UF=SP
Provedor=PadraoNacional

[3502507]
; Atualizado em 27/05/2021
Nome=Aparecida
UF=SP
Provedor=SilTecnologia
ProRecepcionar=https://aparecida.siltecnologia.com.br/tbw/services/Abrasf10
HomRecepcionar=
;
ProLinkURL=http://aparecida.siltecnologia.com.br/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%CodVerif%
HomLinkURL=http://aparecida.siltecnologia.com.br/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%CodVerif%

[3502606]
Nome=Aparecida D Oeste
UF=SP
Provedor=PadraoNacional

[3502705]
Nome=Apiai
UF=SP
Provedor=PadraoNacional

[3502754]
Nome=Aracariguama
UF=SP
Provedor=PadraoNacional

[3502804]
; Atualizado em 16/08/2022
Nome=Aracatuba
UF=SP
Provedor=AssessorPublico
ProRecepcionar=http://201.49.72.130:8083/issonline/servlet/anfse
HomRecepcionar=https://s1.asp.srv.br/issonline-homolog/servlet/anfse

[3502903]
; Inclu�do em 08/12/2022
Nome=Aracoiaba da Serra
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=https://pmaracoiabadaserra.com.br:8443/IssWeb-ejb/IssWebWS/IssWebWS?wsdl
ProLinkURL=https://pmaracoiabadaserra.com.br:8443/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3503000]
Nome=Aramina
UF=SP
Provedor=PadraoNacional

[3503109]
Nome=Arandu
UF=SP
Provedor=PadraoNacional

[3503158]
Nome=Arapei
UF=SP
Provedor=PadraoNacional

[3503208]
Nome=Araraquara
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://araraquara.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://araraquara.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3503307]
; Atualizado em 20/09/2021
Nome=Araras
UF=SP
Provedor=SigISSWeb
ProRecepcionar=https://wsararas.sigissweb.com/

[3503356]
Nome=Arco-Iris
UF=SP
Provedor=PadraoNacional

[3503406]
Nome=Arealva
UF=SP
Provedor=PadraoNacional

[3503505]
Nome=Areias
UF=SP
Provedor=PadraoNacional

[3503604]
Nome=Areiopolis
UF=SP
Provedor=PadraoNacional

[3503703]
; Inclu�do em 10/08/2022
Nome=Ariranha
UF=SP
Provedor=Fiorilli
Versao=2.00
;
ProRecepcionar=http://143.202.29.187:5661/IssWeb-ejb/IssWebWS/IssWebWS

[3503802]
Nome=Artur Nogueira
UF=SP
Provedor=PadraoNacional

[3503901]
; Atualizado em 27/05/2021
Nome=Aruja
UF=SP
Provedor=SmarAPD
Versao=2.03
ProRecepcionar=http://servicos.prefeituradearuja.sp.gov.br:8080/tbw/services/Abrasf23
HomRecepcionar=http://servicos.prefeituradearuja.sp.gov.br:8080/tbwhomologacao/services/Abrasf23
;
ProLinkURL=
HomLinkURL=

[3503950]
Nome=Aspasia
UF=SP
Provedor=PadraoNacional

[3504008]
Nome=Assis
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=https://nfsews.assis.sp.gov.br/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://nfsews.assis.sp.gov.br/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3504107]
Nome=Atibaia
UF=SP
Provedor=PadraoNacional

[3504206]
Nome=Auriflama
UF=SP
Provedor=PadraoNacional

[3504305]
Nome=Avai
UF=SP
Provedor=PadraoNacional

[3504404]
Nome=Avanhandava
UF=SP
Provedor=PadraoNacional

[3504503]
; Atualizado em 27/12/2022
Nome=Avare
UF=SP
Provedor=SigCorp
Versao=2.04
;
ProRecepcionar=https://abrasfavare.meumunicipio.online/ws
HomRecepcionar=https://testeavare.meumunicipio.online/abrasf/ws
;
ProNameSpace=https://abrasfavare.meumunicipio.online/ws
HomNameSpace=https://testeavareabrasf.meumunicipio.online/ws

[3504602]
; Inclu�do em 23/05/2022
Nome=Bady Bassitt
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://200.95.223.250:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://200.95.223.250:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3504701]
Nome=Balbinos
UF=SP
Provedor=PadraoNacional

[3504800]
Nome=Balsamo
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://201.28.69.146:5663/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://201.28.69.146:5663/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3504909]
Nome=Bananal
UF=SP
Provedor=PadraoNacional

[3505005]
Nome=Barao de Antonina
UF=SP
Provedor=PadraoNacional

[3505104]
Nome=Barbosa
UF=SP
Provedor=PadraoNacional

[3505203]
Nome=Bariri
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://sipweb.bariri.sp.gov.br:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://sipweb.bariri.sp.gov.br:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3505302]
Nome=Barra Bonita
UF=SP
Provedor=PadraoNacional

[3505351]
Nome=Barra do Chapeu
UF=SP
Provedor=PadraoNacional

[3505401]
Nome=Barra do Turvo
UF=SP
Provedor=PadraoNacional

[3505500]
Nome=Barretos
UF=SP
Provedor=PadraoNacional

[3505609]
Nome=Barrinha
UF=SP
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://18.229.187.210/nfse.portal.integracao/services.svc
HomRecepcionar=http://18.229.187.210/nfse.portal.integracao.teste/services.svc

[3505708]
; Inclu�do em 28/03/2022
; Atualizado em 27/09/2022
Nome=Barueri
UF=SP
Provedor=ISSBarueri
ProRecepcionar=https://www.barueri.sp.gov.br/nfeservice/wsrps.asmx
ProConsultarNFSeServicoTomado=https://servicos.barueri.sp.gov.br/nfewsxml/wsgeraxml.asmx
HomRecepcionar=https://testeeiss.barueri.sp.gov.br/nfeservice/wsrps.asmx

[3505807]
Nome=Bastos
UF=SP
Provedor=PadraoNacional

[3505906]
; Inclu�do em 07/07/2022
Nome=Batatais
UF=SP
Provedor=Siappa
ProRecepcionar=https://app.siappa.com.br/issqn_batatais/servlet/com.issqnwebev3v2.aws_gera_nfse_token
ProConsultarNFSe=https://app.siappa.com.br/issqn_batatais/servlet/com.issqnwebev3v2.aws_consulta_nfse_token
ProCancelarNFSe=https://app.siappa.com.br/issqn_batatais/servlet/com.issqnwebev3v2.aws_cancela_nfse_token
ProGerarToken=https://app.siappa.com.br/issqn_batatais/servlet/com.issqnwebev3v2.aws_gera_token
;
HomRecepcionar=https://app.siappa.com.br/issqn_batatais/servlet/com.issqnwebev3v2.aws_gera_nfse_token
HomConsultarNFSe=https://app.siappa.com.br/issqn_batatais/servlet/com.issqnwebev3v2.aws_consulta_nfse_token
HomCancelarNFSe=https://app.siappa.com.br/issqn_batatais/servlet/com.issqnwebev3v2.aws_cancela_nfse_token
HomGerarToken=https://app.siappa.com.br/issqn_batatais/servlet/com.issqnwebev3v2.aws_gera_token

[3506003]
; Inclu�do em 26/09/2021
; Atualizado em 26/10/2022
Nome=Bauru
UF=SP
Provedor=SilTecnologia
Versao=2.03
ProRecepcionar=https://tributario.bauru.sp.gov.br/services/Abrasf23
HomRecepcionar=https://homologacao.siltecnologia.com.br/tbbauru/services/Abrasf23
;
ProLinkURL=https://tributario.bauru.sp.gov.br/loginWeb.jsp?execobj=NFSENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%CodVerif%
HomLinkURL=https://homologacao.siltecnologia.com.br/tbbauru/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%CodVerif%

[3506102]
Nome=Bebedouro
UF=SP
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/sp.bebedouro/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/sp.bebedouro/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/sp.bebedouro/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/sp.bebedouro/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3506201]
Nome=Bento de Abreu
UF=SP
Provedor=PadraoNacional

[3506300]
Nome=Bernardino de Campos
UF=SP
Provedor=PadraoNacional

[3506359]
Nome=Bertioga
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://bertioga.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://bertioga.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3506409]
Nome=Bilac
UF=SP
Provedor=PadraoNacional

[3506508]
; Atualizado em 04/08/2021
Nome=Birigui
UF=SP
Provedor=SmarAPD
ProRecepcionar=http://pmbirigui02.smarapd.com.br:9999/smartb/services/WSEntrada
ProConsultarSituacao=http://pmbirigui02.smarapd.com.br:9999/smartb/services/WSEntrada
ProConsultarLote=http://pmbirigui02.smarapd.com.br:9999/smartb/services/WSSaida
ProConsultarNFSeRps=http://pmbirigui02.smarapd.com.br:9999/smartb/services/WSSaida
ProConsultarNFSe=http://pmbirigui02.smarapd.com.br:9999/smartb/services/WSSaida
ProCancelarNFSe=http://pmbirigui02.smarapd.com.br:9999/smartb/services/WSEntrada
ProGerarNFSe=http://pmbirigui02.smarapd.com.br:9999/smartb/services/WSEntrada
ProRecepcionarSincrono=http://pmbirigui02.smarapd.com.br:9999/smartb/services/WSEntrada
ProSubstituirNFSe=http://pmbirigui02.smarapd.com.br:9999/smartb/services/WSEntrada
;
HomRecepcionar=http://tributacao.smarapd.com.br:8090/ddwbirigui/services/WSEntrada
HomConsultarSituacao=http://tributacao.smarapd.com.br:8090/ddwbirigui/services/WSEntrada
HomConsultarLote=http://tributacao.smarapd.com.br:8090/ddwbirigui/services/WSSaida
HomConsultarNFSeRps=http://tributacao.smarapd.com.br:8090/ddwbirigui/services/WSSaida
HomConsultarNFSe=http://tributacao.smarapd.com.br:8090/ddwbirigui/services/WSSaida
HomCancelarNFSe=http://tributacao.smarapd.com.br:8090/ddwbirigui/services/WSEntrada
HomGerarNFSe=http://tributacao.smarapd.com.br:8090/ddwbirigui/services/WSEntrada
HomRecepcionarSincrono=http://tributacao.smarapd.com.br:8090/ddwbirigui/services/WSEntrada
HomSubstituirNFSe=http://tributacao.smarapd.com.br:8090/ddwbirigui/services/WSEntrada
;
ProLinkURL=http://pmbirigui02.smarapd.com.br:9999/smartb/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%
HomLinkURL=http://tributacao.smarapd.com.br:8090/ddwbirigui/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%

[3506607]
Nome=Biritiba-Mirim
UF=SP
Provedor=PadraoNacional

[3506706]
Nome=Boa Esperanca do Sul
UF=SP
Provedor=PadraoNacional

[3506805]
Nome=Bocaina
UF=SP
Provedor=PadraoNacional

[3506904]
; Inclu�do em 08/09/2021
Nome=Bofete
UF=SP
Provedor=GeisWeb
Params=AliasCidade:bofete
;
ProRecepcionar=https://www.geisweb.net.br/producao/bofete/webservice/GeisWebServiceImpl.php

[3507001]
; Atualizado em 10/01/2022
Nome=Boituva
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=https://boituva.4rtec.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=https://boituva.4rtec.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=https://boituva.4rtec.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=https://boituva.4rtec.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=https://boituva.4rtec.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=https://boituva.4rtec.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=https://boituva.4rtec.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=https://boituva.4rtec.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://boituva.4rtec.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://boituva.4rtec.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3507100]
Nome=Bom Jesus Dos Perdoes
UF=SP
Provedor=PadraoNacional

[3507159]
Nome=Bom Sucesso de Itarare
UF=SP
Provedor=PadraoNacional

[3507209]
Nome=Bora
UF=SP
Provedor=PadraoNacional

[3507308]
Nome=Boraceia
UF=SP
Provedor=PadraoNacional

[3507407]
Nome=Borborema
UF=SP
Provedor=PadraoNacional

[3507456]
Nome=Borebi
UF=SP
Provedor=PadraoNacional

[3507506]
Nome=Botucatu
UF=SP
Provedor=Sigep
Versao=2.00
ProRecepcionar=http://botucatu.bsit-br.com.br/integracao/services/nfseWS
HomRecepcionar=

[3507605]
Nome=Braganca Paulista
UF=SP
Provedor=Giap
ProRecepcionar=http://webservice.giap.com.br/WSNfsesPmbp/nfseresources/ws/v2/emissao
ProConsultarNFSeRps=http://webservice.giap.com.br/WSNfsesPmbp/nfseresources/ws/consulta
ProCancelarNFSe=http://webservice.giap.com.br/WSNfsesPmbp/nfseresources/ws/v2/cancela
;
HomRecepcionar=http://webservice.giap.com.br/WSNfsesPmbp/nfseresources/ws/v2/emissao/simula
HomConsultarNFSeRps=http://webservice.giap.com.br/WSNfsesPmbp/nfseresources/ws/consulta
HomCancelarNFSe=http://webservice.giap.com.br/WSNfsesPmbp/nfseresources/ws/v2/cancela

[3507704]
Nome=Brauna
UF=SP
Provedor=PadraoNacional

[3507753]
Nome=Brejo Alegre
UF=SP
Provedor=PadraoNacional

[3507803]
; Atualizado em 23/02/2022
Nome=Brodowski
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://143.0.0.116:8083/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://143.0.0.116:8083/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3507902]
; Inclu�do em 03/01/2023
Nome=Brotas
UF=SP
Provedor=AssessorPublico
ProRecepcionar=http://servicos.brotas.sp.gov.br:8080/issonline/servlet/anfse
HomRecepcionar=http://s1.asp.srv.br:8180/issonline-homolog/servlet/anfse

[3508009]
Nome=Buri
UF=SP
Provedor=PadraoNacional

[3508108]
; Inclu�do em 24/08/2022
Nome=Buritama
UF=SP
Provedor=Facundo

[3508207]
Nome=Buritizal
UF=SP
Provedor=PadraoNacional

[3508306]
Nome=Cabralia Paulista
UF=SP
Provedor=PadraoNacional

[3508405]
Nome=Cabreuva
UF=SP
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/sp.cabreuva/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/sp.cabreuva/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/sp.cabreuva/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/sp.cabreuva/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3508504]
Nome=Cacapava
UF=SP
Provedor=PadraoNacional

[3508603]
; Inclu�do em 09/03/2022
Nome=Cachoeira Paulista
UF=SP
Provedor=SiapNet
Versao=2.00
ProRecepcionar=https://pmcachoeirapaulista.geosiap.net.br/pmcachoeirapaulista/issonline/ws/index.php
HomRecepcionar=

[3508702]
Nome=Caconde
UF=SP
Provedor=PadraoNacional

[3508801]
Nome=Cafelandia
UF=SP
Provedor=PadraoNacional

[3508900]
Nome=Caiabu
UF=SP
Provedor=PadraoNacional

[3509007]
Nome=Caieiras
UF=SP
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/sp.caieiras/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/sp.caieiras/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/sp.caieiras/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/sp.caieiras/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3509106]
Nome=Caiua
UF=SP
Provedor=PadraoNacional

[3509205]
; Inclu�do em 10/05/2021
Nome=Cajamar
UF=SP
Provedor=GeisWeb
Params=AliasCidade:cajamar
;
ProRecepcionar=https://www.geisweb.net.br/producao/cajamar/webservice/GeisWebServiceImpl.php

[3509254]
Nome=Cajati
UF=SP
Provedor=PadraoNacional

[3509304]
Nome=Cajobi
UF=SP
Provedor=PadraoNacional

[3509403]
Nome=Cajuru
UF=SP
Provedor=PadraoNacional

[3509452]
Nome=Campina do Monte Alegre
UF=SP
Provedor=PadraoNacional

[3509502]
Nome=Campinas
UF=SP
Provedor=ISSDSF
;
ProRecepcionar=https://issdigital.campinas.sp.gov.br/WsNFe2/LoteRps.jws
;
ProNameSpace=http://proces.wsnfe2.dsfnet.com.br
HomNameSpace=http://proces.wsnfe2.dsfnet.com.br

[3509601]
; Atualizado em 08/02/2022
Nome=Campo Limpo Paulista
UF=SP
Provedor=GeisWeb
Params=AliasCidade:campolimpopaulista
;
ProRecepcionar=https://www.geisweb.net.br/producao/campolimpopaulista/webservice/GeisWebServiceImpl.php

[3509700]
Nome=Campos do Jordao
UF=SP
Provedor=PadraoNacional

[3509809]
Nome=Campos Novos Paulista
UF=SP
Provedor=PadraoNacional

[3509908]
Nome=Cananeia
UF=SP
Provedor=PadraoNacional

[3509957]
Nome=Canas
UF=SP
Provedor=PadraoNacional

[3510005]
Nome=Candido Mota
UF=SP
Provedor=PadraoNacional

[3510104]
Nome=Candido Rodrigues
UF=SP
Provedor=Betha

[3510153]
Nome=Canitar
UF=SP
Provedor=PadraoNacional

[3510203]
Nome=Capao Bonito
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=http://capaobonito.sistemas4r.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=http://capaobonito.sistemas4r.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=http://capaobonito.sistemas4r.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=http://capaobonito.sistemas4r.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=http://capaobonito.sistemas4r.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=http://capaobonito.sistemas4r.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=http://capaobonito.sistemas4r.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=http://capaobonito.sistemas4r.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://capaobonito.sistemas4r.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://capaobonito.sistemas4r.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3510302]
; Inclu�do em 10/01/2022
Nome=Capela do Alto
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://saopaulo1.dcfiorilli.com.br:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://saopaulo1.dcfiorilli.com.br:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3510401]
Nome=Capivari
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://capivari.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://capivari.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3510500]
Nome=Caraguatatuba
UF=SP
Provedor=PadraoNacional

[3510609]
Nome=Carapicuiba
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wscarapicuiba.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wscarapicuiba.simplissweb.com.br/nfseservice.svc

[3510708]
Nome=Cardoso
UF=SP
Provedor=PadraoNacional

[3510807]
Nome=Casa Branca
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wscasabranca.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wscasabranca.simplissweb.com.br/nfseservice.svc

[3510906]
Nome=Cassia Dos Coqueiros
UF=SP
Provedor=PadraoNacional

[3511003]
Nome=Castilho
UF=SP
Provedor=PadraoNacional

[3511102]
; Atualizado em 28/04/2022
Nome=Catanduva
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://catanduva.sp.gov.br:58080/IssWeb-ejb/IssWebWS/IssWebWS
HomRecepcionar=http://fi1.fiorilli.com.br:5663/IssWeb-ejb/IssWebWS/IssWebWS

[3511201]
Nome=Catigua
UF=SP
Provedor=PadraoNacional

[3511300]
Nome=Cedral
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://187.120.209.20:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://187.120.209.20:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3511409]
Nome=Cerqueira Cesar
UF=SP
Provedor=PadraoNacional

[3511508]
Nome=Cerquilho
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=http://cerquilho.4rtec.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=http://cerquilho.4rtec.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=http://cerquilho.4rtec.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=http://cerquilho.4rtec.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=http://cerquilho.4rtec.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=http://cerquilho.4rtec.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=http://cerquilho.4rtec.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=http://cerquilho.4rtec.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://cerquilho.4rtec.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://cerquilho.4rtec.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3511607]
Nome=Cesario Lange
UF=SP
Provedor=PadraoNacional

[3511706]
Nome=Charqueada
UF=SP
Provedor=PadraoNacional

[3511904]
Nome=Clementina
UF=SP
Provedor=PadraoNacional

[3512001]
Nome=Colina
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://colina.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://colina.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3512100]
Nome=Colombia
UF=SP
Provedor=PadraoNacional

[3512209]
; Inclu�do em 20/09/2022
Nome=Conchal
UF=SP
Provedor=SigISSWeb
ProRecepcionar=https://wsconchal.sigissweb.com/

[3512308]
Nome=Conchas
UF=SP
Provedor=PadraoNacional

[3512407]
Nome=Cordeiropolis
UF=SP
Provedor=SigCorp
Versao=2.03
ProRecepcionar=http://abrasfcordeiropolis.sigbancos.com.br/servico.asmx
HomRecepcionar=http://testeabrasfcordeiropolis.sigbancos.com.br/servico.asmx

[3512506]
; Inclu�do em 04/08/2022
Nome=Coroados
UF=SP
Provedor=Fiorilli
Versao=2.00
;
ProRecepcionar=http://45.225.140.213:5657/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://45.225.140.213:5657/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%           

[3512605]
Nome=Coronel Macedo
UF=SP
Provedor=PadraoNacional

[3512704]
Nome=Corumbatai
UF=SP
Provedor=Betha

[3512803]
Nome=Cosmopolis
UF=SP
Provedor=PadraoNacional

[3512902]
Nome=Cosmorama
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://189.111.140.145:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://189.111.140.145:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3513009]
Nome=Cotia
UF=SP
Provedor=Giap
ProRecepcionar=http://webservice.giap.com.br/WSNfsesCotia/nfseresources/ws/v2/emissao
ProConsultarNFSeRps=http://webservice.giap.com.br/WSNfsesCotia/nfseresources/ws/consulta
ProCancelarNFSe=http://webservice.giap.com.br/WSNfsesCotia/nfseresources/ws/v2/cancela
;
HomRecepcionar=http://webservice.giap.com.br/WSNfsesCotia/nfseresources/ws/v2/emissao/simula
HomConsultarNFSeRps=http://webservice.giap.com.br/WSNfsesCotia/nfseresources/ws/consulta
HomCancelarNFSe=http://webservice.giap.com.br/WSNfsesCotia/nfseresources/ws/v2/cancela

[3513108]
Nome=Cravinhos
UF=SP
Provedor=PadraoNacional

[3513207]
Nome=Cristais Paulista
UF=SP
Provedor=PadraoNacional

[3513306]
Nome=Cruzalia
UF=SP
Provedor=PadraoNacional

[3513405]
; Atualizado em 10/01/2022
Nome=Cruzeiro
UF=SP
Provedor=SiapNet
Versao=2.00
ProRecepcionar=https://pmcruzeiro.geosiap.net.br:4443/pmcruzeiro/issonline/ws/index.php
HomRecepcionar=https://pmcruzeiro.geosiap.net.br:4443/teste/issonline/ws/index.php

[3513504]
; Atualizado em 02/08/2022
Nome=Cubatao
UF=SP
Provedor=SmarAPD
ProRecepcionar=http://sistema.cubatao.sp.gov.br:8080/tbw/services/WSEntrada
ProConsultarSituacao=http://sistema.cubatao.sp.gov.br:8080/tbw/services/WSEntrada
ProConsultarLote=http://sistema.cubatao.sp.gov.br:8080/tbw/services/WSSaida
ProConsultarNFSeRps=http://sistema.cubatao.sp.gov.br:8080/tbw/services/WSSaida
ProConsultarNFSe=http://sistema.cubatao.sp.gov.br:8080/tbw/services/WSSaida
ProCancelarNFSe=http://sistema.cubatao.sp.gov.br:8080/tbw/services/WSEntrada
ProGerarNFSe=http://sistema.cubatao.sp.gov.br:8080/tbw/services/WSEntrada
ProRecepcionarSincrono=http://sistema.cubatao.sp.gov.br:8080/tbw/services/WSEntrada
ProSubstituirNFSe=http://sistema.cubatao.sp.gov.br:8080/tbw/services/WSEntrada
;
HomRecepcionar=http://sistema.cubatao.sp.gov.br:8080/tbwhomolog/services/WSEntrada
HomConsultarSituacao=http://sistema.cubatao.sp.gov.br:8080/tbwhomolog/services/WSEntrada
HomConsultarLote=http://sistema.cubatao.sp.gov.br:8080/tbwhomolog/services/WSSaida
HomConsultarNFSeRps=http://sistema.cubatao.sp.gov.br:8080/tbwhomolog/services/WSSaida
HomConsultarNFSe=http://sistema.cubatao.sp.gov.br:8080/tbwhomolog/services/WSSaida
HomCancelarNFSe=http://sistema.cubatao.sp.gov.br:8080/tbwhomolog/services/WSEntrada
HomGerarNFSe=http://sistema.cubatao.sp.gov.br:8080/tbwhomolog/services/WSEntrada
HomRecepcionarSincrono=http://sistema.cubatao.sp.gov.br:8080/tbwhomolog/services/WSEntrada
HomSubstituirNFSe=http://sistema.cubatao.sp.gov.br:8080/tbwhomolog/services/WSEntrada
;
ProLinkURL=http://sistema.cubatao.sp.gov.br:8080/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%
HomLinkURL=http://sistema.cubatao.sp.gov.br:8080/tbwhomolog/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%

[3513603]
Nome=Cunha
UF=SP
Provedor=Betha

[3513702]
Nome=Descalvado
UF=SP
Provedor=PadraoNacional

[3513801]
Nome=Diadema
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://diadema.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://diadema.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3513850]
Nome=Dirce Reis
UF=SP
Provedor=PadraoNacional

[3513900]
Nome=Divinolandia
UF=SP
Provedor=PadraoNacional

[3514007]
Nome=Dobrada
UF=SP
Provedor=PadraoNacional

[3514106]
Nome=Dois Corregos
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wsdoiscorregos.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsdoiscorregos.simplissweb.com.br/nfseservice.svc

[3514205]
Nome=Dolcinopolis
UF=SP
Provedor=PadraoNacional

[3514304]
; Inclu�do em 04/08/2022
Nome=Dourado
UF=SP
Provedor=Fiorilli
Versao=2.00
;
ProRecepcionar=http://189.1.152.50:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://189.1.152.50:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%           

[3514403]
Nome=Dracena
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://187.17.201.221:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://187.17.201.221:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3514502]
Nome=Duartina
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://186.224.0.62:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://186.224.0.62:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3514601]
Nome=Dumont
UF=SP
Provedor=PadraoNacional

[3514700]
Nome=Echapora
UF=SP
Provedor=PadraoNacional

[3514809]
Nome=Eldorado
UF=SP
Provedor=PadraoNacional

[3514908]
Nome=Elias Fausto
UF=SP
Provedor=PadraoNacional

[3514924]
Nome=Elisiario
UF=SP
Provedor=PadraoNacional

[3514957]
Nome=Embauba
UF=SP
Provedor=PadraoNacional

[3515004]
Nome=Embu das Artes
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wsembudasartes.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsembudasartes.com.br/nfseservice.svc

[3515103]
Nome=Embu-Guacu
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://embuguacu.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://embuguacu.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3515129]
Nome=Emilianopolis
UF=SP
Provedor=PadraoNacional

[3515152]
; Inclu�do em 20/09/2022
Nome=Engenheiro Coelho
UF=SP
Provedor=SigISSWeb
ProRecepcionar=https://wsengenheirocoelho.sigissweb.com/

[3515186]
Nome=Espirito Santo do Pinhal
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wsespiritosantodopinhal.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsespiritosantodopinhal.com.br/nfseservice.svc

[3515194]
Nome=Espirito Santo do Turvo
UF=SP
Provedor=PadraoNacional

[3515202]
Nome=Estrela D Oeste
UF=SP
Provedor=PadraoNacional

[3515301]
Nome=Estrela do Norte
UF=SP
Provedor=PadraoNacional

[3515350]
Nome=Euclides da Cunha Paulista
UF=SP
Provedor=PadraoNacional

[3515400]
Nome=Fartura
UF=SP
Provedor=PadraoNacional

[3515509]
Nome=Fernandopolis
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://servicos.fernandopolis.sp.gov.br:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://servicos.fernandopolis.sp.gov.br:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3515608]
Nome=Fernando Prestes
UF=SP
Provedor=PadraoNacional

[3515657]
Nome=Fernao
UF=SP
Provedor=PadraoNacional

[3515707]
Nome=Ferraz de Vasconcelos
UF=SP
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/sp.ferraz/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/sp.ferraz/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/sp.ferraz/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/sp.ferraz/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3515806]
Nome=Flora Rica
UF=SP
Provedor=PadraoNacional

[3515905]
Nome=Floreal
UF=SP
Provedor=PadraoNacional

[3516002]
Nome=Florida Paulista
UF=SP
Provedor=PadraoNacional

[3516101]
Nome=Florinia
UF=SP
Provedor=PadraoNacional

[3516200]
Nome=Franca
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://franca.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://franca.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3516309]
Nome=Francisco Morato
UF=SP
Provedor=PadraoNacional

[3516408]
Nome=Franco da Rocha
UF=SP
Provedor=PadraoNacional

[3516507]
Nome=Gabriel Monteiro
UF=SP
Provedor=PadraoNacional

[3516606]
Nome=Galia
UF=SP
Provedor=PadraoNacional

[3516705]
; Atualizado em 28/01/2022
Nome=Garca
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://179.96.132.27:2014/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://179.96.132.27:2014/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3516804]
Nome=Gastao Vidigal
UF=SP
Provedor=PadraoNacional

[3516853]
Nome=Gaviao Peixoto
UF=SP
Provedor=Betha

[3516903]
Nome=General Salgado
UF=SP
Provedor=PadraoNacional

[3517000]
Nome=Getulina
UF=SP
Provedor=PadraoNacional

[3517109]
Nome=Glicerio
UF=SP
Provedor=PadraoNacional

[3517208]
Nome=Guaicara
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://45.225.142.194:8080/IssWeb-ejb/IssWebWS/IssWebWS?wsd
ProLinkURL=http://45.225.142.194:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3517307]
Nome=Guaimbe
UF=SP
Provedor=PadraoNacional

[3517406]
Nome=Guaira
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://186.211.16.210:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://186.211.16.210:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3517505]
; Inclu�do em 21/06/2022
Nome=Guapia�u
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://187.9.146.42:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://187.9.146.42:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3517604]
Nome=Guapiara
UF=SP
Provedor=PadraoNacional

[3517703]
Nome=Guara
UF=SP
Provedor=PadraoNacional

[3517802]
Nome=Guaracai
UF=SP
Provedor=PadraoNacional

[3517901]
Nome=Guaraci
UF=SP
Provedor=PadraoNacional

[3518008]
Nome=Guarani D Oeste
UF=SP
Provedor=PadraoNacional

[3518107]
Nome=Guaranta
UF=SP
Provedor=PadraoNacional

[3518206]
Nome=Guararapes
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://177.154.46.80:5657/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://177.154.46.80:5657/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3518305]
Nome=Guararema
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://guararema.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://guararema.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3518404]
; Atualizado em 10/01/2022
Nome=Guaratingueta
UF=SP
Provedor=SiapNet
Versao=2.00
ProRecepcionar=https://pmguaratingueta.geosiap.net.br/pmguaratingueta/issonline/ws/index.php
HomRecepcionar=https://pmguaratingueta.geosiap.net.br/teste/issonline/ws/index.php

[3518503]
Nome=Guarei
UF=SP
Provedor=PadraoNacional

[3518602]
Nome=Guariba
UF=SP
Provedor=PadraoNacional

[3518701]
Nome=Guaruja
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://guaruja.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://guaruja.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3518800]
Nome=Guarulhos
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://guarulhos.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://guarulhos.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3518859]
Nome=Guatapara
UF=SP
Provedor=Betha

[3518909]
Nome=Guzolandia
UF=SP
Provedor=PadraoNacional

[3519006]
Nome=Herculandia
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wsherculandia.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsherculandia.com.br/nfseservice.svc

[3519055]
Nome=Holambra
UF=SP
Provedor=PadraoNacional

[3519071]
Nome=Hortolandia
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://hortolandia.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://hortolandia.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3519105]
; Inclu�do em 06/06/2022
Nome=Iacanga
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://sppmiacanga.dcfiorilli.com.br:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://sppmiacanga.dcfiorilli.com.br:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3519204]
Nome=Iacri
UF=SP
Provedor=PadraoNacional

[3519253]
Nome=Iaras
UF=SP
Provedor=PadraoNacional

[3519303]
Nome=Ibate
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://200.205.131.110:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://200.205.131.110:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3519402]
Nome=Ibira
UF=SP
Provedor=PadraoNacional

[3519501]
Nome=Ibirarema
UF=SP
Provedor=PadraoNacional

[3519600]
; Atualizado em 06/05/2021
Nome=Ibitinga
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://164.163.52.80:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://164.163.52.80:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3519709]
Nome=Ibiuna
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=http://ibiuna.cidadeonline.inf.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=http://ibiuna.cidadeonline.inf.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=http://ibiuna.cidadeonline.inf.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=http://ibiuna.cidadeonline.inf.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=http://ibiuna.cidadeonline.inf.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=http://ibiuna.cidadeonline.inf.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=http://ibiuna.cidadeonline.inf.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=http://ibiuna.cidadeonline.inf.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://ibiuna.cidadeonline.inf.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://ibiuna.cidadeonline.inf.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3519808]
Nome=Icem
UF=SP
Provedor=PadraoNacional

[3519907]
Nome=Iepe
UF=SP
Provedor=PadraoNacional

[3520004]
Nome=Igaracu do Tiete
UF=SP
Provedor=WebFisco

[3520103]
Nome=Igarapava
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://138.117.189.204:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://138.117.189.204:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3520202]
Nome=Igarata
UF=SP
Provedor=PadraoNacional

[3520301]
Nome=Iguape
UF=SP
Provedor=PadraoNacional

[3520400]
Nome=Ilhabela
UF=SP
Provedor=PadraoNacional

[3520426]
Nome=Ilha Comprida
UF=SP
Provedor=PadraoNacional

[3520442]
Nome=Ilha Solteira
UF=SP
Provedor=PadraoNacional

[3520509]
Nome=Indaiatuba
UF=SP
Provedor=DeISS
Versao=2.03
Params=NaoGerarTag:ValorIss
;
ProRecepcionar=https://deiss.indaiatuba.sp.gov.br/producao/nfse
HomRecepcionar=https://deiss.indaiatuba.sp.gov.br/homologacao/nfse
;
ProNameSpace=http://nfse.indaiatuba.sp.gov.br
HomNameSpace=http://nfse.indaiatuba.sp.gov.br
;
ProSoapAction=http://nfse.indaiatuba.sp.gov.br/
HomSoapAction=http://nfse.indaiatuba.sp.gov.br/

[3520608]
Nome=Indiana
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wsindiana.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsindiana.simplissweb.com.br/nfseservice.svc

[3520707]
Nome=Indiapora
UF=SP
Provedor=PadraoNacional

[3520806]
Nome=Inubia Paulista
UF=SP
Provedor=PadraoNacional

[3520905]
Nome=Ipaussu
UF=SP
Provedor=PadraoNacional

[3521002]
Nome=Ipero
UF=SP
Provedor=PadraoNacional

[3521101]
Nome=Ipeuna
UF=SP
Provedor=PadraoNacional

[3521150]
Nome=Ipigua
UF=SP
Provedor=PadraoNacional

[3521200]
Nome=Iporanga
UF=SP
Provedor=PadraoNacional

[3521309]
Nome=Ipua
UF=SP
Provedor=PadraoNacional

[3521408]
Nome=Iracemapolis
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wsiracemapolis.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsiracemapolis.simplissweb.com.br/nfseservice.svc

[3521507]
Nome=Irapua
UF=SP
Provedor=PadraoNacional

[3521606]
Nome=Irapuru
UF=SP
Provedor=PadraoNacional

[3521705]
Nome=Itabera
UF=SP
Provedor=PadraoNacional

[3521804]
Nome=Itai
UF=SP
Provedor=PadraoNacional

[3521903]
; Inclu�do em 21/06/2022
Nome=Itajobi
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://nfes.itajobi.sp.gov.br/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://nfes.itajobi.sp.gov.br/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3522000]
Nome=Itaju
UF=SP
Provedor=PadraoNacional

[3522109]
Nome=Itanhaem
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=http://itanhaem.sistemas4r.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=http://itanhaem.sistemas4r.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=http://itanhaem.sistemas4r.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=http://itanhaem.sistemas4r.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=http://itanhaem.sistemas4r.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=http://itanhaem.sistemas4r.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=http://itanhaem.sistemas4r.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=http://itanhaem.sistemas4r.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://itanhaem.sistemas4r.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://itanhaem.sistemas4r.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3522158]
Nome=Itaoca
UF=SP
Provedor=PadraoNacional

[3522208]
Nome=Itapecerica da Serra
UF=SP
Provedor=PadraoNacional

[3522307]
; Atualizado em 20/09/2022
Nome=Itapetininga
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=http://itapetininga.jlsoft.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=http://itapetininga.jlsoft.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=http://itapetininga.jlsoft.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=http://itapetininga.jlsoft.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=http://itapetininga.jlsoft.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=http://itapetininga.jlsoft.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=http://itapetininga.jlsoft.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=http://itapetininga.jlsoft.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://itapetininga.jlsoft.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://itapetininga.jlsoft.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3522406]
Nome=Itapeva
UF=SP
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/sp.itapeva/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/sp.itapeva/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/sp.itapeva/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/sp.itapeva/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3522505]
; Atualizado em 08/09/2022
Nome=Itapevi
UF=SP
Provedor=SilTecnologia
Versao=2.03
ProRecepcionar=https://itapevi.siltecnologia.com.br/services/Abrasf23
HomRecepcionar=https://homologacao.siltecnologia.com.br/tbitapevi/services/Abrasf23
;
ProLinkURL=http://itapevi.siltecnologia.com.br/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%CodVerif%
HomLinkURL=http://itapevi.siltecnologia.com.br/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%CodVerif%

[3522604]
; Inclu�do em 26/12/2022
Nome=Itapira
UF=SP
Provedor=SigISS
ProRecepcionar=https://itapira.sigiss.com.br/itapira/ws/sigiss_ws.php
;
ProSoapAction=urn:sigiss_ws

[3522653]
Nome=Itapirapua Paulista
UF=SP
Provedor=PadraoNacional

[3522703]
Nome=Itapolis
UF=SP
Provedor=SmarAPD
Versao=2.04
ProRecepcionar=http://notafiscal.itapolis.sp.gov.br:8090/tbw/services/nfseSOAP
HomRecepcionar=https://tributacao.smarapd.com.br/tbwhomolog/services/nfseSOAP
;
ProLinkURL=http://suporte.itapolis.sp.gov.br:9083/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%
HomLinkURL=http://suporte.itapolis.sp.gov.br:9083/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%

[3522802]
Nome=Itaporanga
UF=SP
Provedor=PadraoNacional

[3522901]
Nome=Itapui
UF=SP
Provedor=PadraoNacional

[3523008]
Nome=Itapura
UF=SP
Provedor=PadraoNacional

[3523107]
; Inclu�do em 27/05/2021
; Atualizado em 24/06/2022
Nome=Itaquaquecetuba
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://itaquaquecetuba.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://itaquaquecetuba.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3523206]
Nome=Itarare
UF=SP
Provedor=PadraoNacional

[3523305]
Nome=Itariri
UF=SP
Provedor=PadraoNacional

[3523404]
Nome=Itatiba
UF=SP
Provedor=fintelISS
Versao=2.02
ProRecepcionar=https://iss.itatiba.sp.gov.br:4431/WebService.asmx
HomRecepcionar=https://iss.itatiba.sp.gov.br:4432/Homologacao/WebService.asmx
;
ProXMLNameSpace=http://iss.itatiba.sp.gov.br/Arquivos/nfseV202.xsd

[3523503]
Nome=Itatinga
UF=SP
Provedor=GeisWeb
Params=AliasCidade:itatinga
;
ProRecepcionar=https://www.geisweb.net.br/producao/itatinga/webservice/GeisWebServiceImpl.php

[3523602]
Nome=Itirapina
UF=SP
Provedor=PadraoNacional

[3523701]
Nome=Itirapua
UF=SP
Provedor=PadraoNacional

[3523800]
Nome=Itobi
UF=SP
Provedor=PadraoNacional

[3523909]
Nome=Itu
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://itu.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://itu.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3524006]
; Inclu�do em 07/07/2022
Nome=Itupeva
UF=SP
Provedor=Siappa
ProRecepcionar=https://app.siappa.com.br/issqn_itupeva/servlet/com.issqnwebev3v2.aws_gera_nfse_token
ProConsultarNFSe=https://app.siappa.com.br/issqn_itupeva/servlet/com.issqnwebev3v2.aws_consulta_nfse_token
ProCancelarNFSe=https://app.siappa.com.br/issqn_itupeva/servlet/com.issqnwebev3v2.aws_cancela_nfse_token
ProGerarToken=https://app.siappa.com.br/issqn_itupeva/servlet/com.issqnwebev3v2.aws_gera_token
;
HomRecepcionar=https://app.siappa.com.br/issqn_itupeva/servlet/com.issqnwebev3v2.aws_gera_nfse_token
HomConsultarNFSe=https://app.siappa.com.br/issqn_itupeva/servlet/com.issqnwebev3v2.aws_consulta_nfse_token
HomCancelarNFSe=https://app.siappa.com.br/issqn_itupeva/servlet/com.issqnwebev3v2.aws_cancela_nfse_token
HomGerarToken=https://app.siappa.com.br/issqn_itupeva/servlet/com.issqnwebev3v2.aws_gera_token

[3524105]
Nome=Ituverava
UF=SP
Provedor=PadraoNacional

[3524204]
Nome=Jaborandi
UF=SP
Provedor=PadraoNacional

[3524303]
Nome=Jaboticabal
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://jaboticabal.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://jaboticabal.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3524402]
; Atualizado em 06/12/2022
Nome=Jacarei
UF=SP
Provedor=SiapNet
Versao=2.00
ProRecepcionar=https://egov.jacarei.sp.gov.br/pmjacarei/issonline/ws/index.php
HomRecepcionar=https://egov.jacarei.sp.gov.br/pmjacarei_homologacao/issonline/ws/index.php

[3524501]
Nome=Jaci
UF=SP
Provedor=PadraoNacional

[3524600]
Nome=Jacupiranga
UF=SP
Provedor=PadraoNacional

[3524709]
Nome=Jaguariuna
UF=SP
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/jaguariuna
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/jaguariuna

[3524808]
Nome=Jales
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wsjales.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsjales.simplissweb.com.br/nfseservice.svc

[3524907]
Nome=Jambeiro
UF=SP
Provedor=Betha

[3525003]
; Inclu�do em 18/10/2022
Nome=Jandira
UF=SP
Provedor=SilTecnologia
Versao=2.03
ProRecepcionar=https://jandira.siltecnologia.com.br/services/Abrasf23
HomRecepcionar=https://homologacao.siltecnologia.com.br/tbjandira/services/Abrasf23

[3525102]
Nome=Jardinopolis
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://jardinopolis.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://jardinopolis.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3525201]
Nome=Jarinu
UF=SP
Provedor=PadraoNacional

[3525300]
Nome=Jau
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://179.174.56.79:8090/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://179.174.56.79:8090/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3525409]
Nome=Jeriquara
UF=SP
Provedor=PadraoNacional

[3525508]
Nome=Joanopolis
UF=SP
Provedor=PadraoNacional

[3525607]
Nome=Joao Ramalho
UF=SP
Provedor=PadraoNacional

[3525706]
Nome=Jose Bonifacio
UF=SP
Provedor=PadraoNacional

[3525805]
Nome=Julio Mesquita
UF=SP
Provedor=PadraoNacional

[3525854]
Nome=Jumirim
UF=SP
Provedor=PadraoNacional

[3525904]
Nome=Jundiai
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://jundiai.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://jundiai.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3526001]
; Inclu�do em 16/11/2022
Nome=Junqueiropolis
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://servicos.junqueiropolis.sp.gov.br/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://servicos.junqueiropolis.sp.gov.br/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3526100]
Nome=Juquia
UF=SP
Provedor=PadraoNacional

[3526209]
Nome=Juquitiba
UF=SP
Provedor=PadraoNacional

[3526308]
Nome=Lagoinha
UF=SP
Provedor=PadraoNacional

[3526407]
; Inclu�do em 10/09/2021
Nome=Laranjal Paulista
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://189.45.236.250/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://189.45.236.250/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3526506]
Nome=Lavinia
UF=SP
Provedor=PadraoNacional

[3526605]
Nome=Lavrinhas
UF=SP
Provedor=PadraoNacional

[3526704]
; Inclu�do em 20/09/2022
Nome=Leme
UF=SP
Provedor=SigISSWeb
ProRecepcionar=https://wsleme.sigissweb.com/

[3526803]
Nome=Lencois Paulista
UF=SP
Provedor=ISSLencois
ProRecepcionar=https://apl2.lencoispaulista.sp.gov.br/webservice/wsNotaFiscal.asmx
HomRecepcionar=https://apl2.lencoispaulista.sp.gov.br/wsteste/wsNotaFiscal.asmx

[3526902]
Nome=Limeira
UF=SP
Provedor=iiBrasil
Versao=2.04
ProRecepcionar=https://limeira.iibr.com.br/api/soap/notafiscal.php
HomRecepcionar=https://limeira.iibr.com.br/api/soap/homologacao_notafiscal.php

[3527009]
Nome=Lindoia
UF=SP
Provedor=PadraoNacional

[3527108]
Nome=Lins
UF=SP
Provedor=PadraoNacional

[3527207]
; Atualizado em 10/01/2022
Nome=Lorena
UF=SP
Provedor=SiapNet
Versao=2.00
ProRecepcionar=https://siap.lorena.sp.gov.br/pmlorena/issonline/ws/index.php
HomRecepcionar=https://siap.lorena.sp.gov.br/teste/issonline/ws/index.php

[3527256]
Nome=Lourdes
UF=SP
Provedor=PadraoNacional

[3527306]
Nome=Louveira
UF=SP
Provedor=PadraoNacional

[3527405]
Nome=Lucelia
UF=SP
Provedor=PadraoNacional

[3527504]
Nome=Lucianopolis
UF=SP
Provedor=PadraoNacional

[3527603]
; Inclu�do em 05/09/2022
Nome=Luis Antonio
UF=SP
Provedor=WebFisco

[3527702]
Nome=Luiziania
UF=SP
Provedor=PadraoNacional

[3527801]
Nome=Lupercio
UF=SP
Provedor=PadraoNacional

[3527900]
Nome=Lutecia
UF=SP
Provedor=PadraoNacional

[3528007]
Nome=Macatuba
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=http://macatuba.4rtec.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=http://macatuba.4rtec.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=http://macatuba.4rtec.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=http://macatuba.4rtec.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=http://macatuba.4rtec.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=http://macatuba.4rtec.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=http://macatuba.4rtec.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=http://macatuba.4rtec.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://macatuba.4rtec.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://macatuba.4rtec.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3528106]
Nome=Macaubal
UF=SP
Provedor=PadraoNacional

[3528205]
Nome=Macedonia
UF=SP
Provedor=PadraoNacional

[3528304]
Nome=Magda
UF=SP
Provedor=PadraoNacional

[3528403]
Nome=Mairinque
UF=SP
Provedor=PadraoNacional

[3528502]
Nome=Mairipora
UF=SP
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/sp.mairipora/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/sp.mairipora/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/sp.mairipora/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/sp.mairipora/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3528601]
Nome=Manduri
UF=SP
Provedor=PadraoNacional

[3528700]
Nome=Maraba Paulista
UF=SP
Provedor=PadraoNacional

[3528809]
Nome=Maracai
UF=SP
Provedor=PadraoNacional

[3528858]
Nome=Marapoama
UF=SP
Provedor=PadraoNacional

[3528908]
Nome=Mariapolis
UF=SP
Provedor=PadraoNacional

[3529005]
Nome=Marilia
UF=SP
Provedor=SigISS
ProRecepcionar=https://marilia.sigiss.com.br/marilia/ws/sigiss_ws.php
;
ProSoapAction=urn:sigiss_ws

[3529104]
Nome=Marinopolis
UF=SP
Provedor=PadraoNacional

[3529203]
Nome=Martinopolis
UF=SP
Provedor=PadraoNacional

[3529302]
Nome=Matao
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://matao.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://matao.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3529401]
Nome=Maua
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://maua.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://maua.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3529500]
Nome=Mendonca
UF=SP
Provedor=PadraoNacional

[3529609]
Nome=Meridiano
UF=SP
Provedor=PadraoNacional

[3529658]
Nome=Mesopolis
UF=SP
Provedor=PadraoNacional

[3529708]
Nome=Miguelopolis
UF=SP
Provedor=PadraoNacional

[3529807]
; Atualizado em 24/09/2021
Nome=Mineiros do Tiete
UF=SP
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://54.207.200.34/nfse.portal.integracao/services.svc
HomRecepcionar=http://54.207.200.34/nfse.portal.integracao.teste/services.svc

[3529906]
Nome=Miracatu
UF=SP
Provedor=PadraoNacional

[3530003]
Nome=Mira Estrela
UF=SP
Provedor=PadraoNacional

[3530102]
Nome=Mirandopolis
UF=SP
Provedor=PadraoNacional

[3530201]
Nome=Mirante do Paranapanema
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wsmirantedoparanapanema.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsmirantedoparanapanema.simplissweb.com.br/nfseservice.svc

[3530300]
; Atualizado em 18/04/2022
Nome=Mirassol
UF=SP
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://mirassol.govbr.cloud/NFSe.Portal.integracao/services.svc
HomRecepcionar=http://mirassol.govbr.cloud/NFSe.Portal.integracao.teste/services.svc

[3530409]
Nome=Mirassolandia
UF=SP
Provedor=PadraoNacional

[3530508]
; Atualizado em 11/06/2021
Nome=Mococa
UF=SP
Provedor=Betha

[3530607]
; Atualizado em 05/07/2022
Nome=Mogi das Cruzes
UF=SP
Provedor=SmarAPD
Versao=2.03
ProRecepcionar=https://servicos.mogidascruzes.sp.gov.br/tbw/services/Abrasf23
HomRecepcionar=https://servicos.mogidascruzes.sp.gov.br/tbwhomologacao/services/Abrasf23
;
ProLinkURL=
HomLinkURL=

[3530706]
Nome=Mogi Guacu
UF=SP
Provedor=PadraoNacional

[3530805]
Nome=Mogi Mirim
UF=SP
Provedor=SigCorp
Versao=2.03
ProRecepcionar=http://abrasfmogimirim.sigbancos.com.br/servico.asmx
HomRecepcionar=http://abrasfmogimirimteste.sigbancos.com.br/servico.asmx

[3530904]
Nome=Mombuca
UF=SP
Provedor=PadraoNacional

[3531001]
Nome=Moncoes
UF=SP
Provedor=PadraoNacional

[3531100]
Nome=Mongagua
UF=SP
Provedor=PadraoNacional

[3531209]
Nome=Monte Alegre do Sul
UF=SP
Provedor=PadraoNacional

[3531308]
Nome=Monte Alto
UF=SP
Provedor=Betha

[3531407]
; Inclu�do em 23/05/2022
Nome=Monte Aprazivel
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://170.0.24.38:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://170.0.24.38:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3531506]
; Inclu�do em 04/06/2021
Nome=Monte Azul Paulista
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://914f087b1e8f.sn.mynetname.net:35000/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://914f087b1e8f.sn.mynetname.net:35000/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3531605]
Nome=Monte Castelo
UF=SP
Provedor=PadraoNacional

[3531704]
Nome=Monteiro Lobato
UF=SP
Provedor=PadraoNacional

[3531803]
Nome=Monte Mor
UF=SP
Provedor=PadraoNacional

[3531902]
Nome=Morro Agudo
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://177.129.28.34:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://177.129.28.34:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3532009]
Nome=Morungaba
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://servicos.morungaba.sp.gov.br:5600/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://servicos.morungaba.sp.gov.br:5600/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3532058]
Nome=Motuca
UF=SP
Provedor=PadraoNacional

[3532108]
Nome=Murutinga do Sul
UF=SP
Provedor=PadraoNacional

[3532157]
Nome=Nantes
UF=SP
Provedor=PadraoNacional

[3532207]
Nome=Narandiba
UF=SP
Provedor=PadraoNacional

[3532306]
Nome=Natividade da Serra
UF=SP
Provedor=PadraoNacional

[3532405]
Nome=Nazare Paulista
UF=SP
Provedor=Betha

[3532504]
Nome=Neves Paulista
UF=SP
Provedor=PadraoNacional

[3532603]
Nome=Nhandeara
UF=SP
Provedor=PadraoNacional

[3532702]
Nome=Nipoa
UF=SP
Provedor=PadraoNacional

[3532801]
Nome=Nova Alianca
UF=SP
Provedor=PadraoNacional

[3532827]
Nome=Nova Campina
UF=SP
Provedor=PadraoNacional

[3532843]
Nome=Nova Canaa Paulista
UF=SP
Provedor=PadraoNacional

[3532868]
Nome=Nova Castilho
UF=SP
Provedor=PadraoNacional

[3532900]
Nome=Nova Europa
UF=SP
Provedor=PadraoNacional

[3533007]
; Inclu�do em 08/11/2022
Nome=Nova Granada
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://723b066b6103.sn.mynetname.net:5661/IssWeb-ejb/IssWebWS/IssWebWS

[3533106]
Nome=Nova Guataporanga
UF=SP
Provedor=PadraoNacional

[3533205]
Nome=Nova Independencia
UF=SP
Provedor=PadraoNacional

[3533254]
Nome=Novais
UF=SP
Provedor=PadraoNacional

[3533304]
Nome=Nova Luzitania
UF=SP
Provedor=PadraoNacional

[3533403]
; Atualizado em 02/06/2022
Nome=Nova Odessa
UF=SP
Provedor=SmarAPD
Versao=2.04
ProRecepcionar=http://apps.novaodessa.sp.gov.br:9083/tbw/services/nfseSOAP
HomRecepcionar=http://apps.novaodessa.sp.gov.br:9083/tbwhomolog/services/nfseSOAP
;
ProLinkURL=http://apps.novaodessa.sp.gov.br:9083/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%
HomLinkURL=http://apps.novaodessa.sp.gov.br:9083/tbwhomolog/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%

[3533502]
Nome=Novo Horizonte
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://nfews.novohorizonte.sp.gov.br/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://nfews.novohorizonte.sp.gov.br/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3533601]
Nome=Nuporanga
UF=SP
Provedor=PadraoNacional

[3533700]
Nome=Ocaucu
UF=SP
Provedor=PadraoNacional

[3533809]
Nome=Oleo
UF=SP
Provedor=PadraoNacional

[3533908]
Nome=Olimpia
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://visualizar.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://visualizar.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3534005]
Nome=Onda Verde
UF=SP
Provedor=PadraoNacional

[3534104]
Nome=Oriente
UF=SP
Provedor=PadraoNacional

[3534203]
Nome=Orindiuva
UF=SP
Provedor=PadraoNacional

[3534302]
Nome=Orlandia
UF=SP
Provedor=Betha

[3534401]
; Atualizado em 08/02/2022
Nome=Osasco
UF=SP
Provedor=eGoverneISS
ProRecepcionar=https://nfe.osasco.sp.gov.br/EissnfeWebServices/NotaFiscalEletronica.svc
HomRecepcionar=https://nfe.osasco.sp.gov.br/EissnfeWebServices/NotaFiscalEletronica.svc

[3534500]
Nome=Oscar Bressane
UF=SP
Provedor=PadraoNacional

[3534609]
Nome=Osvaldo Cruz
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wsosvaldocruz.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsosvaldocruz.simplissweb.com.br/nfseservice.svc

[3534708]
; Atualizado em 12/04/2022
Nome=Ourinhos
UF=SP
Provedor=SmarAPD
Versao=2.04
ProRecepcionar=http://e-gov.ourinhos.sp.gov.br:8080/tb/services/nfseSOAP
;
HomRecepcionar=https://tributacao.smarapd.com.br/ourinhos/services/nfseSOAP
;
ProLinkURL=http://e-gov.ourinhos.sp.gov.br:8080/tb/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%
HomLinkURL=https://tributacao.smarapd.com.br/ourinhos/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%

[3534757]
Nome=Ouroeste
UF=SP
Provedor=PadraoNacional

[3534807]
Nome=Ouro Verde
UF=SP
Provedor=PadraoNacional

[3534906]
Nome=Pacaembu
UF=SP
Provedor=PadraoNacional

[3535002]
Nome=Palestina
UF=SP
Provedor=PadraoNacional

[3535101]
Nome=Palmares Paulista
UF=SP
Provedor=PadraoNacional

[3535200]
Nome=Palmeira D Oeste
UF=SP
Provedor=PadraoNacional

[3535309]
Nome=Palmital
UF=SP
Provedor=PadraoNacional

[3535408]
Nome=Panorama
UF=SP
Provedor=PadraoNacional

[3535507]
Nome=Paraguacu Paulista
UF=SP
Provedor=PadraoNacional

[3535606]
Nome=Paraibuna
UF=SP
Provedor=PadraoNacional

[3535705]
Nome=Paraiso
UF=SP
Provedor=PadraoNacional

[3535804]
Nome=Paranapanema
UF=SP
Provedor=PadraoNacional

[3535903]
Nome=Paranapua
UF=SP
Provedor=PadraoNacional

[3536000]
Nome=Parapua
UF=SP
Provedor=PadraoNacional

[3536109]
Nome=Pardinho
UF=SP
Provedor=PadraoNacional

[3536208]
Nome=Pariquera-Acu
UF=SP
Provedor=PadraoNacional

[3536257]
Nome=Parisi
UF=SP
Provedor=PadraoNacional

[3536307]
Nome=Patrocinio Paulista
UF=SP
Provedor=PadraoNacional

[3536406]
Nome=Pauliceia
UF=SP
Provedor=PadraoNacional

[3536505]
Nome=Paulinia
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://paulinia.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://paulinia.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3536570]
Nome=Paulistania
UF=SP
Provedor=PadraoNacional

[3536604]
Nome=Paulo de Faria
UF=SP
Provedor=PadraoNacional

[3536703]
Nome=Pederneiras
UF=SP
Provedor=SmarAPD
ProRecepcionar=http://portal.pederneiras.sp.gov.br:8080/tbw/services/WSEntrada
ProConsultarSituacao=http://portal.pederneiras.sp.gov.br:8080/tbw/services/WSEntrada
ProConsultarLote=http://portal.pederneiras.sp.gov.br:8080/tbw/services/WSSaida
ProConsultarNFSeRps=http://portal.pederneiras.sp.gov.br:8080/tbw/services/WSSaida
ProConsultarNFSe=http://portal.pederneiras.sp.gov.br:8080/tbw/services/WSSaida
ProCancelarNFSe=http://portal.pederneiras.sp.gov.br:8080/tbw/services/WSEntrada
ProGerarNFSe=http://portal.pederneiras.sp.gov.br:8080/tbw/services/WSEntrada
ProRecepcionarSincrono=http://portal.pederneiras.sp.gov.br:8080/tbw/services/WSEntrada
ProSubstituirNFSe=http://portal.pederneiras.sp.gov.br:8080/tbw/services/WSEntrada
;
HomRecepcionar=http://portal.pederneiras.sp.gov.br:8080/tbwhomolog/services/WSEntrada
HomConsultarSituacao=http://portal.pederneiras.sp.gov.br:8080/tbwhomolog/services/WSEntrada
HomConsultarLote=http://portal.pederneiras.sp.gov.br:8080/tbwhomolog/services/WSSaida
HomConsultarNFSeRps=http://portal.pederneiras.sp.gov.br:8080/tbwhomolog/services/WSSaida
HomConsultarNFSe=http://portal.pederneiras.sp.gov.br:8080/tbwhomolog/services/WSSaida
HomCancelarNFSe=http://portal.pederneiras.sp.gov.br:8080/tbwhomolog/services/WSEntrada
HomGerarNFSe=http://portal.pederneiras.sp.gov.br:8080/tbwhomolog/services/WSEntrada
HomRecepcionarSincrono=http://portal.pederneiras.sp.gov.br:8080/tbwhomolog/services/WSEntrada
HomSubstituirNFSe=http://portal.pederneiras.sp.gov.br:8080/tbwhomolog/services/WSEntrada
;
ProLinkURL=http://portal.pederneiras.sp.gov.br:8080/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%
HomLinkURL=http://portal.pederneiras.sp.gov.br:8080/tbwhomolog/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%

[3536802]
Nome=Pedra Bela
UF=SP
Provedor=PadraoNacional

[3536901]
Nome=Pedranopolis
UF=SP
Provedor=PadraoNacional

[3537008]
Nome=Pedregulho
UF=SP
Provedor=PadraoNacional

[3537107]
Nome=Pedreira
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://intranet.pedreira.sp.gov.br:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://intranet.pedreira.sp.gov.br:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3537156]
Nome=Pedrinhas Paulista
UF=SP
Provedor=PadraoNacional

[3537206]
Nome=Pedro de Toledo
UF=SP
Provedor=PadraoNacional

[3537305]
; Inclu�do em 04/08/2022
Nome=Penapolis
UF=SP
Provedor=AssessorPublico
;
ProRecepcionar=http://s33.asp.srv.br:8080/issonline/servlet/anfse
HomRecepcionar=http://s33.asp.srv.br:8080/issonline-homolog/servlet/anfse

[3537404]
Nome=Pereira Barreto
UF=SP
Provedor=RLZ
Versao=2.03
ProRecepcionar=http://pereirabarreto.sp.gov.br/webservice/nfse
HomRecepcionar=http://saturno.rlz.com.br:3080/sp/pereirabarreto/webservice/nfse

[3537503]
Nome=Pereiras
UF=SP
Provedor=PadraoNacional

[3537602]
Nome=Peruibe
UF=SP
Provedor=PadraoNacional

[3537701]
Nome=Piacatu
UF=SP
Provedor=PadraoNacional

[3537800]
Nome=Piedade
UF=SP
Provedor=PadraoNacional

[3537909]
Nome=Pilar do Sul
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://www.nfse.pilardosul.sp.gov.br:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://www.nfse.pilardosul.sp.gov.br:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3538006]
; Atualizado em 10/01/2022
Nome=Pindamonhangaba
UF=SP
Provedor=SiapNet
Versao=2.00
ProRecepcionar=https://siapegov.pindamonhangaba.sp.gov.br/pmpinda/issonline/ws/index.php
HomRecepcionar=

[3538105]
Nome=Pindorama
UF=SP
Provedor=PadraoNacional

[3538204]
Nome=Pinhalzinho
UF=SP
Provedor=PadraoNacional

[3538303]
Nome=Piquerobi
UF=SP
Provedor=PadraoNacional

[3538501]
Nome=Piquete
UF=SP
Provedor=PadraoNacional

[3538600]
Nome=Piracaia
UF=SP
Provedor=PadraoNacional

[3538709]
Nome=Piracicaba
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wspiracicaba.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wspiracicaba.simplissweb.com.br/nfseservice.svc

[3538808]
Nome=Piraju
UF=SP
Provedor=PadraoNacional

[3538907]
; Atualizado em 10/11/2022
Nome=Pirajui
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://prefeiturapirajui.ddns.net:3392/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://prefeiturapirajui.ddns.net:3392/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3539004]
Nome=Pirangi
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://portal.pmpirangi.com.br:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://portal.pmpirangi.com.br:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3539103]
Nome=Pirapora do Bom Jesus
UF=SP
Provedor=PadraoNacional

[3539202]
; Inclu�do 06/10/2022
Nome=Pirapozinho
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://186.227.40.20:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://186.227.40.20:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3539301]
Nome=Pirassununga
UF=SP
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/sp.pirassununga/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/sp.pirassununga/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/sp.pirassununga/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/sp.pirassununga/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3539400]
Nome=Piratininga
UF=SP
Provedor=PadraoNacional

[3539509]
Nome=Pitangueiras
UF=SP
Provedor=PadraoNacional

[3539608]
Nome=Planalto
UF=SP
Provedor=PadraoNacional

[3539707]
Nome=Platina
UF=SP
Provedor=PadraoNacional

[3539806]
; Atualizado em 06/12/2022
Nome=Poa
UF=SP
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/sp.poa/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/sp.poa/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/sp.poa/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/sp.poa/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3539905]
Nome=Poloni
UF=SP
Provedor=PadraoNacional

[3540002]
Nome=Pompeia
UF=SP
Provedor=PadraoNacional

[3540101]
Nome=Pongai
UF=SP
Provedor=PadraoNacional

[3540200]
Nome=Pontal
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://45.71.128.162:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://45.71.128.162:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3540259]
Nome=Pontalinda
UF=SP
Provedor=PadraoNacional

[3540309]
Nome=Pontes Gestal
UF=SP
Provedor=PadraoNacional

[3540408]
Nome=Populina
UF=SP
Provedor=PadraoNacional

[3540507]
Nome=Porangaba
UF=SP
Provedor=PadraoNacional

[3540606]
Nome=Porto Feliz
UF=SP
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://54.94.43.142/nfse.portal.integracao/services.svc
HomRecepcionar=http://54.94.43.142/nfse.portal.integracao.teste/services.svc

[3540705]
Nome=Porto Ferreira
UF=SP
Provedor=Ginfes
ProLinkURL=http://portoferreira.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://portoferreira.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3540754]
Nome=Potim
UF=SP
Provedor=PadraoNacional

[3540804]
Nome=Potirendaba
UF=SP
Provedor=PadraoNacional

[3540853]
Nome=Pracinha
UF=SP
Provedor=PadraoNacional

[3540903]
Nome=Pradopolis
UF=SP
Provedor=PadraoNacional

[3541000]
; Atualizado em 09/02/2022
Nome=Praia Grande
UF=SP
Provedor=ISSNet
Params=NaoDividir100:|NaoFormatarItemServico:
;
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/praiagrande/servicos.asmx

[3541059]
Nome=Pratania
UF=SP
Provedor=PadraoNacional

[3541109]
Nome=Presidente Alves
UF=SP
Provedor=PadraoNacional

[3541208]
Nome=Presidente Bernardes
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wspresidentebernardes.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wspresidentebernardes.simplissweb.com.br/nfseservice.svc

[3541307]
Nome=Presidente Epitacio
UF=SP
Provedor=PadraoNacional

[3541406]
; Atualizado em 17/08/2021
Nome=Presidente Prudente
UF=SP
Provedor=SimplISS
ProRecepcionar=http://issprudente.sp.gov.br/ws_nfse/nfseservice.svc
;
ProLinkURL=http://issprudente.sp.gov.br/ws_nfse/nfseservice.svc

[3541505]
; Atualizado em 03/05/2021
Nome=Presidente Venceslau
UF=SP
Provedor=AssessorPublico
ProRecepcionar=http://mail.presidentevenceslau.sp.gov.br:8083/issonline/servlet/anfse
HomRecepcionar=https://s1.asp.srv.br/issonline-homolog/servlet/anfse

[3541604]
Nome=Promissao
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://kaingang.comunicapromissao.com.br:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://kaingang.comunicapromissao.com.br:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3541653]
Nome=Quadra
UF=SP
Provedor=PadraoNacional

[3541703]
Nome=Quata
UF=SP
Provedor=PadraoNacional

[3541802]
Nome=Queiroz
UF=SP
Provedor=PadraoNacional

[3541901]
Nome=Queluz
UF=SP
Provedor=PadraoNacional

[3542008]
Nome=Quintana
UF=SP
Provedor=PadraoNacional

[3542107]
Nome=Rafard
UF=SP
Provedor=PadraoNacional

[3542206]
Nome=Rancharia
UF=SP
Provedor=PadraoNacional

[3542305]
Nome=Redencao da Serra
UF=SP
Provedor=PadraoNacional

[3542404]
Nome=Regente Feijo
UF=SP
Provedor=PadraoNacional

[3542503]
Nome=Reginopolis
UF=SP
Provedor=PadraoNacional

[3542602]
Nome=Registro
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://registro.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://registro.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3542701]
Nome=Restinga
UF=SP
Provedor=PadraoNacional

[3542800]
Nome=Ribeira
UF=SP
Provedor=PadraoNacional

[3542909]
Nome=Ribeirao Bonito
UF=SP
Provedor=PadraoNacional

[3543006]
Nome=Ribeirao Branco
UF=SP
Provedor=PadraoNacional

[3543105]
Nome=Ribeirao Corrente
UF=SP
Provedor=PadraoNacional

[3543204]
Nome=Ribeirao do Sul
UF=SP
Provedor=PadraoNacional

[3543238]
Nome=Ribeirao Dos Indios
UF=SP
Provedor=PadraoNacional

[3543253]
Nome=Ribeirao Grande
UF=SP
Provedor=PadraoNacional

[3543303]
Nome=Ribeirao Pires
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://ribeiraopires.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://ribeiraopires.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3543402]
; Atualizado em 25/07/2022
Nome=Ribeirao Preto
UF=SP
Provedor=ISSNet
Params=NaoDividir100:
;
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/ribeiraopreto/servicos.asmx

[3543501]
Nome=Riversul
UF=SP
Provedor=PadraoNacional

[3543600]
Nome=Rifaina
UF=SP
Provedor=PadraoNacional

[3543709]
Nome=Rincao
UF=SP
Provedor=PadraoNacional

[3543808]
Nome=Rinopolis
UF=SP
Provedor=PadraoNacional

[3543907]
Nome=Rio Claro
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://rioclaro.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://rioclaro.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3544004]
Nome=Rio das Pedras
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://riodaspedras.brgov.com.br:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://riodaspedras.brgov.com.br:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3544103]
Nome=Rio Grande da Serra
UF=SP
Provedor=PadraoNacional

[3544202]
Nome=Riolandia
UF=SP
Provedor=PadraoNacional

[3544251]
Nome=Rosana
UF=SP
Provedor=PadraoNacional

[3544301]
Nome=Roseira
UF=SP
Provedor=PadraoNacional

[3544400]
Nome=Rubiacea
UF=SP
Provedor=PadraoNacional

[3544509]
Nome=Rubineia
UF=SP
Provedor=PadraoNacional

[3544608]
Nome=Sabino
UF=SP
Provedor=PadraoNacional

[3544707]
Nome=Sagres
UF=SP
Provedor=PadraoNacional

[3544806]
Nome=Sales
UF=SP
Provedor=PadraoNacional

[3544905]
Nome=Sales Oliveira
UF=SP
Provedor=PadraoNacional

[3545001]
Nome=Salesopolis
UF=SP
Provedor=PadraoNacional

[3545100]
Nome=Salmourao
UF=SP
Provedor=PadraoNacional

[3545159]
Nome=Saltinho
UF=SP
Provedor=PadraoNacional

[3545209]
Nome=Salto
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://salto.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://salto.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3545308]
Nome=Salto de Pirapora
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://201.55.199.136:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://201.55.199.136:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3545407]
Nome=Salto Grande
UF=SP
Provedor=Pronim
ProRecepcionar=http://200.192.244.89/nfsews/services.svc
HomRecepcionar=http://200.192.244.89/nfsewsteste/services.svc

[3545506]
Nome=Sandovalina
UF=SP
Provedor=PadraoNacional

[3545605]
Nome=Santa Adelia
UF=SP
Provedor=PadraoNacional

[3545704]
Nome=Santa Albertina
UF=SP
Provedor=PadraoNacional

[3545803]
; Inclu�do em 20/09/2022
Nome=Santa Barbara D Oeste
UF=SP
Provedor=SigISSWeb
ProRecepcionar=https://wssantabarbara.sigissweb.com/

[3546009]
Nome=Santa Branca
UF=SP
Provedor=PadraoNacional

[3546108]
Nome=Santa Clara D Oeste
UF=SP
Provedor=PadraoNacional

[3546207]
Nome=Santa Cruz da Conceicao
UF=SP
Provedor=PadraoNacional

[3546256]
Nome=Santa Cruz da Esperanca
UF=SP
Provedor=PadraoNacional

[3546306]
Nome=Santa Cruz das Palmeiras
UF=SP
Provedor=Betha

[3546405]
Nome=Santa Cruz do Rio Pardo
UF=SP
Provedor=PadraoNacional

[3546504]
Nome=Santa Ernestina
UF=SP
Provedor=PadraoNacional

[3546603]
Nome=Santa Fe do Sul
UF=SP
Provedor=PadraoNacional

[3546702]
; Inclu�do em 20/09/2022
Nome=Santa Gertrudes
UF=SP
Provedor=SigISSWeb
ProRecepcionar=https://wssantagertrudes.sigissweb.com/

[3546801]
Nome=Santa Isabel
UF=SP
Provedor=PadraoNacional

[3546900]
Nome=Santa Lucia
UF=SP
Provedor=PadraoNacional

[3547007]
Nome=Santa Maria da Serra
UF=SP
Provedor=PadraoNacional

[3547106]
Nome=Santa Mercedes
UF=SP
Provedor=PadraoNacional

[3547205]
Nome=Santana da Ponte Pensa
UF=SP
Provedor=PadraoNacional

[3547304]
Nome=Santana de Parnaiba
UF=SP
Provedor=PadraoNacional

[3547403]
Nome=Santa Rita D Oeste
UF=SP
Provedor=PadraoNacional

[3547502]
Nome=Santa Rita do Passa Quatro
UF=SP
Provedor=PadraoNacional

[3547601]
Nome=Santa Rosa de Viterbo
UF=SP
Provedor=Betha

[3547650]
Nome=Santa Salete
UF=SP
Provedor=PadraoNacional

[3547700]
Nome=Santo Anastacio
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://189.124.85.57:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://189.124.85.57:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3547809]
Nome=Santo Andre
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://santoandre.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://santoandre.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3547908]
Nome=Santo Antonio da Alegria
UF=SP
Provedor=PadraoNacional

[3548005]
Nome=Santo Antonio de Posse
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://177.36.128.42:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://177.36.128.42:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3548054]
Nome=Santo Antonio do Aracangua
UF=SP
Provedor=PadraoNacional

[3548104]
Nome=Santo Antonio do Jardim
UF=SP
Provedor=PadraoNacional

[3548203]
Nome=Santo Antonio do Pinhal
UF=SP
Provedor=Betha

[3548302]
Nome=Santo Expedito
UF=SP
Provedor=PadraoNacional

[3548401]
Nome=Santopolis do Aguapei
UF=SP
Provedor=PadraoNacional

[3548500]
Nome=Santos
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://santos.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://santos.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3548609]
Nome=Sao Bento do Sapucai
UF=SP
Provedor=PadraoNacional

[3548708]
; Atualizado em 19/09/2022
Nome=Sao Bernardo do Campo
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://nfse.isssbc.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://saobernardo.ginfesh.com.br/report/consultarNota?__report=nfs_sao_bernardo_campo_novo&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3548807]
Nome=Sao Caetano do Sul
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://saocaetanodosul.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://saocaetanodosul.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3548906]
; Atualizado em 27/01/2022
Nome=Sao Carlos
UF=SP
Provedor=Giap
ProRecepcionar=http://webservice.giap.com.br/WSNfsesScarlos02/nfseresources/ws/v2/emissao
ProConsultarNFSeRps=http://webservice.giap.com.br/WSNfsesScarlos02/nfseresources/ws/consulta
ProCancelarNFSe=http://webservice.giap.com.br/WSNfsesScarlos02/nfseresources/ws/v2/cancela
;
HomRecepcionar=http://webservice.giap.com.br/WSNfsesScarlos02/nfseresources/ws/v2/emissao/simula
HomConsultarNFSeRps=http://webservice.giap.com.br/WSNfsesScarlos02/nfseresources/ws/consulta
HomCancelarNFSe=http://webservice.giap.com.br/WSNfsesScarlos02/nfseresources/ws/v2/cancela

[3549003]
Nome=Sao Francisco
UF=SP
Provedor=PadraoNacional

[3549102]
Nome=Sao Joao da Boa Vista
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wssaojoao.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wssaojoao.simplissweb.com.br/nfseservice.svc

[3549201]
Nome=Sao Joao das Duas Pontes
UF=SP
Provedor=PadraoNacional

[3549250]
Nome=Sao Joao de Iracema
UF=SP
Provedor=PadraoNacional

[3549300]
Nome=Sao Joao do Pau D Alho
UF=SP
Provedor=PadraoNacional

[3549409]
Nome=Sao Joaquim da Barra
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://187.72.128.113:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://187.72.128.113:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3549508]
Nome=Sao Jose da Bela Vista
UF=SP
Provedor=PadraoNacional

[3549607]
Nome=Sao Jose do Barreiro
UF=SP
Provedor=PadraoNacional

[3549706]
Nome=Sao Jose do Rio Pardo
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wssao_jose_rio_pardo.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wssao_jose_rio_pardo.simplissweb.com.br/nfseservice.svc

[3549805]
Nome=Sao Jose do Rio Preto
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://saojosedoriopreto.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://saojosedoriopreto.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3549904]
; Atualizado em 24/01/2022
Nome=Sao Jose dos Campos
UF=SP
Provedor=DSF
ProRecepcionar=https://notajoseense.sjc.sp.gov.br/notafiscal-ws/NotaFiscalSoap
HomRecepcionar=https://homol-notajoseense.sjc.sp.gov.br/notafiscal-ws/NotaFiscalSoap

[3549953]
Nome=Sao Lourenco da Serra
UF=SP
Provedor=PadraoNacional

[3550001]
Nome=Sao Luis do Paraitinga
UF=SP
Provedor=PadraoNacional

[3550100]
Nome=Sao Manuel
UF=SP
Provedor=PadraoNacional

[3550209]
Nome=Sao Miguel Arcanjo
UF=SP
Provedor=PadraoNacional

[3550308]
Nome=Sao Paulo
UF=SP
Provedor=ISSSaoPaulo
ProRecepcionar=https://nfe.prefeitura.sp.gov.br/ws/lotenfe.asmx
HomRecepcionar=
;
ProLinkURL=https://nfe.prefeitura.sp.gov.br/nfe.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://nfe.prefeitura.sp.gov.br/nfe.aspx?ccm=%InscMunic%&nf=%NumeroNFSe%&cod=%CodVerif%

[3550407]
Nome=Sao Pedro
UF=SP
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://186.238.54.82/nfse.portal.integracao/services.svc
HomRecepcionar=http://186.238.54.82/nfse.portal.integracao.teste/services.svc

[3550506]
Nome=Sao Pedro do Turvo
UF=SP
Provedor=PadraoNacional

[3550605]
Nome=Sao Roque
UF=SP
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/saoRoque
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/saoRoque

[3550704]
; Atualizado em 30/04/2021
Nome=Sao Sebastiao
UF=SP
Provedor=iiBrasil
Versao=2.04
ProRecepcionar=https://api.iibr.com.br/3550704/1/soap/producao/rps
HomRecepcionar=https://api.iibr.com.br/3550704/1/soap/homologacao/rps

[3550803]
Nome=Sao Sebastiao da Grama
UF=SP
Provedor=PadraoNacional

[3550902]
Nome=Sao Simao
UF=SP
Provedor=PadraoNacional

[3551009]
Nome=Sao Vicente
UF=SP
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/saovicente/servicos.asmx

[3551108]
Nome=Sarapui
UF=SP
Provedor=PadraoNacional

[3551207]
Nome=Sarutaia
UF=SP
Provedor=PadraoNacional

[3551306]
Nome=Sebastianopolis do Sul
UF=SP
Provedor=PadraoNacional

[3551405]
Nome=Serra Azul
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://189.44.176.74:8888/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://189.44.176.74:8888/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3551504]
Nome=Serrana
UF=SP
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/serrana/servicos.asmx

[3551603]
Nome=Serra Negra
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://intra.serranegra.sp.gov.br/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://intra.serranegra.sp.gov.br/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3551702]
Nome=Sertaozinho
UF=SP
Provedor=SmarAPD
Versao=2.04
ProRecepcionar=https://nfe.sertaozinho.sp.gov.br:8443/tbw/services/nfseSOAP
HomRecepcionar=https://tributacao.smarapd.com.br/tbwhomolog/services/nfseSOAP
;
ProLinkURL=http://suporte.sertaozinho.sp.gov.br:9083/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%
HomLinkURL=http://suporte.sertaozinho.sp.gov.br:9083/tbw/loginWeb.jsp?execobj=NFENotaFiscalBuscarDireto&cnpj=%Cnpj%&numero=%NumeroNFSe%&chave=%ChaveAcesso%

[3551801]
Nome=Sete Barras
UF=SP
Provedor=PadraoNacional

[3551900]
Nome=Severinia
UF=SP
Provedor=PadraoNacional

[3552007]
Nome=Silveiras
UF=SP
Provedor=PadraoNacional

[3552106]
; Inclu�do em 11/07/2022
Nome=Socorro
UF=SP
Provedor=iiBrasil
Versao=2.04
ProRecepcionar=https://socorro.iibr.com.br/api/soap/notafiscal.php
HomRecepcionar=https://socorro.iibr.com.br/api/soap/homologacao_notafiscal.php

[3552205]
; Atualizado em 01/04/2022
Nome=Sorocaba
UF=SP
Provedor=DSF
Versao=2.03
ProRecepcionar=https://notafiscal.sorocaba.sp.gov.br/notafiscal-abrasfv203-ws/NotaFiscalSoap
HomRecepcionar=https://homolsod.dsfweb.com.br/notafiscal-abrasfv203-ws/NotaFiscalSoap
;
ProLinkURL=https://notafiscal.sorocaba.sp.gov.br/notafiscal-ws/servico/notafiscal/autenticacao/cpfCnpj/%Cnpj%/inscricaoMunicipal/%InscMunic%/numeroNota/%NumeroNFSe%/codigoVerificacao/%CodVerif%	

[3552304]
Nome=Sud Mennucci
UF=SP
Provedor=PadraoNacional

[3552403]
; Inclu�do em 20/09/2022
Nome=Sumare
UF=SP
Provedor=SigISSWeb
ProRecepcionar=https://wssumare.sigissweb.com/

[3552502]
Nome=Suzano
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://suzano.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://suzano.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3552551]
Nome=Suzanapolis
UF=SP
Provedor=PadraoNacional

[3552601]
Nome=Tabapua
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=http://tabapua.sistemas4r.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=http://tabapua.sistemas4r.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=http://tabapua.sistemas4r.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=http://tabapua.sistemas4r.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=http://tabapua.sistemas4r.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=http://tabapua.sistemas4r.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=http://tabapua.sistemas4r.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=http://tabapua.sistemas4r.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://tabapua.sistemas4r.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://tabapua.sistemas4r.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3552700]
; Inclu�do em 18/06/2021
Nome=Tabatinga
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://189.20.141.242:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://189.20.141.242:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3552809]
Nome=Taboao da Serra
UF=SP
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/sp.taboaodaserra/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/sp.taboaodaserra/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/sp.taboaodaserra/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/sp.taboaodaserra/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3552908]
Nome=Taciba
UF=SP
Provedor=PadraoNacional

[3553005]
Nome=Taguai
UF=SP
Provedor=PadraoNacional

[3553104]
Nome=Taiacu
UF=SP
Provedor=PadraoNacional

[3553203]
Nome=Taiuva
UF=SP
Provedor=PadraoNacional

[3553302]
Nome=Tambau
UF=SP
Provedor=PadraoNacional

[3553401]
Nome=Tanabi
UF=SP
Provedor=PadraoNacional

[3553500]
Nome=Tapirai
UF=SP
Provedor=PadraoNacional

[3553609]
Nome=Tapiratiba
UF=SP
Provedor=PadraoNacional

[3553658]
Nome=Taquaral
UF=SP
Provedor=PadraoNacional

[3553708]
; Atualizado em 19/07/2021
Nome=Taquaritinga
UF=SP
Provedor=Conam
ProRecepcionar=https://nfe.etransparencia.com.br/sp.taquaritinga/webservice/aws_nfe.aspx
HomRecepcionar=https://nfehomologacao.etransparencia.com.br/sp.taquaritinga/webservice/aws_nfe.aspx
;
ProLinkURL=https://nfe.etransparencia.com.br/sp.taquaritinga/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%
HomLinkURL=https://nfehomologacao.etransparencia.com.br/sp.taquaritinga/nfe/stubimprimenfe.aspx?%NumeroNFSe%_%InscMunic%_%CodVerif%

[3553807]
Nome=Taquarituba
UF=SP
Provedor=PadraoNacional

[3553856]
Nome=Taquarivai
UF=SP
Provedor=PadraoNacional

[3553906]
Nome=Tarabai
UF=SP
Provedor=PadraoNacional

[3553955]
Nome=Taruma
UF=SP
Provedor=PadraoNacional

[3554003]
; Atualizado em 13/01/2022
Nome=Tatui
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=http://tatui.4rtec.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=http://tatui.4rtec.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=http://tatui.4rtec.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=http://tatui.4rtec.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=http://tatui.4rtec.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=http://tatui.4rtec.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=http://tatui.4rtec.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=http://tatui.4rtec.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://tatui.4rtec.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://tatui.4rtec.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3554102]
; Atualizado em 06/05/2022
Nome=Taubate
UF=SP
Provedor=Etherium
Versao=2.03
ProRecepcionar=https://taubateabrasf.meumunicipio.digital/servico.asmx
HomRecepcionar=https://testetaubate.meumunicipio.digital/abrasf/servico.asmx

[3554201]
Nome=Tejupa
UF=SP
Provedor=PadraoNacional

[3554300]
; Inclu�do em 10/11/2022
Nome=Teodoro Sampaio
UF=SP
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://177.92.168.36/nfse.portal.integracao/services.svc
HomRecepcionar=http://177.92.168.36/nfse.portal.integracao.teste/services.svc

[3554409]
Nome=Terra Roxa
UF=SP
Provedor=PadraoNacional

[3554508]
; Inclu�do em 16/03/2022
Nome=Tiete
UF=SP
Provedor=GeisWeb
Params=AliasCidade:tiete
;
ProRecepcionar=https://www.geisweb.net.br/producao/tiete/webservice/GeisWebServiceImpl.php

[3554607]
Nome=Timburi
UF=SP
Provedor=PadraoNacional

[3554656]
Nome=Torre de Pedra
UF=SP
Provedor=PadraoNacional

[3554706]
Nome=Torrinha
UF=SP
Provedor=PadraoNacional

[3554755]
Nome=Trabiju
UF=SP
Provedor=PadraoNacional

[3554805]
Nome=Tremembe
UF=SP
Provedor=PadraoNacional

[3554904]
Nome=Tres Fronteiras
UF=SP
Provedor=PadraoNacional

[3554953]
Nome=Tuiuti
UF=SP
Provedor=PadraoNacional

[3555000]
Nome=Tupa
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wstupa.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wstupa.simplissweb.com.br/nfseservice.svc

[3555109]
Nome=Tupi Paulista
UF=SP
Provedor=Sistemas4R
Versao=2.00
ProRecepcionar=*
ProConsultarLote=http://tupipaulista.sistemas4r.com.br/abrasf/aconsultarloterps.aspx
ProConsultarNFSeRps=http://tupipaulista.sistemas4r.com.br/abrasf/aconsultarnfseporrps.aspx
ProCancelarNFSe=http://tupipaulista.sistemas4r.com.br/abrasf/acancelarnfse.aspx
ProRecepcionarSincrono=http://tupipaulista.sistemas4r.com.br/abrasf/arecepcionarloterpssincrono.aspx
;
HomRecepcionar=*
HomConsultarLote=http://tupipaulista.sistemas4r.com.br/abrasf/ahconsultarloterps.aspx
HomConsultarNFSeRps=http://tupipaulista.sistemas4r.com.br/abrasf/ahconsultarnfseporrps.aspx
HomCancelarNFSe=http://tupipaulista.sistemas4r.com.br/abrasf/ahcancelarnfse.aspx
HomRecepcionarSincrono=http://tupipaulista.sistemas4r.com.br/abrasf/ahrecepcionarloterpssincrono.aspx
;
ProLinkURL=https://tupipaulista.sistemas4r.com.br/CS/Em_Impressao_Nfe.aspx?id=%CodVerif%
HomLinkURL=https://tupipaulista.sistemas4r.com.br/CS/Em_Impressao_NfeHomologa.aspx?id=%CodVerif%

[3555208]
Nome=Turiuba
UF=SP
Provedor=PadraoNacional

[3555307]
Nome=Turmalina
UF=SP
Provedor=PadraoNacional

[3555356]
Nome=Ubarana
UF=SP
Provedor=PadraoNacional

[3555406]
Nome=Ubatuba
UF=SP
Provedor=Ginfes
;
ProLinkURL=http://ubatuba.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://ubatuba.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[3555505]
Nome=Ubirajara
UF=SP
Provedor=PadraoNacional

[3555604]
Nome=Uchoa
UF=SP
Provedor=PadraoNacional

[3555703]
Nome=Uniao Paulista
UF=SP
Provedor=PadraoNacional

[3555802]
Nome=Urania
UF=SP
Provedor=PadraoNacional

[3555901]
Nome=Uru
UF=SP
Provedor=PadraoNacional

[3556008]
Nome=Urupes
UF=SP
Provedor=PadraoNacional

[3556107]
Nome=Valentim Gentil
UF=SP
Provedor=PadraoNacional

[3556206]
; Inclu�do em 20/09/2022
Nome=Valinhos
UF=SP
Provedor=SigISSWeb
ProRecepcionar=https://wsvalinhos.sigissweb.com/

[3556305]
Nome=Valparaiso
UF=SP
Provedor=PadraoNacional

[3556354]
Nome=Vargem
UF=SP
Provedor=PadraoNacional

[3556404]
Nome=Vargem Grande do Sul
UF=SP
Provedor=SimplISS
ProRecepcionar=http://wsvargemgrandedosul.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsvargemgrandedosul.simplissweb.com.br/nfseservice.svc

[3556453]
Nome=Vargem Grande Paulista
UF=SP
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/vgp
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/vgp

[3556503]
Nome=Varzea Paulista
UF=SP
Provedor=GovDigital
Versao=2.00
ProRecepcionar=https://ws.nfe-cidades.com.br/ws/varzea
HomRecepcionar=https://ws.homolog.nfe-cidades.com.br/ws/varzea

[3556602]
Nome=Vera Cruz
UF=SP
Provedor=PadraoNacional

[3556701]
Nome=Vinhedo
UF=SP
Provedor=PadraoNacional

[3556800]
; Inclu�do em 16/02/2022
Nome=Viradouro
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://191.5.98.25:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://191.5.98.25:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3556909]
; Atualizado em 04/06/2021
Nome=Vista Alegre do Alto
UF=SP
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://nfse.pmvistaalegredoalto.com.br:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://nfse.pmvistaalegredoalto.com.br:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[3556958]
Nome=Vitoria Brasil
UF=SP
Provedor=PadraoNacional

[3557006]
; Inclu�do em 14/04/2022
Nome=Votorantim
UF=SP
Provedor=AssessorPublico
ProRecepcionar=http://sql.sefvotorantim.sp.gov.br:8080/issonline/servlet/anfse
HomRecepcionar=http://sql.sefvotorantim.sp.gov.br:8080/issonline_teste/servlet/anfse

[3557105]
; Atualizado em 18/09/2021
Nome=Votuporanga
UF=SP
Provedor=RLZ
ProRecepcionar=https://web.votuporanga.sp.gov.br/amfphp/services/RLZ/webservice/server.php
HomRecepcionar=http://votuporanga.prefeitura.rlz.com.br/webservices/nfse/server.php

[3557154]
Nome=Zacarias
UF=SP
Provedor=PadraoNacional

[3557204]
Nome=Chavantes
UF=SP
Provedor=PadraoNacional

[3557303]
Nome=Estiva Gerbi
UF=SP
Provedor=PadraoNacional

[4100103]
Nome=Abatia
UF=PR
Provedor=PadraoNacional

[4100202]
Nome=Adrianopolis
UF=PR
Provedor=Betha

[4100301]
Nome=Agudos do Sul
UF=PR
Provedor=Betha

[4100400]
Nome=Almirante Tamandare
UF=PR
Provedor=Betha

[4100459]
Nome=Altamira do Parana
UF=PR
Provedor=PadraoNacional

[4100509]
Nome=Altonia
UF=PR
Provedor=Pronim
ProRecepcionar=http://201.87.233.17:5620/NFSEWS/Services.svc
HomRecepcionar=http://201.87.233.17:5620/nfsewsteste/Services.svc

[4100608]
Nome=Alto Parana
UF=PR
Provedor=Betha

[4100707]
Nome=Alto Piquiri
UF=PR
Provedor=PadraoNacional

[4100806]
Nome=Alvorada do Sul
UF=PR
Provedor=PadraoNacional

[4100905]
Nome=Amapora
UF=PR
Provedor=PadraoNacional

[4101002]
Nome=Ampere
UF=PR
Provedor=Betha

[4101051]
Nome=Anahy
UF=PR
Provedor=PadraoNacional

[4101101]
Nome=Andira
UF=PR
Provedor=PadraoNacional

[4101150]
Nome=Angulo
UF=PR
Provedor=PadraoNacional

[4101200]
Nome=Antonina
UF=PR
Provedor=PadraoNacional

[4101309]
Nome=Antonio Olinto
UF=PR
Provedor=PadraoNacional

[4101408]
; Atualizado em 19/04/2022
Nome=Apucarana
UF=PR
Provedor=IPM
Versao=1.01
ProRecepcionar=https://apucarana.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes

[4101507]
Nome=Arapongas
UF=PR
Provedor=IPM

[4101606]
Nome=Arapoti
UF=PR
Provedor=PadraoNacional

[4101655]
Nome=Arapua
UF=PR
Provedor=PadraoNacional

[4101705]
Nome=Araruna
UF=PR
Provedor=PadraoNacional

[4101804]
Nome=Araucaria
UF=PR
Provedor=IPM

[4101853]
Nome=Ariranha do Ivai
UF=PR
Provedor=PadraoNacional

[4101903]
Nome=Assai
UF=PR
Provedor=Betha

[4102000]
Nome=Assis Chateaubriand
UF=PR
Provedor=Pronim
ProRecepcionar=http://177.38.165.34:8184/nfsews/Services.svc
HomRecepcionar=http://177.38.165.34:8184/nfsewsteste/Services.svc

[4102109]
Nome=Astorga
UF=PR
Provedor=SimplISS
ProRecepcionar=http://wsastorga.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsastorga.simplissweb.com.br/nfseservice.svc

[4102208]
Nome=Atalaia
UF=PR
Provedor=PadraoNacional

[4102307]
Nome=Balsa Nova
UF=PR
Provedor=Equiplano
Params=CodigoCidade:23

[4102406]
; Inclu�do em 27/12/2021
Nome=Bandeirantes
UF=PR
Provedor=SimplISS
ProRecepcionar=http://wsbandeirantes.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsbandeirantes.simplissweb.com.br/nfseservice.svc

[4102505]
Nome=Barbosa Ferraz
UF=PR
Provedor=PadraoNacional

[4102604]
Nome=Barracao
UF=PR
Provedor=Betha

[4102703]
Nome=Barra do Jacare
UF=PR
Provedor=PadraoNacional

[4102752]
Nome=Bela Vista da Caroba
UF=PR
Provedor=Betha

[4102802]
Nome=Bela Vista do Paraiso
UF=PR
Provedor=PadraoNacional

[4102901]
Nome=Bituruna
UF=PR
Provedor=Betha

[4103008]
Nome=Boa Esperanca
UF=PR
Provedor=PadraoNacional

[4103024]
Nome=Boa Esperanca do Iguacu
UF=PR
Provedor=PadraoNacional

[4103040]
Nome=Boa Ventura de Sao Roque
UF=PR
Provedor=PadraoNacional

[4103057]
Nome=Boa Vista da Aparecida
UF=PR
Provedor=PadraoNacional

[4103107]
Nome=Bocaiuva do Sul
UF=PR
Provedor=GovBR 
ProRecepcionar=http://18.230.172.116/nfsews/services.svc
HomRecepcionar=http://18.230.172.116/nfsewsteste/services.svc

[4103156]
Nome=Bom Jesus do Sul
UF=PR
Provedor=Betha

[4103206]
Nome=Bom Sucesso
UF=PR
Provedor=PadraoNacional

[4103222]
Nome=Bom Sucesso do Sul
UF=PR
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://nfse.bomsucessodosul.pr.gov.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://nfse.bomsucessodosul.pr.gov.br/nfse.portal.integracao.teste/services.svc

[4103305]
Nome=Borrazopolis
UF=PR
Provedor=PadraoNacional

[4103354]
Nome=Braganey
UF=PR
Provedor=PadraoNacional

[4103370]
Nome=Brasilandia do Sul
UF=PR
Provedor=PadraoNacional

[4103404]
Nome=Cafeara
UF=PR
Provedor=PadraoNacional

[4103453]
Nome=Cafelandia
UF=PR
Provedor=PadraoNacional

[4103479]
Nome=Cafezal do Sul
UF=PR
Provedor=PadraoNacional

[4103503]
Nome=California
UF=PR
Provedor=PadraoNacional

[4103602]
Nome=Cambara
UF=PR
Provedor=PadraoNacional

[4103701]
; Inclu�do em 21/03/2022
Nome=Cambe
UF=PR
Provedor=ISSCambe
;
ProRecepcionar=https://nfse.cambe.pr.gov.br:8443/enfe-ws/schemas/schema-ws-service.wsdl

[4103800]
Nome=Cambira
UF=PR
Provedor=PadraoNacional

[4103909]
Nome=Campina da Lagoa
UF=PR
Provedor=PadraoNacional

[4103958]
Nome=Campina do Simao
UF=PR
Provedor=PadraoNacional

[4104006]
Nome=Campina Grande do Sul
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://campinagrandedosul.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://campinagrandedosul.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4104055]
Nome=Campo Bonito
UF=PR
Provedor=PadraoNacional

[4104105]
Nome=Campo do Tenente
UF=PR
Provedor=PadraoNacional

[4104204]
Nome=Campo Largo
UF=PR
Provedor=IPM

[4104253]
Nome=Campo Magro
UF=PR
Provedor=Betha

[4104303]
; Inclu�do em 17/01/2022
Nome=Campo Mourao
UF=PR
Provedor=IPM
Versao=1.01
ProRecepcionar=https://campomourao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4104402]
Nome=Candido de Abreu
UF=PR
Provedor=PadraoNacional

[4104428]
Nome=Candoi
UF=PR
Provedor=PadraoNacional

[4104451]
Nome=Cantagalo
UF=PR
Provedor=Equiplano
Params=CodigoCidade:51

[4104501]
Nome=Capanema
UF=PR
Provedor=Equiplano
Params=CodigoCidade:50

[4104600]
; Inclu�do em 27/12/2021
Nome=Capitao Leonidas Marques
UF=PR
Provedor=Betha
Versao=2.02
ProRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-ws/nfseWS
HomRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-test-ws/nfseWS

[4104659]
Nome=Carambei
UF=PR
Provedor=Equiplano
Params=CodigoCidade:141

[4104709]
Nome=Carlopolis
UF=PR
Provedor=PadraoNacional

[4104808]
; Atualizado em 19/10/2021
Nome=Cascavel
UF=PR
Provedor=IPM
Versao=1.01
Params=NaoGerarGrupoRps
;
ProRecepcionar=https://cascavel.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4104907]
; Inclu�do em 08/03/2022
; Atualizado em 17/08/2022
Nome=Castro
UF=PR
Provedor=IPM
Versao=1.01
Params=NaoGerarGrupoRps
ProRecepcionar=https://ws-castro.atende.net:7443/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://treinamento.atende.net/atende.php?pg=services&service=WNENotaFiscalEletronicaNFe&cidade=treina_castro

[4105003]
; Inclu�do em 08/09/2022
Nome=Catanduvas
UF=PR
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://18.229.97.72/NFSe.Portal.Integracao/Services.svc

[4105102]
Nome=Centenario do Sul
UF=PR
Provedor=PadraoNacional

[4105201]
Nome=Cerro Azul
UF=PR
Provedor=Betha

[4105300]
; Inclu�do em 27/12/2021
Nome=Ceu Azul
UF=PR
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://portal.ceuazul.pr.gov.br/nfse.portal.integracao/Services.svc
HomRecepcionar=http://portal.ceuazul.pr.gov.br/nfse.portal.integracao.teste/Services.svc

[4105409]
Nome=Chopinzinho
UF=PR
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://int.chopinzinho.pr.gov.br:38181/nfse.portal.integracao/services.svc
HomRecepcionar=http://int.chopinzinho.pr.gov.br:38181/nfse.portal.integracao.teste/services.svc

[4105508]
; Inclu�do em 19/07/2022
Nome=Cianorte
UF=PR
Provedor=SigISS
ProRecepcionar=https://cianorte.sigiss.com.br/cianorte/ws/sigiss_ws.php
HomRecepcionar=https://testecianorte.sigiss.com.br/testecianorte/ws/sigiss_ws.php
;
ProSoapAction=urn:sigiss_ws

[4105607]
Nome=Cidade Gaucha
UF=PR
Provedor=PadraoNacional

[4105706]
Nome=Clevelandia
UF=PR
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://186.250.93.210/nfse.portal.integracao/services.svc
HomRecepcionar=http://186.250.93.210/nfse.portal.integracao.teste/services.svc

[4105805]
Nome=Colombo
UF=PR
Provedor=IPM
Params=Assinar:AssRpsGerarNFSe

[4105904]
Nome=Colorado
UF=PR
Provedor=Betha

[4106001]
Nome=Congonhinhas
UF=PR
Provedor=PadraoNacional

[4106100]
Nome=Conselheiro Mairinck
UF=PR
Provedor=PadraoNacional

[4106209]
; Inclu�do em 15/02/2022
Nome=Contenda
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://contenda.oxy.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://contenda.oxy.elotech.com.br/iss-ws/nfse203.wsdl

[4106308]
; Inclu�do em 10/06/2022
; Atualizado em 23/12/2022
Nome=Corbelia
UF=PR
Provedor=IPM
Versao=1.01
ProRecepcionar=https://corbelia.atende.net/?pg=rest&service=WNERestServiceNFSe
HomRecepcionar=

[4106407]
Nome=Cornelio Procopio
UF=PR
Provedor=Betha

[4106456]
Nome=Coronel Domingos Soares
UF=PR
Provedor=PadraoNacional

[4106506]
; Atualizado em 01/06/2022
Nome=Coronel Vivida
UF=PR
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://coronelvivida.govbr.cloud/nfse.portal.integracao/services.svc
HomRecepcionar=http://coronelvivida.govbr.cloud/nfse.portal.integracao.teste/services.svc

[4106555]
Nome=Corumbatai do Sul
UF=PR
Provedor=PadraoNacional

[4106571]
Nome=Cruzeiro do Iguacu
UF=PR
Provedor=PadraoNacional

[4106605]
; Inclu�do em 30/01/2022
Nome=Cruzeiro do Oeste
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://cruzeirodooeste.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://cruzeirodooeste.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4106704]
Nome=Cruzeiro do Sul
UF=PR
Provedor=PadraoNacional

[4106803]
Nome=Cruz Machado
UF=PR
Provedor=Betha

[4106852]
Nome=Cruzmaltina
UF=PR
Provedor=PadraoNacional

[4106902]
; Atualizado em 09/02/2022
Nome=Curitiba
UF=PR
Provedor=ISSCuritiba
ProRecepcionar=https://srv2-isscuritiba.curitiba.pr.gov.br/Iss.NfseWebService/Nfsews.asmx
HomRecepcionar=https://piloto-iss.curitiba.pr.gov.br/nfse_ws/NfseWs.asmx
;
ProLinkURL=https://srv2-isscuritiba.curitiba.pr.gov.br/portalnfse/Default.aspx?doc=%Cnpj%&num=%NumeroNFSe%&cod=%CodVerif%
HomLinkURL=https://piloto-iss.curitiba.pr.gov.br/portalnfse/Default.aspx?doc=%Cnpj%&num=%NumeroNFSe%&cod=%CodVerif%

[4107009]
Nome=Curiuva
UF=PR
Provedor=PadraoNacional

[4107108]
Nome=Diamante do Norte
UF=PR
Provedor=PadraoNacional

[4107124]
Nome=Diamante do Sul
UF=PR
Provedor=PadraoNacional

[4107157]
Nome=Diamante D Oeste
UF=PR
Provedor=PadraoNacional

[4107207]
Nome=Dois Vizinhos
UF=PR
Provedor=Equiplano
Params=CodigoCidade:68

[4107256]
; Inclu�do em 30/01/2022
Nome=Douradina
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://douradina.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://douradina.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4107306]
Nome=Doutor Camargo
UF=PR
Provedor=PadraoNacional

[4107405]
Nome=Eneas Marques
UF=PR
Provedor=PadraoNacional

[4107504]
Nome=Engenheiro Beltrao
UF=PR
Provedor=Betha

[4107520]
Nome=Esperanca Nova
UF=PR
Provedor=PadraoNacional

[4107538]
Nome=Entre Rios do Oeste
UF=PR
Provedor=PadraoNacional

[4107546]
Nome=Espigao Alto do Iguacu
UF=PR
Provedor=PadraoNacional

[4107553]
Nome=Farol
UF=PR
Provedor=PadraoNacional

[4107603]
Nome=Faxinal
UF=PR
Provedor=PadraoNacional

[4107652]
Nome=Fazenda Rio Grande
UF=PR
Provedor=Betha

[4107702]
Nome=Fenix
UF=PR
Provedor=PadraoNacional

[4107736]
Nome=Fernandes Pinheiro
UF=PR
Provedor=Equiplano
Params=CodigoCidade:140

[4107751]
Nome=Figueira
UF=PR
Provedor=Betha

[4107801]
Nome=Florai
UF=PR
Provedor=PadraoNacional

[4107850]
Nome=Flor da Serra do Sul
UF=PR
Provedor=Betha

[4107900]
Nome=Floresta
UF=PR
Provedor=PadraoNacional

[4108007]
Nome=Florestopolis
UF=PR
Provedor=PadraoNacional

[4108106]
Nome=Florida
UF=PR
Provedor=PadraoNacional

[4108205]
; Inclu�do em 04/01/2023
Nome=Formosa do Oeste
UF=PR
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://formosadoeste.govbr.cloud/nfse.portal.integracao/services.svc
HomRecepcionar=

[4108304]
Nome=Foz do Iguacu
UF=PR
Provedor=Lexsom
ProRecepcionar=http://nfse.pmfi.pr.gov.br/nfsews/nfse.asmx
HomRecepcionar=http://homologa.nfse.pmfi.pr.gov.br/nfsews/nfse.asmx

[4108320]
; Incluido em 26/12/2022
Nome=Francisco Alves
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://franciscoalves.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://franciscoalves.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4108403]
Nome=Francisco Beltrao
UF=PR
Provedor=Equiplano
Params=CodigoCidade:35

[4108452]
Nome=Foz do Jordao
UF=PR
Provedor=PadraoNacional

[4108502]
Nome=General Carneiro
UF=PR
Provedor=Betha

[4108551]
Nome=Godoy Moreira
UF=PR
Provedor=PadraoNacional

[4108601]
Nome=Goioere
UF=PR
Provedor=Betha

[4108650]
Nome=Goioxim
UF=PR
Provedor=PadraoNacional

[4108700]
Nome=Grandes Rios
UF=PR
Provedor=PadraoNacional

[4108809]
; Inclu�do em 30/01/2022
Nome=Guaira
UF=PR
Provedor=IPM

[4108908]
Nome=Guairaca
UF=PR
Provedor=PadraoNacional

[4108957]
Nome=Guamiranga
UF=PR
Provedor=PadraoNacional

[4109005]
Nome=Guapirama
UF=PR
Provedor=PadraoNacional

[4109104]
Nome=Guaporema
UF=PR
Provedor=PadraoNacional

[4109203]
Nome=Guaraci
UF=PR
Provedor=PadraoNacional

[4109302]
Nome=Guaraniacu
UF=PR
Provedor=PadraoNacional

[4109401]
; Atualizado em 31/08/2021
Nome=Guarapuava
UF=PR
Provedor=IPM
Versao=1.01
ProRecepcionar=https://guarapuava.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://migracao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=treina_guarapuava_integracao

[4109500]
Nome=Guaraquecaba
UF=PR
Provedor=Betha

[4109609]
Nome=Guaratuba
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://guaratuba.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://guaratuba.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4109658]
Nome=Honorio Serpa
UF=PR
Provedor=PadraoNacional

[4109708]
Nome=Ibaiti
UF=PR
Provedor=PadraoNacional

[4109757]
Nome=Ibema
UF=PR
Provedor=PadraoNacional

[4109807]
; Atualizado em 18/02/2022
Nome=Ibipora
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://ibipora.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://ibipora.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4109906]
Nome=Icaraima
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://icaraima.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://icaraima.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4110003]
Nome=Iguaracu
UF=PR
Provedor=PadraoNacional

[4110052]
Nome=Iguatu
UF=PR
Provedor=PadraoNacional

[4110078]
Nome=Imbau
UF=PR
Provedor=PadraoNacional

[4110102]
Nome=Imbituva
UF=PR
Provedor=PadraoNacional

[4110201]
; Inclu�do em 15/07/2022
Nome=Inacio Martins
UF=PR
Provedor=Equiplano
Params=CodigoCidade:88

[4110300]
Nome=Inaja
UF=PR
Provedor=PadraoNacional

[4110409]
Nome=Indianopolis
UF=PR
Provedor=PadraoNacional

[4110508]
Nome=Ipiranga
UF=PR
Provedor=PadraoNacional

[4110607]
; Inclu�do em 03/08/2022
Nome=Ipora
UF=PR
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://52.67.200.118/nfse.portal.integracao/services.svc
HomRecepcionar=http://52.67.200.118/nfse.portal.teste/services.svc

[4110656]
Nome=Iracema do Oeste
UF=PR
Provedor=Betha

[4110706]
Nome=Irati
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://irati.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://irati.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4110805]
Nome=Iretama
UF=PR
Provedor=PadraoNacional

[4110904]
Nome=Itaguaje
UF=PR
Provedor=PadraoNacional

[4110953]
Nome=Itaipulandia
UF=PR
Provedor=PadraoNacional

[4111001]
Nome=Itambaraca
UF=PR
Provedor=PadraoNacional

[4111100]
Nome=Itambe
UF=PR
Provedor=PadraoNacional

[4111209]
Nome=Itapejara D Oeste
UF=PR
Provedor=PadraoNacional

[4111258]
Nome=Itaperucu
UF=PR
Provedor=PadraoNacional

[4111308]
Nome=Itauna do Sul
UF=PR
Provedor=PadraoNacional

[4111407]
Nome=Ivai
UF=PR
Provedor=PadraoNacional

[4111506]
Nome=Ivaipora
UF=PR
Provedor=PadraoNacional

[4111555]
; Inclu�do em 30/01/2022
Nome=Ivate
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://ivate.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://ivate.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4111605]
Nome=Ivatuba
UF=PR
Provedor=PadraoNacional

[4111704]
Nome=Jaboti
UF=PR
Provedor=PadraoNacional

[4111803]
Nome=Jacarezinho
UF=PR
Provedor=PadraoNacional

[4111902]
Nome=Jaguapita
UF=PR
Provedor=PadraoNacional

[4112009]
Nome=Jaguariaiva
UF=PR
Provedor=Betha

[4112108]
Nome=Jandaia do Sul
UF=PR
Provedor=Pronim
ProRecepcionar=http://187.109.161.3:8082/nfseWS/Services.svc
HomRecepcionar=http://187.109.161.3:8082/nfseWSTESTE/Services.svc

[4112207]
Nome=Janiopolis
UF=PR
Provedor=PadraoNacional

[4112306]
Nome=Japira
UF=PR
Provedor=PadraoNacional

[4112405]
Nome=Japura
UF=PR
Provedor=PadraoNacional

[4112504]
; Inclu�do em 14/05/2021
Nome=Jardim Alegre
UF=PR
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://18.229.179.240/nfse.portal.integracao/services.svc
HomRecepcionar=http://18.229.179.240/nfse.portal.integracao.teste/services.svc

[4112603]
Nome=Jardim Olinda
UF=PR
Provedor=PadraoNacional

[4112702]
Nome=Jataizinho
UF=PR
Provedor=PadraoNacional

[4112751]
Nome=Jesuitas
UF=PR
Provedor=PadraoNacional

[4112801]
Nome=Joaquim Tavora
UF=PR
Provedor=PadraoNacional

[4112900]
Nome=Jundiai do Sul
UF=PR
Provedor=PadraoNacional

[4112959]
Nome=Juranda
UF=PR
Provedor=Betha

[4113007]
Nome=Jussara
UF=PR
Provedor=PadraoNacional

[4113106]
Nome=Kalore
UF=PR
Provedor=PadraoNacional

[4113205]
Nome=Lapa
UF=PR
Provedor=IPM

[4113254]
Nome=Laranjal
UF=PR
Provedor=PadraoNacional

[4113304]
Nome=Laranjeiras do Sul
UF=PR
Provedor=Equiplano
Params=CodigoCidade:53

[4113403]
Nome=Leopolis
UF=PR
Provedor=PadraoNacional

[4113429]
Nome=Lidianopolis
UF=PR
Provedor=PadraoNacional

[4113452]
Nome=Lindoeste
UF=PR
Provedor=Betha

[4113502]
Nome=Loanda
UF=PR
Provedor=PadraoNacional

[4113601]
Nome=Lobato
UF=PR
Provedor=Betha

[4113700]
; Inclu�do em 21/06/2021
; Atualizado em 29/11/2021
Nome=Londrina
UF=PR
Provedor=SigISS
Versao=1.03
ProRecepcionar=https://iss.londrina.pr.gov.br/ws/v1_03/sigiss_ws.php
HomRecepcionar=http://testeiss.londrina.pr.gov.br/ws/v1_03/sigiss_ws.php
;
ProSoapAction=http://iss.londrina.pr.gov.br/ws/v1_03

[4113734]
Nome=Luiziana
UF=PR
Provedor=PadraoNacional

[4113759]
Nome=Lunardelli
UF=PR
Provedor=PadraoNacional

[4113809]
Nome=Lupionopolis
UF=PR
Provedor=PadraoNacional

[4113908]
Nome=Mallet
UF=PR
Provedor=Betha

[4114005]
Nome=Mambore
UF=PR
Provedor=PadraoNacional

[4114104]
Nome=Mandaguacu
UF=PR
Provedor=Betha

[4114203]
Nome=Mandaguari
UF=PR
Provedor=PadraoNacional

[4114302]
Nome=Mandirituba
UF=PR
Provedor=Betha

[4114351]
Nome=Manfrinopolis
UF=PR
Provedor=PadraoNacional

[4114401]
Nome=Mangueirinha
UF=PR
Provedor=Betha

[4114500]
Nome=Manoel Ribas
UF=PR
Provedor=PadraoNacional

[4114609]
; Atualizado em 06/05/2022
Nome=Marechal Candido Rondon
UF=PR
Provedor=IPM

[4114708]
Nome=Maria Helena
UF=PR
Provedor=PadraoNacional

[4114807]
; Inclu�do em 29/06/2022
Nome=Marialva
UF=PR
Provedor=Elotech
Versao=2.03
ProRecepcionar=https://marialva.oxy.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://marialva.oxy.elotech.com.br/iss-ws/nfse203.wsdl

[4114906]
Nome=Marilandia do Sul
UF=PR
Provedor=PadraoNacional

[4115002]
Nome=Marilena
UF=PR
Provedor=PadraoNacional

[4115101]
; Inclu�do em 30/01/2022
Nome=Mariluz
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://mariluz.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://mariluz.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4115200]
; Atualizado em 06/12/2022
Nome=Maringa
UF=PR
Provedor=ISSe
Versao=2.01
ProRecepcionar=https://nfse-ws.ecity.maringa.pr.gov.br/MaringaNfse.asmx
HomRecepcionar=https://nfse-ws.hom-ecity.maringa.pr.gov.br/MaringaNfse.asmx
;
ProSoapAction=https://nfse-ws.ecity.maringa.pr.gov.br/v2.01
HomSoapAction=https://nfse-ws.hom-ecity.maringa.pr.gov.br/v2.01
;
ProLinkURL=https://maringa.fintel.com.br/ImprimirNfse/%NumeroNFSe%/%Cnpj%/%CodVerif%	

[4115309]
Nome=Mariopolis
UF=PR
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://177.44.223.242/nfse.portal.integracao/services.svc
HomRecepcionar=http://177.44.223.242/nfse.portal.integracao.teste/services.svc

[4115358]
Nome=Maripa
UF=PR
Provedor=PadraoNacional

[4115408]
; Inclu�do em 02/06/2022
Nome=Marmeleiro
UF=PR
Provedor=IPM
Versao=1.01
Params=GerarTag:codigo_atividade
;
ProRecepcionar=https://ws-marmeleiro.atende.net:7443/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://ws-marmeleiro.atende.net:7443/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao

[4115457]
Nome=Marquinho
UF=PR
Provedor=PadraoNacional

[4115507]
Nome=Marumbi
UF=PR
Provedor=PadraoNacional

[4115606]
Nome=Matelandia
UF=PR
Provedor=PadraoNacional

[4115705]
Nome=Matinhos
UF=PR
Provedor=PadraoNacional

[4115739]
Nome=Mato Rico
UF=PR
Provedor=PadraoNacional

[4115754]
Nome=Maua da Serra
UF=PR
Provedor=PadraoNacional

[4115804]
; Inclu�do em 27/12/2021
; Atualizado em 21/01/2022
Nome=Medianeira
UF=PR
Provedor=Pronim
ProRecepcionar=http://nfse2.medianeira.pr.gov.br/nfse.portal.integracao/Services.svc
HomRecepcionar=http://nfse2.medianeira.pr.gov.br/nfse.portal.integracao.teste/Services.svc

[4115853]
Nome=Mercedes
UF=PR
Provedor=PadraoNacional

[4115903]
Nome=Mirador
UF=PR
Provedor=PadraoNacional

[4116000]
Nome=Miraselva
UF=PR
Provedor=PadraoNacional

[4116059]
Nome=Missal
UF=PR
Provedor=PadraoNacional

[4116109]
Nome=Moreira Sales
UF=PR
Provedor=PadraoNacional

[4116208]
Nome=Morretes
UF=PR
Provedor=PadraoNacional

[4116307]
Nome=Munhoz de Melo
UF=PR
Provedor=Betha

[4116406]
Nome=Nossa Senhora das Gracas
UF=PR
Provedor=PadraoNacional

[4116505]
Nome=Nova Alianca do Ivai
UF=PR
Provedor=PadraoNacional

[4116604]
Nome=Nova America da Colina
UF=PR
Provedor=PadraoNacional

[4116703]
Nome=Nova Aurora
UF=PR
Provedor=Betha

[4116802]
Nome=Nova Cantu
UF=PR
Provedor=PadraoNacional

[4116901]
Nome=Nova Esperanca
UF=PR
Provedor=PadraoNacional

[4116950]
Nome=Nova Esperanca do Sudoeste
UF=PR
Provedor=PadraoNacional

[4117008]
Nome=Nova Fatima
UF=PR
Provedor=PadraoNacional

[4117057]
Nome=Nova Laranjeiras
UF=PR
Provedor=PadraoNacional

[4117107]
Nome=Nova Londrina
UF=PR
Provedor=PadraoNacional

[4117206]
Nome=Nova Olimpia
UF=PR
Provedor=PadraoNacional

[4117214]
Nome=Nova Santa Barbara
UF=PR
Provedor=PadraoNacional

[4117222]
Nome=Nova Santa Rosa
UF=PR
Provedor=PadraoNacional

[4117255]
Nome=Nova Prata do Iguacu
UF=PR
Provedor=PadraoNacional

[4117271]
Nome=Nova Tebas
UF=PR
Provedor=PadraoNacional

[4117297]
Nome=Novo Itacolomi
UF=PR
Provedor=PadraoNacional

[4117305]
Nome=Ortigueira
UF=PR
Provedor=Betha

[4117404]
Nome=Ourizona
UF=PR
Provedor=Betha

[4117453]
Nome=Ouro Verde do Oeste
UF=PR
Provedor=PadraoNacional

[4117503]
; Atualizado em 26/01/2022
Nome=Paicandu
UF=PR
Provedor=AssessorPublico
ProRecepcionar=http://177.220.141.2:8280/issonline_/servlet/anfse
HomRecepcionar=http://177.220.141.2:8280/issonline_homolog/servlet/anfse

[4117602]
Nome=Palmas
UF=PR
Provedor=Betha

[4117701]
; Inclu�do em 15/02/2022
Nome=Palmeira
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://palmeira.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://palmeira.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4117800]
Nome=Palmital
UF=PR
Provedor=PadraoNacional

[4117909]
Nome=Palotina
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://palotina.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://palotina.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4118006]
Nome=Paraiso do Norte
UF=PR
Provedor=PadraoNacional

[4118105]
Nome=Paranacity
UF=PR
Provedor=PadraoNacional

[4118204]
Nome=Paranagua
UF=PR
Provedor=IPM

[4118303]
Nome=Paranapoema
UF=PR
Provedor=PadraoNacional

[4118402]
; Atualizado em 08/11/2022
Nome=Paranavai
UF=PR
Provedor=IPM
Versao=1.01
Params=Assinar:AssRpsGerarNFSe
ProRecepcionar=https://paranavai.atende.net/?pg=rest&service=WNERestServiceNFSe
HomRecepcionar=https://paranavai.atende.net/?pg=rest&service=WNERestServiceNFSe

[4118451]
Nome=Pato Bragado
UF=PR
Provedor=PadraoNacional

[4118501]
Nome=Pato Branco
UF=PR
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://nfse2.patobranco.pr.gov.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://nfse2.patobranco.pr.gov.br/nfse.portal.integracao.teste/services.svc

[4118600]
Nome=Paula Freitas
UF=PR
Provedor=Betha

[4118709]
Nome=Paulo Frontin
UF=PR
Provedor=PadraoNacional

[4118808]
Nome=Peabiru
UF=PR
Provedor=PadraoNacional

[4118857]
Nome=Perobal
UF=PR
Provedor=PadraoNacional

[4118907]
Nome=Perola
UF=PR
Provedor=PadraoNacional

[4119004]
Nome=Perola D Oeste
UF=PR
Provedor=Betha

[4119103]
Nome=Pien
UF=PR
Provedor=PadraoNacional

[4119152]
; Atualizado em 29/11/2021
Nome=Pinhais
UF=PR
Provedor=IPM
Versao=1.01
ProRecepcionar=https://ws-pinhais.atende.net:7443/atende.php?pg=rest&service=WNERestServiceNFSe
HomRecepcionar=https://treinamento.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=migra_pinhais

[4119202]
Nome=Pinhalao
UF=PR
Provedor=PadraoNacional

[4119251]
Nome=Pinhal de Sao Bento
UF=PR
Provedor=PadraoNacional

[4119301]
Nome=Pinhao
UF=PR
Provedor=PadraoNacional

[4119400]
Nome=Pirai do Sul
UF=PR
Provedor=PadraoNacional

[4119509]
Nome=Piraquara
UF=PR
Provedor=PadraoNacional

[4119608]
Nome=Pitanga
UF=PR
Provedor=PadraoNacional

[4119657]
Nome=Pitangueiras
UF=PR
Provedor=PadraoNacional

[4119707]
Nome=Planaltina do Parana
UF=PR
Provedor=PadraoNacional

[4119806]
Nome=Planalto
UF=PR
Provedor=PadraoNacional

[4119905]
Nome=Ponta Grossa
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://pontagrossa.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://pontagrossa.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4119954]
Nome=Pontal do Parana
UF=PR
Provedor=PadraoNacional

[4120002]
Nome=Porecatu
UF=PR
Provedor=SimplISS
ProRecepcionar=http://wsporecatu.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wsporecatu.com.br/nfseservice.svc

[4120101]
Nome=Porto Amazonas
UF=PR
Provedor=PadraoNacional

[4120150]
Nome=Porto Barreiro
UF=PR
Provedor=PadraoNacional

[4120200]
Nome=Porto Rico
UF=PR
Provedor=PadraoNacional

[4120309]
Nome=Porto Vitoria
UF=PR
Provedor=PadraoNacional

[4120333]
Nome=Prado Ferreira
UF=PR
Provedor=PadraoNacional

[4120358]
Nome=Pranchita
UF=PR
Provedor=PadraoNacional

[4120408]
Nome=Presidente Castelo Branco
UF=PR
Provedor=PadraoNacional

[4120507]
Nome=Primeiro de Maio
UF=PR
Provedor=PadraoNacional

[4120606]
Nome=Prudentopolis
UF=PR
Provedor=Equiplano
Params=CodigoCidade:28

[4120655]
Nome=Quarto Centenario
UF=PR
Provedor=PadraoNacional

[4120705]
Nome=Quatigua
UF=PR
Provedor=PadraoNacional

[4120804]
; Atualizado em 13/08/2021
Nome=Quatro Barras
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://quatrobarras.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://quatrobarras.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4120853]
Nome=Quatro Pontes
UF=PR
Provedor=Betha

[4120903]
Nome=Quedas do Iguacu
UF=PR
Provedor=PadraoNacional

[4121000]
Nome=Querencia do Norte
UF=PR
Provedor=PadraoNacional

[4121109]
Nome=Quinta do Sol
UF=PR
Provedor=PadraoNacional

[4121208]
Nome=Quitandinha
UF=PR
Provedor=PadraoNacional

[4121257]
Nome=Ramilandia
UF=PR
Provedor=PadraoNacional

[4121307]
Nome=Rancho Alegre
UF=PR
Provedor=PadraoNacional

[4121356]
Nome=Rancho Alegre D Oeste
UF=PR
Provedor=PadraoNacional

[4121406]
; Inclu�do em 20/08/2021
Nome=Realeza
UF=PR
Provedor=Equiplano
Params=CodigoCidade:49

[4121505]
Nome=Reboucas
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://reboucas.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://reboucas.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4121604]
Nome=Renascenca
UF=PR
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://200.195.142.211:8081/nfse.portal.integracao/services.svc
HomRecepcionar=http://200.195.142.211:8081/nfse.portal.integracao.teste/services.svc

[4121703]
Nome=Reserva
UF=PR
Provedor=PadraoNacional

[4121752]
Nome=Reserva do Iguacu
UF=PR
Provedor=PadraoNacional

[4121802]
Nome=Ribeirao Claro
UF=PR
Provedor=PadraoNacional

[4121901]
Nome=Ribeirao do Pinhal
UF=PR
Provedor=PadraoNacional

[4122008]
Nome=Rio Azul
UF=PR
Provedor=Equiplano
Params=CodigoCidade:19

[4122107]
Nome=Rio Bom
UF=PR
Provedor=PadraoNacional

[4122156]
Nome=Rio Bonito do Iguacu
UF=PR
Provedor=PadraoNacional

[4122172]
Nome=Rio Branco do Ivai
UF=PR
Provedor=PadraoNacional

[4122206]
; Inclu�do em 18/10/2022
; Atualizado em 04/11/2022
Nome=Rio Branco do Sul
UF=PR
Provedor=IPM
Versao=1.01
ProRecepcionar=https://riobrancodosul.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes

[4122305]
; Inclu�do em 07/07/2021
Nome=Rio Negro
UF=PR
Provedor=IPM
ProRecepcionar=http://sync-pr.nfs-e.net/datacenter/include/nfw/importa_nfw/nfw_import_upload.php?eletron=1
HomRecepcionar=http://sync-pr.nfs-e.net/datacenter/include/nfw/importa_nfw/nfw_import_upload.php?eletron=1
;
ProLinkURL=http://sync-pr.nfs-e.net/datacenter/include/nfw/nfw_imp_notas.php?codauten=%CodVerif%
HomLinkURL=http://sync-pr.nfs-e.net/datacenter/include/nfw/nfw_imp_notas.php?codauten=%CodVerif%

[4122404]
; Atualizado em 04/11/2022
Nome=Rolandia
UF=PR
Provedor=Pronim
ProRecepcionar=http://nfse.rolandia.pr.gov.br/NFSe.Portal.Integracao/Services.svc
HomRecepcionar=

[4122503]
Nome=Roncador
UF=PR
Provedor=PadraoNacional

[4122602]
Nome=Rondon
UF=PR
Provedor=PadraoNacional

[4122651]
Nome=Rosario do Ivai
UF=PR
Provedor=PadraoNacional

[4122701]
Nome=Sabaudia
UF=PR
Provedor=PadraoNacional

[4122800]
Nome=Salgado Filho
UF=PR
Provedor=Betha

[4122909]
Nome=Salto do Itarare
UF=PR
Provedor=PadraoNacional

[4123006]
Nome=Salto do Lontra
UF=PR
Provedor=PadraoNacional

[4123105]
Nome=Santa Amelia
UF=PR
Provedor=PadraoNacional

[4123204]
Nome=Santa Cecilia do Pavao
UF=PR
Provedor=PadraoNacional

[4123303]
Nome=Santa Cruz de Monte Castelo
UF=PR
Provedor=PadraoNacional

[4123402]
Nome=Santa Fe
UF=PR
Provedor=PadraoNacional

[4123501]
Nome=Santa Helena
UF=PR
Provedor=Equiplano
Params=CodigoCidade:54

[4123600]
Nome=Santa Ines
UF=PR
Provedor=PadraoNacional

[4123709]
Nome=Santa Isabel do Ivai
UF=PR
Provedor=PadraoNacional

[4123808]
Nome=Santa Izabel do Oeste
UF=PR
Provedor=IPM
Versao=1.01
ProRecepcionar=https://santaizabeldooeste.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4123824]
Nome=Santa Lucia
UF=PR
Provedor=PadraoNacional

[4123857]
Nome=Santa Maria do Oeste
UF=PR
Provedor=PadraoNacional

[4123907]
Nome=Santa Mariana
UF=PR
Provedor=PadraoNacional

[4123956]
Nome=Santa Monica
UF=PR
Provedor=PadraoNacional

[4124004]
Nome=Santana do Itarare
UF=PR
Provedor=PadraoNacional

[4124020]
Nome=Santa Tereza do Oeste
UF=PR
Provedor=Betha

[4124053]
Nome=Santa Terezinha de Itaipu
UF=PR
Provedor=PadraoNacional

[4124103]
; Atualizado em 15/09/2022
Nome=Santo Antonio da Platina
UF=PR
Provedor=IPM
Versao=1.01
ProRecepcionar=https://santoantoniodaplatina.atende.net/?pg=rest&service=WNERestServiceNFSe
HomRecepcionar=https://santoantoniodaplatina.atende.net/?pg=rest&service=WNERestServiceNFSe

[4124202]
Nome=Santo Antonio do Caiua
UF=PR
Provedor=PadraoNacional

[4124301]
Nome=Santo Antonio do Paraiso
UF=PR
Provedor=PadraoNacional

[4124400]
; Inclu�do em 24/02/2022
Nome=Santo Antonio do Sudoeste
UF=PR
Provedor=Equiplano
Params=CodigoCidade:58

[4124509]
Nome=Santo Inacio
UF=PR
Provedor=PadraoNacional

[4124608]
Nome=Sao Carlos do Ivai
UF=PR
Provedor=PadraoNacional

[4124707]
Nome=Sao Jeronimo da Serra
UF=PR
Provedor=PadraoNacional

[4124806]
Nome=Sao Joao
UF=PR
Provedor=Equiplano
Params=CodigoCidade:0

[4124905]
Nome=Sao Joao do Caiua
UF=PR
Provedor=PadraoNacional

[4125001]
Nome=Sao Joao do Ivai
UF=PR
Provedor=PadraoNacional

[4125100]
Nome=Sao Joao do Triunfo
UF=PR
Provedor=PadraoNacional

[4125209]
Nome=Sao Jorge D Oeste
UF=PR
Provedor=Equiplano
Params=CodigoCidade:163

[4125308]
Nome=Sao Jorge do Ivai
UF=PR
Provedor=Betha

[4125357]
Nome=Sao Jorge do Patrocinio
UF=PR
Provedor=PadraoNacional

[4125407]
Nome=Sao Jose da Boa Vista
UF=PR
Provedor=PadraoNacional

[4125456]
Nome=Sao Jose das Palmeiras
UF=PR
Provedor=PadraoNacional

[4125506]
Nome=Sao Jose dos Pinhais
UF=PR
Provedor=ISSSJP
ProRecepcionar=https://nfe.sjp.pr.gov.br/servicos/issOnline2/ws/index.php
HomRecepcionar=https://nfe.sjp.pr.gov.br/servicos/issOnline2/homologacao/ws/index.php
;
ProLinkURL=https://nfe.sjp.pr.gov.br/servicos/validarnfse/validar.php?CCM=%InscMunic%&verificador=%CodVerif%&nrnfs=%NumeroNFSe%
HomLinkURL=https://nfe.sjp.pr.gov.br/servicos/validarnfsehomologacao/validar.php?CCM=%InscMunic%&verificador=%CodVerif%&nrnfs=%NumeroNFSe%

[4125555]
Nome=Sao Manoel do Parana
UF=PR
Provedor=PadraoNacional

[4125605]
Nome=Sao Mateus do Sul
UF=PR
Provedor=Betha

[4125704]
; Incluido em 22/12/2022
Nome=Sao Miguel do Iguacu
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://saomigueldoiguacu.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://saomigueldoiguacu.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4125753]
Nome=Sao Pedro do Iguacu
UF=PR
Provedor=Betha

[4125803]
Nome=Sao Pedro do Ivai
UF=PR
Provedor=PadraoNacional

[4125902]
Nome=Sao Pedro do Parana
UF=PR
Provedor=PadraoNacional

[4126009]
Nome=Sao Sebastiao da Amoreira
UF=PR
Provedor=Betha

[4126108]
Nome=Sao Tome
UF=PR
Provedor=PadraoNacional

[4126207]
Nome=Sapopema
UF=PR
Provedor=PadraoNacional

[4126256]
; Inclu�da em 13/10/2022
Nome=Sarandi
UF=PR
Provedor=SigISS
ProRecepcionar=https://sarandi.sigiss.com.br:443/sarandi/ws/sigiss_ws.php
;
ProSoapAction=urn:sigiss_ws

[4126272]
Nome=Saudade do Iguacu
UF=PR
Provedor=PadraoNacional

[4126306]
Nome=Senges
UF=PR
Provedor=Equiplano
Params=CodigoCidade:61

[4126355]
Nome=Serranopolis do Iguacu
UF=PR
Provedor=PadraoNacional

[4126405]
Nome=Sertaneja
UF=PR
Provedor=PadraoNacional

[4126504]
Nome=Sertanopolis
UF=PR
Provedor=SimplISS
ProRecepcionar=http://wssertanopolis.simplissweb.com.br/nfseservice.svc
;
ProLinkURL=http://wssertanopolis.simplissweb.com.br/nfseservice.svc

[4126603]
Nome=Siqueira Campos
UF=PR
Provedor=Betha

[4126652]
; Inclu�do em 21/09/2021
Nome=Sulina
UF=PR
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://177.71.163.104/nfse.portal.Integracao/Services.svc
HomRecepcionar=http://177.71.163.104/nfse.portal.integracao.teste/services.svc

[4126678]
Nome=Tamarana
UF=PR
Provedor=PadraoNacional

[4126702]
Nome=Tamboara
UF=PR
Provedor=PadraoNacional

[4126801]
Nome=Tapejara
UF=PR
Provedor=PadraoNacional

[4126900]
Nome=Tapira
UF=PR
Provedor=PadraoNacional

[4127007]
Nome=Teixeira Soares
UF=PR
Provedor=PadraoNacional

[4127106]
; Atualizado em 29/11/2021
Nome=Telemaco Borba
UF=PR
Provedor=IPM

[4127205]
; Inclu�do em 18/01/2022
Nome=Terra Boa
UF=PR
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://terraboa.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://terraboa.iss.elotech.com.br/iss-ws/nfse203.wsdl

[4127304]
Nome=Terra Rica
UF=PR
Provedor=PadraoNacional

[4127403]
; Inclu�do em 30/01/2022
Nome=Terra Roxa
UF=PR
Provedor=IPM

[4127502]
Nome=Tibagi
UF=PR
Provedor=PadraoNacional

[4127601]
Nome=Tijucas do Sul
UF=PR
Provedor=Betha

[4127700]
Nome=Toledo
UF=PR
Provedor=Equiplano
Params=CodigoCidade:136

[4127809]
Nome=Tomazina
UF=PR
Provedor=Betha

[4127858]
Nome=Tres Barras do Parana
UF=PR
Provedor=PadraoNacional

[4127882]
Nome=Tunas do Parana
UF=PR
Provedor=PadraoNacional

[4127908]
Nome=Tuneiras do Oeste
UF=PR
Provedor=PadraoNacional

[4127957]
Nome=Tupassi
UF=PR
Provedor=PadraoNacional

[4127965]
Nome=Turvo
UF=PR
Provedor=PadraoNacional

[4128005]
Nome=Ubirata
UF=PR
Provedor=PadraoNacional

[4128104]
Nome=Umuarama
UF=PR
Provedor=Ginfes
;
ProLinkURL=http://umuarama.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://umuarama.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[4128203]
Nome=Uniao da Vitoria
UF=PR
Provedor=Betha

[4128302]
Nome=Uniflor
UF=PR
Provedor=PadraoNacional

[4128401]
Nome=Urai
UF=PR
Provedor=PadraoNacional

[4128500]
Nome=Wenceslau Braz
UF=PR
Provedor=Betha

[4128534]
Nome=Ventania
UF=PR
Provedor=PadraoNacional

[4128559]
Nome=Vera Cruz do Oeste
UF=PR
Provedor=Betha

[4128609]
Nome=Vere
UF=PR
Provedor=PadraoNacional

[4128625]
Nome=Alto Paraiso
UF=PR
Provedor=PadraoNacional

[4128633]
Nome=Doutor Ulysses
UF=PR
Provedor=PadraoNacional

[4128658]
Nome=Virmond
UF=PR
Provedor=PadraoNacional

[4128708]
Nome=Vitorino
UF=PR
Provedor=Betha

[4128807]
Nome=Xambre
UF=PR
Provedor=PadraoNacional

[4200051]
Nome=Abdon Batista
UF=SC
Provedor=Betha

[4200101]
; Atualizado em 09/09/2021
Nome=Abelardo Luz
UF=SC
Provedor=Publica
ProRecepcionar=http://nfse1.publica.inf.br/abelardoluz_nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/nfse_integracao/Services

[4200200]
; Inclu�do em 30/04/2022
Nome=Agrolandia
UF=SC
Provedor=IPM

[4200309]
Nome=Agronomica
UF=SC
Provedor=Publica
ProRecepcionar=http://nfse1.publica.inf.br/agronomica_nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/homologa_nfse_integracao/Services

[4200408]
Nome=Agua Doce
UF=SC
Provedor=Betha

[4200507]
Nome=Aguas de Chapeco
UF=SC
Provedor=Betha

[4200556]
Nome=Aguas Frias
UF=SC
Provedor=PadraoNacional

[4200606]
Nome=Aguas Mornas
UF=SC
Provedor=Betha

[4200705]
Nome=Alfredo Wagner
UF=SC
Provedor=Betha

[4200754]
Nome=Alto Bela Vista
UF=SC
Provedor=Betha

[4200804]
Nome=Anchieta
UF=SC
Provedor=CIGA

[4200903]
Nome=Angelina
UF=SC
Provedor=PadraoNacional

[4201000]
Nome=Anita Garibaldi
UF=SC
Provedor=Betha

[4201109]
Nome=Anitapolis
UF=SC
Provedor=Betha

[4201208]
Nome=Antonio Carlos
UF=SC
Provedor=Betha

[4201257]
Nome=Apiuna
UF=SC
Provedor=PadraoNacional

[4201273]
Nome=Arabuta
UF=SC
Provedor=Betha

[4201307]
Nome=Araquari
UF=SC
Provedor=IPM

[4201406]
; Inclu�do em 28/09/2022
Nome=Ararangua
UF=SC
Provedor=IPM
Versao=1.01
Params=Assinar:AssRpsGerarNFSe
ProRecepcionar=https://ararangua.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4201505]
Nome=Armazem
UF=SC
Provedor=Betha

[4201604]
; Inclu�do em 22/02/2022
Nome=Arroio Trinta
UF=SC
Provedor=Publica
ProRecepcionar=http://nfse1.publica.inf.br/arroiotrinta_nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/homologa_nfse_integracao/Services

[4201653]
Nome=Arvoredo
UF=SC
Provedor=Betha

[4201703]
Nome=Ascurra
UF=SC
Provedor=IPM

[4201802]
Nome=Atalanta
UF=SC
Provedor=Betha

[4201901]
Nome=Aurora
UF=SC
Provedor=PadraoNacional

[4201950]
Nome=Balneario Arroio do Silva
UF=SC
Provedor=PadraoNacional

[4202008]
; Atualizado em 24/03/2022
Nome=Balneario Camboriu
UF=SC
Provedor=Publica
ProRecepcionar=http://nfse1.publica.inf.br/balneariocamboriu_nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/homologa_nfse_integracao/Services

[4202057]
Nome=Balneario Barra do Sul
UF=SC
Provedor=PadraoNacional

[4202073]
Nome=Balneario Gaivota
UF=SC
Provedor=Betha

[4202081]
Nome=Bandeirante
UF=SC
Provedor=PadraoNacional

[4202099]
Nome=Barra Bonita
UF=SC
Provedor=PadraoNacional

[4202107]
Nome=Barra Velha
UF=SC
Provedor=IPM

[4202131]
Nome=Bela Vista do Toldo
UF=SC
Provedor=Betha

[4202156]
Nome=Belmonte
UF=SC
Provedor=Betha

[4202206]
Nome=Benedito Novo
UF=SC
Provedor=PadraoNacional

[4202305]
Nome=Biguacu
UF=SC
Provedor=Betha

[4202404]
Nome=Blumenau
UF=SC
Provedor=SimplISS
Versao=2.03
;
ProRecepcionar=https://wsblumenau1.simplissweb.com.br/nfseservice.svc
HomRecepcionar=https://wshomologacaoabrasf1.simplissweb.com.br/nfseservice.svc
;
ProSoapAction=http://www.sistema.com.br/Sistema.Ws.Nfse
HomSoapAction=http://nfse.abrasf.org.br

[4202438]
Nome=Bocaina do Sul
UF=SC
Provedor=PadraoNacional

[4202453]
Nome=Bombinhas
UF=SC
Provedor=Betha

[4202503]
Nome=Bom Jardim da Serra
UF=SC
Provedor=Betha

[4202537]
Nome=Bom Jesus
UF=SC
Provedor=Betha

[4202578]
Nome=Bom Jesus do Oeste
UF=SC
Provedor=PadraoNacional

[4202602]
Nome=Bom Retiro
UF=SC
Provedor=PadraoNacional

[4202701]
Nome=Botuvera
UF=SC
Provedor=PadraoNacional

[4202800]
Nome=Braco do Norte
UF=SC
Provedor=Betha

[4202859]
Nome=Braco do Trombudo
UF=SC
Provedor=PadraoNacional

[4202875]
Nome=Brunopolis
UF=SC
Provedor=PadraoNacional

[4202909]
Nome=Brusque
UF=SC
Provedor=IPM

[4203006]
; Atualizado em 09/09/2021
Nome=Cacador
UF=SC
Provedor=Publica
ProRecepcionar=http://nfse1.publica.inf.br/cacador_nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/cacador_nfse_integracao/Services

[4203105]
; Inclu�do em 03/08/2021
Nome=Caibi
UF=SC
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://186.236.16.66:8095/nfse.portal.integracao/services.svc
HomRecepcionar=http://186.236.16.66:8095/nfse.portal.integracao.teste/services.svc

[4203154]
Nome=Calmon
UF=SC
Provedor=PadraoNacional

[4203204]
; Inclu�do em 11/08/2021
Nome=Camboriu
UF=SC
Provedor=Simple
ProRecepcionar=http://simple.camboriu.sc.gov.br/LISIPMC/NFSePrefeituraCamboriu.wso

[4203253]
Nome=Capao Alto
UF=SC
Provedor=PadraoNacional

[4203303]
Nome=Campo Alegre
UF=SC
Provedor=Betha

[4203402]
Nome=Campo Belo do Sul
UF=SC
Provedor=PadraoNacional

[4203501]
; Atualizado em 29/03/2022
Nome=Campo Ere
UF=SC
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://campoere.govbr.cloud/nfse.portal.integracao/services.svc
HomRecepcionar=http://campoere.govbr.cloud/nfse.portal.integracao.teste/services.svc

[4203600]
Nome=Campos Novos
UF=SC
Provedor=Betha

[4203709]
Nome=Canelinha
UF=SC
Provedor=Betha

[4203808]
Nome=Canoinhas
UF=SC
Provedor=Publica
ProRecepcionar=http://nfse2.publica.inf.br/canoinhas_nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/homologa_nfse_integracao/Services

[4203907]
Nome=Capinzal
UF=SC
Provedor=Betha

[4203956]
Nome=Capivari de Baixo
UF=SC
Provedor=PadraoNacional

[4204004]
Nome=Catanduvas
UF=SC
Provedor=Betha

[4204103]
Nome=Caxambu do Sul
UF=SC
Provedor=PadraoNacional

[4204152]
Nome=Celso Ramos
UF=SC
Provedor=Betha

[4204178]
Nome=Cerro Negro
UF=SC
Provedor=PadraoNacional

[4204194]
Nome=Chapadao do Lageado
UF=SC
Provedor=Betha

[4204202]
; Atualizado em 27/12/2022
Nome=Chapeco
UF=SC
Provedor=SigCorp
Versao=2.04
;
ProRecepcionar=https://abrasfchapeco.meumunicipio.online/ws
HomRecepcionar=https://testechapeco.meumunicipio.online/abrasf/ws
;
ProNameSpace=https://abrasfchapeco.meumunicipio.online/ws
HomNameSpace=https://testechapecoabrasf.meumunicipio.online/ws

[4204251]
Nome=Cocal do Sul
UF=SC
Provedor=Betha

[4204301]
Nome=Concordia
UF=SC
Provedor=IPM

[4204350]
Nome=Cordilheira Alta
UF=SC
Provedor=Betha

[4204400]
Nome=Coronel Freitas
UF=SC
Provedor=Betha

[4204459]
Nome=Coronel Martins
UF=SC
Provedor=PadraoNacional

[4204509]
Nome=Corupa
UF=SC
Provedor=Betha

[4204558]
Nome=Correia Pinto
UF=SC
Provedor=Saatri
Versao=2.01
ProRecepcionar=https://correiapinto.saatri.com.br/servicos/nfse.svc
HomRecepcionar=https://homologa-correiapinto.saatri.com.br/servicos/nfse.svc
;
ProLinkURL=https://correiapinto.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%
HomLinkURL=https://correiapinto.saatri.com.br/Relatorio/VisualizarNotaFiscal?numero=%NumeroNFSe%&codigoVerificacao=%CodVerif%

[4204608]
Nome=Criciuma
UF=SC
Provedor=Betha

[4204707]
; Atualizado em 31/08/2022
Nome=Cunha Pora
UF=SC
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://cunhapora.govbr.cloud/nfse.portal.integracao/services.svc
HomRecepcionar=http://cunhapora.govbr.cloud/nfse.portal.integracao.teste/services.svc

[4204756]
Nome=Cunhatai
UF=SC
Provedor=Betha

[4204806]
Nome=Curitibanos
UF=SC
Provedor=Betha

[4204905]
Nome=Descanso
UF=SC
Provedor=Betha

[4205001]
Nome=Dionisio Cerqueira
UF=SC
Provedor=Betha

[4205100]
Nome=Dona Emma
UF=SC
Provedor=Betha

[4205159]
Nome=Doutor Pedrinho
UF=SC
Provedor=PadraoNacional

[4205175]
Nome=Entre Rios
UF=SC
Provedor=PadraoNacional

[4205191]
Nome=Ermo
UF=SC
Provedor=Betha

[4205209]
Nome=Erval Velho
UF=SC
Provedor=Betha

[4205308]
Nome=Faxinal Dos Guedes
UF=SC
Provedor=Betha

[4205357]
Nome=Flor do Sertao
UF=SC
Provedor=CIGA

[4205407]
; Atualizado em 28/10/2022
Nome=Florianopolis
UF=SC
Provedor=SoftPlan
ProRecepcionar=https://nfps-e.pmf.sc.gov.br/api/v1
HomRecepcionar=https://nfps-e-hml.pmf.sc.gov.br/api/v1

[4205431]
Nome=Formosa do Sul
UF=SC
Provedor=PadraoNacional

[4205456]
Nome=Forquilhinha
UF=SC
Provedor=PadraoNacional

[4205506]
; Atualizado em 25/05/2022
Nome=Fraiburgo
UF=SC
Provedor=IPM
Versao=1.01
ProRecepcionar=https://ws-fraiburgo.atende.net:7443/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4205555]
Nome=Frei Rogerio
UF=SC
Provedor=Betha

[4205605]
Nome=Galvao
UF=SC
Provedor=PadraoNacional

[4205704]
; Atualizado em 22/11/2021
Nome=Garopaba
UF=SC
Provedor=IPM
Versao=1.01
Params=Assinar:AssRpsGerarNFSe
;
ProRecepcionar=https://garopaba.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4205803]
Nome=Garuva
UF=SC
Provedor=PadraoNacional

[4205902]
Nome=Gaspar
UF=SC
Provedor=Thema
ProRecepcionar=https://nfse.gaspar.sc.gov.br/nfse/services/NFSEremessa
ProConsultarSituacao=https://nfse.gaspar.sc.gov.br/nfse/services/NFSEconsulta
ProConsultarLote=https://nfse.gaspar.sc.gov.br/nfse/services/NFSEconsulta
ProConsultarNFSeRps=https://nfse.gaspar.sc.gov.br/nfse/services/NFSEconsulta
ProConsultarNFSe=https://nfse.gaspar.sc.gov.br/nfse/services/NFSEconsulta
ProCancelarNFSe=https://nfse.gaspar.sc.gov.br/nfse/services/NFSEcancelamento
ProRecepcionarSincrono=https://nfse.gaspar.sc.gov.br/nfse/services/NFSEremessa
;
HomRecepcionar=http://nfsehml.gaspar.sc.gov.br/nfse/services/NFSEremessa
HomConsultarSituacao=http://nfsehml.gaspar.sc.gov.br/nfse/services/NFSEconsulta
HomConsultarLote=http://nfsehml.gaspar.sc.gov.br/nfse/services/NFSEconsulta
HomConsultarNFSeRps=http://nfsehml.gaspar.sc.gov.br/nfse/services/NFSEconsulta
HomConsultarNFSe=http://nfsehml.gaspar.sc.gov.br/nfse/services/NFSEconsulta
HomCancelarNFSe=http://nfsehml.gaspar.sc.gov.br/nfse/services/NFSEcancelamento
HomRecepcionarSincrono=http://nfsehml.gaspar.sc.gov.br/nfse/services/NFSEremessa

[4206009]
Nome=Governador Celso Ramos
UF=SC
Provedor=PadraoNacional

[4206108]
Nome=Grao Para
UF=SC
Provedor=Betha

[4206207]
Nome=Gravatal
UF=SC
Provedor=Betha

[4206306]
Nome=Guabiruba
UF=SC
Provedor=PadraoNacional

[4206405]
Nome=Guaraciaba
UF=SC
Provedor=Betha

[4206504]
Nome=Guaramirim
UF=SC
Provedor=IPM

[4206603]
Nome=Guaruja do Sul
UF=SC
Provedor=Betha

[4206652]
Nome=Guatambu
UF=SC
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://177.10.167.82/nfse.portal.integracao/services.svc
HomRecepcionar=http://177.10.167.82/nfse.portal.integracao.teste/services.svc

[4206702]
Nome=Herval D Oeste
UF=SC
Provedor=Betha

[4206751]
Nome=Ibiam
UF=SC
Provedor=Betha

[4206801]
Nome=Ibicare
UF=SC
Provedor=Betha

[4206900]
Nome=Ibirama
UF=SC
Provedor=Betha

[4207007]
; Inclu�do em 21/11/2022
Nome=Icara
UF=SC
Provedor=Bauhaus
ProRecepcionar=*
ProGerarNFSe=https://api-nfse-icara-sc.prefeituramoderna.com.br/ws/services/gerar
ProConsultarNFSe=https://api-nfse-icara-sc.prefeituramoderna.com.br/ws/services/consultar
ProCancelarNFSe=https://api-nfse-icara-sc.prefeituramoderna.com.br/ws/services/cancelar
ProSubstituirNFSe=https://api-nfse-icara-sc.prefeituramoderna.com.br/ws/services/substituir

[4207106]
Nome=Ilhota
UF=SC
Provedor=PadraoNacional

[4207205]
Nome=Imarui
UF=SC
Provedor=Betha

[4207304]
Nome=Imbituba
UF=SC
Provedor=Betha

[4207403]
Nome=Imbuia
UF=SC
Provedor=Betja

[4207502]
Nome=Indaial
UF=SC
Provedor=IPM

[4207577]
Nome=Iomere
UF=SC
Provedor=PadraoNacional

[4207601]
Nome=Ipira
UF=SC
Provedor=Betha

[4207650]
Nome=Ipora do Oeste
UF=SC
Provedor=IPM

[4207684]
Nome=Ipuacu
UF=SC
Provedor=Betha

[4207700]
Nome=Ipumirim
UF=SC
Provedor=Betha

[4207759]
Nome=Iraceminha
UF=SC
Provedor=PadraoNacional

[4207809]
; Atualizado em 18/11/2021
Nome=Irani
UF=SC
Provedor=Publica
ProRecepcionar=http://nfse1.publica.inf.br/irani_nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/homologa_nfse_integracao/Services

[4207858]
Nome=Irati
UF=SC
Provedor=PadraoNacional

[4207908]
Nome=Irineopolis
UF=SC
Provedor=CIGA

[4208005]
; Atualizado em 27/09/2022
Nome=Ita
UF=SC
Provedor=IPM
Versao=1.01
ProRecepcionar=https://ita.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://ita.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao

[4208104]
Nome=Itaiopolis
UF=SC
Provedor=PadraoNacional

[4208203]
Nome=Itajai
UF=SC
Provedor=Publica
ProRecepcionar=https://nfse.itajai.sc.gov.br/nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/itajai_nfse_integracao/Services

[4208302]
; Atualizado em 31/12/2021
Nome=Itapema
UF=SC
Provedor=Bauhaus
ProRecepcionar=*
ProGerarNFSe=https://api-nfse-itapema-sc.prefeituramoderna.com.br/ws/services/gerar
ProConsultarNFSe=https://api-nfse-itapema-sc.prefeituramoderna.com.br/ws/services/consultar
ProCancelarNFSe=https://api-nfse-itapema-sc.prefeituramoderna.com.br/ws/services/cancelar
ProSubstituirNFSe=https://api-nfse-itapema-sc.prefeituramoderna.com.br/ws/services/substituir

[4208401]
Nome=Itapiranga
UF=SC
Provedor=Betha

[4208450]
Nome=Itapoa
UF=SC
Provedor=PadraoNacional

[4208500]
Nome=Ituporanga
UF=SC
Provedor=IPM

[4208609]
Nome=Jabora
UF=SC
Provedor=PadraoNacional

[4208708]
Nome=Jacinto Machado
UF=SC
Provedor=Betha

[4208807]
; Inclu�do em 30/09/2022
Nome=Jaguaruna
UF=SC
Provedor=IPM
Versao=1.01
ProRecepcionar=https://jaguaruna.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4208906]
Nome=Jaragua do Sul
UF=SC
Provedor=Betha

[4208955]
Nome=Jardinopolis
UF=SC
Provedor=CIGA

[4209003]
Nome=Joacaba
UF=SC
Provedor=Betha

[4209102]
Nome=Joinville
UF=SC
Provedor=ISSJoinville
Versao=2.04
ProRecepcionar=https://nfemws.joinville.sc.gov.br/NotaFiscal/Servicos.asmx
HomRecepcionar=https://nfemwshomologacao.joinville.sc.gov.br/NotaFiscal/Servicos.asmx
;
ProLinkURL=https://nfem.joinville.sc.gov.br/processos/imprimir_nfe.aspx?codigo=%CodVerif%&numero=%NumeroNFSe%&documento_prestador=%Cnpj%
HomLinkURL=https://nfemhomologacao.joinville.sc.gov.br/processos/imprimir_nfe.aspx?codigo=%CodVerif%&numero=%NumeroNFSe%&documento_prestador=%Cnpj%

[4209151]
Nome=Jose Boiteux
UF=SC
Provedor=PadraoNacional

[4209177]
Nome=Jupia
UF=SC
Provedor=Betha

[4209201]
Nome=Lacerdopolis
UF=SC
Provedor=Betha

[4209300]
Nome=Lages
UF=SC
Provedor=Betha

[4209409]
Nome=Laguna
UF=SC
Provedor=Betha
Versao=2.02
ProRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-ws/nfseWS
HomRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-test-ws/nfseWS

[4209458]
Nome=Lajeado Grande
UF=SC
Provedor=Betha

[4209508]
Nome=Laurentino
UF=SC
Provedor=PadraoNacional

[4209607]
Nome=Lauro Muller
UF=SC
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://lauromullersc.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://lauromullersc.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[4209706]
; Atualizado em 09/09/2021
Nome=Lebon Regis
UF=SC
Provedor=Publica
ProRecepcionar=http://nfse1.publica.inf.br/lebonregis_nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/nfse_integracao/Services

[4209805]
Nome=Leoberto Leal
UF=SC
Provedor=PadraoNacional

[4209854]
Nome=Lindoia do Sul
UF=SC
Provedor=Betha

[4209904]
Nome=Lontras
UF=SC
Provedor=PadraoNacional

[4210001]
Nome=Luiz Alves
UF=SC
Provedor=Betha

[4210035]
Nome=Luzerna
UF=SC
Provedor=Betha

[4210050]
Nome=Macieira
UF=SC
Provedor=Betha

[4210100]
; Atualizado em 09/09/2021
Nome=Mafra
UF=SC
Provedor=Publica
ProRecepcionar=http://nfse1.publica.inf.br/mafra_nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/nfse_integracao/Services

[4210209]
Nome=Major Gercino
UF=SC
Provedor=Betha

[4210308]
Nome=Major Vieira
UF=SC
Provedor=Betha

[4210407]
Nome=Maracaja
UF=SC
Provedor=Betha

[4210506]
Nome=Maravilha
UF=SC
Provedor=Betha

[4210555]
Nome=Marema
UF=SC
Provedor=Betha

[4210605]
Nome=Massaranduba
UF=SC
Provedor=IPM

[4210704]
Nome=Matos Costa
UF=SC
Provedor=PadraoNacional

[4210803]
; Atualizado em 09/09/2021
Nome=Meleiro
UF=PR
Provedor=Publica
ProRecepcionar=http://nfse1.publica.inf.br/meleiro_nfse_integracao/Services
HomRecepcionar=http://nfse-teste.publica.inf.br/nfse_integracao/Services

[4210852]
Nome=Mirim Doce
UF=SC
Provedor=PadraoNacional

[4210902]
; Atualizado em 29/06/2022
Nome=Modelo
UF=SC
Provedor=IPM
Versao=1.01
ProRecepcionar=https://ws-modelo.atende.net:7443/?pg=rest&service=WNERestServiceNFSe
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4211009]
Nome=Mondai
UF=SC
Provedor=Betha

[4211058]
Nome=Monte Carlo
UF=SC
Provedor=Betha

[4211108]
; Atualizado em 15/09/2022
Nome=Monte Castelo
UF=SC
Provedor=Betha
Versao=2.02
ProRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-ws/nfseWS
HomRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-test-ws/nfseWS

[4211207]
Nome=Morro da Fumaca
UF=SC
Provedor=Betha

[4211256]
Nome=Morro Grande
UF=SC
Provedor=Betha

[4211306]
Nome=Navegantes
UF=SC
Provedor=Betha

[4211405]
Nome=Nova Erechim
UF=SC
Provedor=IPM
Versao=1.01
ProRecepcionar=https://novaerechim.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4211454]
Nome=Nova Itaberaba
UF=SC
Provedor=PadraoNacional

[4211504]
Nome=Nova Trento
UF=SC
Provedor=Betha

[4211603]
Nome=Nova Veneza
UF=SC
Provedor=Betha

[4211652]
Nome=Novo Horizonte
UF=SC
Provedor=Betha

[4211702]
Nome=Orleans
UF=SC
Provedor=Betha

[4211751]
Nome=Otacilio Costa
UF=SC
Provedor=Betha

[4211801]
Nome=Ouro
UF=SC
Provedor=Betha

[4211850]
Nome=Ouro Verde
UF=SC
Provedor=PadraoNacional

[4211876]
Nome=Paial
UF=SC
Provedor=Betha

[4211892]
Nome=Painel
UF=SC
Provedor=PadraoNacional

[4211900]
; Atualizado em 21/03/2022
Nome=Palhoca
UF=SC
Provedor=IPM
Versao=1.01
ProRecepcionar=https://palhoca.atende.net:7443/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4212007]
Nome=Palma Sola
UF=SC
Provedor=IPM

[4212056]
Nome=Palmeira
UF=SC
Provedor=PadraoNacional

[4212106]
Nome=Palmitos
UF=SC
Provedor=Betha

[4212205]
; Atualizado em 11/06/2021
Nome=Papanduva
UF=SC
Provedor=Betha

[4212239]
Nome=Paraiso
UF=SC
Provedor=PadraoNacional

[4212254]
Nome=Passo de Torres
UF=SC
Provedor=Betha

[4212270]
Nome=Passos Maia
UF=SC
Provedor=Betha

[4212304]
Nome=Paulo Lopes
UF=SC
Provedor=Betha

[4212403]
Nome=Pedras Grandes
UF=SC
Provedor=Betha

[4212502]
Nome=Penha
UF=SC
Provedor=Betha

[4212601]
Nome=Peritiba
UF=SC
Provedor=Betha

[4212650]
Nome=Pescaria Brava
UF=SC
Provedor=PadraoNacional

[4212700]
Nome=Petrolandia
UF=SC
Provedor=Betha

[4212809]
Nome=Balneario Picarras
UF=SC
Provedor=PadraoNacional

[4212908]
Nome=Pinhalzinho
UF=SC
Provedor=IPM

[4213005]
Nome=Pinheiro Preto
UF=SC
Provedor=PadraoNacional

[4213104]
Nome=Piratuba
UF=SC
Provedor=Betha

[4213153]
Nome=Planalto Alegre
UF=SC
Provedor=IPM

[4213203]
Nome=Pomerode
UF=SC
Provedor=IPM

[4213302]
Nome=Ponte Alta
UF=SC
Provedor=Betha

[4213351]
Nome=Ponte Alta do Norte
UF=SC
Provedor=Betha

[4213401]
Nome=Ponte Serrada
UF=SC
Provedor=Betha

[4213500]
Nome=Porto Belo
UF=SC
Provedor=Betha

[4213609]
Nome=Porto Uniao
UF=SC
Provedor=Betha

[4213708]
Nome=Pouso Redondo
UF=SC
Provedor=Betha

[4213807]
; Inclu�do em 11/10/2022
Nome=Praia Grande
UF=SC
Provedor=IPM
Versao=1.01
Params=NaoGerarGrupoRps
ProRecepcionar=https://praiagrande.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4213906]
Nome=Presidente Castello Branco
UF=SC
Provedor=PadraoNacional

[4214003]
; Inclu�do em 19/09/2022
Nome=Presidente Getulio
UF=SC
Provedor=IPM

[4214102]
Nome=Presidente Nereu
UF=SC
Provedor=CIGA

[4214151]
Nome=Princesa
UF=SC
Provedor=CIGA

[4214201]
Nome=Quilombo
UF=SC
Provedor=Betha

[4214300]
Nome=Rancho Queimado
UF=SC
Provedor=Betha

[4214409]
; Inclu�do em 16/11/2022
Nome=Rio das Antas
UF=SC
Provedor=IPM

[4214508]
Nome=Rio do Campo
UF=SC
Provedor=PadraoNacional

[4214607]
; Inclu�do em 30/04/2022
Nome=Rio do Oeste
UF=SC
Provedor=IPM

[4214706]
Nome=Rio dos Cedros
UF=SC
Provedor=IPM

[4214805]
; Atualizado em 26/08/2021
Nome=Rio do Sul
UF=SC
Provedor=IPM
Versao=1.01
Params=Assinar:AssRpsGerarNFSe
;
ProRecepcionar=https://riodosul.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4214904]
Nome=Rio Fortuna
UF=SC
Provedor=CIGA

[4215000]
Nome=Rio Negrinho
UF=SC
Provedor=IPM

[4215059]
Nome=Rio Rufino
UF=SC
Provedor=CIGA

[4215075]
Nome=Riqueza
UF=SC
Provedor=PadraoNacional

[4215109]
Nome=Rodeio
UF=SC
Provedor=PadraoNacional

[4215208]
Nome=Romelandia
UF=SC
Provedor=PadraoNacional

[4215307]
Nome=Salete
UF=SC
Provedor=PadraoNacional

[4215356]
Nome=Saltinho
UF=SC
Provedor=Betha

[4215406]
Nome=Salto Veloso
UF=SC
Provedor=Betha

[4215455]
Nome=Sangao
UF=SC
Provedor=Betha

[4215505]
Nome=Santa Cecilia
UF=SC
Provedor=Betha

[4215554]
Nome=Santa Helena
UF=SC
Provedor=Betha

[4215604]
Nome=Santa Rosa de Lima
UF=SC
Provedor=Betha

[4215653]
Nome=Santa Rosa do Sul
UF=SC
Provedor=PadraoNacional

[4215679]
Nome=Santa Terezinha
UF=SC
Provedor=Betha

[4215687]
Nome=Santa Terezinha do Progresso
UF=SC
Provedor=PadraoNacional

[4215695]
Nome=Santiago do Sul
UF=SC
Provedor=PadraoNacional

[4215703]
Nome=Santo Amaro da Imperatriz
UF=SC
Provedor=Betha

[4215752]
Nome=Sao Bernardino
UF=SC
Provedor=PadraoNacional

[4215802]
Nome=Sao Bento do Sul
UF=SC
Provedor=IPM

[4215901]
Nome=Sao Bonifacio
UF=SC
Provedor=Betha

[4216008]
Nome=Sao Carlos
UF=SC
Provedor=Betha

[4216057]
Nome=Sao Cristovao do Sul
UF=SC
Provedor=CIGA

[4216107]
Nome=Sao Domingos
UF=SC
Provedor=Betha

[4216206]
; Inclu�do em 22/02/2022
Nome=Sao Francisco do Sul
UF=SC
Provedor=IPM

[4216255]
Nome=Sao Joao do Oeste
UF=SC
Provedor=Betha

[4216305]
Nome=Sao Joao Batista
UF=SC
Provedor=Betha

[4216354]
Nome=Sao Joao do Itaperiu
UF=SC
Provedor=Betha

[4216404]
Nome=Sao Joao do Sul
UF=SC
Provedor=Betha

[4216503]
Nome=Sao Joaquim
UF=SC
Provedor=Betha

[4216602]
; Atualizado em 29/09/2022
Nome=Sao Jose
UF=SC
Provedor=IPM
Versao=1.01
Params=GerarTag:codigo_atividade
ProRecepcionar=https://saojose.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://qualidade-atendenet56.ipm.com.br/homologacao/?pg=rest&service=WNERestServiceNFSe&cidade=saojose

[4216701]
Nome=Sao Jose do Cedro
UF=SC
Provedor=PadraoNacional

[4216800]
Nome=Sao Jose do Cerrito
UF=SC
Provedor=Betha

[4216909]
Nome=Sao Lourenco do Oeste
UF=SC
Provedor=Betha

[4217006]
Nome=Sao Ludgero
UF=SC
Provedor=Betha

[4217105]
Nome=Sao Martinho
UF=SC
Provedor=Betha

[4217154]
Nome=Sao Miguel da Boa Vista
UF=SC
Provedor=PadraoNacional

[4217204]
Nome=Sao Miguel do Oeste
UF=SC
Provedor=Betha

[4217253]
Nome=Sao Pedro de Alcantara
UF=SC
Provedor=PadraoNacional

[4217303]
; Inclu�do em 20/09/2022
Nome=Saudades
UF=SC
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://saudades.govbr.cloud/nfse.portal.integracao/services.svc
HomRecepcionar=http://saudades.govbr.cloud/nfse.portal.integracao.teste/services.svc

[4217402]
Nome=Schroeder
UF=SC
Provedor=Betha
Versao=2.02
ProRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-ws/nfseWS
HomRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-test-ws/nfseWS

[4217501]
; Atualizado em 02/07/2021
Nome=Seara
UF=SC
Provedor=IPM
ProRecepcionar=http://sync-sc.nfs-e.net/datacenter/include/nfw/importa_nfw/nfw_import_upload.php?eletron=1
HomRecepcionar=
;
ProLinkURL=http://sync-sc.nfs-e.net/datacenter/include/nfw/nfw_imp_notas.php?codauten=%CodVerif%
HomLinkURL=http://sync-sc.nfs-e.net/datacenter/include/nfw/nfw_imp_notas.php?codauten=%CodVerif%

[4217550]
Nome=Serra Alta
UF=SC
Provedor=Betha

[4217600]
Nome=Sideropolis
UF=SC
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://sideropolissc.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://sideropolissc.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[4217709]
Nome=Sombrio
UF=SC
Provedor=Betha

[4217758]
Nome=Sul Brasil
UF=SC
Provedor=PadraoNacional

[4217808]
Nome=Taio
UF=SC
Provedor=IPM

[4217907]
Nome=Tangara
UF=SC
Provedor=Betha

[4217956]
Nome=Tigrinhos
UF=SC
Provedor=PadraoNacional

[4218004]
; Atualizado em 13/12/2022
Nome=Tijucas
UF=SC
Provedor=IPM

[4218103]
Nome=Timbe do Sul
UF=SC
Provedor=PadraoNacional

[4218202]
; Atualizado em 26/08/2021
Nome=Timbo
UF=SC
Provedor=IPM
Versao=1.01
ProRecepcionar=https://timbo.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1 
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1 

[4218251]
Nome=Timbo Grande
UF=SC
Provedor=CIGA

[4218301]
Nome=Tres Barras
UF=SC
Provedor=IPM

[4218350]
Nome=Treviso
UF=SC
Provedor=Betha

[4218400]
Nome=Treze de Maio
UF=SC
Provedor=Betha

[4218509]
Nome=Treze Tilias
UF=SC
Provedor=Betha

[4218608]
Nome=Trombudo Central
UF=SC
Provedor=Betha

[4218707]
; Inclu�do em 21/11/2022
Nome=Tubarao
UF=SC
Provedor=Bauhaus
ProRecepcionar=*
ProGerarNFSe=https://api-nfse-tubarao-sc.prefeituramoderna.com.br/ws/services/gerar
ProConsultarNFSe=https://api-nfse-tubarao-sc.prefeituramoderna.com.br/ws/services/consultar
ProCancelarNFSe=https://api-nfse-tubarao-sc.prefeituramoderna.com.br/ws/services/cancelar
ProSubstituirNFSe=https://api-nfse-tubarao-sc.prefeituramoderna.com.br/ws/services/substituir

[4218756]
Nome=Tunapolis
UF=SC
Provedor=Betha

[4218806]
Nome=Turvo
UF=SC
Provedor=Betha

[4218855]
Nome=Uniao do Oeste
UF=SC
Provedor=Betha

[4218905]
Nome=Urubici
UF=SC
Provedor=PadraoNacional

[4218954]
Nome=Urupema
UF=SC
Provedor=PadraoNacional

[4219002]
Nome=Urussanga
UF=SC
Provedor=Betha

[4219101]
Nome=Vargeao
UF=SC
Provedor=Betha

[4219150]
Nome=Vargem
UF=SC
Provedor=PadraoNacional

[4219176]
Nome=Vargem Bonita
UF=SC
Provedor=Betha

[4219200]
Nome=Vidal Ramos
UF=SC
Provedor=Betha

[4219309]
; Atualizado em 23/08/2022
Nome=Videira
UF=SC
Provedor=IPM
Versao=1.01
ProRecepcionar=https://videira.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://qualidade-atendenet56.ipm.com.br/homologacao/?pg=rest&service=WNERestServiceNFSe&cidade=videira

[4219358]
Nome=Vitor Meireles
UF=SC
Provedor=PadraoNacional

[4219408]
Nome=Witmarsum
UF=SC
Provedor=PadraoNacional

[4219507]
Nome=Xanxere
UF=SC
Provedor=Betha

[4219606]
Nome=Xavantina
UF=SC
Provedor=Betha

[4219705]
Nome=Xaxim
UF=SC
Provedor=Betha

[4219853]
Nome=Zortea
UF=SC
Provedor=Betha

[4220000]
Nome=Balneario Rincao
UF=SC
Provedor=Betha

[4300034]
Nome=Acegua
UF=RS
Provedor=PadraoNacional

[4300059]
Nome=Agua Santa
UF=RS
Provedor=DataSmart
Versao=2.02
Params=AliasCidade:B_ASANTA

[4300109]
Nome=Agudo
UF=RS
Provedor=PadraoNacional

[4300208]
Nome=Ajuricaba
UF=RS
Provedor=PadraoNacional

[4300307]
Nome=Alecrim
UF=RS
Provedor=PadraoNacional

[4300406]
Nome=Alegrete
UF=RS
Provedor=DBSeller
ProRecepcionar=http://nfse.alegrete.rs.gov.br/webservice/index/producao
HomRecepcionar=http://nfse.alegrete.rs.gov.br/webservice/index/homologacao
;
ProNameSpace=http://nfse.alegrete.rs.gov.br/webservice/index/producao
HomNameSpace=http://nfse.alegrete.rs.gov.br/webservice/index/homologacao

[4300455]
Nome=Alegria
UF=RS
Provedor=PadraoNacional

[4300471]
Nome=Almirante Tamandare do Sul
UF=RS
Provedor=PadraoNacional

[4300505]
Nome=Alpestre
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/alpestre/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/alpestre_homolog/nfse/ws/principal

[4300554]
Nome=Alto Alegre
UF=RS
Provedor=PadraoNacional

[4300570]
; Inclu�do em 18/08/2021
Nome=Alto Feliz
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://187.84.56.98:8082/nfse.portal.integracao/services.svc
HomRecepcionar=http://187.84.56.98:8082/nfse.portal.integracao.teste/services.svc

[4300604]
Nome=Alvorada
UF=RS
Provedor=IPM

[4300638]
Nome=Amaral Ferrador
UF=RS
Provedor=PadraoNacional

[4300646]
Nome=Ametista do Sul
UF=RS
Provedor=Betha

[4300661]
Nome=Andre da Rocha
UF=RS
Provedor=PadraoNacional

[4300703]
Nome=Anta Gorda
UF=RS
Provedor=PadraoNacional

[4300802]
; Inclu�do em 05/11/2021
Nome=Antonio Prado
UF=RS
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://antonioprado-portais.govcloud.com.br/NFSe.portal.integracao/services.svc
HomRecepcionar=http://antonioprado-portais.govcloud.com.br/NFSe.portal.integracao.teste/services.svc

[4300851]
Nome=Arambare
UF=RS
Provedor=PadraoNacional

[4300877]
Nome=Ararica
UF=RS
Provedor=PadraoNacional

[4300901]
Nome=Aratiba
UF=RS
Provedor=PadraoNacional

[4301008]
Nome=Arroio do Meio
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://arroiodomeio.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://arroiodomeio.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://arroiodomeio.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://arroiodomeio.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://arroiodomeio.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://arroiodomeio.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologaarroio.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologaarroio.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologaarroio.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologaarroio.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologaarroio.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologaarroio.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4301057]
Nome=Arroio do Sal
UF=RS
Provedor=DBSeller
ProRecepcionar=https://nfse.arroiodosal.rs.gov.br/webservice/index/producao
HomRecepcionar=http://hom.nfe.arroiodosal.rs.gov.br/webservice/index/homologacao
;
ProNameSpace=https://nfse.arroiodosal.rs.gov.br/webservice/index/producao
HomNameSpace=http://hom.nfe.arroiodosal.rs.gov.br/webservice/index/homologacao

[4301073]
Nome=Arroio do Padre
UF=RS
Provedor=PadraoNacional

[4301107]
Nome=Arroio dos Ratos
UF=RS
Provedor=Betha

[4301206]
Nome=Arroio do Tigre
UF=RS
Provedor=PadraoNacional

[4301305]
Nome=Arroio Grande
UF=RS
Provedor=PadraoNacional

[4301404]
Nome=Arvorezinha
UF=RS
Provedor=PadraoNacional

[4301503]
Nome=Augusto Pestana
UF=RS
Provedor=PadraoNacional

[4301552]
Nome=Aurea
UF=RS
Provedor=PadraoNacional

[4301602]
Nome=Bage
UF=RS
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://bagers.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://bagers.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[4301636]
Nome=Balneario Pinhal
UF=RS
Provedor=TcheInfo
Versao=2.04

[4301651]
Nome=Barao
UF=RS
Provedor=PadraoNacional

[4301701]
Nome=Barao de Cotergipe
UF=RS
Provedor=SystemPro
Versao=2.01
ProRecepcionar=https://portal.baraodecotegipe.rs.gov.br:8182/NfseService/NfseService
HomRecepcionar=https://portal.baraodecotegipe.rs.gov.br:8183/NfseService_Homolog/NfseService_Homolog

[4301750]
Nome=Barao do Triunfo
UF=RS
Provedor=PadraoNacional

[4301800]
Nome=Barracao
UF=RS
Provedor=PadraoNacional

[4301859]
Nome=Barra do Guarita
UF=RS
Provedor=PadraoNacional

[4301875]
Nome=Barra do Quarai
UF=RS
Provedor=PadraoNacional

[4301909]
Nome=Barra do Ribeiro
UF=RS
Provedor=PadraoNacional

[4301925]
Nome=Barra do Rio Azul
UF=RS
Provedor=PadraoNacional

[4301958]
; Inclu�do em 30/08/2021
Nome=Barra Funda
UF=RS
Provedor=TcheInfo
Versao=2.04

[4302006]
Nome=Barros Cassal
UF=RS
Provedor=PadraoNacional

[4302055]
Nome=Benjamin Constant do Sul
UF=RS
Provedor=PadraoNacional

[4302105]
Nome=Bento Goncalves
UF=RS
Provedor=IPM

[4302154]
Nome=Boa Vista das Missoes
UF=RS
Provedor=PadraoNacional

[4302204]
Nome=Boa vista do Burica
UF=RS
Provedor=ABase
Versao=2.01

[4302220]
Nome=Boa Vista do Cadeado
UF=RS
Provedor=PadraoNacional

[4302238]
Nome=Boa Vista do Incra
UF=RS
Provedor=PadraoNacional

[4302253]
Nome=Boa Vista do Sul
UF=RS
Provedor=PadraoNacional

[4302303]
Nome=Bom Jesus
UF=RS
Provedor=PadraoNacional

[4302352]
; Atualizado em 03/08/2021
Nome=Bom Principio
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://bomprincipio.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://bomprincipio.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://bomprincipio.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://bomprincipio.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://bomprincipio.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://bomprincipio.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologabomprincipio.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologabomprincipio.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologabomprincipio.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologabomprincipio.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologabomprincipio.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologabomprincipio.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4302378]
Nome=Bom Progresso
UF=RS
Provedor=PadraoNacional

[4302402]
Nome=Bom Retiro do Sul
UF=RS
Provedor=PadraoNacional

[4302451]
Nome=Boqueirao do Leao
UF=RS
Provedor=Betha

[4302501]
Nome=Bossoroca
UF=RS
Provedor=PadraoNacional

[4302584]
Nome=Bozano
UF=RS
Provedor=PadraoNacional

[4302600]
Nome=Braga
UF=RS
Provedor=PadraoNacional

[4302659]
Nome=Brochier
UF=RS
Provedor=PadraoNacional

[4302709]
Nome=Butia
UF=RS
Provedor=PadraoNacional

[4302808]
Nome=Cacapava do Sul
UF=RS
Provedor=Pronim
ProRecepcionar=http://200.237.90.22:8082/nfsews/Services.svc
HomRecepcionar=http://200.237.90.22:8082/nfsewsteste/Services.svc

[4302907]
Nome=Cacequi
UF=RS
Provedor=PadraoNacional

[4303004]
Nome=Cachoeira do Sul
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://177.84.147.222:8091/nfse.portal.integracao/services.svc
HomRecepcionar=http://177.84.147.222:8091/nfse.portal.integracao.teste/services.svc

[4303103]
; Atualizado em 27/09/2022
Nome=Cachoeirinha
UF=RS
Provedor=IPM
Versao=1.01
Params=Assinar:AssRpsGerarNFSe
;
ProRecepcionar=https://cachoeirinha.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4303202]
Nome=Cacique Doble
UF=RS
Provedor=PadraoNacional

[4303301]
Nome=Caibate
UF=RS
Provedor=ABase
Versao=2.01

[4303400]
; Inclu�do em 17/05/2022
Nome=Caicara
UF=RS
Provedor=Betha

[4303509]
Nome=Camaqua
UF=RS
Provedor=Pronim
ProRecepcionar=http://portal.camaqua.rs.gov.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://portal.camaqua.rs.gov.br/nfse.portal.integracao.teste/services.svc
;
ProLinkURL=http://server21.camaqua.rs.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true
HomLinkURL=http://server21.camaqua.rs.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true

[4303558]
Nome=Camargo
UF=RS
Provedor=PadraoNacional

[4303608]
Nome=Cambara do Sul
UF=RS
Provedor=PadraoNacional

[4303673]
Nome=Campestre da Serra
UF=RS
Provedor=PadraoNacional

[4303707]
Nome=Campina das Missoes
UF=RS
Provedor=PadraoNacional

[4303806]
Nome=Campinas do Sul
UF=RS
Provedor=SystemPro
Versao=2.01
ProRecepcionar=https://sistema.campinasdosul.rs.gov.br:8182/NfseService/NfseService
HomRecepcionar=https://sistema.campinasdosul.rs.gov.br:8183/NfseService_Homolog/NfseService_Homolog

[4303905]
Nome=Campo Bom
UF=RS
Provedor=Infisc
Versao=1.01
;
ProRecepcionar=https://nfse.campobom.rs.gov.br/services/nfse/ws/Servicos
HomRecepcionar=https://campobom-gif4homol.infisc.com.br/services/nfse/ws/Servicos
;
ProLinkURL=https://nfse.campobom.rs.gov.br/portal/consulta.jspx?nf=%ChaveAcesso%
HomLinkURL=https://campobom-gif4homol.infisc.com.br/portal/consulta.jspx?nf=%ChaveAcesso%

[4304002]
Nome=Campo Novo
UF=RS
Provedor=Betha

[4304101]
Nome=Campos Borges
UF=RS
Provedor=PadraoNacional

[4304200]
Nome=Candelaria
UF=RS
Provedor=PadraoNacional

[4304309]
Nome=Candido Godoi
UF=RS
Provedor=PadraoNacional

[4304358]
Nome=Candiota
UF=RS
Provedor=Betha

[4304408]
; Atualizado em 17/05/2022
Nome=Canela
UF=RS
Provedor=SystemPro
Versao=2.01
ProRecepcionar=https://www.nfse.canela.rs.gov.br:8182/NfseService/NfseService
HomRecepcionar=https://www.nfse.canela.rs.gov.br:8183/NfseService_Homolog/NfseService_Homolog

[4304507]
Nome=Cangucu
UF=RS
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://nfse.cangucu.rs.gov.br:81/nfse.portal.integracao/services.svc
HomRecepcionar=http://nfse.cangucu.rs.gov.br:81/nfse.portal.integracao.teste/services.svc

[4304606]
Nome=Canoas
UF=RS
Provedor=Abaco
ProRecepcionar=https://www.e-nfs.com.br/e-nfs_canoas/servlet/arecepcionarloterps
ProConsultarSituacao=https://www.e-nfs.com.br/e-nfs_canoas/servlet/aconsultarsituacaoloterps
ProConsultarLote=https://www.e-nfs.com.br/e-nfs_canoas/servlet/aconsultarloterps
ProConsultarNFSeRps=https://www.e-nfs.com.br/e-nfs_canoas/servlet/aconsultarnfseporrps
ProConsultarNFSe=https://www.e-nfs.com.br/e-nfs_canoas/servlet/aconsultarnfse
ProCancelarNFSe=https://www.e-nfs.com.br/e-nfs_canoas/servlet/acancelarnfse
;
HomRecepcionar=https://homologa.e-nfs.com.br/canoas/servlet/arecepcionarloterps
HomConsultarSituacao=https://homologa.e-nfs.com.br/canoas/servlet/aconsultarsituacaoloterps
HomConsultarLote=https://homologa.e-nfs.com.br/canoas/servlet/aconsultarloterps
HomConsultarNFSeRps=https://homologa.e-nfs.com.br/canoas/servlet/aconsultarnfseporrps
HomConsultarNFSe=https://homologa.e-nfs.com.br/canoas/servlet/aconsultarnfse
HomCancelarNFSe=https://homologa.e-nfs.com.br/canoas/servlet/acancelarnfse
;
ProLinkURL=https://www.e-nfs.com.br/e-nfs_canoas/servlet/wvalidarautenticidadenfse?%Cnpj%,%ValorServico%,%NumeroNFSe%,%CodVerif%
HomLinkURL=https://homologa.e-nfs.com.br/canoas/servlet/wvalidarautenticidadenfse?%Cnpj%,%ValorServico%,%NumeroNFSe%,%CodVerif%

[4304614]
Nome=Canudos do Vale
UF=RS
Provedor=PadraoNacional

[4304622]
Nome=Capao Bonito do Sul
UF=RS
Provedor=PadraoNacional

[4304630]
Nome=Capao da Canoa
UF=RS
Provedor=Betha

[4304655]
Nome=Capao do Cipo
UF=RS
Provedor=PadraoNacional

[4304663]
Nome=Capao do Leao
UF=RS
Provedor=PadraoNacional

[4304671]
Nome=Capivari do Sul
UF=RS
Provedor=PadraoNacional

[4304689]
Nome=Capela de Santana
UF=RS
Provedor=PadraoNacional

[4304697]
Nome=Capitao
UF=RS
Provedor=PadraoNacional

[4304705]
Nome=Carazinho
UF=RS
Provedor=DBSeller
ProRecepcionar=https://nfse.carazinho.rs.gov.br/webservice/index/producao
HomRecepcionar=https://nfse.carazinho.rs.gov.br/webservice/index/homologacao
;
ProNameSpace=https://nfse.carazinho.rs.gov.br/webservice/index/producao
HomNameSpace=https://nfse.carazinho.rs.gov.br/webservice/index/homologacao

[4304713]
Nome=Caraa
UF=RS
Provedor=PadraoNacional

[4304804]
Nome=Carlos Barbosa
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://carlosbarbosa.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://carlosbarbosa.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://carlosbarbosa.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://carlosbarbosa.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://carlosbarbosa.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://carlosbarbosa.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologabarbosa.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologabarbosa.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologabarbosa.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologabarbosa.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologabarbosa.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologabarbosa.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4304853]
Nome=Carlos Gomes
UF=RS
Provedor=PadraoNacional

[4304903]
; Inclu�do em 17/09/2021
Nome=Casca
UF=RS
Provedor=Citta
Versao=2.03
ProRecepcionar=https://casca.cittaweb.com.br/nfse/services/nfseSOAP
;
ProLinkURL=https://casca.cittaweb.com.br/nfse/api/public/documento/report/%CodVerif%

[4304952]
Nome=Caseiros
UF=RS
Provedor=PadraoNacional

[4305009]
Nome=Catuipe
UF=RS
Provedor=PadraoNacional

[4305108]
Nome=Caxias do Sul
UF=RS
Provedor=Infisc
Versao=1.01
;
ProRecepcionar=https://nfse.caxias.rs.gov.br/services/nfse/ws/Servicos
HomRecepcionar=https://nfsehomol.caxias.rs.gov.br/services/nfse/ws/Servicos
;
ProLinkURL=https://nfse.caxias.rs.gov.br/portal/consulta.jspx?nf=%ChaveAcesso%
HomLinkURL=https://nfsehomol.caxias.rs.gov.br/portal/consulta.jspx?nf=%ChaveAcesso%

[4305116]
Nome=Centenario
UF=RS
Provedor=PadraoNacional

[4305124]
Nome=Cerrito
UF=RS
Provedor=PadraoNacional

[4305132]
Nome=Cerro Branco
UF=RS
Provedor=PadraoNacional

[4305157]
Nome=Cerro Grande
UF=RS
Provedor=PadraoNacional

[4305173]
Nome=Cerro Grande do Sul
UF=RS
Provedor=Betha

[4305207]
Nome=Cerro Largo
UF=RS
Provedor=ABase
Versao=2.01

[4305306]
Nome=Chapada
UF=RS
Provedor=TcheInfo
Versao=2.04

[4305355]
Nome=Charqueadas
UF=RS
Provedor=DBSeller
ProRecepcionar=http://nfse.charqueadas.rs.gov.br/webservice/index/producao
HomRecepcionar=http://nfse.charqueadas.rs.gov.br:82/webservice/index/homologacao
;
ProNameSpace=http://nfse.charqueadas.rs.gov.br/webservice/index/producao
HomNameSpace=http://nfse.charqueadas.rs.gov.br:82/webservice/index/homologacao

[4305371]
Nome=Charrua
UF=RS
Provedor=PadraoNacional

[4305405]
Nome=Chiapetta
UF=RS
Provedor=PadraoNacional

[4305439]
Nome=Chui
UF=RS
Provedor=PadraoNacional

[4305447]
Nome=Chuvisca
UF=RS
Provedor=PadraoNacional

[4305454]
Nome=Cidreira
UF=RS
Provedor=PadraoNacional

[4305504]
Nome=Ciriaco
UF=RS
Provedor=PadraoNacional

[4305587]
Nome=Colinas
UF=RS
Provedor=PadraoNacional

[4305603]
Nome=Colorado
UF=RS
Provedor=PadraoNacional

[4305702]
Nome=Condor
UF=RS
Provedor=SafeWeb
Versao=2.00

[4305801]
Nome=Constantina
UF=RS
Provedor=Betha

[4305835]
Nome=Coqueiro Baixo
UF=RS
Provedor=PadraoNacional

[4305850]
Nome=Coqueiros do Sul
UF=RS
Provedor=TcheInfo
Versao=2.04

[4305871]
Nome=Coronel Barros
UF=RS
Provedor=PadraoNacional

[4305900]
Nome=Coronel Bicaco
UF=RS
Provedor=PadraoNacional

[4305934]
Nome=Coronel Pilar
UF=RS
Provedor=PadraoNacional

[4305959]
Nome=Cotipora
UF=RS
Provedor=PadraoNacional

[4305975]
Nome=Coxilha
UF=RS
Provedor=PadraoNacional

[4306007]
Nome=Crissiumal
UF=RS
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://crissiumal-portais.govcloud.com.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://crissiumal-portais.govcloud.com.br/nfse.portal.integracao.teste/services.svc

[4306056]
Nome=Cristal
UF=RS
Provedor=PadraoNacional

[4306072]
Nome=Cristal do Sul
UF=RS
Provedor=IPM

[4306106]
Nome=Cruz Alta
UF=RS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/cruzalta/servicos.asmx

[4306130]
Nome=Cruzaltense
UF=RS
Provedor=PadraoNacional

[4306205]
Nome=Cruzeiro do Sul
UF=RS
Provedor=PadraoNacional

[4306304]
; Inclu�do em 08/02/2022
Nome=David Canabarro
UF=RS
Provedor=Citta
Versao=2.03
ProRecepcionar=https://davidcanabarro.cittaweb.com.br/nfse/services/nfseSOAP
;
ProLinkURL=https://davidcanabarro.cittaweb.com.br/nfse/api/public/documento/report/%CodVerif%

[4306320]
Nome=Derrubadas
UF=RS
Provedor=PadraoNacional

[4306353]
Nome=Dezesseis de Novembro
UF=RS
Provedor=PadraoNacional

[4306379]
Nome=Dilermando de Aguiar
UF=RS
Provedor=PadraoNacional

[4306403]
Nome=Dois Irmaos
UF=RS
Provedor=IPM

[4306429]
Nome=Dois Irmaos das Missoes
UF=RS
Provedor=PadraoNacional

[4306452]
Nome=Dois Lajeados
UF=RS
Provedor=PadraoNacional

[4306502]
; Inclu�do em 03/08/2021
Nome=Dom Feliciano
UF=RS
Provedor=SystemPro
Versao=2.01
ProRecepcionar=https://www.sistemas.domfeliciano.rs.gov.br:8182/NfseService/NfseService
HomRecepcionar=https://www.sistemas.domfeliciano.rs.gov.br:8183/NfseService_Homolog/NfseService_Homolog

[4306551]
Nome=Dom Pedro de Alcantara
UF=RS
Provedor=PadraoNacional

[4306601]
; Inclu�do em 13/10/2022
; Atualizado em 28/12/2022
Nome=Dom Pedrito
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://dompedrito.govbr.cloud/NFSe.Portal.Integracao/services.svc
HomRecepcionar=http://dompedrito.govbr.cloud/NFSe.Portal.Integracao.Teste/services.svc

[4306700]
Nome=Dona Francisca
UF=RS
Provedor=PadraoNacional

[4306734]
Nome=Doutor Mauricio Cardoso
UF=RS
Provedor=ABase
Versao=2.01

[4306759]
Nome=Doutor Ricardo
UF=RS
Provedor=PadraoNacional

[4306767]
Nome=Eldorado do Sul
UF=RS
Provedor=Pronim
ProRecepcaoRPS=
HomRecepcaoRPS=

[4306809]
Nome=Encantado
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://encantado.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://encantado.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://encantado.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://encantado.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://encantado.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://encantado.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologaencan.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologaencan.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologaencan.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologaencan.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologaencan.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologaencan.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4306908]
Nome=Encruzilhada do Sul
UF=RS
Provedor=PadraoNacional

[4306924]
Nome=Engenho Velho
UF=RS
Provedor=PadraoNacional

[4306932]
Nome=Entre-Ijuis
UF=RS
Provedor=PadraoNacional

[4306957]
Nome=Entre Rios do Sul
UF=RS
Provedor=PadraoNacional

[4306973]
Nome=Erebango
UF=RS
Provedor=PadraoNacional

[4307005]
Nome=Erechim
UF=RS
Provedor=SystemPro
Versao=2.01
ProRecepcionar=https://www.nfse.erechim.rs.gov.br:8182/NfseService/NfseService
HomRecepcionar=https://www.nfse.erechim.rs.gov.br:8183/NfseService_Homolog/NfseService_Homolog

[4307054]
Nome=Ernestina
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/ernestina/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/ernestina_homolog/nfse/ws/principal

[4307104]
Nome=Herval
UF=RS
Provedor=PadraoNacional

[4307203]
Nome=Erval Grande
UF=RS
Provedor=PadraoNacional

[4307302]
Nome=Erval Seco
UF=RS
Provedor=PadraoNacional

[4307401]
Nome=Esmeralda
UF=RS
Provedor=PadraoNacional

[4307450]
Nome=Esperanca do Sul
UF=RS
Provedor=PadraoNacional

[4307500]
Nome=Espumoso
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/espumoso/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/espumoso_homolog/nfse/ws/principal

[4307559]
; Inclu�do em 25/05/2021
Nome=Estacao
UF=RS
Provedor=SystemPro
Versao=2.01
ProRecepcionar=https://sistema.pmestacao.com.br:8182/NfseService/NfseService
HomRecepcionar=https://sistema.pmestacao.com.br:8183/NfseService_Homolog/NfseService_Homolog

[4307609]
; Atualizado em 26/10/2021
Nome=Estancia Velha
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=http://estanciavelha.nfse-tecnos.com.br:9087/RecepcaoLoteRPS.asmx
ProConsultarLote=http://estanciavelha.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://estanciavelha.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://estanciavelha.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomConsultarNFSeServicoPrestado=http://estanciavelha.nfse-tecnos.com.br:9094/ConsultaNFSeServicosPrestados.asmx
HomConsultarNFSeServicoTomado=http://estanciavelha.nfse-tecnos.com.br:9093/ConsultaNFSeServicosTomadosIntermediados.asmx
ProCancelarNFSe=http://estanciavelha.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://estanciavelha.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://estanciavelha.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=http://homologaestan.nfse-tecnos.com.br:9087/RecepcaoLoteRPS.asmx
HomConsultarLote=http://homologaestan.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologaestan.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologaestan.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomConsultarNFSeServicoPrestado=http://homologaestan.nfse-tecnos.com.br:9094/ConsultaNFSeServicosPrestados.asmx
HomConsultarNFSeServicoTomado=http://homologaestan.nfse-tecnos.com.br:9093/ConsultaNFSeServicosTomadosIntermediados.asmx
HomCancelarNFSe=http://homologaestan.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologaestan.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologaestan.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4307708]
Nome=Esteio
UF=RS
Provedor=Thema
ProRecepcionar=http://grp.esteio.rs.gov.br/nfse/services/NFSEremessa
ProConsultarSituacao=http://grp.esteio.rs.gov.br/nfse/services/NFSEconsulta
ProConsultarLote=http://grp.esteio.rs.gov.br/nfse/services/NFSEconsulta
ProConsultarNFSeRps=http://grp.esteio.rs.gov.br/nfse/services/NFSEconsulta
ProConsultarNFSe=http://grp.esteio.rs.gov.br/nfse/services/NFSEconsulta
ProCancelarNFSe=http://grp.esteio.rs.gov.br/nfse/services/NFSEcancelamento
ProRecepcionarSincrono=http://grp.esteio.rs.gov.br/nfse/services/NFSEremessa
;
HomRecepcionar=http://grp.esteio.rs.gov.br/nfsehml/services/NFSEremessa
HomConsultarSituacao=http://grp.esteio.rs.gov.br/nfsehml/services/NFSEconsulta
HomConsultarLote=http://grp.esteio.rs.gov.br/nfsehml/services/NFSEconsulta
HomConsultarNFSeRps=http://grp.esteio.rs.gov.br/nfsehml/services/NFSEconsulta
HomConsultarNFSe=http://grp.esteio.rs.gov.br/nfsehml/services/NFSEconsulta
HomCancelarNFSe=http://grp.esteio.rs.gov.br/nfsehml/services/NFSEcancelamento
HomRecepcionarSincrono=http://grp.esteio.rs.gov.br/nfsehml/services/NFSEremessa

[4307807]
Nome=Estrela
UF=RS
Provedor=IPM

[4307815]
Nome=Estrela Velha
UF=RS
Provedor=PadraoNacional

[4307831]
Nome=Eugenio de Castro
UF=RS
Provedor=PadraoNacional

[4307864]
Nome=Fagundes Varela
UF=RS
Provedor=PadraoNacional

[4307906]
Nome=Farroupilha
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://nfse-farroupilha.multi24h.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://nfse-farroupilha.multi24h.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://nfse-farroupilha.multi24h.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://nfse-farroupilha.multi24h.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://nfse-farroupilha.multi24h.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://nfse-farroupilha.multi24h.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologafarroupilha.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologafarroupilha.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologafarroupilha.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologafarroupilha.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologafarroupilha.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologafarroupilha.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4308003]
Nome=Faxinal do Soturno
UF=RS
Provedor=PadraoNacional

[4308052]
Nome=Faxinalzinho
UF=RS
Provedor=PadraoNacional

[4308078]
Nome=Fazenda Vilanova
UF=RS
Provedor=PadraoNacional

[4308102]
; Atualizado em 24/05/2022
Nome=Feliz
UF=RS
Provedor=Pronim
ProRecepcionar=http://feliz-portais.govcloud.com.br/nfse.portal.integracao/Services.svc
HomRecepcionar=
;
ProLinkURL=http://server21.feliz.rs.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true
HomLinkURL=http://server21.feliz.rs.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true

[4308201]
Nome=Flores da Cunha
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://flores.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://flores.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://flores.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://flores.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://flores.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://flores.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologaflo.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologaflo.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologaflo.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologaflo.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologaflo.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologaflo.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4308250]
Nome=Floriano Peixoto
UF=RS
Provedor=PadraoNacional

[4308300]
Nome=Fontoura Xavier
UF=RS
Provedor=PadraoNacional

[4308409]
Nome=Formigueiro
UF=RS
Provedor=PadraoNacional

[4308433]
Nome=Forquetinha
UF=RS
Provedor=PadraoNacional

[4308458]
Nome=Fortaleza dos Valos
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/fortalezadosvalos/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/fortalezadosvalos_homolog/nfse/ws/principal

[4308508]
Nome=Frederico Westphalen
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/frederico/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/frederico_homolog/nfse/ws/principal

[4308607]
Nome=Garibaldi
UF=RS
Provedor=Infisc
Versao=1.01
ProRecepcionar=https://nfse.garibaldi.rs.gov.br/services/nfse/ws/Servicos
HomRecepcionar=https://garibaldi-homol.infisc.com.br/services/nfse/ws/Servicos
;
ProLinkURL=https://nfse.garibaldi.rs.gov.br/portal/consulta.jspx?nf=%ChaveAcesso%
HomLinkURL=https://garibaldi-homol.infisc.com.br/portal/consulta.jspx?nf=%ChaveAcesso%

[4308656]
Nome=Garruchos
UF=RS
Provedor=PadraoNacional

[4308706]
; Inclu�do em 22/11/2021
Nome=Gaurama
UF=RS
Provedor=SystemPro
Versao=2.01
ProRecepcionar=https://sistema.gaurama.rs.gov.br:8182/NfseService/NfseService
HomRecepcionar=https://sistema.gaurama.rs.gov.br:8183/NfseService_Homolog/NfseService_Homolog

[4308805]
Nome=General Camara
UF=RS
Provedor=PadraoNacional

[4308854]
Nome=Gentil
UF=RS
Provedor=PadraoNacional

[4308904]
Nome=Getulio Vargas
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://sistemaspmgv.no-ip.info:8083/nfse.portal.integracao/services.svc
HomRecepcionar=http://sistemaspmgv.no-ip.info:8083/nfse.portal.integracao.teste/services.svc

[4309001]
Nome=Girua
UF=RS
Provedor=ABase
Versao=2.01

[4309050]
; Inclu�do em 29/06/2022
Nome=Glorinha
UF=RS
Provedor=Pronim
ProRecepcionar=http://45.191.68.130/NFSe.Portal.Integracao/Services.svc
HomRecepcionar=http://45.191.68.130/nfse.portal.integracao.teste/services.svc

[4309100]
Nome=Gramado
UF=RS
Provedor=Betha

[4309126]
Nome=Gramado Dos Loureiros
UF=RS
Provedor=PadraoNacional

[4309159]
Nome=Gramado Xavier
UF=RS
Provedor=PadraoNacional

[4309209]
; Atualizado em 26/05/2022
Nome=Gravatai
UF=RS
Provedor=IPM
Versao=1.01
ProRecepcionar=https://ws-gravatai.atende.net:7443/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1 

[4309258]
Nome=Guabiju
UF=RS
Provedor=PadraoNacional

[4309308]
Nome=Guaiba
UF=RS
Provedor=IPM

[4309407]
; Atualizado em 23/08/2022
Nome=Guapore
UF=RS
Provedor=Pronim
Versao=1.00
ProRecepcionar=http://guapore-portais.govcloud.com.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://guapore-portais.govcloud.com.br/nfse.portal.integracao.teste/services.svc

[4309506]
Nome=Guarani das Missoes
UF=RS
Provedor=PadraoNacional

[4309555]
Nome=Harmonia
UF=RS
Provedor=PadraoNacional

[4309571]
Nome=Herveiras
UF=RS
Provedor=PadraoNacional

[4309605]
Nome=Horizontina
UF=RS
Provedor=IPM

[4309654]
Nome=Hulha Negra
UF=RS
Provedor=PadraoNacional

[4309704]
Nome=Humaita
UF=RS
Provedor=PadraoNacional

[4309753]
Nome=Ibarama
UF=RS
Provedor=PadraoNacional

[4309803]
Nome=Ibiaca
UF=RS
Provedor=DataSmart
Versao=2.02
Params=AliasCidade:B_IBIACA

[4309902]
; Inclu�do em 09/08/2022
Nome=Ibiraiaras
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://189.14.227.196:8084/nfse.portal.integracao/services.svc
HomRecepcionar=http://189.14.227.196:8084/nfse.portal.integracao.teste/services.svc

[4309951]
Nome=Ibirapuita
UF=RS
Provedor=PadraoNacional

[4310009]
Nome=Ibiruba
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/ibiruba/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/ibiruba_homolog/nfse/ws/principal

[4310108]
Nome=Igrejinha
UF=RS
Provedor=PadraoNacional

[4310207]
Nome=Ijui
UF=RS
Provedor=Pronim
ProRecepcionar=http://ijui-portais.govcloud.com.br/NFSe.portal.integracao/services.svc
HomRecepcionar=http://ijui-portais.govcloud.com.br/NFSe.portal.integracao.teste/services.svc
;
ProLinkURL=http://server21.ijui.rs.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true
HomLinkURL=http://server21.ijui.rs.gov.br/nfse/VisualizarXMLdaNota.aspx?Prestador=&Numero=%NumeroNFSe%&Codigo=%CodVerif%&page=default.aspx&origin=ConAut&pdf=true

[4310306]
Nome=Ilopolis
UF=RS
Provedor=PadraoNacional

[4310330]
Nome=Imbe
UF=RS
Provedor=Thema
ProRecepcionar=http://nfse.imbe.rs.gov.br/nfse/services/NFSEremessa
ProConsultarSituacao=http://nfse.imbe.rs.gov.br/nfse/services/NFSEconsulta
ProConsultarLote=http://nfse.imbe.rs.gov.br/nfse/services/NFSEconsulta
ProConsultarNFSeRps=http://nfse.imbe.rs.gov.br/nfse/services/NFSEconsulta
ProConsultarNFSe=http://nfse.imbe.rs.gov.br/nfse/services/NFSEconsulta
ProCancelarNFSe=http://nfse.imbe.rs.gov.br/nfse/services/NFSEcancelamento
ProRecepcionarSincrono=http://nfse.imbe.rs.gov.br/nfse/services/NFSEremessa
;
HomRecepcionar=http://nfsehml.imbe.rs.gov.br/nfse/services/NFSEremessa
HomConsultarSituacao=http://nfsehml.imbe.rs.gov.br/nfse/services/NFSEconsulta
HomConsultarLote=http://nfsehml.imbe.rs.gov.br/nfse/services/NFSEconsulta
HomConsultarNFSeRps=http://nfsehml.imbe.rs.gov.br/nfse/services/NFSEconsulta
HomConsultarNFSe=http://nfsehml.imbe.rs.gov.br/nfse/services/NFSEconsulta
HomCancelarNFSe=http://nfsehml.imbe.rs.gov.br/nfse/services/NFSEcancelamento
HomRecepcionarSincrono=http://nfsehml.imbe.rs.gov.br/nfse/services/NFSEremessa

[4310363]
Nome=Imigrante
UF=RS
Provedor=PadraoNacional

[4310405]
Nome=Independencia
UF=RS
Provedor=ABase
Versao=2.01

[4310413]
Nome=Inhacora
UF=RS
Provedor=PadraoNacional

[4310439]
Nome=Ipe
UF=RS
Provedor=Betha

[4310462]
Nome=Ipiranga do Sul
UF=RS
Provedor=PadraoNacional

[4310504]
Nome=Irai
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/irai/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/irai_homolog/nfse/ws/principal

[4310538]
Nome=Itaara
UF=RS
Provedor=PadraoNacional

[4310553]
Nome=Itacurubi
UF=RS
Provedor=PadraoNacional

[4310579]
Nome=Itapuca
UF=RS
Provedor=PadraoNacional

[4310603]
Nome=Itaqui
UF=RS
Provedor=DBSeller
ProRecepcionar=https://nfse.itaqui.rs.gov.br/webservice/index/producao
HomRecepcionar=https://nfse.itaqui.rs.gov.br/webservice/index/homologacao
;
ProNameSpace=https://nfse.itaqui.rs.gov.br/webservice/index/producao
HomNameSpace=https://nfse.itaqui.rs.gov.br/webservice/index/homologacao

[4310652]
Nome=Itati
UF=RS
Provedor=PadraoNacional

[4310702]
Nome=Itatiba do Sul
UF=RS
Provedor=PadraoNacional

[4310751]
Nome=Ivora
UF=RS
Provedor=PadraoNacional

[4310801]
Nome=Ivoti
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://ivoti.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://ivoti.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://ivoti.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://ivoti.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://ivoti.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://ivoti.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologaivo.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologaivo.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologaivo.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologaivo.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologaivo.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologaivo.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4310850]
Nome=Jaboticaba
UF=RS
Provedor=Betha

[4310876]
Nome=Jacuizinho
UF=RS
Provedor=PadraoNacional

[4310900]
Nome=Jacutinga
UF=RS
Provedor=SystemPro
Versao=2.01
ProRecepcionar=https://portal.jacutinga.rs.gov.br:8182/NfseService/NfseService
HomRecepcionar=https://portal.jacutinga.rs.gov.br:8183/NfseService_Homolog/NfseService_Homolog

[4311007]
Nome=Jaguarao
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://sistemas.jaguarao.rs.gov.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://sistemas.jaguarao.rs.gov.br/nfse.portal.integracao.teste/services.svc

[4311106]
Nome=Jaguari
UF=RS
Provedor=PadraoNacional

[4311122]
Nome=Jaquirana
UF=RS
Provedor=PadraoNacional

[4311130]
Nome=Jari
UF=RS
Provedor=PadraoNacional

[4311155]
Nome=Joia
UF=RS
Provedor=PadraoNacional

[4311205]
; Inclu�do em 21/06/2022
Nome=Julio de Castilhos
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://juliodecastilhos-portais.govcloud.com.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://juliodecastilhos-portais.govcloud.com.br/nfse.portal.integracao.teste/services.svc

[4311239]
Nome=Lagoa Bonita do Sul
UF=RS
Provedor=PadraoNacional

[4311254]
Nome=Lagoao
UF=RS
Provedor=PadraoNacional

[4311270]
Nome=Lagoa dos Tres Cantos
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://177.22.91.215/nfse.portal.integracao/services.svc
HomRecepcionar=http://177.22.91.215/nfse.portal.integracao.teste/services.svc

[4311304]
Nome=Lagoa Vermelha
UF=RS
Provedor=Betha

[4311403]
Nome=Lajeado
UF=RS
Provedor=Thema
ProRecepcionar=http://nfse.lajeado.rs.gov.br/thema-nfse/services/NFSEremessa
ProConsultarSituacao=http://nfse.lajeado.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarLote=http://nfse.lajeado.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSeRps=http://nfse.lajeado.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSe=http://nfse.lajeado.rs.gov.br/thema-nfse/services/NFSEconsulta
ProCancelarNFSe=http://nfse.lajeado.rs.gov.br/thema-nfse/services/NFSEcancelamento
ProRecepcionarSincrono=http://nfse.lajeado.rs.gov.br/thema-nfse/services/NFSEremessa
;
HomRecepcionar=http://nfsehml.lajeado.rs.gov.br/thema-nfse/services/NFSEremessa
HomConsultarSituacao=http://nfsehml.lajeado.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarLote=http://nfsehml.lajeado.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSeRps=http://nfsehml.lajeado.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSe=http://nfsehml.lajeado.rs.gov.br/thema-nfse/services/NFSEconsulta
HomCancelarNFSe=http://nfsehml.lajeado.rs.gov.br/thema-nfse/services/NFSEcancelamento
HomRecepcionarSincrono=http://nfsehml.lajeado.rs.gov.br/thema-nfse/services/NFSEremessa

[4311429]
Nome=Lajeado do Bugre
UF=RS
Provedor=PadraoNacional

[4311502]
Nome=Lavras do Sul
UF=RS
Provedor=PadraoNacional

[4311601]
Nome=Liberato Salzano
UF=RS
Provedor=PadraoNacional

[4311627]
Nome=Lindolfo Collor
UF=RS
Provedor=PadraoNacional

[4311643]
Nome=Linha Nova
UF=RS
Provedor=PadraoNacional

[4311700]
Nome=Machadinho
UF=RS
Provedor=PadraoNacional

[4311718]
Nome=Macambara
UF=RS
Provedor=PadraoNacional

[4311734]
Nome=Mampituba
UF=RS
Provedor=PadraoNacional

[4311759]
Nome=Manoel Viana
UF=RS
Provedor=PadraoNacional

[4311775]
Nome=Maquine
UF=RS
Provedor=PadraoNacional

[4311791]
Nome=Marata
UF=RS
Provedor=PadraoNacional

[4311809]
Nome=Marau
UF=RS
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://nfse.pmmarau.com.br:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://nfse.pmmarau.com.br:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[4311908]
Nome=Marcelino Ramos
UF=RS
Provedor=PadraoNacional

[4311981]
Nome=Mariana Pimentel
UF=RS
Provedor=PadraoNacional

[4312005]
Nome=Mariano Moro
UF=RS
Provedor=PadraoNacional

[4312054]
Nome=Marques de Souza
UF=RS
Provedor=PadraoNacional

[4312104]
Nome=Mata
UF=RS
Provedor=PadraoNacional

[4312138]
Nome=Mato Castelhano
UF=RS
Provedor=PadraoNacional

[4312153]
Nome=Mato Leitao
UF=RS
Provedor=PadraoNacional

[4312179]
Nome=Mato Queimado
UF=RS
Provedor=PadraoNacional

[4312203]
Nome=Maximiliano de Almeida
UF=RS
Provedor=PadraoNacional

[4312252]
Nome=Minas do Leao
UF=RS
Provedor=PadraoNacional

[4312302]
Nome=Miraguai
UF=RS
Provedor=PadraoNacional

[4312351]
Nome=Montauri
UF=RS
Provedor=PadraoNacional

[4312377]
Nome=Monte Alegre Dos Campos
UF=RS
Provedor=PadraoNacional

[4312385]
Nome=Monte Belo do Sul
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://montebelo.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://montebelo.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://montebelo.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://montebelo.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://montebelo.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://montebelo.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologamontebelo.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologamontebelo.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologamontebelo.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologamontebelo.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologamontebelo.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologamontebelo.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4312401]
Nome=Montenegro
UF=RS
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://montenegro.govbr.cloud/NFSe.Portal.Integracao/Services.svc
;
HomRecepcionar=http://montenegro.govbr.cloud/NFSe.Portal.Integracao.Teste/services.svc

[4312427]
Nome=Mormaco
UF=RS
Provedor=PadraoNacional

[4312443]
Nome=Morrinhos do Sul
UF=RS
Provedor=PadraoNacional

[4312450]
Nome=Morro Redondo
UF=RS
Provedor=Betha

[4312476]
Nome=Morro Reuter
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://morroreuter.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://morroreuter.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://morroreuter.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://morroreuter.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://morroreuter.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://morroreuter.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologareuter.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologareuter.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologareuter.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologareuter.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologareuter.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologareuter.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4312500]
Nome=Mostardas
UF=RS
Provedor=PadraoNacional

[4312609]
Nome=Mucum
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://mucum.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://mucum.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://mucum.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://mucum.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://mucum.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://mucum.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologamucum.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologamucum.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologamucum.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologamucum.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologamucum.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologamucum.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4312617]
Nome=Muitos Capoes
UF=RS
Provedor=PadraoNacional

[4312625]
Nome=Muliterno
UF=RS
Provedor=PadraoNacional

[4312658]
Nome=Nao-Me-Toque
UF=RS
Provedor=Thema
ProRecepcionar=http://nfse.naometoquers.com.br/thema-nfse/services/NFSEremessa
ProConsultarSituacao=http://nfse.naometoquers.com.br/thema-nfse/services/NFSEconsulta
ProConsultarLote=http://nfse.naometoquers.com.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSeRps=http://nfse.naometoquers.com.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSe=http://nfse.naometoquers.com.br/thema-nfse/services/NFSEconsulta
ProCancelarNFSe=http://nfse.naometoquers.com.br/thema-nfse/services/NFSEcancelamento
ProRecepcionarSincrono=http://nfse.naometoquers.com.br/thema-nfse/services/NFSEremessa
;
HomRecepcionar=http://nfsehml.naometoquers.com.br/thema-nfse/services/NFSEremessa
HomConsultarSituacao=http://nfsehml.naometoquers.com.br/thema-nfse/services/NFSEconsulta
HomConsultarLote=http://nfsehml.naometoquers.com.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSeRps=http://nfsehml.naometoquers.com.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSe=http://nfsehml.naometoquers.com.br/thema-nfse/services/NFSEconsulta
HomCancelarNFSe=http://nfsehml.naometoquers.com.br/thema-nfse/services/NFSEcancelamento
HomRecepcionarSincrono=http://nfsehml.naometoquers.com.br/thema-nfse/services/NFSEremessa

[4312674]
; Inclu�do em 17/09/2021
Nome=Nicolau Vergueiro
UF=RS
Provedor=Citta
Versao=2.03
ProRecepcionar=https://nicolau.cittaweb.com.br/nfse/services/nfseSOAP
;
ProLinkURL=https://nicolau.cittaweb.com.br/nfse/api/public/documento/report/%CodVerif%

[4312708]
Nome=Nonoai
UF=RS
Provedor=DataSmart
Versao=2.02
Params=AliasCidade:NONOAIRS

[4312757]
; Inclu�do em 17/09/2021
Nome=Nova Alvorada
UF=RS
Provedor=Citta
Versao=2.03
ProRecepcionar=https://nalvorada.cittaweb.com.br/nfse/services/nfseSOAP
;
ProLinkURL=https://nalvorada.cittaweb.com.br/nfse/api/public/documento/report/%CodVerif%

[4312807]
; Inclu�do em 17/09/2021
Nome=Nova Araca
UF=RS
Provedor=Citta
Versao=2.03
ProRecepcionar=https://novaaraca.cittaweb.com.br/nfse/services/nfseSOAP
;
ProLinkURL=https://novaaraca.cittaweb.com.br/nfse/api/public/documento/report/%CodVerif%

[4312906]
; Inclu�do em 04/05/2022
Nome=Nova Bassano
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://novabassano.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://novabassano.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://novabassano.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://novabassano.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://novabassano.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://novabassano.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologabassano.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologabassano.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologabassano.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologabassano.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologabassano.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologabassano.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4312955]
Nome=Nova Boa Vista
UF=RS
Provedor=TcheInfo
Versao=2.04

[4313003]
Nome=Nova Brescia
UF=RS
Provedor=PadraoNacional

[4313011]
Nome=Nova Candelaria
UF=RS
Provedor=PadraoNacional

[4313037]
Nome=Nova Esperanca do Sul
UF=RS
Provedor=Betha

[4313060]
Nome=Nova Hartz
UF=RS
Provedor=PadraoNacional

[4313086]
Nome=Nova Padua
UF=RS
Provedor=PadraoNacional

[4313102]
Nome=Nova Palma
UF=RS
Provedor=PadraoNacional

[4313201]
Nome=Nova Petropolis
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://186.195.18.22:8484/nfse.portal.integracao/services.svc
HomRecepcionar=http://186.195.18.18:33894/nfse.portal.integracao.teste/services.svc

[4313300]
Nome=Nova Prata
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://novaprata.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://novaprata.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://novaprata.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://novaprata.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://novaprata.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://novaprata.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologaprata.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologaprata.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologaprata.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologaprata.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologaprata.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologaprata.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4313334]
Nome=Nova Ramada
UF=RS
Provedor=PadraoNacional

[4313359]
Nome=Nova Roma do Sul
UF=RS
Provedor=PadraoNacional

[4313375]
Nome=Nova Santa Rita
UF=RS
Provedor=IPM

[4313391]
Nome=Novo Cabrais
UF=RS
Provedor=PadraoNacional

[4313409]
; Atualizado em 16/02/2022
Nome=Novo Hamburgo
UF=RS
Provedor=ISSNet
Params=NaoDividir100:
;
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/novohamburgo/servicos.asmx

[4313425]
Nome=Novo Machado
UF=RS
Provedor=PadraoNacional

[4313441]
Nome=Novo Tiradentes
UF=RS
Provedor=PadraoNacional

[4313466]
Nome=Novo Xingu
UF=RS
Provedor=PadraoNacional

[4313490]
; Inclu�do em 04/01/2023
Nome=Novo Barreiro
UF=RS
Provedor=TcheInfo
Versao=2.04

[4313508]
; Atualizado em 08/11/2022
Nome=Osorio
UF=RS
Provedor=IPM

[4313607]
Nome=Paim Filho
UF=RS
Provedor=PadraoNacional

[4313656]
Nome=Palmares do Sul
UF=RS
Provedor=PadraoNacional

[4313706]
; Atualizado em 28/12/2021
Nome=Palmeira das Missoes
UF=RS
Provedor=IPM
ProRecepcionar=http://sync-rs.nfs-e.net/datacenter/include/nfw/importa_nfw/nfw_import_upload.php?eletron=1
HomRecepcionar=
;
ProLinkURL=http://sync-rs.nfs-e.net/datacenter/include/nfw/nfw_imp_notas.php?codauten=%CodVerif%
HomLinkURL=http://sync-rs.nfs-e.net/datacenter/include/nfw/nfw_imp_notas.php?codauten=%CodVerif%

[4313805]
Nome=Palmitinho
UF=RS
Provedor=IPM

[4313904]
Nome=Panambi
UF=RS
Provedor=IPM

[4313953]
Nome=Pantano Grande
UF=RS
Provedor=ISSIntel
ProNameSpace=http://pantanogrande-pr.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://pantanogrande-pr.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://pantanogrande-pr.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://pantanogrande-pr.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://pantanogrande-pr.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://pantanogrande-pr.treino-issintel.com.br/webservices/abrasf/api/

[4314001]
; Inclu�do em 17/09/2021
Nome=Parai
UF=RS
Provedor=Citta
Versao=2.03
ProRecepcionar=https://parai.cittaweb.com.br/nfse/services/nfseSOAP
;
ProLinkURL=https://parai.cittaweb.com.br/nfse/api/public/documento/report/%CodVerif%

[4314027]
Nome=Paraiso do Sul
UF=RS
Provedor=PadraoNacional

[4314035]
Nome=Pareci Novo
UF=RS
Provedor=PadraoNacional

[4314050]
Nome=Parobe
UF=RS
Provedor=Infisc
Versao=1.01
ProRecepcionar=https://nfse.parobe.rs.gov.br/services/nfse/ws/Servicos
HomRecepcionar=https://homol.parobe.infisc.com.br/services/nfse/ws/Servicos
;
ProLinkURL=https://nfse.parobe.rs.gov.br/portal/consulta.jspx?nf=%ChaveAcesso%
HomLinkURL=https://homol.parobe.infisc.com.br'/portal/consulta.jspx?nf=%ChaveAcesso%

[4314068]
Nome=Passa Sete
UF=RS
Provedor=PadraoNacional

[4314076]
Nome=Passo do Sobrado
UF=RS
Provedor=PadraoNacional

[4314100]
Nome=Passo Fundo
UF=RS
Provedor=Thema
ProRecepcionar=http://nfse.pmpf.rs.gov.br/thema-nfse/services/NFSEremessa
ProConsultarSituacao=http://nfse.pmpf.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarLote=http://nfse.pmpf.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSeRps=http://nfse.pmpf.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSe=http://nfse.pmpf.rs.gov.br/thema-nfse/services/NFSEconsulta
ProCancelarNFSe=http://nfse.pmpf.rs.gov.br/thema-nfse/services/NFSEcancelamento
ProRecepcionarSincrono=http://nfse.pmpf.rs.gov.br/thema-nfse/services/NFSEremessa
;
HomRecepcionar=http://hmlnfse.pmpf.rs.gov.br/thema-nfse/services/NFSEremessa
HomConsultarSituacao=http://hmlnfse.pmpf.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarLote=http://hmlnfse.pmpf.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSeRps=http://hmlnfse.pmpf.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSe=http://hmlnfse.pmpf.rs.gov.br/thema-nfse/services/NFSEconsulta
HomCancelarNFSe=http://hmlnfse.pmpf.rs.gov.br/thema-nfse/services/NFSEcancelamento
HomRecepcionarSincrono=http://hmlnfse.pmpf.rs.gov.br/thema-nfse/services/NFSEremessa

[4314134]
Nome=Paulo Bento
UF=RS
Provedor=PadraoNacional

[4314159]
Nome=Paverama
UF=RS
Provedor=PadraoNacional

[4314175]
Nome=Pedras Altas
UF=RS
Provedor=PadraoNacional

[4314209]
Nome=Pedro Osorio
UF=RS
Provedor=PadraoNacional

[4314308]
Nome=Pejucara
UF=RS
Provedor=PadraoNacional

[4314407]
; Atualizado em 26/10/2021
Nome=Pelotas
UF=RS
Provedor=Asten
Versao=2.02
ProRecepcionar=https://ws.pelotas.rs.gov.br/wsnfse/NfseWSISAPI.dll/soap/INfse
HomRecepcionar=https://wshomo.pelotas.rs.gov.br/wsnfse/NfseWSISAPI.dll/soap/INfse

[4314423]
Nome=Picada Cafe
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=https://picadacafe-portais.govcloud.com.br/nfse.portal.integracao/services.svc
HomRecepcionar=https://picadacafe-portais.govcloud.com.br/nfse.portal.integracao.teste/services.svc

[4314456]
Nome=Pinhal
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/pinhal/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/pinhal_homolog/nfse/ws/principal

[4314464]
Nome=Pinhal da Serra
UF=RS
Provedor=PadraoNacional

[4314472]
Nome=Pinhal Grande
UF=RS
Provedor=PadraoNacional

[4314498]
Nome=Pinheirinho do Vale
UF=RS
Provedor=PadraoNacional

[4314548]
Nome=Pinto Bandeira
UF=RS
Provedor=PadraoNacional

[4314506]
Nome=Pinheiro Machado
UF=RS
Provedor=PadraoNacional

[4314555]
Nome=Pirapo
UF=RS
Provedor=PadraoNacional

[4314605]
Nome=Piratini
UF=RS
Provedor=PadraoNacional

[4314704]
Nome=Planalto
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/planalto/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/planalto_homolog/nfse/ws/principal

[4314753]
Nome=Poco das Antas
UF=RS
Provedor=PadraoNacional

[4314779]
Nome=Pontao
UF=RS
Provedor=TcheInfo
Versao=2.04

[4314787]
Nome=Ponte Preta
UF=RS
Provedor=PadraoNacional

[4314803]
Nome=Portao
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://portao.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://portao.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://portao.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://portao.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://portao.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://portao.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologapor.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologapor.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologapor.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologapor.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologapor.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologapor.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4314902]
Nome=Porto Alegre
UF=RS
Provedor=BHISS
ProRecepcionar=https://nfe.portoalegre.rs.gov.br/bhiss-ws/nfse
HomRecepcionar=https://nfse-hom.procempa.com.br/bhiss-ws/nfse

[4315008]
Nome=Porto Lucena
UF=RS
Provedor=PadraoNacional

[4315057]
Nome=Porto Maua
UF=RS
Provedor=ABase
Versao=2.01

[4315073]
Nome=Porto Vera Cruz
UF=RS
Provedor=PadraoNacional

[4315107]
Nome=Porto Xavier
UF=RS
Provedor=ABase
Versao=2.01

[4315131]
Nome=Pouso Novo
UF=RS
Provedor=PadraoNacional

[4315149]
Nome=Presidente Lucena
UF=RS
Provedor=PadraoNacional

[4315156]
Nome=Progresso
UF=RS
Provedor=PadraoNacional

[4315172]
Nome=Protasio Alves
UF=RS
Provedor=PadraoNacional

[4315206]
Nome=Putinga
UF=RS
Provedor=PadraoNacional

[4315305]
Nome=Quarai
UF=RS
Provedor=PadraoNacional

[4315313]
Nome=Quatro Irmaos
UF=RS
Provedor=PadraoNacional

[4315321]
Nome=Quevedos
UF=RS
Provedor=PadraoNacional

[4315354]
Nome=Quinze de Novembro
UF=RS
Provedor=PadraoNacional

[4315404]
Nome=Redentora
UF=RS
Provedor=ABase
Versao=2.01

[4315453]
Nome=Relvado
UF=RS
Provedor=PadraoNacional

[4315503]
Nome=Restinga Seca
UF=RS
Provedor=PadraoNacional

[4315552]
Nome=Rio Dos Indios
UF=RS
Provedor=PadraoNacional

[4315602]
; Atualizado em 26/04/2022
Nome=Rio Grande
UF=RS
Provedor=SigISS
ProRecepcionar=https://riogrande.sigiss.com.br/riogrande/ws/sigiss_ws.php
HomRecepcionar=https://testeriogrande.sigiss.com.br/testeriogrande/ws/sigiss_ws.php
;
ProSoapAction=urn:sigiss_ws

[4315701]
Nome=Rio Pardo
UF=RS
Provedor=PadraoNacional

[4315750]
Nome=Riozinho
UF=RS
Provedor=PadraoNacional

[4315800]
Nome=Roca Sales
UF=RS
Provedor=PadraoNacional

[4315909]
Nome=Rodeio Bonito
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/rodeiobonito/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/rodeiobonito_homolog/nfse/ws/principal

[4315958]
Nome=Rolador
UF=RS
Provedor=PadraoNacional

[4316006]
Nome=Rolante
UF=RS
Provedor=Betha

[4316105]
; Inclu�do em 11/07/2022
Nome=Ronda Alta
UF=RS
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://rondaalta-portais.govcloud.com.br/NFSe.portal.integracao/services.svc
HomRecepcionar=http://rondaalta-portais.govcloud.com.br/NFSe.portal.integracao.teste/services.svc

[4316204]
Nome=Rondinha
UF=RS
Provedor=TcheInfo
Versao=2.04

[4316303]
Nome=Roque Gonzales
UF=RS
Provedor=PadraoNacional

[4316402]
Nome=Rosario do Sul
UF=RS
Provedor=PadraoNacional

[4316428]
Nome=Sagrada Familia
UF=RS
Provedor=PadraoNacional

[4316436]
Nome=Saldanha Marinho
UF=RS
Provedor=PadraoNacional

[4316451]
Nome=Salto do Jacui
UF=RS
Provedor=PadraoNacional

[4316477]
Nome=Salvador das Missoes
UF=RS
Provedor=PadraoNacional

[4316501]
Nome=Salvador do Sul
UF=RS
Provedor=PadraoNacional

[4316600]
Nome=Sananduva
UF=RS
Provedor=DataSmart
Versao=2.02
Params=AliasCidade:SANANDUVA

[4316709]
Nome=Santa Barbara do Sul
UF=RS
Provedor=PadraoNacional

[4316733]
Nome=Santa Cecilia do Sul
UF=RS
Provedor=PadraoNacional

[4316758]
Nome=Santa Clara do Sul
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://santaclaradosul.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://santaclaradosul.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://santaclaradosul.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://santaclaradosul.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://santaclaradosul.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://santaclaradosul.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologasclara.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologasclara.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologasclara.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologasclara.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologasclara.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologasclara.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4316808]
Nome=Santa Cruz do Sul
UF=RS
Provedor=Thema
ProRecepcionar=http://nfse.santacruz.rs.gov.br/thema-nfse/services/NFSEremessa
ProConsultarSituacao=http://nfse.santacruz.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarLote=http://nfse.santacruz.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSeRps=http://nfse.santacruz.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSe=http://nfse.santacruz.rs.gov.br/thema-nfse/services/NFSEconsulta
ProCancelarNFSe=http://nfse.santacruz.rs.gov.br/thema-nfse/services/NFSEcancelamento
ProRecepcionarSincrono=http://nfse.santacruz.rs.gov.br/thema-nfse/services/NFSEremessa
;
HomRecepcionar=http://grphml.santacruz.rs.gov.br/thema-nfse-hml/services/NFSEremessa
HomConsultarSituacao=http://grphml.santacruz.rs.gov.br/thema-nfse-hml/services/NFSEconsulta
HomConsultarLote=http://grphml.santacruz.rs.gov.br/thema-nfse-hml/services/NFSEconsulta
HomConsultarNFSeRps=http://grphml.santacruz.rs.gov.br/thema-nfse-hml/services/NFSEconsulta
HomConsultarNFSe=http://grphml.santacruz.rs.gov.br/thema-nfse-hml/services/NFSEconsulta
HomCancelarNFSe=http://grphml.santacruz.rs.gov.br/thema-nfse-hml/services/NFSEcancelamento
HomRecepcionarSincrono=http://grphml.santacruz.rs.gov.br/thema-nfse-hml/services/NFSEremessa

[4316907]
Nome=Santa Maria
UF=RS
Provedor=ISSNet
Params=NaoDividir100:
;
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/santamaria/servicos.asmx

[4316956]
Nome=Santa Maria do Herval
UF=RS
Provedor=PadraoNacional

[4316972]
Nome=Santa Margarida do Sul
UF=RS
Provedor=PadraoNacional

[4317004]
Nome=Santana da Boa Vista
UF=RS
Provedor=PadraoNacional

[4317103]
Nome=Santana do Livramento
UF=RS
Provedor=DBSeller
ProRecepcionar=http://nfe.sdolivramento.com.br/webservice/index/producao
HomRecepcionar=http://hom.nfe.sdolivramento.com.br/webservice/index/homologacao
;
ProNameSpace=http://nfe.sdolivramento.com.br/webservice/index/producao
HomNameSpace=http://hom.nfe.sdolivramento.com.br/webservice/index/homologacao

[4317202]
; Atualizado em 22/06/2022
Nome=Santa Rosa
UF=RS
Provedor=IPM

[4317251]
Nome=Santa Tereza
UF=RS
Provedor=PadraoNacional

[4317301]
Nome=Santa Vitoria do Palmar
UF=RS
Provedor=PadraoNacional

[4317400]
; Atualizado em 17/06/2022
Nome=Santiago
UF=RS
Provedor=Infisc
Versao=2.03
ProRecepcionar=https://nfse.santiago.rs.gov.br/services/nfse/ws/Servicos
HomRecepcionar=https://santiago-homol.infisc.com.br/services/nfse/ws/Servicos

[4317509]
Nome=Santo Angelo
UF=RS
Provedor=ABase
Versao=2.01

[4317558]
Nome=Santo Antonio do Palma
UF=RS
Provedor=PadraoNacional

[4317608]
Nome=Santo Antonio da Patrulha
UF=RS
Provedor=Thema
ProRecepcionar=http://nfse.pmsap.com.br/thema-nfse/services/NFSEremessa
ProConsultarSituacao=http://nfse.pmsap.com.br/thema-nfse/services/NFSEconsulta
ProConsultarLote=http://nfse.pmsap.com.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSeRps=http://nfse.pmsap.com.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSe=http://nfse.pmsap.com.br/thema-nfse/services/NFSEconsulta
ProCancelarNFSe=http://nfse.pmsap.com.br/thema-nfse/services/NFSEcancelamento
ProRecepcionarSincrono=http://nfse.pmsap.com.br/thema-nfse/services/NFSEremessa
;
HomRecepcionar=http://nfsehomologacao.pmsap.com.br/nfsehml/services/NFSEremessa
HomConsultarSituacao=http://nfsehomologacao.pmsap.com.br/nfsehml/services/NFSEconsulta
HomConsultarLote=http://nfsehomologacao.pmsap.com.br/nfsehml/services/NFSEconsulta
HomConsultarNFSeRps=http://nfsehomologacao.pmsap.com.br/nfsehml/services/NFSEconsulta
HomConsultarNFSe=http://nfsehomologacao.pmsap.com.br/nfsehml/services/NFSEconsulta
HomCancelarNFSe=http://nfsehomologacao.pmsap.com.br/nfsehml/services/NFSEcancelamento
HomRecepcionarSincrono=http://nfsehomologacao.pmsap.com.br/nfsehml/services/NFSEremessa

[4317707]
Nome=Santo Antonio das Missoes
UF=RS
Provedor=ABase
Versao=2.01

[4317756]
Nome=Santo Antonio do Planalto
UF=RS
Provedor=TcheInfo
Versao=2.04

[4317806]
Nome=Santo Augusto
UF=RS
Provedor=Betha

[4317905]
Nome=Santo Cristo
UF=RS
Provedor=ABase
Versao=2.01

[4317954]
Nome=Santo Expedito do Sul
UF=RS
Provedor=PadraoNacional

[4318002]
Nome=Sao Borja
UF=RS
Provedor=DBSeller
ProRecepcionar=https://nfse.saoborja.rs.gov.br/webservice/index/producao
HomRecepcionar=http://hom.nfse.saoborja.rs.gov.br:81/webservice/index/homologacao
;
ProNameSpace=https://nfse.saoborja.rs.gov.br/webservice/index/producao
HomNameSpace=http://hom.nfse.saoborja.rs.gov.br:81/webservice/index/homologacao

[4318051]
; Inclu�do em 17/09/2021
Nome=Sao Domingos do Sul
UF=RS
Provedor=Citta
Versao=2.03
ProRecepcionar=https://sds.cittaweb.com.br/nfse/services/nfseSOAP
;
ProLinkURL=https://sds.cittaweb.com.br/nfse/api/public/documento/report/%CodVerif%

[4318101]
Nome=Sao Francisco de Assis
UF=RS
Provedor=PadraoNacional

[4318200]
Nome=Sao Francisco de Paula
UF=RS
Provedor=Thema
ProRecepcionar=http://srv-java-prd.pmsfp.oc.cloud.thema.inf.br/nfse/services/NFSEremessa
ProConsultarSituacao=http://srv-java-prd.pmsfp.oc.cloud.thema.inf.br/nfse/services/NFSEconsulta
ProConsultarLote=http://srv-java-prd.pmsfp.oc.cloud.thema.inf.br/nfse/services/NFSEconsulta
ProConsultarNFSeRps=http://srv-java-prd.pmsfp.oc.cloud.thema.inf.br/nfse/services/NFSEconsulta
ProConsultarNFSe=http://srv-java-prd.pmsfp.oc.cloud.thema.inf.br/nfse/services/NFSEconsulta
ProCancelarNFSe=http://srv-java-prd.pmsfp.oc.cloud.thema.inf.br/nfse/services/NFSEcancelamento
ProRecepcionarSincrono=http://srv-java-prd.pmsfp.oc.cloud.thema.inf.br/nfse/services/NFSEremessa

[4318309]
Nome=Sao Gabriel
UF=RS
Provedor=GovBR
ProRecepcionar=http://191.36.145.163/nfsews/services.svc
HomRecepcionar=http://191.36.145.163/nfsewsteste/services.svc

[4318408]
Nome=Sao Jeronimo
UF=RS
Provedor=Betha

[4318424]
; Inclu�do em 09/08/2022
Nome=Sao Joao da Urtiga
UF=RS
Provedor=Citta
Versao=2.03
ProRecepcionar=https://sjurtiga.cittaweb.com.br/nfse/services/nfseSOAP
;
ProLinkURL=https://sjurtiga.cittaweb.com.br/nfse/api/public/documento/report/%CodVerif%

[4318432]
Nome=Sao Joao do Polesine
UF=RS
Provedor=PadraoNacional

[4318440]
Nome=Sao Jorge
UF=RS
Provedor=PadraoNacional

[4318457]
Nome=Sao Jose das Missoes
UF=RS
Provedor=TcheInfo
Versao=2.04

[4318465]
Nome=Sao Jose do Herval
UF=RS
Provedor=PadraoNacional

[4318481]
Nome=Sao Jose do Hortencio
UF=RS
Provedor=PadraoNacional

[4318499]
Nome=Sao Jose do Inhacora
UF=RS
Provedor=PadraoNacional

[4318507]
Nome=Sao Jose do Norte
UF=RS
Provedor=PadraoNacional

[4318606]
Nome=Sao Jose do Ouro
UF=RS
Provedor=DataSmart
Versao=2.02
Params=AliasCidade:B_SJOSE

[4318614]
Nome=Sao Jose do Sul
UF=RS
Provedor=PadraoNacional

[4318622]
Nome=Sao Jose Dos Ausentes
UF=RS
Provedor=PadraoNacional

[4318705]
Nome=Sao Leopoldo
UF=RS
Provedor=Thema
ProRecepcionar=https://nfe.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEremessa
ProConsultarSituacao=https://nfe.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarLote=https://nfe.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSeRps=https://nfe.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSe=https://nfe.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEconsulta
ProCancelarNFSe=https://nfe.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEcancelamento
ProRecepcionarSincrono=https://nfe.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEremessa
;
HomRecepcionar=http://nfehomologacao.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEremessa
HomConsultarSituacao=http://nfehomologacao.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarLote=http://nfehomologacao.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSeRps=http://nfehomologacao.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSe=http://nfehomologacao.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEconsulta
HomCancelarNFSe=http://nfehomologacao.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEcancelamento
HomRecepcionarSincrono=http://nfehomologacao.saoleopoldo.rs.gov.br/thema-nfse/services/NFSEremessa

[4318804]
Nome=Sao Lourenco do Sul
UF=RS
Provedor=PadraoNacional

[4318903]
Nome=Sao Luiz Gonzaga
UF=RS
Provedor=ABase
Versao=2.01

[4319000]
Nome=Sao Marcos
UF=RS
Provedor=PadraoNacional

[4319109]
Nome=Sao Martinho
UF=RS
Provedor=PadraoNacional

[4319125]
Nome=Sao Martinho da Serra
UF=RS
Provedor=PadraoNacional

[4319158]
Nome=Sao Miguel das Missoes
UF=RS
Provedor=ABase
Versao=2.01

[4319208]
Nome=Sao Nicolau
UF=RS
Provedor=PadraoNacional

[4319307]
Nome=Sao Paulo das Missoes
UF=RS
Provedor=PadraoNacional

[4319356]
Nome=Sao Pedro da Serra
UF=RS
Provedor=PadraoNacional

[4319364]
Nome=Sao Pedro das Missoes
UF=RS
Provedor=PadraoNacional

[4319372]
Nome=Sao Pedro do Butia
UF=RS
Provedor=Betha

[4319406]
Nome=Sao Pedro do Sul
UF=RS
Provedor=PadraoNacional

[4319505]
Nome=Sao Sebastiao do Cai
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://saosebastiaodocai.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://saosebastiaodocai.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://saosebastiaodocai.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://saosebastiaodocai.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://saosebastiaodocai.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://saosebastiaodocai.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologacai.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologacai.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologacai.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologacai.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologacai.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologacai.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4319604]
Nome=Sao Sepe
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://saosepe-portais.govcloud.com.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://177.8.37.253/nfse.portal.integracao.teste/services.svc

[4319703]
Nome=Sao Valentim
UF=RS
Provedor=PadraoNacional

[4319711]
Nome=Sao Valentim do Sul
UF=RS
Provedor=PadraoNacional

[4319737]
Nome=Sao Valerio do Sul
UF=RS
Provedor=PadraoNacional

[4319752]
Nome=Sao Vendelino
UF=RS
Provedor=PadraoNacional

[4319802]
Nome=Sao Vicente do Sul
UF=RS
Provedor=PadraoNacional

[4319901]
Nome=Sapiranga
UF=RS
Provedor=DBSeller
ProRecepcionar=https://nfe.sapiranga.rs.gov.br/webservice/index/producao
HomRecepcionar=http://hom.nfe.sapiranga.rs.gov.br/webservice/index/homologacao
;
ProNameSpace=https://nfe.sapiranga.rs.gov.br/webservice/index/producao
HomNameSpace=http://hom.nfe.sapiranga.rs.gov.br/webservice/index/homologacao

[4320008]
Nome=Sapucaia do Sul
UF=RS
Provedor=Infisc
Versao=2.01
ProRecepcionar=https://nfse.sapucaiadosul.rs.gov.br/services/nfse/ws/Servicos
HomRecepcionar=https://sapucaiadosul-homol.infisc.com.br/services/nfse/ws/Servicos

[4320107]
; Atualizado em 27/09/2021
Nome=Sarandi
UF=RS
Provedor=TcheInfo
Versao=2.04

[4320206]
; Atualizado em 19/09/2021
Nome=Seberi
UF=RS
Provedor=IPM
ProRecepcionar=http://sync-rs.nfs-e.net/datacenter/include/nfw/importa_nfw/nfw_import_upload.php?eletron=1
HomRecepcionar=http://sync-rs.nfs-e.net/datacenter/include/nfw/importa_nfw/nfw_import_upload.php?eletron=1
;
ProLinkURL=http://sync-rs.nfs-e.net/datacenter/include/nfw/nfw_imp_notas.php?codauten=%CodVerif%
HomLinkURL=http://sync-rs.nfs-e.net/datacenter/include/nfw/nfw_imp_notas.php?codauten=%CodVerif%

[4320230]
Nome=Sede Nova
UF=RS
Provedor=PadraoNacional

[4320263]
Nome=Segredo
UF=RS
Provedor=PadraoNacional

[4320305]
Nome=Selbach
UF=RS
Provedor=PadraoNacional

[4320321]
Nome=Senador Salgado Filho
UF=RS
Provedor=PadraoNacional

[4320354]
Nome=Sentinela do Sul
UF=RS
Provedor=PadraoNacional

[4320404]
Nome=Serafina Correa
UF=RS
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://177.20.225.197:8081/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://177.20.225.197:8081/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[4320453]
Nome=Serio
UF=RS
Provedor=PadraoNacional

[4320503]
Nome=Sertao
UF=RS
Provedor=PadraoNacional

[4320552]
Nome=Sertao Santana
UF=RS
Provedor=Betha

[4320578]
Nome=Sete de Setembro
UF=RS
Provedor=PadraoNacional

[4320602]
Nome=Severiano de Almeida
UF=RS
Provedor=PadraoNacional

[4320651]
Nome=Silveira Martins
UF=RS
Provedor=PadraoNacional

[4320677]
Nome=Sinimbu
UF=RS
Provedor=PadraoNacional

[4320701]
Nome=Sobradinho
UF=RS
Provedor=PadraoNacional

[4320800]
Nome=Soledade
UF=RS
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://186.237.127.134/nfsews/services.svc
HomRecepcionar=

[4320859]
Nome=Tabai
UF=RS
Provedor=PadraoNacional

[4320909]
Nome=Tapejara
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://tapejara.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://tapejara.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://tapejara.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://tapejara.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://tapejara.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://tapejara.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologatapejara.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologatapejara.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologatapejara.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologatapejara.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologatapejara.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologatapejara.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4321006]
Nome=Tapera
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://177.22.94.131:8081/nfse.portal.integracao/services.svc
HomRecepcionar=http://177.22.94.131:8081/nfse.portal.integracao.teste/services.svc

[4321105]
Nome=Tapes
UF=RS
Provedor=PadraoNacional

[4321204]
Nome=Taquara
UF=RS
Provedor=Thema
ProRecepcionar=http://nfse.taquara.rs.gov.br/thema-nfse/services/NFSEremessa
ProConsultarSituacao=http://nfse.taquara.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarLote=http://nfse.taquara.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSeRps=http://nfse.taquara.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSe=http://nfse.taquara.rs.gov.br/thema-nfse/services/NFSEconsulta
ProCancelarNFSe=http://nfse.taquara.rs.gov.br/thema-nfse/services/NFSEcancelamento
ProRecepcionarSincrono=http://nfse.taquara.rs.gov.br/thema-nfse/services/NFSEremessa
;
HomRecepcionar=http://nfsehomologacao.taquara.rs.gov.br/thema-nfse/services/NFSEremessa
HomConsultarSituacao=http://nfsehomologacao.taquara.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarLote=http://nfsehomologacao.taquara.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSeRps=http://nfsehomologacao.taquara.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSe=http://nfsehomologacao.taquara.rs.gov.br/thema-nfse/services/NFSEconsulta
HomCancelarNFSe=http://nfsehomologacao.taquara.rs.gov.br/thema-nfse/services/NFSEcancelamento
HomRecepcionarSincrono=http://nfsehomologacao.taquara.rs.gov.br/thema-nfse/services/NFSEremessa

[4321303]
; Atualizado em 08/03/2022
Nome=Taquari
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/taquari/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/taquari_homolog/nfse/ws/principal

[4321329]
Nome=Taquarucu do Sul
UF=RS
Provedor=PadraoNacional

[4321352]
Nome=Tavares
UF=RS
Provedor=PadraoNacional

[4321402]
Nome=Tenente Portela
UF=RS
Provedor=Betha

[4321436]
; Inclu�do em 05/08/2022
Nome=Terra de Areia 
UF=RS
Provedor=Tecnos
Versao=2.01
;
ProRecepcionar=*
ProConsultarLote=http://terradeareia.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://terradeareia.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://terradeareia.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://terradeareia.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://terradeareia.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://terradeareia.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologaterraareia.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologaterraareia.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologaterraareia.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologaterraareia.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologaterraareia.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologaterraareia.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4321451]
Nome=Teutonia
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://teutonia.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://teutonia.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://teutonia.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://teutonia.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://teutonia.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://teutonia.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologateuto.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologateuto.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologateuto.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologateuto.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologateuto.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologateuto.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4321469]
Nome=Tio Hugo
UF=RS
Provedor=Digifred
Versao=2.00
ProRecepcionar=https://sim.digifred.net.br/tiohugo/nfse/ws/principal
HomRecepcionar=https://sim.digifred.net.br/tiohugo_homolog/nfse/ws/principal

[4321477]
Nome=Tiradentes do Sul
UF=RS
Provedor=PadraoNacional

[4321493]
Nome=Toropi
UF=RS
Provedor=PadraoNacional

[4321501]
Nome=Torres
UF=RS
Provedor=Betha

[4321600]
Nome=Tramandai
UF=RS
Provedor=DBSeller
ProRecepcionar=http://nfse.tramandai.rs.gov.br/webservice/index/producao
HomRecepcionar=http://hom.nfse.tramandai.rs.gov.br/webservice/index/homologacao
;
ProNameSpace=http://nfse.tramandai.rs.gov.br/webservice/index/producao
HomNameSpace=http://hom.nfse.tramandai.rs.gov.br/webservice/index/homologacao

[4321626]
Nome=Travesseiro
UF=RS
Provedor=PadraoNacional

[4321634]
Nome=Tres Arroios
UF=RS
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://portal.pmtresarroios.com.br:8888/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://portal.pmtresarroios.com.br:8888/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[4321667]
; Inclu�do em 28/09/2022
Nome=Tres Cachoeiras
UF=RS
Provedor=Betha

[4321709]
Nome=Tres Coroas
UF=RS
Provedor=Pronim
ProRecepcionar=http://nfse.pmtcoroas.com.br/nfsews/Services.svc
HomRecepcionar=http://nfseteste.pmtcoroas.com.br/nfsewsteste/Services.svc

[4321808]
Nome=Tres de Maio
UF=RS
Provedor=ABase
Versao=2.01

[4321832]
Nome=Tres Forquilhas
UF=RS
Provedor=PadraoNacional

[4321857]
Nome=Tres Palmeiras
UF=RS
Provedor=PadraoNacional

[4321907]
Nome=Tres Passos
UF=RS
Provedor=Betha

[4321956]
Nome=Trindade do Sul
UF=RS
Provedor=DataSmart
Versao=2.02
Params=AliasCidade:B_TRINDADE

[4322004]
; Atualizado em 11/11/2022
Nome=Triunfo
UF=RS
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://triunfo-portais.govcloud.com.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://triunfo-portais.govcloud.com.br/nfse.portal.integracao.teste/services.svc

[4322103]
Nome=Tucunduva
UF=RS
Provedor=ABase
Versao=2.01

[4322152]
Nome=Tunas
UF=RS
Provedor=PadraoNacional

[4322186]
Nome=Tupanci do Sul
UF=RS
Provedor=PadraoNacional

[4322202]
Nome=Tupancireta
UF=RS
Provedor=PadraoNacional

[4322251]
Nome=Tupandi
UF=RS
Provedor=PadraoNacional

[4322301]
Nome=Tuparendi
UF=RS
Provedor=ABase
Versao=2.01

[4322327]
Nome=Turucu
UF=RS
Provedor=PadraoNacional

[4322343]
Nome=Ubiretama
UF=RS
Provedor=PadraoNacional

[4322350]
Nome=Uniao da Serra
UF=RS
Provedor=PadraoNacional

[4322376]
Nome=Unistalda
UF=RS
Provedor=PadraoNacional

[4322400]
Nome=Uruguaiana
UF=RS
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://uruguaiana-portais.govcloud.com.br/nfse.portal.integracao/services.svc
HomRecepcionar=http://uruguaiana-portais.govcloud.com.br/nfse.portal.integracao.teste/services.svc

[4322509]
Nome=Vacaria
UF=RS
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://200.170.163.253:8082/nfse.portal.integracao/services.svc
HomRecepcionar=http://200.170.163.253:8082/nfse.portal.integracao.teste/services.svc

[4322525]
Nome=Vale Verde
UF=RS
Provedor=PadraoNacional

[4322533]
Nome=Vale do Sol
UF=RS
Provedor=PadraoNacional

[4322541]
Nome=Vale Real
UF=RS
Provedor=PadraoNacional

[4322558]
; Inclu�do em 17/09/2021
Nome=Vanini
UF=RS
Provedor=Citta
Versao=2.03
ProRecepcionar=https://vanini.cittaweb.com.br/nfse/services/nfseSOAP
;
ProLinkURL=https://vanini.cittaweb.com.br/nfse/api/public/documento/report/%CodVerif%

[4322608]
Nome=Venancio Aires
UF=RS
Provedor=Thema
ProRecepcionar=http://nfe.venancioaires.rs.gov.br/thema-nfse/services/NFSEremessa
ProConsultarSituacao=http://nfe.venancioaires.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarLote=http://nfe.venancioaires.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSeRps=http://nfe.venancioaires.rs.gov.br/thema-nfse/services/NFSEconsulta
ProConsultarNFSe=http://nfe.venancioaires.rs.gov.br/thema-nfse/services/NFSEconsulta
ProCancelarNFSe=http://nfe.venancioaires.rs.gov.br/thema-nfse/services/NFSEcancelamento
ProRecepcionarSincrono=http://nfe.venancioaires.rs.gov.br/thema-nfse/services/NFSEremessa
;
HomRecepcionar=http://nfehml.venancioaires.rs.gov.br/thema-nfse/services/NFSEremessa
HomConsultarSituacao=http://nfehml.venancioaires.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarLote=http://nfehml.venancioaires.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSeRps=http://nfehml.venancioaires.rs.gov.br/thema-nfse/services/NFSEconsulta
HomConsultarNFSe=http://nfehml.venancioaires.rs.gov.br/thema-nfse/services/NFSEconsulta
HomCancelarNFSe=http://nfehml.venancioaires.rs.gov.br/thema-nfse/services/NFSEcancelamento
HomRecepcionarSincrono=http://nfehml.venancioaires.rs.gov.br/thema-nfse/services/NFSEremessa

[4322707]
; Inclu�do em 29/10/2021
; Atualizado em 28/04/2022
Nome=Vera Cruz
UF=RS
Provedor=IPM
Versao=1.01
ProRecepcionar=https://veracruz.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=padrao&eletron=1
HomRecepcionar=https://homologacao.atende.net/atende.php?pg=rest&service=WNERestServiceNFSe&cidade=integracoes&eletron=1

[4322806]
Nome=Veranopolis
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://veranopolis.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://veranopolis.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://veranopolis.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://veranopolis.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://veranopolis.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://veranopolis.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologaver.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologaver.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologaver.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologaver.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologaver.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologaver.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4322855]
Nome=Vespasiano Correa
UF=RS
Provedor=PadraoNacional

[4322905]
Nome=Viadutos
UF=RS
Provedor=PadraoNacional

[4323002]
; Atualizado em 21/09/2021
Nome=Viamao
UF=RS
Provedor=Pronim
Versao=2.02
ProRecepcionar=http://viamao-portais.govcloud.com.br/NFSe.portal.integracao/services.svc
HomRecepcionar=http://viamao-portais.govcloud.com.br/NFSe.portal.integracao.teste/services.svc

[4323101]
Nome=Vicente Dutra
UF=RS
Provedor=PadraoNacional

[4323200]
Nome=Victor Graeff
UF=RS
Provedor=PadraoNacional

[4323309]
Nome=Vila Flores
UF=RS
Provedor=PadraoNacional

[4323358]
Nome=Vila Langaro
UF=RS
Provedor=DataSmart
Versao=2.02
Params=AliasCidade:B_LANGARO

[4323408]
Nome=Vila Maria
UF=RS
Provedor=PadraoNacional

[4323457]
Nome=Vila Nova do Sul
UF=RS
Provedor=PadraoNacional

[4323507]
Nome=Vista Alegre
UF=RS
Provedor=Betha

[4323606]
Nome=Vista Alegre do Prata
UF=RS
Provedor=PadraoNacional

[4323705]
Nome=Vista Gaucha
UF=RS
Provedor=PadraoNacional

[4323754]
Nome=Vitoria das Missoes
UF=RS
Provedor=PadraoNacional

[4323770]
; Inclu�do em 24/11/2021
Nome=Westfalia
UF=RS
Provedor=Tecnos
Versao=2.01
ProRecepcionar=*
ProConsultarLote=http://westfalia.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
ProConsultarNFSeRps=http://westfalia.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
ProConsultarNFSePorFaixa=http://westfalia.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
ProCancelarNFSe=http://westfalia.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
ProRecepcionarSincrono=http://westfalia.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
ProGerarNFSe=*
ProSubstituirNFSe=http://westfalia.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx
;
HomRecepcionar=*
HomConsultarLote=http://homologawestfalia.nfse-tecnos.com.br:9097/ConsultaLoteRPS.asmx
HomConsultarNFSeRps=http://homologawestfalia.nfse-tecnos.com.br:9095/ConsultaNFSePorRPS.asmx
HomConsultarNFSePorFaixa=http://homologawestfalia.nfse-tecnos.com.br:9096/ConsultaNFSePorFaixa.asmx
HomCancelarNFSe=http://homologawestfalia.nfse-tecnos.com.br:9098/CancelamentoNFSe.asmx
HomRecepcionarSincrono=http://homologawestfalia.nfse-tecnos.com.br:9091/EnvioLoteRPSSincrono.asmx
HomGerarNFSe=*
HomSubstituirNFSe=http://homologawestfalia.nfse-tecnos.com.br:9086/SubstituicaoNFSe.asmx

[4323804]
Nome=Xangri-La
UF=RS
Provedor=PadraoNacional

[5000203]
Nome=Agua Clara
UF=MS
Provedor=PadraoNacional

[5000252]
Nome=Alcinopolis
UF=MS
Provedor=PadraoNacional

[5000609]
Nome=Amambai
UF=MS
Provedor=PadraoNacional

[5000708]
Nome=Anastacio
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/anastacio/servicos.asmx

[5000807]
Nome=Anaurilandia
UF=MS
Provedor=PadraoNacional

[5000856]
Nome=Angelica
UF=MS
Provedor=PadraoNacional

[5000906]
Nome=Antonio Joao
UF=MS
Provedor=PadraoNacional

[5001003]
Nome=Aparecida do Taboado
UF=MS
Provedor=PadraoNacional

[5001102]
; Atualizado em 06/10/2022
Nome=Aquidauana
UF=MS
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://pmaquidauana.rcmsuporte.com.br:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://pmaquidauana.rcmsuporte.com.br:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5001243]
Nome=Aral Moreira
UF=MS
Provedor=Betha

[5001508]
Nome=Bandeirantes
UF=MS
Provedor=PadraoNacional

[5001904]
Nome=Bataguassu
UF=MS
Provedor=PadraoNacional

[5002001]
Nome=Bataypora
UF=MS
Provedor=Betha

[5002100]
Nome=Bela Vista
UF=MS
Provedor=NEAInformatica
Versao=2.00
ProRecepcionar=http://nfse.belavista.ms.gov.br/pmbvanfseletronica/ServicoWeb
HomRecepcionar=http://nfse.belavista.ms.gov.br/pmbvanfseletronica_homolog/ServicoWeb

[5002159]
Nome=Bodoquena
UF=MS
Provedor=PadraoNacional

[5002209]
Nome=Bonito
UF=MS
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://45.188.183.155:8089/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://45.188.183.155:8089/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5002308]
Nome=Brasilandia
UF=MS
Provedor=NEAInformatica
Versao=2.00
ProRecepcionar=http://nfse.brasilandia.ms.gov.br/pmbsanfseletronica/ServicoWeb
HomRecepcionar=http://nfse.brasilandia.ms.gov.br/pmbsanfseletronica_homolog/ServicoWeb

[5002407]
Nome=Caarapo
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/caarapo/servicos.asmx

[5002605]
Nome=Camapua
UF=MS
Provedor=PadraoNacional

[5002704]
Nome=Campo Grande
UF=MS
Provedor=ISSDSF
;
ProRecepcionar=http://issdigital.pmcg.ms.gov.br/WsNFe2/LoteRps.jws
;
ProNameSpace=http://proces.wsnfe2.dsfnet.com.br
HomNameSpace=http://proces.wsnfe2.dsfnet.com.br

[5002803]
Nome=Caracol
UF=MS
Provedor=PadraoNacional

[5002902]
Nome=Cassilandia
UF=MS
Provedor=PadraoNacional

[5002951]
Nome=Chapadao do Sul
UF=MS
Provedor=PadraoNacional

[5003108]
Nome=Corguinho
UF=MS
Provedor=PadraoNacional

[5003157]
Nome=Coronel Sapucaia
UF=MS
Provedor=Betha

[5003207]
Nome=Corumba
UF=MS
Provedor=NEAInformatica
Versao=2.00
; a URL de homologacao nao esta correta
ProRecepcionar=http://nfse.corumba.ms.gov.br/pmcrbnfseletronica/ServicoWeb
HomRecepcionar=http://nfse.web.neainformatica.com.br:16580/pmcrbnfseletronica_homolog/ServicoWeb

[5003256]
Nome=Costa Rica
UF=MS
Provedor=PadraoNacional

[5003306]
Nome=Coxim
UF=MS
Provedor=PadraoNacional

[5003454]
Nome=Deodapolis
UF=MS
Provedor=Betha

[5003488]
Nome=Dois Irmaos do Buriti
UF=MS
Provedor=PadraoNacional

[5003504]
Nome=Douradina
UF=MS
Provedor=PadraoNacional

[5003702]
Nome=Dourados
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/dourados/servicos.asmx

[5003751]
Nome=Eldorado
UF=MS
Provedor=PadraoNacional

[5003801]
Nome=Fatima do Sul
UF=MS
Provedor=Betha

[5003900]
Nome=Figueirao
UF=MS
Provedor=PadraoNacional

[5004007]
Nome=Gloria de Dourados
UF=MS
Provedor=PadraoNacional

[5004106]
Nome=Guia Lopes da Laguna
UF=MS
Provedor=NEAInformatica
Versao=2.00
ProRecepcionar=http://nfse.guialopesdalaguna.ms.gov.br/pmgllnfseletronica/ServicoWeb
HomRecepcionar=http://nfse.guialopesdalaguna.ms.gov.br/pmgllnfseletronica_homolog/ServicoWeb

[5004304]
Nome=Iguatemi
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/iguatemi/servicos.asmx

[5004403]
Nome=Inocencia
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/inocencio/servicos.asmx

[5004502]
Nome=Itapora
UF=MS
Provedor=PadraoNacional

[5004601]
Nome=Itaquirai
UF=MS
Provedor=Betha

[5004700]
Nome=Ivinhema
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/ivinhema/servicos.asmx

[5004809]
Nome=Japora
UF=MS
Provedor=PadraoNacional

[5004908]
Nome=Jaraguari
UF=MS
Provedor=PadraoNacional

[5005004]
; Atualizado em 28/09/2022
Nome=Jardim
UF=MS
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://issweb.jardim.ms.gov.br:8088/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://issweb.jardim.ms.gov.br:8088/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5005103]
Nome=Jatei
UF=MS
Provedor=PadraoNacional

[5005152]
Nome=Juti
UF=MS
Provedor=PadraoNacional

[5005202]
Nome=Ladario
UF=MS
Provedor=PadraoNacional

[5005251]
Nome=Laguna Carapa
UF=MS
Provedor=PadraoNacional

[5005400]
Nome=Maracaju
UF=MS
Provedor=Betha

[5005608]
Nome=Miranda
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/miranda/servicos.asmx

[5005681]
Nome=Mundo Novo
UF=MS
Provedor=Betha

[5005707]
Nome=Navirai
UF=MS
Provedor=Pronim
Versao=2.03
ProRecepcionar=http://187.6.10.202:9191/nfse.portal.integracao/services.svc
HomRecepcionar=http://187.6.10.202:9191/nfse.portal.integracao.teste/services.svc

[5005806]
Nome=Nioaque
UF=MS
Provedor=PadraoNacional

[5006002]
Nome=Nova Alvorada do Sul
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/novaalvoradadosul/servicos.asmx

[5006200]
Nome=Nova Andradina
UF=MS
Provedor=Betha

[5006259]
Nome=Novo Horizonte do Sul
UF=MS
Provedor=Betha

[5006275]
Nome=Paraiso das Aguas
UF=MS
Provedor=PadraoNacional

[5006309]
Nome=Paranaiba
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/paranaiba/servicos.asmx

[5006358]
Nome=Paranhos
UF=MS
Provedor=PadraoNacional

[5006408]
Nome=Pedro Gomes
UF=MS
Provedor=PadraoNacional

[5006606]
; Atualizado em 05/01/2023
Nome=Ponta Pora
UF=MS
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://pmpontapora.rcmsuporte.com.br:8081/IssWeb-ejb/IssWebWS/IssWebWS?wsdl
ProLinkURL=http://pmpontapora.rcmsuporte.com.br:8081/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5006903]
Nome=Porto Murtinho
UF=MS
Provedor=Betha

[5007109]
Nome=Ribas do Rio Pardo
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/ribasdoriopardo/servicos.asmx

[5007208]
; Atualizado em 04/10/2021
Nome=Rio Brilhante
UF=MS
Provedor=Betha

[5007307]
Nome=Rio Negro
UF=MS
Provedor=PadraoNacional

[5007406]
Nome=Rio Verde de Mato Grosso
UF=MS
Provedor=Betha

[5007505]
Nome=Rochedo
UF=MS
Provedor=PadraoNacional

[5007554]
Nome=Santa Rita do Pardo
UF=MS
Provedor=Betha

[5007695]
Nome=Sao Gabriel do Oeste
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/saogabrieldooeste/servicos.asmx

[5007703]
Nome=Sete Quedas
UF=MS
Provedor=PadraoNacional

[5007802]
Nome=Selviria
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/selviria/servicos.asmx

[5007901]
Nome=Sidrolandia
UF=MS
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/sindrolandia/servicos.asmx

[5007935]
Nome=Sonora
UF=MS
Provedor=PadraoNacional

[5007950]
Nome=Tacuru
UF=MS
Provedor=PadraoNacional

[5007976]
Nome=Taquarussu
UF=MS
Provedor=Betha

[5008008]
Nome=Terenos
UF=MS
Provedor=PadraoNacional

[5008305]
Nome=Tres Lagoas
UF=MS
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://issweb.treslagoas.ms.gov.br:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://issweb.treslagoas.ms.gov.br:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5008404]
Nome=Vicentina
UF=MS
Provedor=PadraoNacional

[5100102]
Nome=Acorizal
UF=MT
Provedor=PadraoNacional

[5100201]
; Atualizado em 17/06/2022
Nome=Agua Boa
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/aguaboa/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/aguaboa/tnfse_validacao?%CodVerif%

[5100250]
; Atualizado em 15/06/2022
Nome=Alta Floresta
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/altafloresta/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/altafloresta/tnfse_validacao?%CodVerif%

[5100300]
Nome=Alto Araguaia
UF=MT
Provedor=Betha

[5100359]
Nome=Alto Boa Vista
UF=MT
Provedor=PadraoNacional

[5100409]
Nome=Alto Garcas
UF=MT
Provedor=Betha

[5100508]
Nome=Alto Paraguai
UF=MT
Provedor=PadraoNacional

[5100607]
Nome=Alto Taquari
UF=MT
Provedor=PadraoNacional

[5100805]
Nome=Apiacas
UF=MT
Provedor=Betha

[5101001]
Nome=Araguaiana
UF=MT
Provedor=PadraoNacional

[5101209]
Nome=Araguainha
UF=MT
Provedor=PadraoNacional

[5101258]
Nome=Araputanga
UF=MT
Provedor=PadraoNacional

[5101308]
Nome=Arenapolis
UF=MT
Provedor=ISSIntel
ProNameSpace=http://arenapolis-mt.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://arenapolis-mt.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://arenapolis-mt.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://arenapolis-mt.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://arenapolis-mt.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://arenapolis-mt.treino-issintel.com.br/webservices/abrasf/api/

[5101407]
Nome=Aripuana
UF=MT
Provedor=PadraoNacional

[5101605]
Nome=Barao de Melgaco
UF=MT
Provedor=PadraoNacional

[5101704]
Nome=Barra do Bugres
UF=MT
Provedor=FISSLex
ProRecepcionar=https://barradobugres.fisslex.com.br/fiss-lex/servlet/aws_recepcionarloterps
ProConsultarSituacao=https://barradobugres.fisslex.com.br/fiss-lex/servlet/aws_consultarsituacaoloterps
ProConsultarLote=https://barradobugres.fisslex.com.br/fiss-lex/servlet/aws_consultaloterps
ProConsultarNFSeRps=https://barradobugres.fisslex.com.br/fiss-lex/servlet/aws_consultanfseporrps
ProConsultarNFSe=https://barradobugres.fisslex.com.br/fiss-lex/servlet/aws_consultanfse
ProCancelarNFSe=https://barradobugres.fisslex.com.br/fiss-lex/servlet/aws_cancelarnfse
;
ProLinkURL=https://barradobugres.fisslex.com.br/fiss-lex/servlet/apnotafiscalurl?%CodVerif%

[5101803]
; Atualizado em 10/06/2022
Nome=Barra do Garcas
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/barradogarcas/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/barradogarcas/tnfse_validacao?%CodVerif%
HomLinkURL=http://www.gp.srv.br/tributario/homologacao/tnfse_validacao?%CodVerif%

[5101852]
Nome=Bom Jesus do Araguaia
UF=MT
Provedor=PadraoNacional

[5101902]
; Atualizado em 30/11/2022
Nome=Brasnorte
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/brasnorte/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/brasnorte/tnfse_validacao?%CodVerif%

[5102504]
Nome=Caceres
UF=MT
Provedor=FISSLex
ProRecepcionar=https://caceres.fisslex.com.br/fiss-lex/servlet/aws_recepcionarloterps
ProConsultarSituacao=https://caceres.fisslex.com.br/fiss-lex/servlet/aws_consultarsituacaoloterps
ProConsultarLote=https://caceres.fisslex.com.br/fiss-lex/servlet/aws_consultaloterps
ProConsultarNFSeRps=https://caceres.fisslex.com.br/fiss-lex/servlet/aws_consultanfseporrps
ProConsultarNFSe=https://caceres.fisslex.com.br/fiss-lex/servlet/aws_consultanfse
ProCancelarNFSe=https://caceres.fisslex.com.br/fiss-lex/servlet/aws_cancelarnfse
;
ProLinkURL=https://caceres.fisslex.com.br/fiss-lex/servlet/apnotafiscalurl?%CodVerif%

[5102603]
Nome=Campinapolis
UF=MT
Provedor=PadraoNacional

[5102637]
; Atualizado em 17/06/2022
Nome=Campo Novo do Parecis
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/camponovodoparecis/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/camponovodoparecis/tnfse_validacao?%CodVerif%

[5102678]
; Atualizado em 17/06/2022
Nome=Campo Verde
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/campoverde/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/campoverde/tnfse_validacao?%CodVerif%

[5102686]
Nome=Campos de Julio
UF=MT
Provedor=Betha

[5102694]
Nome=Canabrava do Norte
UF=MT
Provedor=PadraoNacional

[5102702]
; Atualizado em 24/01/2022
Nome=Canarana
UF=MT
Provedor=Betha
Versao=2.02
ProRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-ws/nfseWS
HomRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-test-ws/nfseWS

[5102793]
Nome=Carlinda
UF=MT
Provedor=PadraoNacional

[5102850]
Nome=Castanheira
UF=MT
Provedor=PadraoNacional

[5103007]
; Atualizado em 29/06/2022
Nome=Chapada dos Guimaraes
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/chapada/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/chapada/tnfse_validacao?%CodVerif%

[5103056]
Nome=Claudia
UF=MT
Provedor=PadraoNacional

[5103106]
Nome=Cocalinho
UF=MT
Provedor=PadraoNacional

[5103205]
; Atualizado em 17/06/2022
Nome=Colider
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/colider/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/colider/tnfse_validacao?%CodVerif%

[5103254]
; Inclu�do em 15/12/2021
Nome=Colniza
UF=MT
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://170.79.84.5:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://170.79.84.5:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5103304]
Nome=Comodoro
UF=MT
Provedor=Betha

[5103353]
; Atualizado em 08/12/2022
Nome=Confresa
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/confresa/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/confresa/tnfse_validacao?%CodVerif%

[5103361]
Nome=Conquista D Oeste
UF=MT
Provedor=PadraoNacional

[5103379]
Nome=Cotriguacu
UF=MT
Provedor=Betha

[5103403]
; Atualizado em 22/12/2022
Nome=Cuiaba
UF=MT
Provedor=ISSNet
Params=NaoFormatarItemServico:|NaoDividir100:
;
ProRecepcionar=https://wscuiaba.issnetonline.com.br/webserviceabrasf/cuiaba/servicos.asmx

[5103437]
Nome=Curvelandia
UF=MT
Provedor=PadraoNacional

[5103452]
; Inclu�do em 24/05/2022
Nome=Denise
UF=MT
Provedor=Agili
Params=NomeTagAtividadeEconomica:ItemLei116AtividadeEconomica|NaoGerarTag:CodigoCnae

[5103502]
; Atualizado em 17/06/2022
Nome=Diamantino
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/diamantino/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/diamantino/tnfse_validacao?%CodVerif%

[5103601]
Nome=Dom Aquino
UF=MT
Provedor=PadraoNacional

[5103700]
Nome=Feliz Natal
UF=MT
Provedor=FISSLex
ProRecepcionar=https://feliznatal.fisslex.com.br/fiss-lex/servlet/aws_recepcionarloterps
ProConsultarSituacao=https://feliznatal.fisslex.com.br/fiss-lex/servlet/aws_consultarsituacaoloterps
ProConsultarLote=https://feliznatal.fisslex.com.br/fiss-lex/servlet/aws_consultaloterps
ProConsultarNFSeRps=https://feliznatal.fisslex.com.br/fiss-lex/servlet/aws_consultanfseporrps
ProConsultarNFSe=https://feliznatal.fisslex.com.br/fiss-lex/servlet/aws_consultanfse
ProCancelarNFSe=https://feliznatal.fisslex.com.br/fiss-lex/servlet/aws_cancelarnfse
;
ProLinkURL=https://feliznatal.fisslex.com.br/fiss-lex/servlet/apnotafiscalurl?%CodVerif%

[5103809]
Nome=Figueiropolis D Oeste
UF=MT
Provedor=PadraoNacional

[5103858]
Nome=Gaucha do Norte
UF=MT
Provedor=PadraoNacional

[5103908]
Nome=General Carneiro
UF=MT
Provedor=PadraoNacional

[5103957]
Nome=Gloria D Oeste
UF=MT
Provedor=PadraoNacional

[5104104]
; Atualizado em 14/06/2022
Nome=Guaranta do Norte
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/guarantadonorte/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/guarantadonorte/tnfse_validacao?%CodVerif%

[5104203]
Nome=Guiratinga
UF=MT
Provedor=PadraoNacional

[5104500]
Nome=Indiavai
UF=MT
Provedor=PadraoNacional

[5104526]
; Atualizado em 16/11/2021
Nome=Ipiranga do Norte
UF=MT
Provedor=Agili
Params=NomeTagAtividadeEconomica:CodigoCnaeAtividadeEconomica|NaoGerarTag:CodigoCnae

[5104542]
Nome=Itanhanga
UF=MT
Provedor=WebISS
ProRecepcionar=https://www7.webiss.com.br/itanhangamt_wsnfse/NfseServices.svc
HomRecepcionar=https://www7.webiss.com.br/itanhangamt_wsnfse_homolog/NfseServices.svc

[5104559]
Nome=Itauba
UF=MT
Provedor=FISSLex
ProRecepcionar=https://itauba.fisslex.com.br/fiss-lex/servlet/aws_recepcionarloterps
ProConsultarSituacao=https://itauba.fisslex.com.br/fiss-lex/servlet/aws_consultarsituacaoloterps
ProConsultarLote=https://itauba.fisslex.com.br/fiss-lex/servlet/aws_consultaloterps
ProConsultarNFSeRps=https://itauba.fisslex.com.br/fiss-lex/servlet/aws_consultanfseporrps
ProConsultarNFSe=https://itauba.fisslex.com.br/fiss-lex/servlet/aws_consultanfse
ProCancelarNFSe=https://itauba.fisslex.com.br/fiss-lex/servlet/aws_cancelarnfse
;
ProLinkURL=https://itauba.fisslex.com.br/fiss-lex/servlet/apnotafiscalurl?%CodVerif%

[5104609]
; Atualizado em 11/06/2021
Nome=Itiquira
UF=MT
Provedor=Betha

[5104807]
Nome=Jaciara
UF=MT
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://intranet.jaciara.mt.gov.br:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://intranet.jaciara.mt.gov.br:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5104906]
Nome=Jangada
UF=MT
Provedor=PadraoNacional

[5105002]
Nome=Jauru
UF=MT
Provedor=PadraoNacional

[5105101]
Nome=Juara
UF=MT
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/juara/servicos.asmx

[5105150]
; Atualizado em 08/12/2021
Nome=Juina
UF=MT
Provedor=Agili
Params=NomeTagAtividadeEconomica:ItemLei116AtividadeEconomica|NaoGerarTag:ItemLei116,CodigoCnae

[5105176]
Nome=Juruena
UF=MT
Provedor=PadraoNacional

[5105200]
Nome=Juscimeira
UF=MT
Provedor=PadraoNacional

[5105234]
Nome=Lambari D Oeste
UF=MT
Provedor=PadraoNacional

[5105259]
; Atualizado em 01/02/2022
Nome=Lucas do Rio Verde
UF=MT
Provedor=Betha
Versao=2.02
ProRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-ws/nfseWS
HomRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-test-ws/nfseWS

[5105309]
Nome=Luciara
UF=MT
Provedor=PadraoNacional

[5105507]
Nome=Vila Bela da Santissima Trindade
UF=MT
Provedor=PadraoNacional

[5105580]
Nome=Marcelandia
UF=MT
Provedor=PadraoNacional

[5105606]
; Atualizado em 17/06/2022
Nome=Matupa
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/matupa/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/matupa/tnfse_validacao?%CodVerif%

[5105622]
Nome=Mirassol D Oeste
UF=MT
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://186.235.81.12:5663/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://186.235.81.12:5663/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5105903]
; Atualizado em 08/12/2021
Nome=Nobres
UF=MT
Provedor=Agili
Params=NomeTagAtividadeEconomica:ItemLei116AtividadeEconomica|NaoGerarTag:ItemLei116

[5106000]
Nome=Nortelandia
UF=MT
Provedor=PadraoNacional

[5106109]
Nome=Nossa Senhora do Livramento
UF=MT
Provedor=PadraoNacional

[5106158]
Nome=Nova Bandeirantes
UF=MT
Provedor=PadraoNacional

[5106174]
Nome=Nova Nazare
UF=MT
Provedor=PadraoNacional

[5106182]
Nome=Nova Lacerda
UF=MT
Provedor=PadraoNacional

[5106190]
Nome=Nova Santa Helena
UF=MT
Provedor=PadraoNacional

[5106208]
; Atualizado em 17/06/2022
Nome=Nova Brasilandia
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/novabrasilandia/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/novabrasilandia/tnfse_validacao?%CodVerif%

[5106216]
Nome=Nova Canaa do Norte
UF=MT
Provedor=PadraoNacional

[5106224]
; Atualizado em 17/06/2022
Nome=Nova Mutum
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/novamutum/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/novamutum/tnfse_validacao?%CodVerif%

[5106232]
Nome=Nova Olimpia
UF=MT
Provedor=FISSLex
ProRecepcionar=https://novaolimpia.fisslex.com.br/fiss-lex/servlet/aws_recepcionarloterps
ProConsultarSituacao=https://novaolimpia.fisslex.com.br/fiss-lex/servlet/aws_consultarsituacaoloterps
ProConsultarLote=https://novaolimpia.fisslex.com.br/fiss-lex/servlet/aws_consultaloterps
ProConsultarNFSeRps=https://novaolimpia.fisslex.com.br/fiss-lex/servlet/aws_consultanfseporrps
ProConsultarNFSe=https://novaolimpia.fisslex.com.br/fiss-lex/servlet/aws_consultanfse
ProCancelarNFSe=https://novaolimpia.fisslex.com.br/fiss-lex/servlet/aws_cancelarnfse
;
ProLinkURL=https://novaolimpia.fisslex.com.br/fiss-lex/servlet/apnotafiscalurl?%CodVerif%

[5106240]
Nome=Nova Ubirata
UF=MT
Provedor=PadraoNacional

[5106257]
; Atualizado em 16/11/2021
Nome=Nova Xavantina
UF=MT
Provedor=Agili
Params=NomeTagAtividadeEconomica:CodigoAtividadeEconomica

[5106265]
Nome=Novo Mundo
UF=MT
Provedor=PadraoNacional

[5106273]
Nome=Novo Horizonte do Norte
UF=MT
Provedor=PadraoNacional

[5106281]
Nome=Novo Sao Joaquim
UF=MT
Provedor=PadraoNacional

[5106299]
Nome=Paranaita
UF=MT
Provedor=PadraoNacional

[5106307]
; Atualizado em 24/05/2022
Nome=Paranatinga
UF=MT
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://paranatinga.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://paranatinga.iss.elotech.com.br/iss-ws/nfse203.wsdl

[5106315]
Nome=Novo Santo Antonio
UF=MT
Provedor=PadraoNacional

[5106372]
; Inclu�do em 16/11/2021
Nome=Pedra Preta
UF=MT
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://pedrapreta.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://pedrapreta.iss.elotech.com.br/iss-ws/nfse203.wsdl

[5106422]
; Atualizado em 17/06/2022
Nome=Peixoto de Azevedo
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/peixotodeazevedo/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/peixotodeazevedo/tnfse_validacao?%CodVerif%

[5106455]
; Atualizado em 17/06/2022
Nome=Planalto da Serra
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/planaltodaserra/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/planaltodaserra/tnfse_validacao?%CodVerif%

[5106505]
Nome=Pocone
UF=MT
Provedor=FISSLex
ProRecepcionar=https://pocone.fisslex.com.br/fiss-lex/servlet/aws_recepcionarloterps
ProConsultarSituacao=https://pocone.fisslex.com.br/fiss-lex/servlet/aws_consultarsituacaoloterps
ProConsultarLote=https://pocone.fisslex.com.br/fiss-lex/servlet/aws_consultaloterps
ProConsultarNFSeRps=https://pocone.fisslex.com.br/fiss-lex/servlet/aws_consultanfseporrps
ProConsultarNFSe=https://pocone.fisslex.com.br/fiss-lex/servlet/aws_consultanfse
ProCancelarNFSe=https://pocone.fisslex.com.br/fiss-lex/servlet/aws_cancelarnfse
;
ProLinkURL=https://pocone.fisslex.com.br/fiss-lex/servlet/apnotafiscalurl?%CodVerif%

[5106653]
Nome=Pontal do Araguaia
UF=MT
Provedor=PadraoNacional

[5106703]
Nome=Ponte Branca
UF=MT
Provedor=PadraoNacional

[5106752]
Nome=Pontes E Lacerda
UF=MT
Provedor=PadraoNacional

[5106778]
Nome=Porto Alegre do Norte
UF=MT
Provedor=ISSIntel
ProNameSpace=http://portoalegredonorte-mt.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://portoalegredonorte-mt.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://portoalegredonorte-mt.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://portoalegredonorte-mt.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://portoalegredonorte-mt.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://portoalegredonorte-mt.treino-issintel.com.br/webservices/abrasf/api/

[5106802]
Nome=Porto Dos Gauchos
UF=MT
Provedor=PadraoNacional

[5106828]
Nome=Porto Esperidiao
UF=MT
Provedor=PadraoNacional

[5106851]
Nome=Porto Estrela
UF=MT
Provedor=PadraoNacional

[5107008]
Nome=Poxoreo
UF=MT
Provedor=EloTech
Versao=2.03
ProRecepcionar=https://poxoreu.iss.elotech.com.br/iss-ws/nfse203.wsdl
HomRecepcionar=https://poxoreu.iss.elotech.com.br/iss-ws/nfse203.wsdl

[5107040]
Nome=Primavera do Leste
UF=MT
Provedor=AssessorPublico
ProRecepcionar=http://s32.asp.srv.br:8080/issonline/servlet/anfse
HomRecepcionar=http://s32.asp.srv.br:8080/issonline-homolog/servlet/anfse

[5107065]
; Atualizado em 17/06/2022
Nome=Querencia
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/querencia/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/querencia/tnfse_validacao?%CodVerif%

[5107107]
Nome=Sao Jose Dos Quatro Marcos
UF=MT
Provedor=ISSIntel
ProNameSpace=http://saojosedosquatromarcos-mt.issintel.com.br/webservices/abrasf/api
HomNameSpace=http://saojosedosquatromarcos-mt.treino-issintel.com.br/webservices/abrasf/api
;
ProRecepcionar=https://saojosedosquatromarcos-mt.issintel.com.br/webservices/abrasf/api
HomRecepcionar=https://saojosedosquatromarcos-mt.treino-issintel.com.br/webservices/abrasf/api
;
ProSoapAction=http://saojosedosquatromarcos-mt.issintel.com.br/webservices/abrasf/api/
HomSoapAction=http://saojosedosquatromarcos-mt.treino-issintel.com.br/webservices/abrasf/api/

[5107156]
Nome=Reserva do Cabacal
UF=MT
Provedor=PadraoNacional

[5107180]
Nome=Ribeirao Cascalheira
UF=MT
Provedor=Betha

[5107198]
Nome=Ribeiraozinho
UF=MT
Provedor=PadraoNacional

[5107206]
Nome=Rio Branco
UF=MT
Provedor=PadraoNacional

[5107248]
; Atualizado em 02/06/2022
Nome=Santa Carmen
UF=MT
Provedor=RLZ
Versao=2.03
ProRecepcionar=https://cidadaoonline.santacarmem.mt.gov.br/api/webservice/nfse
HomRecepcionar=http://santacarmem.prefeitura.rlz.com.br/api/webservice/nfse

[5107263]
Nome=Santo Afonso
UF=MT
Provedor=PadraoNacional

[5107297]
Nome=Sao Jose do Povo
UF=MT
Provedor=PadraoNacional

[5107305]
; Atualizado em 16/11/2021
Nome=Sao Jose do Rio Claro
UF=MT
Provedor=Agili
Params=NomeTagAtividadeEconomica:ItemLei116AtividadeEconomica

[5107354]
Nome=Sao Jose do Xingu
UF=MT
Provedor=PadraoNacional

[5107404]
Nome=Sao Pedro da Cipa
UF=MT
Provedor=PadraoNacional

[5107578]
Nome=Rondolandia
UF=MT
Provedor=PadraoNacional

[5107602]
; Atualizado em 13/09/2022
Nome=Rondonopolis
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=http://intranet.rondonopolis.mt.gov.br/tributario_rondonopolis/servlet/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/rondonopolis/tnfse_validacao?%CodVerif%

[5107701]
Nome=Rosario Oeste
UF=MT
Provedor=PadraoNacional

[5107743]
Nome=Santa Cruz do Xingu
UF=MT
Provedor=PadraoNacional

[5107750]
Nome=Salto do Ceu
UF=MT
Provedor=PadraoNacional

[5107768]
; Inclu�do em 14/03/2022
Nome=Santa Rita do Trivelato
UF=MT
Provedor=Agili
Params=NomeTagAtividadeEconomica:CodigoCnaeAtividadeEconomica|NaoGerarTag:CodigoCnae

[5107776]
Nome=Santa Terezinha
UF=MT
Provedor=PadraoNacional

[5107792]
Nome=Santo Antonio do Leste
UF=MT
Provedor=PadraoNacional

[5107800]
Nome=Santo Antonio do Leverger
UF=MT
Provedor=FISSLex
ProRecepcionar=https://leverger.fisslex.com.br/fiss-lex/servlet/aws_recepcionarloterps
ProConsultarSituacao=https://leverger.fisslex.com.br/fiss-lex/servlet/aws_consultarsituacaoloterps
ProConsultarLote=https://leverger.fisslex.com.br/fiss-lex/servlet/aws_consultaloterps
ProConsultarNFSeRps=https://leverger.fisslex.com.br/fiss-lex/servlet/aws_consultanfseporrps
ProConsultarNFSe=https://leverger.fisslex.com.br/fiss-lex/servlet/aws_consultanfse
ProCancelarNFSe=https://leverger.fisslex.com.br/fiss-lex/servlet/aws_cancelarnfse
;
ProLinkURL=https://leverger.fisslex.com.br/fiss-lex/servlet/apnotafiscalurl?%CodVerif%

[5107859]
Nome=Sao Felix do Araguaia
UF=MT
Provedor=Betha

[5107875]
Nome=Sapezal
UF=MT
Provedor=Betha

[5107883]
Nome=Serra Nova Dourada
UF=MT
Provedor=PadraoNacional

[5107909]
; Atualizado em 15/06/2022
Nome=Sinop
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/sinop/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/sinop/tnfse_validacao?%CodVerif%

[5107925]
; Atualizado em 08/09/2022
Nome=Sorriso
UF=MT
Provedor=Agili
Params=NomeTagAtividadeEconomica:ItemLei116AtividadeEconomica|NaoGerarTag:ItemLei116
;
ProRecepcionar=https://prefsorriso-mt.agilicloud.com.br/api/EnviarLoteRps
ProConsultarLote=https://prefsorriso-mt.agilicloud.com.br/api/ConsultarLoteRps
ProConsultarNFSeRps=https://prefsorriso-mt.agilicloud.com.br/api/ConsultarNfseRps
ProConsultarNFSe=https://prefsorriso-mt.agilicloud.com.br/api/ConsultarNfseFaixa
ProCancelarNFSe=https://prefsorriso-mt.agilicloud.com.br/api/CancelarNfse
ProGerarNFSe=https://prefsorriso-mt.agilicloud.com.br/api/GerarNfse
ProSubstituirNFSe=https://prefsorriso-mt.agilicloud.com.br/api/SubstituirNfse
;
HomRecepcionar=
HomConsultarLote=
HomConsultarNFSeRps=
HomConsultarNFSe=
HomCancelarNFSe=
HomGerarNFSe=
HomSubstituirNFSe=

[5107941]
Nome=Tabapora
UF=MT
Provedor=PadraoNacional

[5107958]
Nome=Tangara da Serra
UF=MT
Provedor=RLZ
Versao=2.03
ProRecepcionar=http://177.190.246.28/webservice/nfse
HomRecepcionar=http://saturno.rlz.com.br:3080/mt/tangaradaserra/webservice/nfse

[5108006]
; Atualizado em 17/06/2022
Nome=Tapurah
UF=MT
Provedor=Coplan
Versao=2.01
ProRecepcionar=https://www.gp.srv.br/tributario/tapurah/anfse_web_service
;
ProLinkURL=http://www.gp.srv.br/tributario/tapurah/tnfse_validacao?%CodVerif%

[5108055]
Nome=Terra Nova do Norte
UF=MT
Provedor=PadraoNacional

[5108105]
Nome=Tesouro
UF=MT
Provedor=PadraoNacional

[5108204]
Nome=Torixoreu
UF=MT
Provedor=PadraoNacional

[5108303]
Nome=Uniao do Sul
UF=MT
Provedor=PadraoNacional

[5108352]
Nome=Vale de Sao Domingos
UF=MT
Provedor=Betha

[5108402]
Nome=Varzea Grande
UF=MT
Provedor=Abaco
ProRecepcionar=https://www.e-nfs.com.br/varzeagrande/servlet/arecepcionarloterps
ProConsultarSituacao=https://www.e-nfs.com.br/varzeagrande/servlet/aconsultarsituacaoloterps
ProConsultarLote=https://www.e-nfs.com.br/varzeagrande/servlet/aconsultarloterps
ProConsultarNFSeRps=https://www.e-nfs.com.br/varzeagrande/servlet/aconsultarnfseporrps
ProConsultarNFSe=https://www.e-nfs.com.br/varzeagrande/servlet/aconsultarnfse
ProCancelarNFSe=https://www.e-nfs.com.br/varzeagrande/servlet/acancelarnfse
;
HomRecepcionar=https://homologa.e-nfs.com.br/varzeagrande/servlet/arecepcionarloterps
HomConsultarSituacao=https://homologa.e-nfs.com.br/varzeagrande/servlet/aconsultarsituacaoloterps
HomConsultarLote=https://homologa.e-nfs.com.br/varzeagrande/servlet/aconsultarloterps
HomConsultarNFSeRps=https://homologa.e-nfs.com.br/varzeagrande/servlet/aconsultarnfseporrps
HomConsultarNFSe=https://homologa.e-nfs.com.br/varzeagrande/servlet/aconsultarnfse
HomCancelarNFSe=https://homologa.e-nfs.com.br/varzeagrande/servlet/acancelarnfse
;
ProLinkURL=https://www.e-nfs.com.br/varzeagrande/servlet/wvalidarautenticidadenfse?%Cnpj%,%ValorServico%,%NumeroNFSe%,%CodVerif%
HomLinkURL=https://homologa.e-nfs.com.br/varzeagrande/servlet/wvalidarautenticidadenfse?%Cnpj%,%ValorServico%,%NumeroNFSe%,%CodVerif%

[5108501]
Nome=Vera
UF=MT
Provedor=PadraoNacional

[5108600]
; Atualizado em 24/01/2022
Nome=Vila Rica
UF=MT
Provedor=Betha
Versao=2.02
ProRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-ws/nfseWS
HomRecepcionar=http://e-gov.betha.com.br/e-nota-contribuinte-test-ws/nfseWS

[5108808]
Nome=Nova Guarita
UF=MT
Provedor=PadraoNacional

[5108857]
Nome=Nova Marilandia
UF=MT
Provedor=PadraoNacional

[5108907]
Nome=Nova Maringa
UF=MT
Provedor=PadraoNacional

[5108956]
Nome=Nova Monte Verde
UF=MT
Provedor=PadraoNacional

[5200050]
Nome=Abadia de Goias
UF=GO
Provedor=PadraoNacional

[5200100]
Nome=Abadiania
UF=GO
Provedor=PadraoNacional

[5200134]
; Inclu�do em 03/08/2021
Nome=Acreuna
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=*
ProConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/rps/go/acreuna
ProCancelarNFSe=https://api.centi.com.br/nfe/cancelar/go/acreuna
ProGerarNFSe=https://api.centi.com.br/nfe/gerar/go/acreuna
;
HomRecepcionar=*
HomConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/homologacao/rps/go/acreuna
HomCancelarNFSe=https://api.centi.com.br/nfe/cancelar/homologacao/go/acreuna
HomGerarNFSe=https://api.centi.com.br/nfe/gerar/homologacao/go/acreuna
;
ProLinkURL=https://api.centi.dev.br/portal/nfse/go/acreuna/%CodVerif%
HomLinkURL=https://api.centi.dev.br/portal/nfse/go/acreuna/%CodVerif%

[5200159]
Nome=Adelandia
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/adelandia/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5200175]
Nome=Agua Fria de Goias
UF=GO
Provedor=PadraoNacional

[5200209]
Nome=Agua Limpa
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/agualimpa/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5200258]
; Atualizado em 21/12/2022
Nome=Aguas Lindas de Goias
UF=GO
Provedor=Ginfes
;
ProLinkURL=http://aguaslindas.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://aguaslindas.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[5200308]
Nome=Alexania
UF=GO
Provedor=PadraoNacional

[5200506]
Nome=Aloandia
UF=GO
Provedor=PadraoNacional

[5200555]
Nome=Alto Horizonte
UF=GO
Provedor=PadraoNacional

[5200605]
Nome=Alto Paraiso de Goias
UF=GO
Provedor=PadraoNacional

[5200803]
Nome=Alvorada do Norte
UF=GO
Provedor=PadraoNacional

[5200829]
Nome=Amaralina
UF=GO
Provedor=PadraoNacional

[5200852]
Nome=Americano do Brasil
UF=GO
Provedor=PadraoNacional

[5200902]
Nome=Amorinopolis
UF=GO
Provedor=PadraoNacional

[5201108]
Nome=Anapolis
UF=GO
Provedor=ISSNet
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/anapolis/servicos.asmx

[5201207]
Nome=Anhanguera
UF=GO
Provedor=PadraoNacional

[5201306]
Nome=Anicuns
UF=GO
Provedor=PadraoNacional

[5201405]
; Atualizado em 24/01/2022
Nome=Aparecida de Goiania
UF=GO
Provedor=ISSNet
Params=NaoDividir100:
;
ProRecepcionar=http://www.issnetonline.com.br/webserviceabrasf/aparecidadegoiania/servicos.asmx
HomRecepcionar=http://aparecidadegoiania.issnetonline.com.br/webserviceabrasf/homologacao/servicos.asmx

[5201454]
Nome=Aparecida do Rio Doce
UF=GO
Provedor=Betha

[5201504]
Nome=Apore
UF=GO
Provedor=Betha

[5201603]
Nome=Aracu
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/aracu/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5201702]
Nome=Aragarcas
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://aragarcas.megasoftarrecadanet.com.br/aragarcas/ws/nfseSOAP
HomRecepcionar=

[5201801]
; Inclu�do em 14/12/2021
Nome=Aragoiania
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://aragoiania.megasoftarrecadanet.com.br/aragoiania/ws/nfseSOAP
HomRecepcionar=

[5202155]
Nome=Araguapaz
UF=GO
Provedor=PadraoNacional

[5202353]
Nome=Arenopolis
UF=GO
Provedor=PadraoNacional

[5202502]
Nome=Aruana
UF=GO
Provedor=PadraoNacional

[5202601]
Nome=Aurilandia
UF=GO
Provedor=PadraoNacional

[5202809]
Nome=Avelinopolis
UF=GO
Provedor=PadraoNacional

[5203104]
Nome=Baliza
UF=GO
Provedor=PadraoNacional

[5203203]
Nome=Barro Alto
UF=GO
Provedor=PadraoNacional

[5203302]
Nome=Bela Vista de Goias
UF=GO
Provedor=PadraoNacional

[5203401]
Nome=Bom Jardim de Goias
UF=GO
Provedor=PadraoNacional

[5203500]
Nome=Bom Jesus de Goias
UF=GO
Provedor=PadraoNacional

[5203559]
Nome=Bonfinopolis
UF=GO
Provedor=PadraoNacional

[5203575]
Nome=Bonopolis
UF=GO
Provedor=PadraoNacional

[5203609]
Nome=Brazabrantes
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/brazabrantes/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5203807]
Nome=Britania
UF=GO
Provedor=PadraoNacional

[5203906]
Nome=Buriti Alegre
UF=GO
Provedor=PadraoNacional

[5203939]
Nome=Buriti de Goias
UF=GO
Provedor=PadraoNacional

[5203962]
Nome=Buritinopolis
UF=GO
Provedor=PadraoNacional

[5204003]
Nome=Cabeceiras
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/cabeceiras/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5204102]
Nome=Cachoeira Alta
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/cachoeiraalta/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5204201]
Nome=Cachoeira de Goias
UF=GO
Provedor=PadraoNacional

[5204250]
Nome=Cachoeira Dourada
UF=GO
Provedor=PadraoNacional

[5204300]
Nome=Cacu
UF=GO
Provedor=Betha

[5204409]
Nome=Caiaponia
UF=GO
Provedor=PadraoNacional

[5204508]
Nome=Caldas Novas
UF=GO
Provedor=WebISS
Versao=2.02
ProRecepcionar=https://caldasnovasgo.webiss.com.br/ws/nfse.asmx
HomRecepcionar=https://homologacao.webiss.com.br/ws/nfse.asmx
;
ProLinkURL=https://caldasnovasgo.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%
HomLinkURL=https://homologacao.webiss.com.br/externo/nfse/visualizar/%Cnpj%/%CodVerif%/%NumeroNFSe%

[5204557]
Nome=Caldazinha
UF=GO
Provedor=PadraoNacional

[5204607]
Nome=Campestre de Goias
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/campestredegoias/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5204656]
Nome=Campinacu
UF=GO
Provedor=PadraoNacional

[5204706]
Nome=Campinorte
UF=GO
Provedor=PadraoNacional

[5204805]
Nome=Campo Alegre de Goias
UF=GO
Provedor=PadraoNacional

[5204854]
Nome=Campo Limpo de Goias
UF=GO
Provedor=PadraoNacional

[5204904]
Nome=Campos Belos
UF=GO
Provedor=PadraoNacional

[5204953]
Nome=Campos Verdes
UF=GO
Provedor=PadraoNacional

[5205000]
Nome=Carmo do Rio Verde
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/carmodorioverde/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5205059]
Nome=Castelandia
UF=GO
Provedor=PadraoNacional

[5205109]
Nome=Catalao
UF=GO
Provedor=Prodata
Versao=2.01
ProRecepcionar=http://187.111.62.130/prodataws/services/NfseWSService
HomRecepcionar=

[5205208]
Nome=Caturai
UF=GO
Provedor=PadraoNacional

[5205307]
Nome=Cavalcante
UF=GO
Provedor=PadraoNacional

[5205406]
; Inclu�do em 24/06/2022
Nome=Ceres
UF=GO
Provedor=Prodata
Versao=2.01
ProRecepcionar=http://177.10.239.123:8080/prodataws/services/NfseWSService

[5205455]
; Atualizado em 08/08/2022
Nome=Cezarina
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://cezarina.megasoftarrecadanet.com.br/cezarina/ws/nfseSOAP

[5205471]
Nome=Chapadao do Ceu
UF=GO
Provedor=Betha

[5205497]
Nome=Cidade Ocidental
UF=GO
Provedor=PadraoNacional

[5205513]
Nome=Cocalzinho de Goias
UF=GO
Provedor=PadraoNacional

[5205521]
Nome=Colinas do Sul
UF=GO
Provedor=PadraoNacional

[5205703]
Nome=Corrego do Ouro
UF=GO
Provedor=PadraoNacional

[5205802]
; Inclu�do em 10/10/2022
Nome=Corumb� de Goi�s
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://corumbadegoias.megasoftarrecadanet.com.br/corumbadegoias/ws/nfseSOAP
HomRecepcionar=

[5205901]
Nome=Corumbaiba
UF=GO
Provedor=PadraoNacional

[5206206]
Nome=Cristalina
UF=GO
Provedor=PadraoNacional

[5206305]
Nome=Cristianopolis
UF=GO
Provedor=PadraoNacional

[5206404]
Nome=Crixas
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/crixas/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5206503]
Nome=Crominia
UF=GO
Provedor=PadraoNacional

[5206602]
Nome=Cumari
UF=GO
Provedor=PadraoNacional

[5206701]
Nome=Damianopolis
UF=GO
Provedor=PadraoNacional

[5206800]
Nome=Damolandia
UF=GO
Provedor=PadraoNacional

[5206909]
Nome=Davinopolis
UF=GO
Provedor=PadraoNacional

[5207105]
Nome=Diorama
UF=GO
Provedor=PadraoNacional

[5207253]
Nome=Doverlandia
UF=GO
Provedor=PadraoNacional

[5207352]
Nome=Edealina
UF=GO
Provedor=PadraoNacional

[5207402]
Nome=Edeia
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/edeia/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5207501]
Nome=Estrela do Norte
UF=GO
Provedor=PadraoNacional

[5207535]
Nome=Faina
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/faina/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5207600]
Nome=Fazenda Nova
UF=GO
Provedor=PadraoNacional

[5207808]
Nome=Firminopolis
UF=GO
Provedor=PadraoNacional

[5207907]
Nome=Flores de Goias
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/floresdegoias/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5208004]
; Atualizado em 20/01/2022
Nome=Formosa
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=*
ProConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/rps/go/formosa
ProCancelarNFSe=https://api.centi.com.br/nfe/cancelar/go/formosa
ProGerarNFSe=https://api.centi.com.br/nfe/gerar/go/formosa
;
HomRecepcionar=*
HomConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/homologacao/rps/go/formosa
HomCancelarNFSe=https://api.centi.com.br/nfe/cancelar/homologacao/go/formosa
HomGerarNFSe=https://api.centi.com.br/nfe/gerar/homologacao/go/formosa
;
ProLinkURL=https://api.centi.dev.br/portal/nfse/go/formosa/%CodVerif%
HomLinkURL=https://api.centi.dev.br/portal/nfse/go/formosa/%CodVerif%

[5208103]
Nome=Formoso
UF=GO
Provedor=PadraoNacional

[5208152]
Nome=Gameleira de Goias
UF=GO
Provedor=PadraoNacional

[5208301]
Nome=Divinopolis de Goias
UF=GO
Provedor=PadraoNacional

[5208400]
Nome=Goianapolis
UF=GO
Provedor=PadraoNacional

[5208509]
Nome=Goiandira
UF=GO
Provedor=PadraoNacional

[5208608]
Nome=Goianesia
UF=GO
Provedor=Prodata
Versao=2.01
ProRecepcionar=http://191.242.30.222:8080/prodataws/services/NfseWSService
HomRecepcionar=

[5208707]
Nome=Goiania
UF=GO
Provedor=ISSGoiania
Versao=2.00
ProRecepcionar=https://nfse.goiania.go.gov.br/ws/nfse.asmx
HomRecepcionar=
ProLinkURL=http://www2.goiania.go.gov.br/sistemas/snfse/asp/snfse00200w0.asp?inscricao=%InscMunic%&nota=%NumeroNFSe%&verificador=%CodVerif%
HomLinkURL=http://www2.goiania.go.gov.br/sistemas/snfse/asp/snfse00200w0.asp?inscricao=%InscMunic%&nota=%NumeroNFSe%&verificador=%CodVerif%

[5208806]
; Inclu�do em 24/05/2021
Nome=Goianira
UF=GO
Provedor=Sigep
Versao=2.00
ProRecepcionar=http://goianira.bsit-br.com.br/integracao/services/nfseWS
HomRecepcionar=

[5208905]
Nome=Goias
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://goias.megasoftarrecadanet.com.br/goias/ws/nfseSOAP
HomRecepcionar=

[5209101]
Nome=Goiatuba
UF=GO
Provedor=PadraoNacional

[5209150]
Nome=Gouvelandia
UF=GO
Provedor=PadraoNacional

[5209200]
Nome=Guapo
UF=GO
Provedor=PadraoNacional

[5209291]
Nome=Guaraita
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/guaraita/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5209408]
Nome=Guarani de Goias
UF=GO
Provedor=PadraoNacional

[5209457]
Nome=Guarinos
UF=GO
Provedor=PadraoNacional

[5209606]
Nome=Heitorai
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/heitorai/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5209705]
Nome=Hidrolandia
UF=GO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://186.211.164.130:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://186.211.164.130:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5209804]
Nome=Hidrolina
UF=GO
Provedor=PadraoNacional

[5209903]
Nome=Iaciara
UF=GO
Provedor=PadraoNacional

[5209937]
Nome=Inaciolandia
UF=GO
Provedor=PadraoNacional

[5209952]
Nome=Indiara
UF=GO
Provedor=Sigep
Versao=2.00
ProRecepcionar=http://gestaopublica.indiara.bsit-br.com.br/integracao/services/nfseWS
HomRecepcionar=http://gestaopublica.indiara.bsit-br.com.br/integracao/services/nfseWS

[5210000]
Nome=Inhumas
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/inhumas/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5210109]
Nome=Ipameri
UF=GO
Provedor=PadraoNacional

[5210158]
Nome=Ipiranga de Goias
UF=GO
Provedor=PadraoNacional

[5210208]
Nome=Ipora
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://ipora.megasoftarrecadanet.com.br/ipora/ws/nfseSOAP
HomRecepcionar=

[5210307]
Nome=Israelandia
UF=GO
Provedor=PadraoNacional

[5210406]
Nome=Itaberai
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://itaberai.megasoftarrecadanet.com.br/itaberai/ws/nfseSOAP
HomRecepcionar=

[5210562]
Nome=Itaguari
UF=GO
Provedor=PadraoNacional

[5210604]
Nome=Itaguaru
UF=GO
Provedor=PadraoNacional

[5210802]
Nome=Itaja
UF=GO
Provedor=Betha

[5210901]
Nome=Itapaci
UF=GO
Provedor=PadraoNacional

[5211008]
Nome=Itapirapua
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/itapirapua/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5211206]
Nome=Itapuranga
UF=GO
Provedor=PadraoNacional

[5211305]
Nome=Itaruma
UF=GO
Provedor=Betha

[5211404]
Nome=Itaucu
UF=GO
Provedor=PadraoNacional

[5211503]
Nome=Itumbiara
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=*
ProConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/rps/go/itumbiara
ProCancelarNFSe=https://api.centi.com.br/nfe/cancelar/go/itumbiara
ProGerarNFSe=https://api.centi.com.br/nfe/gerar/go/itumbiara
;
HomRecepcionar=*
HomConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/homologacao/rps/go/itumbiara
HomCancelarNFSe=https://api.centi.com.br/nfe/cancelar/homologacao/go/itumbiara
HomGerarNFSe=https://api.centi.com.br/nfe/gerar/homologacao/go/itumbiara
;
ProLinkURL=https://api.centi.dev.br/portal/nfse/go/itumbiara/%CodVerif%
HomLinkURL=https://api.centi.dev.br/portal/nfse/go/itumbiara/%CodVerif%

[5211602]
Nome=Ivolandia
UF=GO
Provedor=PadraoNacional

[5211701]
Nome=Jandaia
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/jandaia/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5211800]
Nome=Jaragua
UF=GO
Provedor=PadraoNacional

[5211909]
; Inclu�do em 11/06/2021
Nome=Jatai
UF=GO
Provedor=Sigep
Versao=2.00
ProRecepcionar=http://gestaopublica.jatai.bsit-br.com.br/integracao/services/nfseWS
HomRecepcionar=

[5212006]
Nome=Jaupaci
UF=GO
Provedor=PadraoNacional

[5212055]
Nome=Jesupolis
UF=GO
Provedor=PadraoNacional

[5212105]
Nome=Joviania
UF=GO
Provedor=PadraoNacional

[5212204]
Nome=Jussara
UF=GO
Provedor=PadraoNacional

[5212253]
Nome=Lagoa Santa
UF=GO
Provedor=Betha

[5212303]
Nome=Leopoldo de Bulhoes
UF=GO
Provedor=PadraoNacional

[5212501]
Nome=Luziania
UF=GO
Provedor=PadraoNacional

[5212600]
Nome=Mairipotaba
UF=GO
Provedor=PadraoNacional

[5212709]
Nome=Mambai
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/mambai/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5212808]
Nome=Mara Rosa
UF=GO
Provedor=PadraoNacional

[5212907]
Nome=Marzagao
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://marzagao.megasoftarrecadanet.com.br/marzagao/ws/nfseSOAP
HomRecepcionar=

[5212956]
Nome=Matrincha
UF=GO
Provedor=PadraoNacional

[5213004]
Nome=Maurilandia
UF=GO
Provedor=PadraoNacional

[5213053]
Nome=Mimoso de Goias
UF=GO
Provedor=PadraoNacional

[5213087]
Nome=Minacu
UF=GO
Provedor=PadraoNacional

[5213103]
Nome=Mineiros
UF=GO
Provedor=Ginfes
;
ProLinkURL=http://mineiros.ginfes.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null
HomLinkURL=http://mineiros.ginfesh.com.br/report/consultarNota?__report=nfs_ver4&cdVerificacao=%CodVerif%&numNota=%NumeroNFSe%&cnpjPrestador=null

[5213400]
Nome=Moipora
UF=GO
Provedor=PadraoNacional

[5213509]
Nome=Monte Alegre de Goias
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/montealebredegoias/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5213707]
Nome=Montes Claros de Goias
UF=GO
Provedor=PadraoNacional

[5213756]
; Inclu�do em 06/08/2021
Nome=Montividiu
UF=GO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://45.182.54.130:8080/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://45.182.54.130:8080/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5213772]
Nome=Montividiu do Norte
UF=GO
Provedor=PadraoNacional

[5213806]
Nome=Morrinhos
UF=GO
Provedor=PadraoNacional

[5213855]
Nome=Morro Agudo de Goias
UF=GO
Provedor=PadraoNacional

[5213905]
Nome=Mossamedes
UF=GO
Provedor=PadraoNacional

[5214002]
Nome=Mozarlandia
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/mozarlandia/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5214051]
Nome=Mundo Novo
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/mundonovo/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5214101]
Nome=Mutunopolis
UF=GO
Provedor=PadraoNacional

[5214408]
Nome=Nazario
UF=GO
Provedor=PadraoNacional

[5214507]
; Inclu�do em 19/07/2021
; Atualizado em 14/08/2022
Nome=Neropolis
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=*
ProConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/rps/go/neropolis
ProCancelarNFSe=https://api.centi.com.br/nfe/cancelar/go/neropolis
ProGerarNFSe=https://api.centi.com.br/nfe/gerar/go/neropolis
;
HomRecepcionar=*
HomConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/homologacao/rps/go/neropolis
HomCancelarNFSe=https://api.centi.com.br/nfe/cancelar/homologacao/go/neropolis
HomGerarNFSe=https://api.centi.com.br/nfe/gerar/homologacao/go/neropolis
;
ProLinkURL=https://api.centi.dev.br/portal/nfse/go/neropolis/%CodVerif%
HomLinkURL=https://api.centi.dev.br/portal/nfse/go/neropolis/%CodVerif%

[5214606]
Nome=Niquelandia
UF=GO
Provedor=PadraoNacional

[5214705]
Nome=Nova America
UF=GO
Provedor=PadraoNacional

[5214804]
Nome=Nova Aurora
UF=GO
Provedor=PadraoNacional

[5214838]
Nome=Nova Crixas
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/novacrixas/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5214861]
Nome=Nova Gloria
UF=GO
Provedor=PadraoNacional

[5214879]
Nome=Nova Iguacu de Goias
UF=GO
Provedor=PadraoNacional

[5214903]
Nome=Nova Roma
UF=GO
Provedor=PadraoNacional

[5215009]
Nome=Nova Veneza
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/novaveneza/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5215207]
Nome=Novo Brasil
UF=GO
Provedor=PadraoNacional

[5215231]
Nome=Novo Gama
UF=GO
Provedor=PadraoNacional

[5215256]
Nome=Novo Planalto
UF=GO
Provedor=PadraoNacional

[5215306]
; Inclu�do em 17/11/2021
Nome=Orizona
UF=GO
Provedor=Sigep
Versao=2.00
ProRecepcionar=http://gestaopublica.orizona.bsit-br.com.br/integracao/services/nfseWS

[5215405]
Nome=Ouro Verde de Goias
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/ouroverdedegoias/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5215504]
Nome=Ouvidor
UF=GO
Provedor=PadraoNacional

[5215603]
Nome=Padre Bernardo
UF=GO
Provedor=PadraoNacional

[5215652]
Nome=Palestina de Goias
UF=GO
Provedor=PadraoNacional

[5215702]
Nome=Palmeiras de Goias
UF=GO
Provedor=PadraoNacional

[5215801]
Nome=Palmelo
UF=GO
Provedor=PadraoNacional

[5215900]
Nome=Palminopolis
UF=GO
Provedor=PadraoNacional

[5216007]
Nome=Panama
UF=GO
Provedor=PadraoNacional

[5216304]
Nome=Paranaiguara
UF=GO
Provedor=Betha

[5216403]
Nome=Parauna
UF=GO
Provedor=PadraoNacional

[5216452]
Nome=Perolandia
UF=GO
Provedor=PadraoNacional

[5216809]
Nome=Petrolina de Goias
UF=GO
Provedor=PadraoNacional

[5216908]
Nome=Pilar de Goias
UF=GO
Provedor=PadraoNacional

[5217104]
Nome=Piracanjuba
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/piracanjuba/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5217203]
Nome=Piranhas
UF=GO
Provedor=PadraoNacional

[5217302]
Nome=Pirenopolis
UF=GO
Provedor=Prodata
Versao=2.01
ProRecepcionar=http://gestao.pirenopolis.go.gov.br/prodataws/services/NfseWSService
HomRecepcionar=

[5217401]
; Inclu�do em 21/01/2022
Nome=Pires do Rio
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/piresdorio/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5217609]
Nome=Planaltina
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/planaltina/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5217708]
; Inclu�do em 30/08/2021
Nome=Pontalina
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://pontalina.megasoftarrecadanet.com.br/pontalina/ws/nfseSOAP
HomRecepcionar=

[5218003]
Nome=Porangatu
UF=GO
Provedor=Sigep
Versao=2.00
ProRecepcionar=http://gestaopublica.porangatu.bsit-br.com.br/integracao/services/nfseWS
HomRecepcionar=

[5218052]
Nome=Porteirao
UF=GO
Provedor=PadraoNacional

[5218102]
Nome=Portelandia
UF=GO
Provedor=PadraoNacional

[5218300]
Nome=Posse
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/posse/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5218391]
Nome=Professor Jamil
UF=GO
Provedor=PadraoNacional

[5218508]
Nome=Quirinopolis
UF=GO
Provedor=PadraoNacional

[5218607]
Nome=Rialma
UF=GO
Provedor=PadraoNacional

[5218706]
Nome=Rianapolis
UF=GO
Provedor=PadraoNacional

[5218789]
Nome=Rio Quente
UF=GO
Provedor=PadraoNacional

[5218805]
Nome=Rio Verde
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=*
ProConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/rps/go/rioverde
ProCancelarNFSe=https://api.centi.com.br/nfe/cancelar/go/rioverde
ProGerarNFSe=https://api.centi.com.br/nfe/gerar/go/rioverde
;
HomRecepcionar=*
HomConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/homologacao/rps/go/rioverde
HomCancelarNFSe=https://api.centi.com.br/nfe/cancelar/homologacao/go/rioverde
HomGerarNFSe=https://api.centi.com.br/nfe/gerar/homologacao/go/rioverde
;
ProLinkURL=https://api.centi.dev.br/portal/nfse/go/rioverde/%CodVerif%
HomLinkURL=https://api.centi.dev.br/portal/nfse/go/rioverde/%CodVerif%

[5218904]
; Inclu�do em 12/05/2022
Nome=Rubiataba
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://rubiataba.megasoftarrecadanet.com.br/rubiataba/ws/nfseSOAP
HomRecepcionar=

[5219001]
Nome=Sanclerlandia
UF=GO
Provedor=PadraoNacional

[5219100]
Nome=Santa Barbara de Goias
UF=GO
Provedor=PadraoNacional

[5219209]
Nome=Santa Cruz de Goias
UF=GO
Provedor=PadraoNacional

[5219258]
Nome=Santa Fe de Goias
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=http://app.centi.com.br/santafedegoias/wcf/service/ServiceNfse.svc/ws
HomRecepcionar=

[5219308]
Nome=Santa Helena de Goias
UF=GO
Provedor=PadraoNacional

[5219357]
Nome=Santa Isabel
UF=GO
Provedor=PadraoNacional

[5219407]
Nome=Santa Rita do Araguaia
UF=GO
Provedor=PadraoNacional

[5219456]
Nome=Santa Rita do Novo Destino
UF=GO
Provedor=PadraoNacional

[5219506]
Nome=Santa Rosa de Goias
UF=GO
Provedor=PadraoNacional

[5219605]
Nome=Santa Tereza de Goias
UF=GO
Provedor=PadraoNacional

[5219704]
Nome=Santa Terezinha de Goias
UF=GO
Provedor=PadraoNacional

[5219712]
Nome=Santo Antonio da Barra
UF=GO
Provedor=PadraoNacional

[5219738]
Nome=Santo Antonio de Goias
UF=GO
Provedor=PadraoNacional

[5219753]
Nome=Santo Antonio do Descoberto
UF=GO
Provedor=PadraoNacional

[5219803]
Nome=Sao Domingos
UF=GO
Provedor=PadraoNacional

[5219902]
Nome=Sao Francisco de Goias
UF=GO
Provedor=PadraoNacional

[5220009]
Nome=Sao Joao D Alianca
UF=GO
Provedor=PadraoNacional

[5220058]
Nome=Sao Joao da Parauna
UF=GO
Provedor=PadraoNacional

[5220108]
Nome=Sao Luis de Montes Belos
UF=GO
Provedor=Sigep
Versao=2.00
ProRecepcionar=http://gestaopublica.slmb.bsit-br.com.br/integracao/services/nfseWS
HomRecepcionar=

[5220157]
Nome=Sao Luiz do Norte
UF=GO
Provedor=PadraoNacional

[5220207]
; Inclu�do em 14/12/2021
Nome=Sao Miguel do Araguaia
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=*
ProConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/rps/go/saomigueldoaraguaia
ProCancelarNFSe=https://api.centi.com.br/nfe/cancelar/go/saomigueldoaraguaia
ProGerarNFSe=https://api.centi.com.br/nfe/gerar/go/saomigueldoaraguaia
;
HomRecepcionar=*
HomConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/homologacao/rps/go/saomigueldoaraguaia
HomCancelarNFSe=https://api.centi.com.br/nfe/cancelar/homologacao/go/saomigueldoaraguaia
HomGerarNFSe=https://api.centi.com.br/nfe/gerar/homologacao/go/saomigueldoaraguaia
;
ProLinkURL=https://api.centi.dev.br/portal/nfse/go/saomigueldoaraguaia/%CodVerif%
HomLinkURL=https://api.centi.dev.br/portal/nfse/go/saomigueldoaraguaia/%CodVerif%

[5220264]
Nome=Sao Miguel do Passa Quatro
UF=GO
Provedor=PadraoNacional

[5220280]
Nome=Sao Patricio
UF=GO
Provedor=PadraoNacional

[5220405]
Nome=Sao Simao
UF=GO
Provedor=PadraoNacional

[5220454]
; Atualizado em 26/07/2022
Nome=Senador Canedo
UF=GO
Provedor=Fiorilli
Versao=2.00
ProRecepcionar=http://45.65.223.34:5661/IssWeb-ejb/IssWebWS/IssWebWS
ProLinkURL=http://45.65.223.34:5661/issweb/formGerarNF.jsf?nroNota=%NumeroNFSe%&codVerificacao=%CodVerif%&cnpj=%Cnpj%&hash=%ChaveAcesso%

[5220504]
Nome=Serranopolis
UF=GO
Provedor=PadraoNacional

[5220603]
; Inclu�do em 14/12/2021
; Atualizado em 28/10/2022
Nome=Silvania
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://silvania.megasoftarrecadanet.com.br/silvania/ws/nfseSOAP

[5220686]
Nome=Simolandia
UF=GO
Provedor=PadraoNacional

[5220702]
Nome=Sitio D Abadia
UF=GO
Provedor=PadraoNacional

[5221007]
Nome=Taquaral de Goias
UF=GO
Provedor=PadraoNacional

[5221080]
Nome=Teresina de Goias
UF=GO
Provedor=PadraoNacional

[5221197]
; Inclu�do em 04/11/2021
Nome=Terezopolis de Goias
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://terezopolisdegoias.megasoftarrecadanet.com.br/terezopolisdegoias/ws/nfseSOAP
HomRecepcionar=

[5221304]
Nome=Tres Ranchos
UF=GO
Provedor=PadraoNacional

[5221403]
; Atualizado em 19/05/2022
Nome=Trindade
UF=GO
Provedor=Centi
Versao=2.02
ProRecepcionar=*
ProConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/rps/go/trindade
ProCancelarNFSe=https://api.centi.com.br/nfe/cancelar/go/trindade
ProGerarNFSe=https://api.centi.com.br/nfe/gerar/go/trindade
;
HomRecepcionar=*
HomConsultarNFSeRps=https://api.centi.com.br/nfe/consultar/homologacao/rps/go/trindade
HomCancelarNFSe=https://api.centi.com.br/nfe/cancelar/homologacao/go/trindade
HomGerarNFSe=https://api.centi.com.br/nfe/gerar/homologacao/go/trindade
;
ProLinkURL=https://api.centi.dev.br/portal/nfse/go/trindade/%CodVerif%
HomLinkURL=https://api.centi.dev.br/portal/nfse/go/trindade/%CodVerif%

[5221452]
Nome=Trombas
UF=GO
Provedor=PadraoNacional

[5221502]
Nome=Turvania
UF=GO
Provedor=PadraoNacional

[5221551]
Nome=Turvelandia
UF=GO
Provedor=PadraoNacional

[5221577]
Nome=Uirapuru
UF=GO
Provedor=PadraoNacional

[5221601]
; Inclu�do em 24/01/2022
Nome=Uruacu
UF=GO
Provedor=MegaSoft
Versao=2.00
ProRecepcionar=https://uruacu.megasoftarrecadanet.com.br/uruacu/ws/nfseSOAP

[5221700]
Nome=Uruana
UF=GO
Provedor=PadraoNacional

[5221809]
Nome=Urutai
UF=GO
Provedor=PadraoNacional

[5221858]
Nome=Valparaiso de Goias
UF=GO
Provedor=Governa
Params=VersaoArquivo:1|VersaoImpressao:3
;
ProRecepcionar=http://177.69.240.130/webservicevalparaiso/esiat.asmx

[5221908]
Nome=Varjao
UF=GO
Provedor=PadraoNacional

[5222005]
Nome=Vianopolis
UF=GO
Provedor=PadraoNacional

[5222054]
Nome=Vicentinopolis
UF=GO
Provedor=PadraoNacional

[5222203]
Nome=Vila Boa
UF=GO
Provedor=PadraoNacional

[5222302]
Nome=Vila Propicio
UF=GO
Provedor=PadraoNacional

[5300108]
; Atualizado em 30/12/2022
Nome=Brasilia
UF=DF
Provedor=ISSNet
Versao=2.04
ProRecepcionar=https://df.issnetonline.com.br/webservicenfse204/nfse.asmx
HomRecepcionar=https://www.issnetonline.com.br/apresentacao/df/webservicenfse204/nfse.asmx

  