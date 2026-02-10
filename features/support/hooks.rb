
require_relative './pages/home.rb'
require_relative './pages/checkout.rb'
require_relative './pages/components.rb'
Before do
  @home = HomePage.new
  @checkout = CheckoutPage.new
  @popup = Popup.new
  @order = OrderPage.new
end

# executado depois de cada teste
After do |scenario|

  # evidências para tudo
  screenshot = page.save_screenshot("logs/screenshot/#{scenario.__id__}.png")
  attach(screenshot, "image/png", "Screenshot")

  # evidência apenas se falhar
 # if (scenario.failed)
 #   screenshot = page.save_screenshot("logs/screenshot/#{scenario.__id__}.png"))
 #   attach(screenshot, "image/png", "Screenshot")
 # end

end
