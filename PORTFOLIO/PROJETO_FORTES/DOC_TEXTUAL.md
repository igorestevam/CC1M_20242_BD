# Sistema de Gerenciamento de Parcerias e Monitoramentos FORTES ENGENHARIA

## Introdução
Este sistema foi projetado para gerenciar o relacionamento, monitoramento e formalização de parcerias entre a organização FORTES e instituições, além de acompanhar as atividades relacionadas, como reuniões, visitas técnicas, relatórios e propostas de doação.

## Estrutura do Banco de Dados
A seguir, detalhamos cada tabela e sua função no sistema:

### 1. **PROPONENTES**
Armazena informações dos proponentes, que são pessoas jurídicas interessadas em estabelecer parceria com a FORTES.
- **Campos principais:** 
  - CNPJ, Nome, Endereço, Contato (E-mail e Telefone).

### 2. **RESP_TEC**
Guarda informações sobre os responsáveis técnicos vinculados às instituições parceiras.
- **Campos principais:** 
  - CPF, RG, Nome, Contato (E-mail e Telefone), Endereço.

### 3. **RESP_LEG**
Registra os dados dos responsáveis legais das instituições parceiras.
- **Campos principais:** 
  - CPF, RG, Nome, Contato (E-mail e Telefone), Endereço.

### 4. **FUNC_FORTES**
Contém os dados dos funcionários da FORTES responsáveis por intermediar ou monitorar as parcerias.
- **Campos principais:** 
  - Registro Acadêmico (RA), Nome, E-mail, Cargo.

### 5. **APADRINHAMENTO**
Armazena informações sobre o vínculo entre funcionários da FORTES e as instituições apadrinhadas.
- **Campos principais:** 
  - Identificador do padrinho (relacionado ao RA de FUNC_FORTES).

### 6. **INSTITUICOES**
Armazena informações das instituições parceiras, incluindo documentos essenciais para formalização da parceria.
- **Campos principais:** 
  - ID da instituição, Documentos obrigatórios (Ata de Eleição, Contrato Social, etc.), CPF/RG do Presidente, Referências a PROPONENTES, RESPONSÁVEIS (Técnico e Legal), e o PADRINHO.

### 7. **MONITORAMENTOS**
Gerencia o acompanhamento de cada parceria por meio de cadastros, documentos e status.
- **Campos principais:** 
  - ID do monitoramento, Status de cadastro/documentação, Referência a INSTITUIÇÕES e FUNCIONÁRIOS da FORTES.

### 8. **REUNIÕES**
Registra as reuniões realizadas como parte do monitoramento.
- **Campos principais:** 
  - ID da reunião, Data, Hora, Link (caso virtual), Tipo (presencial ou remoto), ID do monitoramento associado.

### 9. **VISITAS_TÉCNICAS**
Controla visitas técnicas realizadas às instituições como parte do processo de acompanhamento.
- **Campos principais:** 
  - ID da visita, Data, Hora, ID do monitoramento, Padrinho responsável.

### 10. **RELATÓRIOS**
Guarda relatórios gerados no acompanhamento das instituições.
- **Campos principais:** 
  - ID do relatório, Data, Hora, Conteúdo (em formato de arquivo), ID do monitoramento.

### 11. **PROPOSTAS_DOACOES**
Registra as propostas de doações feitas pelas instituições.
- **Campos principais:** 
  - ID da proposta, Detalhes do projeto (Metodologia, Metas, Objetivo, Público-Alvo, Área de Atuação, Prazo e Valor), Referências a INSTITUIÇÕES e FUNCIONÁRIOS da FORTES.

## Funcionalidades do Sistema
1. **Cadastro e Gerenciamento de Proponentes**:
   - Registro de informações básicas.
   - Associação com responsáveis técnicos e legais.

2. **Gerenciamento de Instituições**:
   - Armazenamento de documentos obrigatórios.
   - Vinculação a proponentes, responsáveis e padrinhos.

3. **Monitoramento**:
   - Registro de reuniões e visitas técnicas.
   - Criação e acompanhamento de relatórios.

4. **Propostas de Doações**:
   - Cadastro e controle de propostas submetidas pelas instituições parceiras.

5. **Acompanhamento por Funcionários da FORTES**:
   - Gerenciamento do apadrinhamento.
   - Controle das ações relacionadas ao monitoramento.

## Requisitos para Execução
- **Banco de Dados**: MySQL ou MariaDB.
- **Pré-requisitos**:
  - Garantir que o banco FORTES seja criado antes de executar as tabelas.
  - Todas as tabelas são dependentes de integridade referencial.

## Observações
- **Chaves Primárias e Estrangeiras**: As tabelas utilizam chaves primárias para identificação única e estrangeiras para garantir a integridade referencial.
- **Tipos de Dados**: Tipos como `MEDIUMBLOB` são usados para armazenar documentos digitalizados.
- **Enumerações**: A tabela `PROPOSTAS_DOACOES` usa um campo `ENUM` para especificar a área de atuação.
