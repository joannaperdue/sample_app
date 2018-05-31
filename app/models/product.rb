class Product < ApplicationRecord

  def self.search(search_term)
    if Rails.env.development?
      like_operator = "LIKE"
    else
      like_operator = "ilike"
    end

    Product.where("name #{like_operator} ?", "%#{sanitize_sql_like(search_term)}%")
  end

end
