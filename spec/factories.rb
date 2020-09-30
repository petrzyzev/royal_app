FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
  end

  factory :tag do
    name { Faker::Types.rb_string }
  end

  factory :contact do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.phone_number }
    user_id { user_id }
    company_id { company_id }
  end

  factory :company do
    name { Faker::Company.name }

    trait :with_tags_and_persons do
      after(:create) do |company|
        company.tags << Tag.order('RANDOM()').limit(5)
        FactoryBot.create_list(:contact, 5, company_id: company.id,
                                            user_id:    User.ids.sample)
      end
    end
  end
end
