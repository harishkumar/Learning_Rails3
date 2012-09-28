module ApplicationHelper
   def list_products(user_id)
    Cart.find_all_by_buyer_id_and_date(user_id,Date.today)
   end
end
