class Company < ApplicationRecord
  has_many :contacts
  has_and_belongs_to_many :tags
end
