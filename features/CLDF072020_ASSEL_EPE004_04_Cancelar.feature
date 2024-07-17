#language: pt
#encoding: utf-8

Funcionalidade: 04 - Cancelar

  **COMO** usuário que possui permissão

  **QUERO** cancelar uma solicitação

  **PARA** interromper seu processo no sistema

  Contexto: Criterios de Aceitação
    Dado que existam os seguintes registros de solicitação:
      | Autor                   | Data/Hora          | Tipo              | Subtipo   | Status                  |
      | Luiz Soares Cardoso     | 07/09/2020 - 09:58 | Minuta de Parecer | Indicação | Em execução             |
      | Luiz Soares Cardoso     | 10/09/2020 - 13:45 | Estudo            | N/A       | Concluído               |
      | Aline Batista Lopes     | 15/02/2021 - 15:32 | Consulta          | N/A       | Descontinuado           |
      | Francisco Gomes Freitas | 25/03/2021 - 16:27 | Estudo            | N/A       | Cancelado (TE)          |
      | Francisco Gomes Freitas | 30/03/2021 - 18:30 | Estudo            | N/A       | Cancelado               |
      | João Carlos da Silva    | 11/11/2020 - 13:17 | Estudo            | N/A       | Enviado para assinatura |

  Cenário: Cancelar OS “Em Execução” Sem Necessidade de Bloco de Assinatura
    Dado que o usuário solicita **Cancelar** para uma OS de <Situações>
      | Situações   |
      | Em Execução |
    E o sistema apresenta a funcionalidade **”Justificativa”** com um campo de texto para ser preenchido com a justificativa
    E o usuário preenche o campo com a justificativa
    Quando o usuário solicita **“Enviar para ASSEL”**
    E verifica que a **Unidade Solicitante no SEI** (correspondente à **Unidade Solicitante no SISTEMA ASSEL**) **POSSUI** o **Usuário do SISTEMA SEI** (correspondente ao **Usuário do SISTEMA ASSEL** que está fazendo o cancelamento**)
    Então, no SEI, na Unidade Solicitante, **SE** o **PROCESSO DO SEI** relacionado à **ORDEM DE SERVIÇO** do SISTEMA ASSEL que o usuário deseja cancelar **NÃO ESTIVER ABERTO**, **ENTÃO** o sistema **REABRE** o processo
    E, no SEI, no PROCESSO DO SEI reaberto, adiciona nova minuta de documento do SEI do tipo "Termo de Cancelamento"
    E, no SISTEMA ASSEL, armazena e grava o n° da minuta do "Termo de Cancelamento" no atributo interno da OS "Informações do SEI - Número do Termo de Cancelamento"
    # Nota: O atributo interno da OS "Informações do SEI - Número do Termo de Cancelamento" não possui lugar para ser visualizado nas interfaces gráficas ainda.
    E, no SEI, no PROCESSO DO SEI reaberto, no "Termo de Cancelamento", preenche-o de acordo com o modelo, com as seguintes informações:
    |Campos do Termo de Cancelamento | Origem dos Dados |
    |Deputado/Órgão | Atributos da Solicitação da Ordem de Serviço |
    |Contato | Atributos da Solicitação da Ordem de Serviço |
    |Ramal | Atributos da Solicitação da Ordem de Serviço |
    |PEDIDO DE CANCELAMENTO | Mensagem: Solicito o cancelamento da Ordem de Serviço Nº <Número do Documento da Solicitação no SEI>. Compreendo que a execução do
