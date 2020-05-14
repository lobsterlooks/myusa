FactoryGirl.define do
  factory :profile do
    first_name 'Joan'
    last_name 'Public'
    association :user

    factory :full_profile, class: Profile do
      title 'Sir'
      first_name 'michael'
      middle_name 'maindal'
      last_name 'Jensen'
      suffix 'III'
      address '1 Infinite Loop'
      address2 'Attn: Steve Jobs'
      city 'Cupertino'
      state 'CA'
      zip '92037'
      gender 'Female'
      marital_status 'Married'
      is_parent true
      is_student false
      is_veteran true
      is_retired false
      phone '91190382'
      mobile '9099528324'
    end
  end
end
