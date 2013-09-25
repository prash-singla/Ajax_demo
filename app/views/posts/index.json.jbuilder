json.array!(@posts) do |post|
  json.extract! post, :tittle.string
  json.url post_url(post, format: :json)
end
