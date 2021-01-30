ActiveRecord::Base.transaction do
  Admin.create(email: 'admin@example.com', password: 'Passw0rd!')

  (1..3).each do |i|
    Teacher.create!(name: "teacher#{i}", email: "teacher#{i}@example.com", password: 'Passw0rd!')
    User.create!(name: "user#{i}", email: "user#{i}@example.com", password: 'Passw0rd!')
  end

  Product.create!(
    [
      { label: '1回分', price: 2000, amount: 1 },
      { label: '3回分', price: 5000, amount: 3 },
      { label: '5回分', price: 7500, amount: 5 }
    ]
  )

  Language.create!(
    [
      { label: '日本語' },
      { label: '英語' },
      { label: '中国語' }
    ]
  )
end
