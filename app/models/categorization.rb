class Categorization < ApplicationRecord
  belongs_to :expense
  belongs_to :category
end
