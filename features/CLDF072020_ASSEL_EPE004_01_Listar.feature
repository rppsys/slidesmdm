#language: pt
#encoding: utf-8

Funcionalidade: 01 - Listar

  **COMO** usuário que possui permissão

  **QUERO** acessar os registros de solicitações da minha Unidade

  **PARA** visualizar no Sistema ASSEL

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

  Cenário: Apresentar Unidades do Usuário
    Dado que o seguinte registro solicitou "Solicitar Ordem de Serviço":
      | Login da Rede | Nome Completo       | Matrícula | Unidade(s)               | Ramal | Situação |
      | Carlos.Sousa  | Carlos Santos Sousa | 010101    | Gabinete 10, Gabinete 15 | 9999  | Ativo    |
    Quando o usuário solicita o combobox "Unidade"
    Então o sistema lista no combobox as unidades vinculadas ao usuário:
      | Unidade     |
      | Gabinete 10 |
      | Gabinete 15 |

  Cenário: Listar Solicitações da Unidade
    Dado o seguinte registro de usuário:
      | Login da Rede | Nome Completo       | Matrícula | Unidade(s)               | Ramal | Situação |
      | Carlos.Sousa  | Carlos Santos Sousa | 010101    | Gabinete 10, Gabinete 15 | 9999  | Ativo    |
    Quando o usuário solicita "Solicitar Ordem de Serviço"
    Então o sistema apresenta a listagem das solicitações da **Primeira Unidade Vinculada ao usuário da lista**
    E não apresenta as solicitações com status "Cancelado" ou "Descontinuado"
      | Unidade     |
      | Gabinete 10 |

  Cenário: Listar Solicitações da Última Unidade Selecionada
    Dado que no último acesso à funcionalidade "Solicitar Ordem de Serviço" o usuário solicitou a seguinte unidade do combobox "Unidade":
      | Unidade     |
      | Gabinete 10 |
    Quando o usuário solicita "Solicitar Ordem de Serviço"
    Então o sistema apresenta automaticamente as solicitações da última unidade selecionada

  Cenário: Listar Todos
    Quando o usuário solicita "Todos"
    Então o sistema lista todos os registros de solicitação da Unidade Vinculada atual

  Cenário: Ordenar
    Quando o usuário solicita "Ordenar"
    Então o sistema ordena os registros de acordo com o campo ao lado do ícone

  Cenário: Pesquisar Parcialmente Por Tipo de Dado
    Quando o usuário insere no campo de pesquisa parcial do campo Autor:
      | Autor |
      | luiz  |
    Então o sistema carrega automaticamente as solicitações que contém o dado inserido na pesquisa:
      | Autor               | Data/Hora          | Tipo   | Subtipo | Status      |
      | Luiz Soares Cardoso | 07/09/2020 - 09:58 | Minuta | Parecer | Em execução |
      | Luiz Soares Cardoso | 10/09/2020 - 13:45 | Minuta | Parecer | Concluído   |

  Cenário: Pesquisar Dado Inexistente
    Dado que o usuário inseriu o seguinte dado no campo de pesquisa parcial de **Autor**:
      | Autor                |
      | Pedro Oliveira Rocha |
    Quando o sistema confirma a inexistência do registro no banco de dados
    Então o sistema apresenta a mensagem: "Nenhum registro encontrado."
    E apresenta a lista de dados vazia:
      | Autor                       | Data/Hora | Tipo | Subtipo | Status |
      |                             |           |      |         |        |
      |                             |           |      |         |        |
      | Nenhum registro encontrado. |           |      |         |        |

  Cenário: Filtrar Status
    Dado que o usuário solicitou a combobox "Status"
    Quando o usuário solicita "Cancelado"
    Então o sistema apresenta somente as solicitações com status "Cancelado":
      | Autor                   | Data/Hora          | Tipo   | Subtipo | Status    |
      | Francisco Gomes Freitas | 25/03/2021 - 16:27 | Estudo | N/A     | Cancelado |

  Cenário: Apresentar Ações Desabilitadas
    Quando o usuário solicita "Solicitar Ordem de Serviço"
    Então o sistema apresenta as seguintes ações **desabilitadas**:
      | Ação       |
      | Visualizar |
      | Cancelar   |

  Esquema do Cenário: Apresentar Código de Grupo 1
    Quando o sistema lista <Tipo>
    Então o sistema apresenta na tabela o <Código> no campo "Solicitação"
    E atribui conforme <Cálculo> e <Máscara>
    Exemplos:
      | Tipo                                      | Código        | Cálculo       | Máscara                  |
      | Consulta (CONS)                           | CONS002-2021  | Crescente(+1) | SIGLA + NUM(3) "-" + Ano |
      | Estudo (EST)                              | EST080-2021   | Crescente(+1) | SIGLA + NUM(3) "-" + Ano |
      | Minuta de Pronunciamento/Discurso (MPRON) | MPRON120-2021 | Crescente(+1) | SIGLA + NUM(3) "-" + Ano |
      | Nota Técnica (NT)                         | NT010-2021    | Crescente(+1) | SIGLA + NUM(3) "-" + Ano |
      | Relatório de Veto (RV)                    | RV010-2021    | Crescente(+1) | SIGLA + NUM(3) "-" + Ano |
      | Outros (OUT)                              | OUT100-2021   | Crescente(+1) | SIGLA + NUM(3) "-" + Ano |

  Esquema do Cenário: Apresentar Código de Grupo 2 - Minutas de Proposição
    Quando o sistema lista <Tipo> e <Subtipo>
    Então o sistema apresenta na tabela o <Código> no campo "Solicitação"
    E atribui conforme <Cálculo> e <Máscara>
    Exemplos:
      | Tipo                      | Subtipo                                  | Código         | Cálculo       | Máscara                                       |
      | Minuta de Proposição (MP) | Denúncia (DEN)                           | MP001DEN-2021  | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |
      | Minuta de Proposição (MP) | Indicação (IND)                          | MP020IND-2020  | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |
      | Minuta de Proposição (MP) | Mensagem (MENS)                          | MP220MENS-2020 | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |
      | Minuta de Proposição (MP) | Projeto de Decreto Legislativo (PDL)     | MP010PDL-2021  | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |
      | Minuta de Proposição (MP) | Proposta de Emenda à Lei Orgânica (PELO) | MP002PELO-2021 | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |
      | Minuta de Proposição (MP) | Projeto de Lei (PL)                      | MP001PL-2022   | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |
      | Minuta de Proposição (MP) | Projeto de Lei Complementar (PLC)        | MP001PLC-2022  | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |
      | Minuta de Proposição (MP) | Projeto de Resolução (PR)                | MP010PR-2022   | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |
      | Minuta de Proposição (MP) | Moção (MOC)                              | MP010MOC-2022  | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |
      | Minuta de Proposição (MP) | Recurso (RC)                             | MP001RC-2021   | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |
      | Minuta de Proposição (MP) | Requerimento (RQ)                        | MP001RQ-2021   | Crescente(+1) | SIGLA_TIPO + NUM(3) + SIGLA_SUBTIPO "-" + Ano |

  Esquema do Cenário: Apresentar Código de Grupo 3 - Minutas de Parecer
    Quando o sistema lista <Tipo> e <Subtipo>
    Então o sistema apresenta na tabela o <Código> no campo "Solicitação"
    E atribui <Comissão> e <Letra>:
      | Comissão                                                                                                    | Letra |
      | CCJ - Comissão de Constituição e Justiça                                                                    | J     |
      | CEOF - Comissão de Economia Orçamento e Finanças                                                            | F     |
      | CAS - Comissão de Assuntos Sociais                                                                          | S     |
      | CDC - Comissão de Defesa do Consumidor                                                                      | C     |
      | CDDHCEDP - Comissão de Defesa Direitos Humanos, Cidadania, Ética e Decoro Parlamentar                       | H     |
      | CAF - Comissão de Assuntos Fundiários                                                                       | A     |
      | CESC - Comissão de Educação, Saúde e Cultura                                                                | E     |
      | CS - Comissão de Segurança                                                                                  | G     |
      | CDESCTMAT - Comissão de Desenvolvimento Econômico Sustentável, Ciência, Tecnologia, Meio Ambiente e Turismo | D     |
      | CFGTC - Comissão de Fiscalização Governança Transparência e Controle                                        | T     |
      | CTMU - Comissão de Transporte e Mobilidade Urbana                                                           | U     |
      | CE - Comissão Especial                                                                                      | P     |
      | MD - Mesa Diretora                                                                                          | M     |
    E conforme <Cálculo> e <Máscara>:
    Exemplos:
      | Tipo              | Subtipo                                  | Código          | Cálculo       | Máscara                                                                       |
      | Minuta de Parecer | Denúncia (DEN)                           | DEN085J25-2021  | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |
      | Minuta de Parecer | Indicação (IND)                          | IND085J25-2021  | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |
      | Minuta de Parecer | Mensagem (MENS)                          | MENS085A25-2021 | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |
      | Minuta de Parecer | Projeto de Decreto Legislativo (PDL)     | PDL085J25-2022  | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |
      | Minuta de Parecer | Proposta de Emenda à Lei Orgânica (PELO) | PELO085J25-2021 | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |
      | Minuta de Parecer | Projeto de Lei (PL)                      | PL085J25-2021   | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |
      | Minuta de Parecer | Projeto de Lei Complementar (PLC)        | PLC085J25-2021  | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |
      | Minuta de Parecer | Projeto de Resolução (PR)                | PR085J25-2021   | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |
      | Minuta de Parecer | Moção (MOC)                              | MOC085J25-2021  | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |
      | Minuta de Parecer | Recurso (RC)                             | RC085J25-2021   | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |
      | Minuta de Parecer | Requerimento (RQ)                        | RQ085J25-2021   | Crescente(+1) | SIGLA_SUBTIPO + NUM_Proposição + Letra_Comissão + NUM "-" + Ano_Da_Proposição |

  Cenário: Os Assinada
    Dado que o sistema busca **a cada 30 minutos** todas **OS's** que estejam em situação de **"Enviado para Assinatura"**
      | Situação                  |
      | Enviado para a Assinatura |
    E o sistema busca no SEI cada **"Minuta do Formulário de Ordem de Serviço"** gerado sobre cada OS encontrada
    Quando o sistema verifica que os documentos de descrição **"Minuta do Formulário de Ordem de Serviço"** criados no envio da OS contém ao menos 1 assinatura
  Então, no SISTEMA ASSEL, o sistema atribui a <Situação> para as OS’s encontradas
  | Situação     |
  | Em EXECUÇÃO |
  E, no SEI, se houver Bloco de Assinatura, o Sistema *cancela* a disponibilização do Bloco de Assinatura se ainda não foi cancelada, *retira* o documento do Bloco de Assinatura se ainda não foi retirado e *exclui* o Bloco de Assinatura se o mesmo ainda não tiver sido excluído
  E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Bloco de Assinatura" com a informação: "NA"
  E, no SEI, na unidade solicitante, se o PROCESSO tiver sido concluído, o Sistema **REABRE** o PROCESSO
  E, no SEI, na unidade solicitante, o sistema envia o PROCESSO para a <Unidade> "ASSEL" do SEI
  E, no SEI, na <Unidade> "ASSEL", se o PROCESSO ainda não tiver sido recebido, o sistema recebe o PROCESSO
  E, no SEI, na <Unidade> "ASSEL", se o PROCESSO ainda não tiver sido concluído, o sistema conclui o PROCESSO
  E, no SISTEMA ASSEL, o sistema envia a ORDEM DE SERVIÇO para a Unidade **"ASSEL"**

  Cenário: OS Não Assinada em menos de 15 dias
    Dado que o sistema busca **a cada 30 minutos** todas **OS's** que estejam em situação de **"Enviado para Assinatura"**
      | Situação                  |
      | Enviado para a Assinatura |
    E o sistema busca no SEI cada **"Minuta do Formulário de Ordem de Serviço"** gerado sobre cada OS encontrada
    Quando o sistema verifica que a **"Minuta do Formulário de Ordem de Serviço"** não contém assinatura
    E o sistema verifica que a diferença entre a data atual e a data de criação do documento é menor ou igual a 15 dias
    Então as OS's permanecem com a mesma <Situação>
      | Situação                  |
      | Enviado para a Assinatura |
    E o sistema realiza a próxima consulta em 30 minutos

  Cenário: OS Não Assinada em mais que 15 dias
    Quando o sistema verifica que a **"Minuta do Formulário de Ordem de Serviço"** não contém assinatura
    E o sistema verifica que a diferença entre a data atual e a data de criação do documento é maior que 15 dias
  Então, no SEI, se houver Bloco de Assinatura, o Sistema *cancela* a disponibilização do Bloco de Assinatura se ainda não foi cancelada, *retira* o documento do Bloco de Assinatura se ainda não foi retirado e *exclui* o Bloco de Assinatura se o mesmo ainda não tiver sido excluído
  E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Bloco de Assinatura" com a informação: "NA"
  E, no SEI, o sistema **exclui** todos os anexos da solicitação inseridos no PROCESSO SEI
  E, no SEI, o sistema **exclui** a **"Minuta do Formulário de Ordem de Serviço"** do PROCESSO SEI
  E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Número da Solicitação" com a informação: "NA"
  E, no SEI, na Unidade Solicitante, o sistema conclui o PROCESSO SEI
  E, no SISTEMA ASSEL, *mantém* o atributo interno da OS "Informações do SEI - Número do Processo"
  E, no SISTEMA ASSEL, o sistema atribui a <Situação> à ORDEM DE SERVIÇO
  | Situação  |
  | Cancelado (TE)|
