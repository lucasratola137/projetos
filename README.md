<div align="center">
<h3> Clusterização da Base de Clientes </h3>
<h4> Um Projeto Estruturado de Engenharia de Dados, Machine Learning e Business Intelligence</h4> 
<div display ="inline">
  <img width="112" height="50" src= "https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue" />
  <img width="112" height="50" src= "https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white" />
  <img width="155" height="50" src= "https://img.shields.io/badge/scikit_learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white" />
  <img width="79" height="50" src= "https://img.shields.io/badge/Sql-003B57?style=for-the-badge&logo=sqlite&logoColor=white" />
  <img width="140" height="50" src= "https://img.shields.io/badge/Google Cloud-F80000?style=for-the-badge&logo=oracle&logoColor=black" />
  <img width="150" height="50" src= "https://img.shields.io/badge/Looker Studio-0078D4?style=for-the-badge&logo=microsoft-outlook&logoColor=white" />
  
  </div>
  </div>
    
<div align="center">

<p>Este README detalha o processo completo de análise de um dataset, desde a limpeza e engenharia de dados em SQL no Google Big Query, passando pela criação de um modelo Machine Learning em Python, até a construção de um dashboard no Looker Studio.</p>

</div>

## 📊 Dashboard Final

<div align="center">
<p>Abaixo, a versão final do dashboard, que consolida todos os insights gerados neste projeto.</p>
<img width="500" height="500" src= "https://iili.io/fid0r79.png" />
<br>
<br><a href="https://lookerstudio.google.com/u/0/reporting/8c8d4297-fb57-450a-b883-61889dea33d1/page/p_he0q3qw2ld">Acessar Dashboard → </a> <br />
</div>

## 📖 Sobre o Projeto

<p>Este projeto simula um caso de uso real do dia a dia de um profissional de dados, com o objetivo de analisar os clientes e realizar a segmentação em 3 níveis para identificação. O processo abrange três grandes áreas:</p>
<ol>
  <li><strong>Engenharia de Dados:</strong> Tratamento, limpeza e enriquecimento dos dados brutos utilizando SQL e Google Cloud Plataform (GCP) para prepará-los para análise e modelagem.</li>
  <li><strong>Machine Learning:</strong> Desenvolvimento de um modelo de clusterização utilizando Python e Scikit-learn.</li>
  <li><strong>Business Intelligence:</strong> Criação de um dashboard dinâmico no Looker Studio para visualizar os insights e permitir a exploração interativa dos dados.</li>
</ol>

## 🔗 Etapas de Construção do Projeto

<p>O projeto foi estruturado em camadas sequenciais listadas abaixo, sendo a última o diagnóstico preciso relacionada aos dados e a segmentação dos clientes de uma loja de varejo de médio porte.</p>

### 1. Regras de Negócio
A primeira fase do projeto consistiu em definir com clareza qual problema seria resolvido e qual resultado era esperado. Essa etapa é fundamental e, sempre que possível, deve ser feita em conjunto com o usuário final, pois é ele quem conhece o contexto real do negócio.

Neste caso, o objetivo era ajudar o CEO da loja a entender quais estratégias de venda aplicar para cada tipo de cliente. Para isso, ele disponibilizou três informações da base:
- Idade
- Renda anual
- Pontuação de gastos na loja (variando de 0 a 100)

A necessidade principal era segmentar os clientes de uma loja em três perfis: Bronze, Prata e Ouro, de forma que cada grupo pudesse receber abordagens diferentes.

As regras de negócio foram definidas da seguinte forma:
- Bronze: clientes com menor pontuação de gastos considerando a renda anual e idade.
- Prata: clientes com pontuação baixa para intermediária considerando a renda anual e idade.
- Ouro: clientes com maior pontuação de gastos considerando a renda anual e idade.

Essas definições serviram como base para validar os resultados do modelo de clusterização, garantindo que os grupos gerados fizessem sentido do ponto de vista do negócio.

### 2. Leitura, Preparação e Segmentação dos Dados
Após a definição das regras de negócio, iniciei a etapa técnica com a leitura da base de clientes em formato CSV utilizando Python.

Em seguida, foi realizada uma análise estatística básica das três variáveis utilizadas no modelo:
- idade
- renda_anual
- pontuacao_gastos

Isso permitiu entender a distribuição dos dados, possíveis outliers e diferenças de escala entre as variáveis.

### 3. Padronização dos Dados
Como as variáveis possuem escalas muito diferentes (por exemplo, renda anual vs. pontuação de gastos), foi necessário aplicar padronização (z-score) antes da clusterização.

Essa etapa garante que nenhuma variável tenha mais peso que outra apenas por estar em uma escala maior.
 
Também foi feita uma comparação visual entre os valores originais e os padronizados para validar o processo.

### 4. Clusterização com K-Means
Com os dados padronizados, foi aplicado o algoritmo K-Means, definindo k = 3 clusters, de acordo com a regra de negócio (Bronze, Prata e Ouro).

Cada cliente passou a receber um identificador numérico de cluster (0, 1 ou 2).
O botão abaixo te redicionará ao código em Python.
<div align="center">
<br><a href="https://github.com/lucasratola137/Clusterizacao_Python/blob/main/Clusterizacao.py">Acessar Código no GitHub → </a> <br />
</div>

### 5. Exportação e Análises no Google Cloud
Após a segmentação, o dataset foi salvo em um novo arquivo. Esse arquivo foi enviado para o Google Cloud Platform, onde realizei análises adicionais e bem simples em SQL, utilizando:
- Funções de agregação (AVG, COUNT, etc.).
- Query com CASE para transformar os clusters numéricos em categorias de negócio (esta query foi a utilizada como fonte de dados do Dashboard).
<div align="center">
<p>Abaixo, a tabela criada no Google Cloud com a query utilizada para conexão com o Looker Studio.</p>
<img width="500" height="500" src= "https://i.ibb.co/MkjVY5wQ/GCP.png" />
  
