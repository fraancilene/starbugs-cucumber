Dado('que iniciei a compra do item {string}') do |product_name|
  @home.buy(product_name)
end

Quando('faço a busca do seguinte CEP: {string}') do |zipcode|
  @checkout.find_zipcode(zipcode)
end

Quando('informo os demais dados do endereço:') do |table|
  @checkout.fill_address(table.rows_hash)
  sleep 5
end

Quando('escolho a forma de pagamento {string}') do |payment_type|
  find('label div', text: payment_type.upcase).click
  #//label//div[text()="Cartão de Débito"]

end

Quando('por fim finalizo a compra') do
  click_on 'Confirmar pedido'
  sleep 5

end

Então('sou redirecionado para a página de confirmação de pedido') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('deve der informado um prazo de entrega entre {int} a {int} minutos') do |int, int2|
  # Então('deve der informado um prazo de entrega entre {int} a {float} minutos') do |int, float|
  # Então('deve der informado um prazo de entrega entre {float} a {int} minutos') do |float, int|
  # Então('deve der informado um prazo de entrega entre {float} a {float} minutos') do |float, float2|
  pending # Write code here that turns the phrase above into concrete actions
end
