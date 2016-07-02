FactoryGirl.define do
  factory :comment do
    author "Valera"
    sequence(:body) {|n| "comment body #{n}"}
  end
end