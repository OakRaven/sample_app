Factory.define :user do |user|
  user.name                  "Mike Hatfield"
  user.email                 "oakraven13@gmail.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end