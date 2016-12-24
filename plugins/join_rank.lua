local function run(msg, matches)
     if msg.action.type == "chat_add_user_link" then
   local hash = 'rank:variables'
   local text = ''
     local value = redis:hget(hash, msg.from.id)
      if not value then
         if msg.from.id == tonumber(mina) then 
            text = text..''
          elseif is_admin2(msg.from.id) then
            text = text..''
          elseif is_owner2(msg.from.id, msg.to.id) then
            text = text..''
          elseif is_momod2(msg.from.id, msg.to.id) then
            text = text..''
      else
            text = text..''
       end
       else
        text = text..'<i>این شخص دارای مقام میباشد 🌐\nلطفا کمال احترام را با ایشان داشته باشید\nعواقب هر گونه بی احترامی بر عهده خود مدیر گروه میباشد </i>\n\nسلام '..value.. '\nبه گروه <b>' ..string.gsub(msg.to.print_name, "_", " ")..'</b>\n خوش آمدید\n\n<b>(Ranking)</b>\n-------------------------------\n-| @Radicall_team |-\n\n'
      end
 return reply_msg(msg.id, text, ok_cb, false)
  end    
 end
 return {
   patterns = {
     "^!!tgservice (chat_add_user_link)$",
 
   }, 
   run = run 
}