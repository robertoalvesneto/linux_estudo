# Passo a passo da configuração do Fedora 34



### A missão do Projeto Fedora é liderar o avanço do software e conteúdo Livre e Aberto como uma comunidade colaborativa. Os três elementos dessa missão são claros:

- O Projeto Fedora sempre se esforça para liderar, e não seguir.

- O Projeto Fedora busca consistentemente criar, melhorar e espalhar código e conteúdo Livre.

- O Projeto Fedora é bem-sucedido por meio de ações compartilhadas por parte de muitas pessoas em nossa comunidade.


&nbsp;
___
``` bash
# Atualizar pacotes
>> sudo dnf upgrade
```


# > EDITAR /etc/dnf/dnf.conf COM SCRIPT

# > repos to add:
``` bash
>> sudo dnf config-manager --add-repo https://mirrors.fedoraproject.org/metalink?repo=fedora-35&arch=x86_64

>> sudo dnf config-manager --add-repo https://mirrors.fedoraproject.org/metalink?repo=fedora-cisco-openh264-35&arch=x86_64

>> sudo dnf config-manager --add-repo https://mirrors.fedoraproject.org/metalink?repo=fedora-modular-35&arch=x86_64

>> sudo dnf config-manager --add-repo https://mirrors.rpmfusion.org/metalink?repo=free-fedora-35&arch=x86_64

>> sudo dnf config-manager --add-repo https://mirrors.rpmfusion.org/metalink?repo=free-fedora-updates-released-35&arch=x86_64

>> sudo dnf config-manager --add-repo https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-35&arch=x86_64

>> sudo dnf config-manager --add-repo https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-nvidia-driver-35&arch=x86_64

>> sudo dnf config-manager --add-repo https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-steam-35&arch=x86_64

>> sudo dnf config-manager --add-repo https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-updates-released-35&arch=x86_64

>> sudo dnf config-manager --add-repo https://mirrors.fedoraproject.org/metalink?repo=updates-released-f35&arch=x86_64

>> sudo dnf config-manager --add-repo https://mirrors.fedoraproject.org/metalink?repo=updates-released-modular-f35&arch=x86_64
```