ActiveRecord::Base.transaction do
  Admin.create(email: 'admin@example.com', password: 'Passw0rd!')

  (1..3).each do |i|
    Teacher.create!(name: "teacher#{i}", email: "teacher#{i}@example.com", password: 'Passw0rd!')
    User.create!(name: "user#{i}", email: "user#{i}@example.com", password: 'Passw0rd!')
  end

  Product.create!(
    [
      { name: '1回分', price: 2000, amount: 1 },
      { name: '3回分', price: 5000, amount: 3 },
      { name: '5回分', price: 7500, amount: 5 }
    ]
  )

  Language.create!(
    [
      { name: '日本語' },
      { name: '英語' },
      { name: '中国語' }
    ]
  )
end
