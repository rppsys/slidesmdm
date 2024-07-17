# language: pt
# encoding: utf-8

Funcionalidade: 02 - Incluir Solicitação

  **COMO** usuário que possui permissão

  **QUERO** incluir Solicitação de Ordem de Serviço

  **PARA** ser assinado no SEI

  Contexto:
    Dado que existam os seguintes registros de solicitação:
      | Autor                   | Data/Hora          | Tipo              | Subtipo   | Status        |
      | Luiz Soares Cardoso     | 07/09/2020 - 09:58 | Minuta de Parecer | Indicação | Em execução   |
      | Luiz Soares Cardoso     | 10/09/2020 - 13:45 | Estudo            | N/A       | Concluído     |
      | Aline Batista Lopes     | 15/02/2021 - 15:32 | Consulta          | N/A       | Descontinuado |
      | Francisco Gomes Freitas | 10/03/2021 - 14:00 | Estudo            | N/A       | Cancelado (TE)|
      | Francisco Gomes Freitas | 25/03/2021 - 16:27 | Estudo            | N/A       | Cancelado     |
    E os dados de domínio, com valores iniciais:
      | Campo          | Valor Possível                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Valor Inicial |
      | Tipo           | Consulta, Estudo, Minuta de Pronunciamento/Discurso, Minuta de Parecer, Minuta de Proposição, Nota Técnica, Relatório de Veto, Outros                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |               |
      | Subtipo        | Minuta de Parecer e Minuta de Proposição[Denúncia, Indicação, Mensagem, Projeto Legislativo, Proposta de Emenda à Lei Orgânica, Projeto de Lei, Projeto de Lei Complementar, Projeto de Resolução, Moção, Recurso, Requerimento], N/A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | "N/A"         |
      | Status         | Enviado para assinatura, Em execução, Pendência, Concluído, Cancelado, Cancelado (TE), Descontinuado                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |               |
      | Hipótese Legal | Auditoria Administrativa e Operacional (Art. 32 da lei Distrital nº 4.011/2007), Direitos Autorais - Obras Protegidas (Inciso X, Art. 7º da Lei 9.610/98), Documento Preparatório (Art.7º, VII, §3º, da Lei nº 4.990/2012), Informação Pessoal (Art.33, §1º, I, da Lei nº4.990/2012), Investigação de responsabilidade do servidor (Art. 181 e seguintes, Lei Complementar 840/2011.), Inviolabilidade do escritório ou local de trabalho (Art. 7º, inciso II da Lei nº 8.906/1994), Licitações e Contratos (Lei nº 6.666/1993), Mediação de Conflitos (Art.12, da instrução Normativa 2, de 25/07/2016), Prejudicar ou Causar Risco a Projetos de Pesquisa (Lei 4.990/2012 - Art. 25, VI), Processos Judiciais sob Segredo de Justiça (Art. 189 da Lei 13.105/2015), Proteção do Direito da Criança e Adolescente (Inciso V, Art. 100, Lei nº 8069/1990), Restrição Operações Bancárias (Art. 1º da Lei Complementar 105/2001), Sigilo Comercial (Art. 155, Parág. 2º da Lei 6.404/1976), Sigilo Contábil (Lei 10.406/2002, Art.1.190), Sigilo Empresarial (Art. 169 da Lei 11.101/2005), Sigilo Fiscal (Art. 198, da Lei nº 5.172/1966) |               |
      | Comissão       | CCJ - Comissão de Constituição e Justiça, CEOF - Comissão de Economia Orçamento e Finanças, CAS - Comissão de Assuntos Sociais, CDC - Comissão de Defesa do Consumidor, CDDHCEDP - Comissão de Defesa Direitos Humanos, Cidadania, Ética e Decoro Parlamentar, CAF - Comissão de Assuntos Fundiários, CESC - Comissão de Educação, Saúde e Cultura, CS - Comissão de Segurança, CDESCTMAT - Comissão de Desenvolvimento Econômico Sustentável, Ciência, Tecnologia, Meio Ambiente e Turismo, CFGTC - Comissão de Fiscalização Governança Transparência e Controle, CTMU - Comissão de Transporte e Mobilidade Urbana, CE - Comissão Especial, MD - Mesa Diretora                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |               |

  Cenário: Incluir Solicitação Sem Necessidade de Criar Bloco de Assinatura
    Dado que o <Usuário> esteja na funcionalidade **"Incluir"** ou **"Incluir Minuta de Parecer"**
      | Usuário                 |
      | Francisco Gomes Freitas |
    E informe os dados de <Solicitante>:
      | Deputado/Órgão         | Contato                | Ramal |
      | Deputado Ozias Profeta | Julio Cesar Nascimento | 8232  |
    E os dados de <Solicitação>
      | Tipo   | Subtipo | Especificação do Trabalho                                     |
      | Estudo | N/A     | Elaboração de estudo técnico de mérito no âmbito da CDESCTMAT |
    E os dados de <Nível de Acesso>
      | Nível de Acesso |
      | Público         |
    E inclua os Anexos
      | Anexos                         |
      | Memorando.pdf PL 1234/2021.pdf |
    E o usuário solicita **"Enviar para Assinatura"**
    E verifica que a **Unidade Solicitante no SEI** (correspondente à **Unidade Solicitante no SISTEMA ASSEL**) **POSSUI** o **Usuário do SISTEMA SEI** (correspondente ao **Usuário do SISTEMA ASSEL** que está fazendo a solicitação**)
    Então o sistema realiza a solicitação **no SEI** em nome da unidade solicitante selecionada na listagem do combobox **"Unidade"** da funcionalidade "Listar"
    E gera um novo **PROCESSO** no SEI
    E, no SISTEMA ASSEL, armazena e grava o n° do novo processo gerado pelo **SEI** no atributo interno da OS "Informações do SEI - Número do Processo"
    E, no SEI, o sistema gera o arquivo [.HMTL] de descrição **"Minuta do Formulário de Ordem de Serviço"** com os dados informados no formulário de inclusão de "Ordem de Serviço" do **SISTEMA ASSEL**
    E, no SISTEMA ASSEL, armazena e grava o N°/link retornado pelo **SEI** da minuta gerada no atributo interno da OS "Informações do SEI - Número da Solicitação"
    E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Bloco de Assinatura" com a informação: "NA"
    E, no SISTEMA ASSEL, armazena e grava o nome completo do usuário logado <Usuário> no atributo interno da OS "Autor"
    E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Número do Termo de Cancelamento" com a informação: "NA"
    E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Bloco de Assinatura Cancelamento" com a informação: "NA"
    E busca na configuração do ambiente o **idSerie** do tipo de documento **Anexo**
    E cadastra os anexos como documentos do tipo **Anexo** **no SEI**
    E apresenta a <Mensagem>:
      | Mensagem                                                                                                                 |
      | Enviado com sucesso!|
      | Por favor, para concluir a solicitação, o documento SEI **N°0003216** do processo **00001-00000001/21-01** disponibilizado para assinatura na unidade **"GAB 01"** deve ser assinado no prazo de até 15 dias!|
      | Após a assinatura, o sistema ASSEL se encarregará de tramitar o processo para a Assessoria Legislativa. Caso o documento não seja assinado em 15 dias, a solicitação será automaticamente cancelada.|
    Com os <Parâmetros>:
      |Parâmetro da Mensagem           | Origem dos Dados                                                   |
      |**N°0003216**                   | Atributo interno da OS "Informações do SEI - Número da Solicitação"|
      |**00001-00000001/21-01**        | Atributo interno da OS "Informações do SEI - Número do Processo"   |
      |**"GAB 01"**                    | Nome completo da Unidade Solicitante                               |
    E o SISTEMA ASSEL fecha a janela "Nova Solicitação";

  Cenário: Incluir Solicitação Criando Bloco de Assinatura no SEI em Unidade Escolhida pelo Usuário - Opção "OK"
    Dado que o <Usuário> esteja na funcionalidade **"Incluir"** ou **"Incluir Minuta de Parecer"**
      | Usuário                 |
      | Francisco Gomes Freitas |
    E informe os dados da Solicitação e Anexos                         |
      | Deputado/Órgão         | Contato                | Ramal | Tipo   | Subtipo | Especificação do Trabalho                                     | Nível de Acesso | Anexos                         |
      | Deputado Ozias Profeta | Julio Cesar Nascimento | 8232  | Estudo | N/A     | Elaboração de estudo técnico de mérito no âmbito da CDESCTMAT | Público         | Memorando.pdf PL 1234/2021.pdf |
    E o usuário solicita **"Enviar para Assinatura"**
    E verifica que a **Unidade Solicitante no SEI** (correspondente à **Unidade Solicitante no SISTEMA ASSEL**) **NÃO POSSUI** o **Usuário do SISTEMA SEI** (correspondente ao **Usuário do SISTEMA ASSEL** que está fazendo a solicitação**)
    E o sistema gera caixa de diálogo com a <Mensagem>:
      | Mensagem                                                                                                                 |
      | Por favor, escolha a unidade do SEI onde a solicitação será assinada:|
    E apresenta um <Combobox> com uma lista de **TODAS AS UNIDADES DO SEI** para o usuário escolher:
      | Combobox                                                                                                                 |
      | CMI   |
      | DRH   |
      | GAB1  |
      | GAB2  |
      | GAB3  |
      | GAB4  |
      | GAB5  |
      | GAB6  |
      | GAB7  |
      | GAB8  |
      | GAB9  |
      | (...) |
    E o usuário escolhe uma **Unidade do SEI** da lista do **Combobox** e clica em "OK".
    E o sistema realiza a solicitação **no SEI** em nome da unidade solicitante selecionada na listagem do combobox **"Unidade"** da funcionalidade "Listar"
    E gera um **PROCESSO** no SEI
    E, no SISTEMA ASSEL, armazena e grava o n° do novo processo gerado pelo **SEI** no atributo interno da OS "Informações do SEI - Número do Processo"
    E **cria no SEI**, na **Unidade Solicitante no SEI** (correspondente à **Unidade Solicitante no SISTEMA ASSEL**), um **Bloco de Assinatura** incluindo em **Unidades para Disponibilização** a **Unidade do SEI escolhido** na lista do **Combobox** com a <Descrição>:
      | Descrição                                                                                                                 |
      |Sistema ASSEL - Solicitação de Serviço|
      |Unidade Solicitante: Gabinete do Deputado Nome do Deputado|
      |Unidade Solicitante: Gabinete do Deputado Nome do Deputado|
      |Usuário Solicitante: Nome Completo do Usuário Solicitante|
    E, no SISTEMA ASSEL, armazena e grava o N°/link retornado pelo **SEI** do novo **Bloco de Assinatura** criado no atributo interno da OS "Informações do SEI - Bloco de Assinatura"
    E gera um arquivo [.HMTL] **no SEI** de descrição **Minuta do Formulário de Ordem de Serviço** com os dados informados no formulário de inclusão de "Ordem de Serviço" no **"ASSEL"**
    E, no SISTEMA ASSEL, armazena e grava o N°/link retornado pelo **SEI** da minuta gerada no atributo interno da OS "Informações do SEI - Número da Solicitação"
    E, no SISTEMA ASSEL, armazena e grava o nome completo do usuário logado <Usuário> no atributo interno da OS "Autor"
    E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Número do Termo de Cancelamento" com a informação: "NA"
    E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Bloco de Assinatura Cancelamento" com a informação: "NA"
    E busca na configuração do ambiente o **idSerie** do tipo de documento **Anexo** a ser gerado no SEI
    E cadastra os anexos como documentos do tipo **Anexo** **no SEI**
    E o sistema inclui o arquivo [.HTML] da **Minuta do Formulário de Ordem de Serviço** no **Bloco de Assinatura** criado
    Quando o sistema disponibiliza o **Bloco de Assinatura** gerado no SEI para a **Unidade do SEI** da lista do **Combobox** escolhida
    Então o sistema apresenta a <Mensagem>:
      | Mensagem                                                                                                                 |
      | Enviado com sucesso!|
      | Por favor, para concluir a solicitação, o documento SEI **N°0003216** do processo **00001-00000001/21-01** disponível no Bloco de Assinatura **N° 00001** disponibilizado para a unidade **Unidade do SEI escolhido no combobox** deve ser assinado no prazo de até 15 dias!|
      | Após a assinatura, o sistema ASSEL se encarregará de tramitar o processo para a Assessoria Legislativa. Caso o documento não seja assinado em 15 dias, a solicitação será automaticamente cancelada.|
    Com os <Parâmetros>:
      |Parâmetro da Mensagem                    | Origem dos Dados                                                           |
      |**N°0003216**                            | Atributo interno da OS "Informações do SEI - Número da Solicitação"        |
      |**00001-00000001/21-01**                 | Atributo interno da OS "Informações do SEI - Número do Processo"           |
      |**N° 00001**                             | Atributo interno da OS "Informações do SEI - Número do Bloco de Assinatura"|
      |**Unidade do SEI escolhido no combobox** | **Unidade do SEI escolhido no combobox**                                   |
    E o SISTEMA ASSEL fecha a janela "Nova Solicitação";
    E o sistema atribui o **Status** de **"Enviado para assinatura"** para **OS** no **SISTEMA ASSEL**

  Cenário: Incluir Solicitação Criando Bloco de Assinatura no SEI em Unidade Escolhida pelo Usuário - Opção "Cancelar"
    Dado que o <Usuário> esteja na funcionalidade **"Incluir"** ou **"Incluir Minuta de Parecer"**
      | Usuário                 |
      | Francisco Gomes Freitas |
    E informe os dados da Solicitação e Anexos                         |
      | Deputado/Órgão         | Contato                | Ramal | Tipo   | Subtipo | Especificação do Trabalho                                     | Nível de Acesso | Anexos                         |
      | Deputado Ozias Profeta | Julio Cesar Nascimento | 8232  | Estudo | N/A     | Elaboração de estudo técnico de mérito no âmbito da CDESCTMAT | Público         | Memorando.pdf PL 1234/2021.pdf |
    E o usuário solicita **"Enviar para Assinatura"**
    E verifica que a **Unidade Solicitante no SEI** (correspondente à **Unidade Solicitante no SISTEMA ASSEL**) **NÃO POSSUI** o **Usuário do SISTEMA SEI** (correspondente ao **Usuário do SISTEMA ASSEL** que está fazendo a solicitação**)
    E o sistema gera caixa de diálogo com a <Mensagem>:
      | Mensagem                                                                                                                 |
      | Por favor, escolha a unidade do SEI onde a solicitação será assinada:|
    E apresenta um <Combobox> com uma lista de **TODAS AS UNIDADES DO SEI** para o usuário escolher:
      | Combobox                                                                                                                 |
      | CMI   |
      | DRH   |
      | GAB1  |
      | GAB2  |
      | GAB3  |
      | GAB4  |
      | GAB5  |
      | GAB6  |
      | GAB7  |
      | GAB8  |
      | GAB9  |
      | (...) |
    E o usuário clica em "Cancelar".
    Então o SISTEMA ASSEL exibe a <Mensagem>:
      | Mensagem                                                                                                                 |
      | Solicitação não foi enviada!|
    E o SISTEMA ASSEL mantem a janela "Nova Solicitação" aberta.

  #1.4  E o usuário que pertence a unidade solicitante podera assinar sem haver assinatura
  #vERIFICA QUE SE TEM 1 ASSINATURA
  #SE SIM  CONITNUA COM O ENVIO
  #1.4. VERIFICAR ASSTINURA
    #E

  Cenário: Solicitar Minuta de Parecer
    Quando o usuário solicita o tipo "Minuta de Parecer"
    Então o sistema carrega as opções em <Subtipo>
    E habilita os campos: "Número", "Ano", "Comissão e "Ementa"

  Cenário: Apresentar Ementa
    Dado que o usuário preencheu os seguintes campos:
      | Número | Ano  |
      | 123123 | 2015 |
    Quando o usuário solicita "Buscar"(ícone Lupa)
    Então o sistema busca ementa correspondente no PLE
    E apresenta no campo "Ementa"
    E não permite edição

  Cenário: Acesso Restrito
    Quando o usuário solicita Nível de Acesso "Restrito"
    Então o sistema habilita o campo: "Hipótese Legal"

  Cenário: Anexar Arquivo
    Dado que o usuário solicitou "Incluir" da sessão "Anexos"
    E anexou um arquivo
    E preencheu os seguintes campos:
      | Nível de Acesso | Descrição                                           |
      | Público         | documento para colaborar com elaboração do artefato |
    Quando o usuário solicita "Incluir"
    Então o sistema grava o anexo
    E retorna para a tela de "Nova Solicitação"
    E apresenta o anexo realizado na lista de Anexos

  Cenário: Acesso Restrito de Anexo
    Quando o usuário solicita Nível de Acesso "Restrito"
    Então o sistema habilita o campo: "Hipótese Legal"

  Cenário: Editar Anexo
    Dado que o usuário solicitou "Editar" da sessão "Anexos" para o seguinte anexo:
      | Anexo            | Nível de Acesso | Descrição                                           |
      | PL 1234/2021.pdf | Público         | documento para colaborar com elaboração do artefato |
    E editou o seguinte campo:
      | Descrição                                                      |
      | documento para colaborar com elaboração do artefato para ASSEL |
    Quando o usuário solicita "Salvar"
    Então o sistema grava a alteração
    E retorna para a tela de "Nova Solicitação"

  Cenário: Remover Anexo
    Dado que o usuário solicitou um anexo na lista "Anexos"
    Quando o usuário solicita "Remover"
    Então o sistema remove o anexo

  Cenário: Anexar Arquivo Não Suportado
    Dado que o usuário anexou um arquivo com formato não suportado pelo SEI
    Quando o usuário solicita "Incluir"
    Então o sistema apresenta mensagem: "Formato de arquivo não suportado."

  Esquema do Cenário: Apresentar Hint de Ação
    Dado que o usuário solicitou "Novo"
    Quando o usuário move o mouse pela <Ação>
    Então o sistema apresenta <Hint> acima da <Ação>
    Exemplos:
      | Ação           | Hint    |
      | Incluir  Anexo | Incluir |
      | Editar Anexo   | Editar  |
      | Excluir Anexo  | Excluir |

  Esquema do Cenário: Verificar Campos Obrigatórios
    Dado que o usuário inseriu <Dado> no <Campo>
    Quando o usuário solicita "Enviar para Assinatura"
    Então o sistema apresenta a mensagem: "Preenchimento Obrigatório."
    Exemplos:
      | Dado | Campo                     |
      |      | Deputado/Órgão            |
      |      | Contato                   |
      |      | Ramal                     |
      |      | Tipo                      |
      |      | Subtipo                   |
      |      | Especificação do Trabalho |
      |      | Nível de Acesso           |
      |      | Hipótese Legal            |
      |      | Número                    |
      |      | Ano                       |
      |      | Comissão                  |

  Cenário: Solicitar Acesso Restrito
    Dado que o usuário solicitou "Nível de Acesso" Restrito:
      | Nível de Acesso |
      | Restrito        |
    Então o sistema apresenta a combobox "Hipótese Legal"
