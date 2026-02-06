# camada de implementação

Quando('acesso a página principal da Starbugs') do
  @home.open
end

Então('eu devo ver uma lista de produtos mais vendidos') do
  expect(@home.coffee_list.size).to be > 0
end

Dado('que estou na página principal da Starbugs') do
  @home.open
end

Dado('que desejo comprar o seguinte produto:') do |table|
  @product = table.rows_hash
  #@product_name = table.rows_hash[:product] # acessando o produto
  #@product_price = table.rows_hash[:price] # acessando o produto
  #@delivery_price = table.rows_hash[:delivery] # acessando o produto

  # convertendo a tabela para um objeto ruby
  #@product_name = table.hashes[0][:product] # acessando o produto
  #@product_price = table.hashes[0][:price] # acessando o produto
  #@delivery_price = table.hashes[0][:delivery] # acessando o produto
end

Quando('inicio a compra desse item') do
  @home.buy(@product[:name])
end

Então('devo ver a página de Checkout com os detalhes do produto') do
  @checkout.assert_product_details(@product)
end

Então('o valor total da compra deve ser de {string}') do |total_price|
  @checkout.assert_total_price(total_price)
end

# comprar café indisponível
Então('devo ver um popup informando que o produto está indisponível') do
  @popup.have_text('Produto indisponível')
end


