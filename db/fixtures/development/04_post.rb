5.times do |n|
  Post.seed do |s|
    s.caption = 'test#{n}'
    s.status = 1
    s.customer_id = 1
  end
end

5.times do |n|
  Post.seed do |s|
    s.caption = 'test#{n}'
    s.status = 1
    s.customer_id = 2
  end
end

5.times do |n|
  Post.seed do |s|
    s.caption = 'test#{n}'
    s.status = 1
    s.customer_id = 3
  end
end

Post.seed do |s|
  s.caption = 'test16 #test'
  s.status = 1
  s.customer_id = 4
end

Post.seed do |s|
  s.caption = 'test17 #test2'
  s.status = 1
  s.customer_id = 5
end