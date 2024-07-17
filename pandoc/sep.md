# Integração SEI Solicitar OS

-4ex -1ex -.4ex 1ex .2ex Detalhamento do Cenário Incluir Solicitação

Na EPE: **"Solicitar Ordem de Serviço"**

Na funcionalidade: **"02 - Incluir Solicitação"**

::: tcolorbox
Quando o usuário solicita \"Enviar para Assinatura\"

Então o sistema realiza solicitação em nome da unidade selecionada pelo
o Usuário

**E gera um processo no SEI**

E gera um arquivo html padrão da solicitação para ser assinado no SEI

E envia os anexos

E gera bloco de assinatura no SEI

E torna o status da solicitação como: \"Enviado para assinatura\"

E apresenta a mensagem: \"Enviado com sucesso!\"
:::

No momento de **gerar um processo no SEI** o que deve acontecer é o
seguinte:

-3ex -0.1ex -.4ex 0.5ex .2ex Criar Novo Processo

Um novo processo do tipo **"Assessoria Legislativa: Consulta, estudo,
parecer, discurso e proposições legislativas"** deve ser automaticamente
criado.

-   Esse processo deve ser criado na Unidade do SEI do Solicitante.

-   O processo deve possuir o Nível de Acesso especificado pelo
    Solicitante na Funcionalidade "Incluir". Caso o Nível escolhido foi
    "Restrito", deve-se utilizar a "Hipótese Legal" escolhida na mesma
    tela da funcionalidade.

-   O número do processo do SEI recém criado deve ser armazenado como
    atributo da Solicitação no sistema ASSEL.

-3ex -0.1ex -.4ex 0.5ex .2ex Criar Documento da OS no Processo

Deve ser criado um primeiro documento no Processo do tipo **"SOLICITAÇÃO
DE SERVIÇO DA ASSESSORIA LEGISLATIVA"** em formato html padrão da
solicitação para ser assinado contendo as informações preenchidas pelo
Solicitante no sistema ASSEL.

-   O número do documento do SEI relacionado à Ordem de Serviço que
    deverá ser assinada deve ser armazenado como atributo da Solicitação
    no sistema ASSEL.

-3ex -0.1ex -.4ex 0.5ex .2ex Inserir os Anexos na OS

Abaixo desse documento deverão ser automaticamente inseridos no mesmo
processo do SEI os anexos enviados pelo solicitante ao sistema ASSEL
respeitando os Níveis de Acesso e Hipóteses Legais escolhidos pelo
usuário para cada anexo no sistema ASSEL.

-3ex -0.1ex -.4ex 0.5ex .2ex Bloco de Assinatura?

-2ex -0.1ex -.2ex .2ex .2ex Caso o Usuário Solicitante Pertença à
Unidade Solicitante do SEI

Se a Unidade Solicitante possui o Usuário que está fazendo a Solicitação
como pertencente a ela, não precisa criar Bloco de Assinatura. E nem
seria possível fazer isso. O sistema vai avisar ao Usuário para assinar
o documento tal do processo tal da Unidade tal.

-2ex -0.1ex -.2ex .2ex .2ex Caso o Usuário Solicitante NÃO Pertença à
Unidade Solicitante do SEI

Se a Unidade Solicitante não possui o Usuário que está fazendo a
Solicitação, então será criado um **Popup** com todas as unidades de
forma que o Usuário Escolha para qual Unidade do SEI deve ser
disponibilizado o Bloco de Assinatura que será assinado.

Nesse caso, o bloco de assinatura é criado na Unidade Solicitante, o
documento com a OS que precisa ser assinado é colocado no Bloco de
Assinatura e o Bloco de Assinatura é disponibilizado para a Unidade que
o Usuário escolheu.

-3ex -0.1ex -.4ex 0.5ex .2ex Sistema Aguarda Assinatura

A partir daí o sistema passa a monitorar o documento esperando que ele
seja assinado por alguém.

-3ex -0.1ex -.4ex 0.5ex .2ex Sistema Envia Processo para a Unidade ASSEL

No momento que o documento é assinado, ele é enviado para a ASSEL.

-3ex -0.1ex -.4ex 0.5ex .2ex Sistema Recebe o Processo Pela ASSEL

Do lado da ASSEL, o próprio sistema recebe o processo, marca com o
Acompanhamento Especial TAL e arquiva.