</div>
 Essa etapa permitiu validar os clusters sob a ótica do negócio e gerar insights para estratégias de venda por perfil de cliente.
 O botão abaixo te redicionará aos códigos em SQL.
<div align="center">
<br><a href="https://github.com/lucasratola137/Clusterizacao_Python/blob/main/Query.sql">Acessar Código no GitHub → </a> <br />
</div>

### 6. Conexão Fonte de Dados e Criação do Dashboard
Nesta etapa foi realizada a conexão entre o Google Cloud e Looker Studio para criação do Dashboard com os gráficos para análise do usuário final.

Observação: Optei pelo Looker Studio pela facilidade em compartilhar, porém a conexão entre Power BI e Google Cloud é bem simples de realizar também.

### 7. Diagnóstico
Por fim, seguimos para a última etapa. 

Após todo o trabalho de entendimento da regra de negócio e o trabalho técnico, vem uma das partes mais importantes de um Analista de Dados: O Diagnóstico dos Dados.

A clusterização separou por comportamento de consumo, podemos resumir esse comportamento montando a tabela abaixo:


| Cluster    | Idade | Renda         | Gasto          | Perfil real                    |
| ---------- | ----- | ------------- | -------------- | ------------------------------ |
| **Ouro**   | ~42   | Média         | **Muito alto** | Clientes engajados             |
| **Prata**  | ~60   | **Mais alta** | Médio          | Clientes ricos, pouco ativados |
| **Bronze** | ~31   | Alta          | Baixo          | Clientes jovens, pouco maduros |


A loja hoje tem:
- Pessoas que podem gastar mais (Prata)
- Pessoas que vão gastar mais no futuro (Bronze)
- Pessoas que já são o motor da receita (Ouro)

O problema em si da loja não é de aquisição e sim de ativação e conversão de valor. 

Diante disso, a pergunta que responderemos a seguir é: 
<div align="center">
<h3>
"O que fazer com cada grupo de cliente?"
  </h3>
</div>



**Segmento Ouro - Financiam o Negócio**

→ Provaram que:
- Têm renda aproximadamente igual a média anual geral
- Têm hábito
- Têm engajamento


→ Objetivo:
- Não perder + aumentar ticket e recorrência


→ Estratégias:
- Programa de fidelidade VIP
- Acesso antecipado a promoções
- Cashback
- Produtos premium


**Segmento Prata - Potencial de Receita Travado**

→ Provaram que:
- Ganham mais que os clientes Ouro, mas gastam bem menos
- São mais velhos
- Estão subutilizados


→ Objetivo:
- Converter poder aquisitivo em consumo


→ Estratégias:
- Campanhas peronalizadas
- Cupons progressivos
- Ofertas por bundle
- Comunicação focada em benefícios, não em preço
Observação: Eles não gastam pouco porque não podem. Eles gastam pouco porque não foram ativados.

**Segmento Bronze - O Começo do Ciclo de Vida**

→ São:
- Jovens
- Renda alta (acima da média geral)
- Gastam pouco


→ Objetivo:
- Criar hábito de consumo


→ Estratégias
- Descontos de entrada
- Gamificação
- Programas de pontos
- Promoções de baixo risco
- Frete grátis, combos, etc.
Importante: Não tentar monetizar forte agora, mas sim construir relacionamento.

## 📈 Estratégia de Crescimento Baseada em Dados

Com a segmentação definida, é possível estruturar uma estratégia clara de crescimento orientada por dados. O funil real do negócio passa a ser:

<div align="center"> <b>Bronze → Prata → Ouro</b> </div>


Cada cliente percorre naturalmente esse ciclo ao longo do tempo, e o papel da empresa é acelerar esse movimento, aumentando o valor capturado ao longo da vida do cliente (Customer Lifetime Value).

A partir disso, surgem três KPIs que passam a orientar as decisões da empresa:
- Taxa de conversão de clientes Bronze para Prata
- Taxa de conversão de clientes Prata para Ouro
- Receita média por cliente em cada cluster

Esses indicadores permitem responder perguntas como:
- A empresa está conseguindo transformar novos clientes em clientes rentáveis?
- Quais campanhas realmente fazem clientes evoluírem de categoria?
- Onde está o maior potencial de crescimento de receita?

## 💰 Onde está o maior potencial financeiro

Embora o cluster Ouro seja o principal gerador de receita atual, os dados mostram que o maior potencial de crescimento está no cluster Prata.

Esse grupo possui:
- A maior renda média anual
- Um volume relevante de clientes
- Um nível de gasto abaixo do seu real potencial

Portanto, o melhor retorno sobre investimento (ROI) não está em tentar vender mais para quem já compra muito, mas sim em converter clientes Prata em clientes Ouro.

Cada ponto percentual de conversão nesse grupo representa aumento direto de receita, sem custo de aquisição de novos clientes.

## 🧠 Conclusão

Este projeto demonstra como técnicas de Machine Learning, combinadas com engenharia de dados e visualização, podem gerar insights acionáveis de negócio.

A clusterização não foi utilizada apenas como exercício técnico, mas como uma ferramenta para:
- Entender o comportamento dos clientes
- Identificar gargalos de receita
- Direcionar estratégias de marketing, fidelização e crescimento

O resultado final é um modelo de segmentação que permite à empresa sair de decisões genéricas e passar a operar de forma **data-driven**, tratando cada grupo de clientes de acordo com seu valor, potencial e estágio de maturidade no ciclo de consumo.
