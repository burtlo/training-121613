class MenuItem
 def initialize(element)
   @element = element
 end

 def add_to_cart
   @element.click_button text_add_to_cart
 end

 def element
   @element
 end

 def text_add_to_cart
   t("menu.menuitem.add_to_cart")
 end
end

def all_menu_items
  selector = t("menu.all.selector")
  all(selector).map { |element| MenuItem.new(element) }
end

def random_menu_item
 all_menu_items.sample
end