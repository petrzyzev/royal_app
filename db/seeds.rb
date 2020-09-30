users = (1..3).map { |i| { id: i, name: Faker::Name.name } }
User.import(users)

tags = (1..20).map { |i| { id: i, name: Faker::Types.rb_string } }
Tag.import(tags)

(1..500).map do
  company = Company.create(name: Faker::Company.name)
  company.tags = Tag.order('RANDOM()').limit(5)
  contacts = (1..30).map do
    { name: Faker::Name.name,
      phone: Faker::PhoneNumber.phone_number,
      user_id: users.sample[:id], company_id: company.id }
  end
  Contact.import(contacts)
end
