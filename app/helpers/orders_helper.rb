module OrdersHelper
  def link_to_address(address)
    link_to address,
            "http://google.com/maps/search/#{address}",
            target: "_blank"
  end
end
