apiconfig = YAML.load(File.open("config/apiconfig.yml"))

client = Twitter::REST::Client.new do |config|
    config.consumer_key        = apiconfig["twitter"]["consumer_key"]
    config.consumer_secret     = apiconfig["twitter"]["consumer_secret"]
    config.access_token        = apiconfig["twitter"]["access_token_key"]
    config.access_token_secret = apiconfig["twitter"]["access_token_secret"]
end

natto = Natto::MeCab.new
parser = CaboCha::Parser.new

last_id = nil
tweet_seeds = []
client.search('エロく聞こえる言葉 -rt', :lang => "ja", :count => 100, :max_id => last_id).map do |status|
  tweet_seed = TweetSeed.new
  tweet_seed.tweet_id_str = status.id.to_s
  tweet_seed.tweet = status.text.each_char.select{|c| c.bytes.count < 4 }.join('')
  tweet_seeds << tweet_seed
  natto.parse(status.text) do |n|
    puts "#{n.surface}\t#{n.feature}"
  end
  tree = parser.parse(status.text)
  puts tree.toString(CaboCha::FORMAT_TREE)
end
TweetSeed.import(tweet_seeds)