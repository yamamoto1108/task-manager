FactoryBot.define do
  factory :team do
    name {Faker::Team.name}
    about {"チームのプロフィールです。"}
  end
end
