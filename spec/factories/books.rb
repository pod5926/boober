FactoryBot.define do
  factory :book do
    title { "test" }
    content { "MyText" }
    user { nil }
  end
end
