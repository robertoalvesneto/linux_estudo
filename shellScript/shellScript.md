# ESTUDO DE SHELLSCRIPT
Essa 'doc' pressupõe conhecimento prévio em programação, então muitas coisas não são adentradas ou explicadas mais aprofundadamente.

# 01 - Variáveis
## 01.1. São usadas para armazenar valores, podendo ser dos tipos:
- Num		-	valores numéricos
- String	-	texto


&nbsp;
## 01.2. As variáveis podem ser dividias em dois grupos:
Esses grupos não são regras da linguagem, são apenas padrões usados pela comunidade.
- Globais:
	- São acessíveis a todas as funções e em todas as partes do script
	- São declaradas em maiúsculo


&nbsp;
- Locais:
	- São acessíveis somente dentro do escopo da função declarada
	- São declaradas em minúsculo


&nbsp;
## 01.3. Exemplo de declaração:
Para criar uma var de string global:
``` bash
>> NOME="Roberto Alves Neto"
```

Para criar uma var de num global: 
``` bash
>> IDADE=22
```

Essas variáveis so existem no shell que está rodando atualmente. A partir do momento que finalizar o terminal e abrir outro elas já não estão mais lá.

Se desejar torna-las presentes para todas as sessões:
``` bash
>> export NOME
```

Ou de forma mais direta:
``` bash
>> export NASC="14/12/1999"
```

Para vermos os valores de uma variável podemos dar echo no valor, colocando o nome da variável precedido do '$':

``` bash
>> echo $NASC
14/12/1999
```

&nbsp;
# 02 - Funções
São usadas para organizar e facilitar a reutilização de código.

## 02.1. Exemplo de declaração:
``` bash
>> lla () {ls -la;}
>> lla
# printa o mesmo que o comando ls -la
```

Todo bloco de código que eu colocar dentro da função sera executado ao chamar o nome dela, podendo também chamar outros binários, scripts e tudo que estiver visível e com permissão ao meu script.

O primeiro exemplo, como foi feito diretamente no terminal, precisava ser tudo posto na mesma linha, mas em um arquivo bash um exemplo seria assim:
``` bash
idade () {
    idade=22
    echo $idade
}
```

&nbsp;
# 03 - Condicionais
Estruturas condicionais nos permite analisar uma condição e a partir da resposta dela seguir caminhos diferentes, dependendo se ela for verdadeira ou falsa.

## 03.1. Exemplo de declaração:
O uso mais interessante do if no shell é testar instruções, no exemplo seguinte testamos se o diretório `/var` existe, se existir, exibe `Diretório existe`, se não, `Diretório não existe`:

``` bash
	if [[ -d /var ]]: then
		echo "Diretório existe"
    else
		echo "Diretório não existe"
```

&nbsp;
# 03 - Laços de repetição
Executa o código dentro do laço enquanto a condição que esta sendo analisa for verdadeira.

## 03.1. Exemplo de declaração FOR:
Conta e exibe de 1 a 10:

``` bash
	# a sintaxe pode parecer familiar para a glr de python
	# o seq cria uma contagem ate o num dado
	for i in $(seq 10); do
		echo $i
	done
```

Podemos por qualquer instrução dentro, por exemplo, para pegar cada nome em `~/`:
``` bash
	for i in $(ls ~/); do
		echo $i
	done
```

## 03.2. Exemplo de declaração WHILE:
Conta e exibe de 1 a 10:

``` bash
	# precisamos declarar o valor inicial
	i=1
	# fazemos uma analisa condicional dentro
	while [[ $i -le 10 ]]; do
		echo $i
		# precisamos incremente manualmente
		i=$(($i+1))
	done
```
Na maioria dos casos o `while` é mais verboso, mas em alguns casos a lógica pode ficar mais clara nele.

&nbsp;
# 05 Tabela de condicionais:

Esses são somente alguns exemplos, acessando /tests no comando main bash podemos ver todos.

|Comparação de Strings| Descrição							       |
|:---				  |:---	    								   |
|Str1 `=` Str2 		  | Retorna `true` se as Strings são iguais    |
|Str1 `!=` Str2		  | Retorna `true` se as Strings não são iguais|
|`-n` Str1     		  | Retorna `true` se a String não é null      |
|`-z` Str1     		  | Retorna `true` se a String é null      |

|Comparação Numérica  | Descrição							      			  |
|:---				  |:---	    											  |
|expr1 `-eq` expr2 	  | Retorna `true` se os valores são iguais são iguais    |
|expr1 `-ne` expr2 	  | Retorna `true` se os valores não são iguais são iguais|
|expr1 `-gt` expr2 	  | Retorna `true` se expr1 é maior que expr2		      |
|expr1 `-ge` expr2 	  | Retorna `true` se expr1 é maior ou igual a expr2	  |
|expr1 `-lt` expr2 	  | Retorna `true` se expr1 é menor que expr2		      |
|expr1 `-le` expr2 	  | Retorna `true` se expr1 é menor ou igual a expr2	  |
|`!` expr1		 	  | Inverte o valor do bool							      |

|Condicionais de arquivos| Descrição							       			     |
|:---				     |:---	    								   			     |
|`-d` file  		     | Retorna se for um diretório			       			     |
|`-e` file  		     | Retorna `true` se o arquivo existir		   			     |
|`-f` file  		     | Retorna `true` se o arquivo existir (mais usado que `-e`) |
|`-g` file  		     | Retorna `true` se o GID estiver habilitado no arquivo     |
|`-s` file  		     | Retorna `true` se o arquivo tiver um tamanho dif de 0     |
|`-u` file  		     | Retorna `true` se o UID estiver habilitado no arquivo     |
|`-r` file  		     | Retorna `true` se o arquivo tiver permissão de leitura	 |
|`-w` file  		     | Retorna `true` se o arquivo tiver permissão de escrita    |
|`-x` file  		     | Retorna `true` se o arquivo tiver permissão de leitura    |

Para usar essas condicionais fora de um laço condicional, usamos o comando `test`:

``` bash
>> test -d ~/Documents
# O resultado vai para a variável `?`
>> echo $?
0
```

Algo importante que difere de linguagens de programação convencionais:
```
1 == False
0 == True
```
Por isso que quando programamos em `C` damos no final da função main `return 0`, essa é uma saida para o sistema que significa 'terminado sem nenhum erro'.


&nbsp;
# 06 Criando um Arquivo Executável:
Qualquer um dos exemplos de código a cima ou comandos que damos direto no terminal, quando adicionados a um arquivo `.sh` sera executado da mesma forma:

``` bash
#! /bin/sh 
sudo dnf update --refresh
```
> salvar arquivo com o nome `update.sh`

o `#! /bin/sh` informa o compilador que deve ser utilizado, talvez você já tenha visto em códigos em python.

Após isso devemos dar permissão de execução ao arquivo, podemos fazer isso pela interface gráfica ou digitando no terminal `chmod +x [nome_arquivo]`.

Agora se chamarmos no terminal `./update.sh` no terminal nosso script sera executado. O `./` significa que não queremos passar pelo terminal o compilador e ai mandamos ele olhar na primeira linha do arquivo qual o compilador.

## Passo a Passo:
1. Colocar no topo do arquivo o path do bash: `#! /bin/sh`;
2. Colocar nosso código;
3. Salvar com a extensão .sh: `[arquivo].sh`;
4. Dar permissão de execução ao arquivo: `chmod +x`;
5. Executar no terminal: `./[arquivo].sh`;