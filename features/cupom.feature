#language: pt

Funcionalidade: Uso de cupons no checkout
  Como um usuário da Starbugs, Eu quero poder aplicar cupons de desconto na página de checkout,
  Para que eu possa obter reduções no preço de produtos, aumentando a satisfação com a minha experiência de compra.

  Contexto:
    Dado que iniciei a compra do item:
      | name     | Café com Leite |
      | price    | R$ 19,99       |
      | delivery | R$ 10,00       |
      | total    | R$ 29,99       |

  Cenário: Aplicar desconto de 20 %
  O usuário deve ser capaz de aplicar um cupom de 20% de desconto válido no checkout.
  O desconto deve ser aplicado apenas ao valor do produto e o valor final deve ser recalculado corretamente.

    Quando aplico o seguinte cupom: "MEUCAFE"
    Então o valor final da compra deve ser atualizado para "R$ 25,99"

    # Steps para desenvolvimento orientado por comportamento"
    #Dado que estou na página de checkout
    #E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
    #E que a taxa de entrega é de R$ 10,00
    #E o valor total é de 29,99
    #E tenho um cupom com 20% de desconto "MEUCAFE"
    #Quando aplico esse cupom de desconto
    #Então o desconto de 20% deve ser aplicado apenas no valor do café com leite
    #E o valor final da compra deve ser atualizado para R$ 25,99


  Cenário: Cupom Expirado
  Ao tentar usar um cupom expirado, o usuário deve receber uma notificação informando que o cupom está expirado.
  Nenhum desconto deve ser aplicado e o valor total da compra deve permanecer inalterado.

    Quando aplico o seguinte cupom: "PROMO20"
    Então devo ver a notificação "Cupom expirado!"
    E o valor final da compra deve permanecer o mesmo


    # Steps para desenvolvimento orientado por comportamento"
    #Dado que estou na página de checkout
    #E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
    #E que a taxa de entrega é de R$ 10,00
    #E o valor total é de 29,99
    #E tenho um cupom que está expirado "PROMO20"
    #Quando aplico esse cupom de desconto
    #Então devo ver a seguinte notificação "Cupom expirado!"
    #E o valor final deve permanecer o mesmo

  Cenário: Cupom inválido
  Ao tentar usar um cupom inválido, o usuário deve receber uma notificação informando que o cupom é inválido.
  Nenhum desconto deve ser aplicado e o valor total da compra deve permanecer inalterado.

    Quando aplico o seguinte cupom: "PROMO100"
    Então devo ver a notificação "Cupom inválido!"
    E o valor final da compra deve permanecer o mesmo

    # Steps para desenvolvimento orientado por comportamento"
    #Dado que estou na página de checkout
    #E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
    #E que a taxa de entrega é de R$ 10,00
    #E o valor total é de 29,99
    #E tenho um cupom com o código inválido "PROMO100"
    #Quando aplico esse cupom de desconto
    #Então devo ver a seguinte notificação "Cupom inválido!"
    #E o valor final deve permanecer o mesmo