serviço será interrompida e essa é uma operação irreversível.|
    |JUSTIFICATIVA | Justificativa escrita no campo de texto. |
    E começa a executar o **robô de verificação de assinaturas** buscando a assinatura no **“Termo de Cancelamento”** a cada 30 minutos

  Cenário: Cancelar OS “Em Execução” Com Necessidade de Criar Bloco de Assinatura - Opção "OK"
    Dado que o usuário solicita **Cancelar** para uma OS de <Situações>
      | Situações   |
      | Em Execução |
    E o sistema apresenta a funcionalidade **”Justificativa”** com um campo de texto para ser preenchido com a justificativa
    E o usuário preenche o campo com a justificativa
    Quando o usuário solicita **“Enviar para ASSEL”**
    E verifica que a **Unidade Solicitante no SEI** (correspondente à **Unidade Solicitante no SISTEMA ASSEL**) **NÃO POSSUI** o **Usuário do SISTEMA SEI** (correspondente ao **Usuário do SISTEMA ASSEL** que está fazendo a solicitação**)
    Então o sistema gera a caixa de diálogo com a <Mensagem>:
      | Mensagem                                                                                                                 |
      | Por favor, escolha a unidade do SEI onde o Termo de Cancelamento será assinado:|
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
    Então, no SEI, na Unidade Solicitante, **SE** o **PROCESSO DO SEI** relacionado à **ORDEM DE SERVIÇO** do SISTEMA ASSEL que o usuário deseja cancelar **NÃO ESTIVER ABERTO**, **ENTÃO** o sistema **REABRE** o processo
    E, no SEI, no PROCESSO DO SEI reaberto, adiciona nova minuta de documento do SEI do tipo "Termo de Cancelamento"
    E, no SISTEMA ASSEL, armazena e grava o n° da minuta do "Termo de Cancelamento" no atributo interno da OS "Informações do SEI - Número do Termo de Cancelamento"
    # Nota: O atributo interno da OS "Informações do SEI - Número do Termo de Cancelamento" não possui lugar para ser visualizado nas interfaces gráficas ainda.
    E, no SEI, no PROCESSO DO SEI reaberto, no "Termo de Cancelamento", preenche-o de acordo com o modelo, as seguintes informações:
    |Campos do Termo de Cancelamento | Origem dos Dados |
    |SOLICITANTE | NA |
    |Deputado/Órgão | Atributos da Solicitação da Ordem de Serviço |
    |Contato | Atributos da Solicitação da Ordem de Serviço |
    |Ramal | Atributos da Solicitação da Ordem de Serviço |
    |PEDIDO DE CANCELAMENTO | Mensagem: Solicito o cancelamento da Ordem de Serviço Nº <Número do Documento da Solicitação no SEI>. Compreendo que a execução do
