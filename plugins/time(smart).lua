function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then
 return "<i>خطا در اتصال به اینترنت!</i>"
end
local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local jdat = json:decode(url)
local url = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..jdat.ENtime..'}}'
local text = '⏱ ساعت '..jdat.FAtime..' \n🔖 امروز '..jdat.FAdate..' میباشد.\n--------------\n⏱ '..jdat.ENtime..'\n🔖 '..jdat.ENdate.. '\n#Smart\n--------------\n🔺 کانال تله بات استور: @TeleBotStore 🔻'
local file = download_to_file(url,'time.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
return  reply_msg(msg.id, text, ok_cb, false)
end
return {
  patterns = {
   "^[/!#]([Tt][iI][Mm][Ee])$",
     "^([Tt][iI][Mm][Ee])$",
      "^ساعت$",
      "^ساعت چنده؟$",
      "^ساعت چنده$",
      "^زمان$",
      "^تاریخ$"
  }, 
run = run 
}

