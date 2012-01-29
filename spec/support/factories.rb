FactoryGirl.define do
  
  factory :comment do
    commentable { Factory(:post) }
    user { Factory(:user) }
    body 'comment body'
  end
  
  factory :post do
    user { Factory(:user) }
    title 'post title'
    body 'post body'
  end
  
  factory :user do |n|
    name "Test User"
    email { Factory.next(:email) }
    password "password"
    password_confirmation "password"
  end
  
end