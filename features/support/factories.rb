FactoryBot.define do
    factory :user do
        name {'Sunsun'}
        email { 'sunsun@ait.asia' }
        password { 'password' }
        password_confirmation { 'password' }
    end
end