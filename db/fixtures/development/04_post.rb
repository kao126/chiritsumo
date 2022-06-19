5.times do |n|
  Post.seed do |s|
    s.id = n
    s.caption = 'test#{n}'
    s.customer_id = n
    s.image.attach(io: File.open(Rails.root.join('app/assets/images/no-image.jpeg')),
                    filename: 'no-image.jpeg')
  end
end

5.times do |n|
  Post.seed do |s|
    s.id = n + '5'
    s.caption = 'test#{n}'
    s.customer_id = n
    s.image.attach(io: File.open(Rails.root.join('app/assets/images/no-image.jpeg')),
                    filename: 'no-image.jpeg')
  end
end

5.times do |n|
  Post.seed do |s|
    s.id = n + '10'
    s.caption = 'test#{n}'
    s.customer_id = n
    s.image.attach(io: File.open(Rails.root.join('app/assets/images/no-image.jpeg')),
                    filename: 'no-image.jpeg')
  end
end

Post.seed do |s|
  s.id = 16
  s.caption = 'test16 #test'
  s.customer_id = 4
  s.image.attach(io: File.open(Rails.root.join('app/assets/images/no-image.jpeg')),
                  filename: 'no-image.jpeg')
end

Post.seed do |s|
  s.id = 17
  s.caption = 'test17 #test2'
  s.customer_id = 5
  s.image.attach(io: File.open(Rails.root.join('app/assets/images/no-image.jpeg')),
                  filename: 'no-image.jpeg')
end