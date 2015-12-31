json.array!(@attorney_profiles) do |attorney_profile|
  json.extract! attorney_profile, :id
  json.url attorney_profile_url(attorney_profile, format: :json)
end
