apiconfig = YAML.load(File.open("config/apiconfig.yml"))

girl_speackers = ["nozomi", "sumire", "maki", "kaho", "akari", "nanako", "reina", "anzu", "chihiro", "miyabi_west", "aoi", "akane_west"]
boy_speackers = ["seiji", "hiroshi", "osamu", "taichi", "koutarou", "yuuto", "yamato_west"]
emo_girl_speackers = ["nozomi_emo", "maki_emo", "reina_emo"]
emo_boy_speackers = ["taichi_emo"]

speackers = girl_speackers + boy_speackers + emo_girl_speackers + emo_boy_speackers
#http://webapi.aitalk.jp/webapi/v2/ttsget.php?username=MA12_WebAPI&password=TNLPXb9d&text=え?マンゴスチン&speaker_name=nozomi&volume=2.0&speed=0.5&pitch=2.0&range=2.0

speackers.each do |speack|
  http_client = HTTPClient.new
  params = {
    username: apiconfig["aitalk"]["username"],
    password: apiconfig["aitalk"]["password"],
    text: "え?マンゴスチン?",
    speaker_name: "nozomi",
    ext: "wav",
    volume: 2.0,
    speed: 0.6,
    range: 2.0,
    pitch: 1.8
  }
  response = http_client.get_content("http://webapi.aitalk.jp/webapi/v2/ttsget.php", params, {})
  open("1_" + SecureRandom.hex + ".wav", 'wb') do |file|
   file.write response
  end
end