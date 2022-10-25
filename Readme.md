# Terraform 

Este é um reposiório que mostra o desenvolvimento, e aprendizado 
sobre terraform dentro de uma IAC utilizando a Cloud AWS.

Para iniciar, é necessário configurar minha senha na AWS Vault, e também criar uma chave SSH na AWS.
Criar a chave não é a única tarefa, é necessário referenciar a chave em resource (arquivo main.tf):

- Adicionar um nome key_name: <nome_do_arquivo_chave>

No <required_providers> (arquivo main.tf) são os provedores necessários (nuvem);

<ami> é o códido do EC2: Lembrando que o AMI muda de acordo com a região;
<tags> é o nome que damos para a nossa instância (Esse nome vai aparecer no EC2)

### Comandos:

Os comandos abaixo servem para iniciar, e subir as alterações do Terraform

<terraform init> - inicia o terraform
<terraform plan> - mostra o que mudou/O que está planejado
<terraform apply> - aplica o que estava planejado, e pergunta se deseja aplicar. É necessário apertar o YES

### gitignore:

Alguns arquivos não podem ir para o repositório, por se tratar de chaves, senhas e etc. No site https://www.toptal.com/developers/gitignore é possível ter acesso a alguns arquivos que geralmente são colocados no git ignore pela comunidade