serviço será interrompida e essa é uma operação irreversível.|
    |JUSTIFICATIVA | Justificativa escrita no campo de texto. |
    E o sistema cria um **Bloco de Assinaturas** na **Unidade do SEI** da lista do **Combobox** informada com a seguinte <Descrição>:
      | Descrição do Bloco de Assinatura                                          | Origem da Informação                                                                           |
      | Sistema ASSEL - Cancelamento de Ordem de Serviço                          | Título Linha da Descrição                                                                      |
      | Unidade solicitante: Gabinete 10                      | Nome da Unidade |
      | Usuário Solicitante: Nome Completo do Usuário Solicitante do Cancelamento | Nome do Usuário Solicitante                                                      |
    E, no SISTEMA ASSEL, armazena e grava o N°/link retornado pelo **SEI** do **Bloco de Assinatura** para cancelamento no atributo interno da OS "Informações do SEI - Bloco de Assinatura Cancelamento"
    # Nota: O atributo interno da OS "Informações do SEI - Bloco de Assinatura Cancelamento" não possui lugar para ser visualizado nas interfaces gráficas ainda.
    E inclui o **Termo de Cancelamento** no **Bloco de Assinaturas** criado
    E o sistema disponibiliza o **Bloco de Assinatura** gerado no SEI
    E o sistema apresenta a <Mensagem>:
      | Mensagem                                                                                                                 |
      | Enviado com sucesso!|
      | Por favor, para concluir a solicitação, o documento SEI **N°0003216** do processo **00001-00000001/21-01** disponível no **Bloco de Assinatura N° 00001** disponibilizado para a unidade **Unidade do SEI escolhido no combobox** deve ser assinado no prazo de até 15 dias!|
      | Após a assinatura, o sistema ASSEL se encarregará de cancelar a ordem de serviço. Caso o Termo de Cancelamento não seja assinado em 15 dias, o pedido de cancelamento será desconsiderado.|
    E o SISTEMA ASSEL fecha a janela "Justificativa";

  Cenário: Cancelar OS “Em Execução” Com Necessidade de Criar Bloco de Assinatura - Opção "Cancelar"
    Dado que o usuário solicita **Cancelar** para uma OS de <Situações>
      | Situações   |
      | Em Execução |
    E o sistema apresenta a funcionalidade **”Justificativa”** com um campo de texto para ser preenchido com a justificativa
    E o usuário preenche o campo com a justificativa
    Quando o usuário solicita **“Enviar para ASSEL”**
    E verifica que a **Unidade Solicitante no SEI** (correspondente à **Unidade Solicitante no SISTEMA ASSEL**) **NÃO POSSUI** o **Usuário do SISTEMA SEI** (correspondente ao **Usuário do SISTEMA ASSEL** que está fazendo a solicitação**)
    Então o sistema gera a caixa de diálogo com a <Mensagem>:
      | Mensagem                                                                                                                 |
      | Por favor, escolha a unidade do SEI onde o Termo de Cancelamento será assinado:|
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
    E o usuário clica em "Cancelar"
    Então o SISTEMA ASSEL exibe a <Mensagem>:
      | Mensagem                                                                                                                 |
      | Pedido de cancelamento desconsiderado!|
    E o SISTEMA ASSEL mantem a janela "Justificativa" aberta.

  Cenário: Cancelar OS “Em Execução” - Termo de Cancelamento não assinado em menos de 15 dias
    Dado que o sistema busca **a cada 30 minutos** todos os **“Termos de Cancelamento”** aguardando assinatura
    Quando o sistema verifica que o **“Termo de Cancelamento”** não contém assinatura
    E o sistema verifica que a diferença entre a data atual e a data de criação do **termo de cancelamento** é menor ou igual a 15 dias
    Então o sistema realiza a próxima consulta em 30 minutos

  Cenário: Cancelar OS “Em Execução” - Termo de Cancelamento não assinado em mais de 15 dias
    Dado que o sistema busca **a cada 30 minutos** todos **“Termos de Cancelamento”** aguardando assinatura
    Quando o sistema verifica que o **“Termo de Cancelamento”** não contém assinatura
    E o sistema verifica que a diferença entre a data atual e a data de criação do termo é maior que 15 dias
    Então, no SEI, se houver Bloco de Assinatura, o Sistema *cancela* a disponibilização do Bloco de Assinatura se ainda não foi cancelada, *retira* o documento do Bloco de Assinatura se ainda não foi retirado e *exclui* o Bloco de Assinatura se o mesmo ainda não tiver sido excluído
    E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Bloco de Assinatura Cancelamento" com a informação: "NA"
    E, no SEI, o sistema **exclui** a **"Minuta do Termo de Cancelamento”**"** do PROCESSO SEI
    E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Número do Termo de Cancelamento" com a informação: "NA"
    E, no SEI, na Unidade Solicitante, o sistema conclui o PROCESSO DO SEI relacionado à ordem de serviço
    E mantém os estados como estão.

  Cenário: Cancelar OS “Em Execução” - Termo de Cancelamento Assinado
    Dado que o sistema busca **a cada 30 minutos** todos os **“Termos de Cancelamento”** aguardando assinatura
    Quando o sistema verifica que o **“Termo de Cancelamento”** contém pelo menos 1 assinatura
    Então, no SEI, se houver Bloco de Assinatura, o Sistema *cancela* a disponibilização do Bloco de Assinatura se ainda não foi cancelada, *retira* o documento do Bloco de Assinatura se ainda não foi retirado e *exclui* o Bloco de Assinatura se o mesmo ainda não tiver sido excluído
    E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Bloco de Assinatura Cancelamento" com a informação: "NA"
    E o Sistema ASSEL **envia o sinal** para realizar o Cancelamento de OS em Execução
    **E mantém os estados como estão**
    Observação: O procedimento de cancelamento de OS “Em Execução” após assinatura do Termo de Cancelamento deverá ser construído nas próximas Sprints pois envolve mais passos.

  Cenário: Cancelar OS "Enviado para Assinatura" - Opção Sim
    Dado que o usuário solicita **Cancelar** para uma OS de <Situações>
      | Situações               |
      | Enviado para Assinatura |
    E o sistema apresenta a  <Mensagem>
      | Mensagem                                                                                                      |
      | Atenção! Ao cancelar a OS todos os documentos gerados no SEI serão excluídos. Deseja realmente cancelar a OS? |
    Quando o usuário solicita **Sim**
    Então, no SEI, se houver Bloco de Assinatura, o Sistema *cancela* a disponibilização do Bloco de Assinatura se ainda não foi cancelada, *retira* o documento do Bloco de Assinatura se ainda não foi retirado e *exclui* o Bloco de Assinatura se o mesmo ainda não tiver sido excluído
    E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Bloco de Assinatura Cancelamento" com a informação: "NA"
    E, no SEI, o Sistema **exclui** todos os documentos criados incluindo a **"Minuta do Formulário de Ordem de Serviço"** para o processo em questão
    E, no SISTEMA ASSEL, atualiza o atributo interno da OS "Informações do SEI - Número da Solicitação" com a informação: "NA"
    E conclui o processo na unidade de solicitante
    E, no SISTEMA ASSEL, *mantém* o atributo interno da OS "Informações do SEI - Número do Processo"
    E atribui no "ASSEL" a <Situação> ao processo.
      | Situação  |
      | Cancelado |

  Cenário: Cancelar OS "Enviado para Assinatura" - Opção Não
    Dado que o usuário solicita **Cancelar** para uma OS de <Situações>
      | Situações               |
      | Enviado para Assinatura |
    E o sistema apresenta a  <Mensagem>
      | Mensagem                                                                                                      |
      | Atenção! Ao cancelar a OS todos os documentos gerados no SEI serão excluídos. Deseja realmente cancelar a OS? |
    Quando o usuário solicita **Não**
    Então o "ASSEL" mantém a <Situação> atual do processo e volta para a tela anterior.
