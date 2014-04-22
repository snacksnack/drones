FactoryGirl.define do
  factory :strike do
    _id "aaabbbccc"
    country "Pakistan"
    date { 5.years.ago }
    deaths_max '6'
    injuries '5'
    children '1'
    bij_summary_short "In the first known US targeted assassination using a drone, a CIA Predator struck a car killing six al Qaeda suspects."
    lat '15.47467'
    lon '45.322755'
  end
end