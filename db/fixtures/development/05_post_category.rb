17.times do |n|
  PostCategory.seed do |s|
    s.id = n
    s.post_id = n
    s.category_id = n
  end
end