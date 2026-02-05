# camada de page object
class HomePage
  # propriedades (funções) que representam elementos da home page
  include Capybara::DSL

  def open
    visit 'https://starbugs.vercel.app/'
  end

  def coffee_list
    return all('.coffee-item')
  end

  def buy(coffee_name)
    product = find('.coffee-item', text: coffee_name)
    product.find('.buy-coffee').click
  end
end