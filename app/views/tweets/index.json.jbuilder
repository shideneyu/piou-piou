json.array!(@tweets) do |json, tweet|
  json.partial! "tweets/tweet", tweet: tweet
end