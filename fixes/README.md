# Doc com scripts para corrigir problemas corriqueiros

## curl

Quando ocorrer o erro:
```
error setting certificate verify locations:
  CAfile: /etc/ssl/certs/ca-certificates.crt
  CApath: /etc/ssl/certs
```
Pode ser problema com o arquivo local de certificados. Para corrigir esse problema baixe o ca atualizado na sua maquina lococal em [cacert.pem](https://curl.se/ca/cacert.pem).

Depois é possivel fazer o upload do arquivo para o servidor via ssh com o comando abaixo:
```
scp /caminho/local/do/download/cacert.pem <usuário>@<ip>:/local/onde/salvar/no/servidor/
```
Exemplo:
```
scp /Users/rafaelgabriel/Downloads/cacert.pem ubuntu@10.0.0.127:/home/ubuntu/
```

Rode o comando no servidor:
```
cat git-mycompany-com.pem | sudo tee -a /etc/ssl/certs/ca-certificates.crt
```

Exemplo:
```
cat cacert.pem | sudo tee -a /etc/ssl/certs/ca-certificates.crt
```

Para testar:
```
curl -v https://google.com
```

