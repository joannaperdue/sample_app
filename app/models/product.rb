class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :color, presence: true
  validates :price, presence: true
  has_many :order
  has_many :comments

  def self.search(search_term)
    if Rails.env.development?
      like_operator = "LIKE"
    else
      like_operator = "ilike"
    end

    Product.where("name #{like_operator} ?", "%#{sanitize_sql_like(search_term)}%")
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first&.rating
  end

  def average_rating
  comments.average(:rating).to_f
  end

end
