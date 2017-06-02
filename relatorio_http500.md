Ao executar os testes relacionados ao pagamento identifiquei que o mesmo retornava HTTP 500 Internal Server Error.

Para o teste foram os usadas as seguintes informações:

:headers => {'Content-Type' => 'application/json', 'Authorization' => 'Basic MEVSVkROMzg2V0UzUlpSSTRZWUc2UUNETE1KNTdMQlI6U1JaR0hSWFlPVDBQVkRMUkIzWUU4WFFXTE5MQTBKUlhUS09JRFZEUQ==' }

body:  {
   "installmentCount": 1,
   "fundingInstrument": {
       "method": "CREDIT_CARD",
       "creditCard": {
           "expirationMonth": 12,
           "expirationYear": 17,
           "number": "4024007170492580",
           "cvc": "164",
           "holder": {
               "fullname": "Teste Moip",
               "birthdate": "1988-12-30",
               "taxDocument": {
                   "type": "CPF",
                   "number": "33333333333"
               },
               "phone": {
                   "countryCode": "55",
                   "areaCode": "11",
                   "number": "66778899"
               }
           }
       }
   }
}

Enpoint: https://sandbox.moip.com.br/v2/orders/ORD-UL544RJF23MS/payments


Mensagem de retorno da requisição: { "ERROR" : "Ops... We were not waiting for it" }
Por esse motivo nenhum teste relacionado a pagamentos foi incluido no projeto de automação
