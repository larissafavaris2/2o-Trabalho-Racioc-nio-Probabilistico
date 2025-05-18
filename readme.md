# Modelo Bayesiano de Farol de Bicicleta em ProbLog

Este repositório contém uma implementação em ProbLog de um sistema de diagnóstico para farol de bicicleta movido a dínamo utilizando redes bayesianas. O modelo probabilístico simula as interações entre diversos componentes do sistema e condições ambientais para determinar a probabilidade de funcionamento do farol.

## Descrição do Problema

O problema modelado envolve um farol de bicicleta acionado por dínamo, onde o funcionamento da luz depende de vários fatores, incluindo:
- Condição da rua (seca, molhada ou coberta de neve)
- Estado do volante do dínamo (desgastado ou não)
- Se o dínamo está deslizando
- Se o dínamo está gerando tensão
- Estado da lâmpada
- Estado do cabo

## Variáveis do Modelo

O modelo inclui as seguintes variáveis:
- `str`: Condição da rua (dry/wet/snow_covered)
- `flw`: Volante do dínamo desgastado (true/false)
- `r`: Dínamo deslizante (true/false)
- `v`: Dínamo mostra tensão (true/false)
- `b`: Lâmpada ok (true/false)
- `k`: Cabo ok (true/false)
- `li`: Luz ligada (true/false)

## Estrutura do Código

O código implementa a rede bayesiana completa com as seguintes seções:

1. **Probabilidades a priori**:
   - P(Str): Distribuição de probabilidade para as condições da rua
   - P(Flw): Probabilidade do volante estar desgastado
   - P(B): Probabilidade da lâmpada estar funcionando
   - P(K): Probabilidade do cabo estar funcionando

2. **Tabelas de probabilidade condicional**:
   - P(R|Str,Flw): Probabilidade do dínamo deslizar dado a condição da rua e o estado do volante
   - P(V|R): Probabilidade do dínamo mostrar tensão dado se está deslizando ou não
   - P(Li|V,B,K): Probabilidade da luz estar ligada dados os estados da tensão, lâmpada e cabo

3. **Consultas**:
   - O arquivo contém uma consulta específica para calcular P(V=true|Str=snow_covered), ou seja, a probabilidade do dínamo mostrar tensão quando a rua está coberta de neve.

## Como Usar

### Requisitos
- ProbLog instalado (versão 2.1 ou superior)
- Python 3.6+ (se estiver usando ProbLog via Python)

### Execução
1. Salve o código em um arquivo com extensão `.pl`, por exemplo `farol_bicicleta.pl`
2. Execute o código usando o interpretador ProbLog:
   ```
   problog farol_bicicleta.pl
   ```
3. Alternativamente, use a interface web em https://problog.org/editor.html

### Modificando as Consultas
Para calcular diferentes probabilidades, modifique as linhas de evidência e consulta:
- Para calcular P(Li=true|Str=snow_covered), a probabilidade da luz estar ligada quando a rua está coberta de neve, use:
  ```prolog
  evidence(str(snow_covered)).
  query(li(true)).
  ```
- Para outras condições de rua, altere a evidência para `str(dry)` ou `str(wet)`
- Para consultar outras variáveis, modifique a linha `query()`

## Resultados Esperados

Para a consulta atual no código, P(V=true|Str=snow_covered), o resultado esperado é aproximadamente 0.815 (81.5%), indicando que há uma alta probabilidade do dínamo mostrar tensão em condições de neve.

Se você alterar a consulta para P(Li=true|Str=snow_covered), o resultado esperado é aproximadamente 0.739 (73.9%), representando a probabilidade da luz estar ligada quando a rua está coberta de neve.
