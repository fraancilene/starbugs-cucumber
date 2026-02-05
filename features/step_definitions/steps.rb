Quando('acesso a página principal da Starbugs') do
  visit 'https://starbugs.vercel.app/'
end

Então('eu devo ver uma lista de produtos mais vendidos') do
  products = all('.coffee-item')
  expect(products.size).to be > 0
end

Dado('que estou na página principal da Starbugs') do
  visit 'https://starbugs.vercel.app/'
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
  product = find('.coffee-item', text: @product[:name])
  product.find('.buy-coffee').click
end

Então('devo ver a página de Checkout com os detalhes do produto') do
  product_title = find('.item-details h1')
  expect(product_title.text).to eql @product[:name]

  sub_price = find('.subtotal .sub-price')
  expect(sub_price.text).to eql @product[:price]

  delivery = find('.delivery-price')
  expect(delivery.text).to eql @product[:delivery]

end

Então('o valor total da compra deve ser de {string}') do |total_price|
  price = find('.total-price')
  expect(price.text).to eql total_price
end

# comprar café indisponível
Então('devo ver um popup informando que o produto está indisponível') do
  popup = find('.swal2-html-container')
  expect(popup.text).to eql 'Produto indisponível'
end


