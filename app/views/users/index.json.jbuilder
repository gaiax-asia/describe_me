json.array!(@users) do |user|
  json.extract! user, :id, :fb_id, :first_name, :middle_name, :last_name, :gender, :link, :username
  json.url user_url(user, format: :json)
end
