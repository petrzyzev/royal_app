class Contact < ApplicationRecord
  belongs_to :company, counter_cache: true
  belongs_to :user
end
