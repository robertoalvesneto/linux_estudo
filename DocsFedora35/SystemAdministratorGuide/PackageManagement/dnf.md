# Estudando Gerenciador de Pacotes `DNF`
DNF é o gerenciador de pacotes padrão do Fedora, por ele buscamos pacotes, instalamos, desinstalamos, adicionamos repositórios etc.

&nbsp;
## > Referência:
___
Material usado: [Fedora 35 dnf documentaçaõ](https://docs.fedoraproject.org/pt_BR/fedora/f34/system-administrators-guide/package-management/DNF/)

Para se aprofundar: [dnf doc](https://dnf.readthedocs.io/en/latest/index.html)

&nbsp;
##  > GPG (Gnu Privacy Guard)
___
Ele é uma forma de validação do repositório e dos pacotes que usamos. Quando ativado, sempre que tentarmos instalar algo ele pedira a key, para garantir que não ouve modificação no pacote que será instalado.

&nbsp;
## > Verificando e Atualizando Pacotes
___
Busca pacotes disponíveis para atualizar e solicita a instalação. Pacotes disponíveis mas com problemas de dependência e ou compatibilidade são ignorados.
``` bash
# Atualizar pacotes
>> dnf upgrade
```

Para apenas ver e listar pacotes disponíveis, use:
``` bash
>> dnf check-update
```

Para atualizar pacotes específicos:
``` bash
>> dnf upgrade [package_name]
```

&nbsp;
## > Listando Pacotes e Repositórios:
___
### >> PESQUISANDO PACOTES:
Pesquisando os pacotes compatíveis dentro dos repositórios ativos:
``` bash
>> dnf search name
```

Pesquisando todas as compatibilidades com o nome pesquisado, seja de pacote ou dentro da descrição dele, dentro dos repositórios ativos:
``` bash
>> dnf search all [name]
```

### >> LISTANDO:
Fornece informações sobre pacotes e repositórios instalados:
``` bash
>> dnf list [name]
```

Lista todos os pacotes instalados e disponíveis:
``` bash
>> dnf list all
```

Lista todos os grupos de pacotes:
``` bash
>> dnf group list
```

Lista os repositórios ativos:
``` bash
>> dnf repolist
```

Lista os pacotes de um rep especifico:
``` bash
>> dnf repository-packages [rep_id] list [option]
```

Mostrar informações sobre um pacote:

``` bash
>> dnf info [package_name]
```

&nbsp;
## > Gerenciando Pacotes:
___
### >> INSTALANDO:
Instala um pacote:
``` bash
>> dnf install [package_name]
```

Se você tiver o binário .rpm, pode passar o caminho:
``` bash
>> dnf install [/path]
```

Para instalar grupos de pacotes:
``` bash
>> dnf group install [groupid]
```

### >> REMOVER:
Remover um pacote:
``` bash
>> dnf remove [package_name]
```

Para remover grupos de pacotes:
``` bash
>> dnf group remove [groupid]
```

### >> HISTÓRICO:
Exibe o histórico de comandos dnf:
``` bash
# O id é opcional
>> dnf history list [start_id]..[end_id]
```

&nbsp;
## > Configurações DNF:
___
### >> EDITAR CONFIGURAÇÕES PADRÕES DO DNF:
Acessando o path `/etc/dnf/dnf.conf` podemos configurar o dnf:
``` bash:
>> vim /etc/dnf/dnf.conf
```

### >> EDITAR REPOSITÓRIOS ATIVOS:
Acessando o path `/etc/yum.repos.d/` podemos ver e configurar os repositórios:
``` bash
>> cd /etc/yum.repos.d/
>> ls
```

### >> CONFIG MANAGER:
Para listar as opções de configurações e seus valores:
``` bash
>> dnf config-manager --dump
```

&nbsp;
## > Gerenciando Repositórios:
___
### >> EDITAR REPOSITÓRIOS ATIVOS:
Acessando o path `/etc/yum.repos.d/` podemos ver e configurar os repositórios:
``` bash
>> cd /etc/yum.repos.d/
>> ls
```

O comando para adicionar um repo é:
``` bash
>> dnf config-manager --add-repo [repository_url]
```

O comando para ativar um repo é:
``` bash
>> dnf config-manager --set-enabled [repository]
```

O comando para desativar um repo é:
``` bash
>> dnf config-manager --set-disabled [repository]
```