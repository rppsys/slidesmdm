# language: pt
# encoding: utf-8

Funcionalidade: 03 - Visualizar

  **COMO** usuário que possui permissão

  **QUERO** acessar registro de solicitação

  **PARA** visualizar no Sistema ASSEL

  Contexto:
    Dado que existam os seguintes registros de solicitação:
      | Autor                   | Data/Hora          | Tipo              | Subtipo   | Status      |
      | Luiz Soares Cardoso     | 07/09/2020 - 09:58 | Minuta de Parecer | Indicação | Em execução |
      | Luiz Soares Cardoso     | 10/09/2020 - 13:45 | Estudo            | N/A       | Concluído   |
      | Aline Batista Lopes     | 15/02/2021 - 15:32 | Consulta          | N/A       | Descontinuado    |
      | Francisco Gomes Freitas | 10/03/2021 - 14:00 | Estudo            | N/A       | Cancelado (TE)|
      | Francisco Gomes Freitas | 25/03/2021 - 16:27 | Estudo            | N/A       | Cancelado   |


  Cenário: Visualizar Solicitação
    Dado que o usuário solicitou o seguinte registro:
      | Autor               | Data/Hora          | Tipo   | Subtipo | Status    |
      | Luiz Soares Cardoso | 10/09/2020 - 13:45 | Estudo | N/A     | Concluído |
    Quando o usuário solicita "Visualizar"
    Então o sistema apresenta "Visualizar Solicitação" com os dados de "Solicitante":
      | Deputado/Órgão         | Contato             | Ramal | Autor               |
      | Deputado Ozias Profeta | Luiz Soares Cardoso | 8232  | Luiz Soares Cardoso |
    E os dados de "Solicitação":
      | Tipo   | Subtipo | Especificação do Trabalho                                     |
      | Estudo | N/A     | Elaboração de estudo técnico de mérito no âmbito da CDESCTMAT |
    E os dados de "Status":
      | Status    |
      | Concluído |
    E os dados de "Informação do SEI":
      | Processo             | Solicitação | Bloco de Assinatura |
      | 0001-0000000/2021-12 | 1234567     | 13123               |
    E os anexos:
      | Anexos        |
      | arquivo 1.pdf |
      | arquivo 2.pdf |
    E habilita os anexos para download
    E **desabilita** todos os campos para edição

  Cenário: Visualizar Minuta de Parecer
    Dado que o usuário solicitou o seguinte registro:
      | Autor               | Data/Hora          | Tipo              | Subtipo   | Status      |
      | Luiz Soares Cardoso | 07/09/2020 - 09:58 | Minuta de Parecer | Indicação | Em execução |
    Quando o usuário solicita "Visualizar"
    Então o sistema apresenta "Visualizar Solicitação" com os dados de "Solicitante":
      | Deputado/Órgão         | Contato             | Ramal | Autor               |
      | Deputado Ozias Profeta | Luiz Soares Cardoso | 8232  | Luiz Soares Cardoso |
    E os dados de "Solicitação":
      | Tipo              | Subtipo   | Número         | Ano  | Comissão          | Especificação do Trabalho                                        |
      | Minuta de Parecer | Indicação | 00000000000000 | 2015 | Comissão Especial | Elaboração de Minuta de Parecer de mérito no âmbito da CDESCTMAT |
    E os dados de "Status":
      | Status      |
      | Em execução |
    E os dados de "Informação do SEI":
      | Processo             | Solicitação | Bloco de Assinatura |
      | 0001-0000000/2021-12 | 1234567     | 13123               |
    E os anexos:
      | Anexos        |
      | arquivo 1.pdf |
      | arquivo 2.pdf |
    E habilita os anexos para download
    E **desabilita** todos os campos para edição
