local function run(msg, matches)
 local makan = 272970544
   local hash = 'rank:variables'
   local text = ''
     local value = redis:hget(hash, msg.from.id)
      if not value then
         if msg.from.id == tonumber(makan) then 
            text = text..reply_msg(msg.id, 'Hi Smart Sudo', ok_cb, false)
          elseif is_admin2(msg.from.id) then
            text = text..''
           elseif is_owner2(msg.from.id, msg.to.id) then
            text = text..reply_msg(msg.id, '', ok_cb, false)
          elseif is_momod2(msg.from.id, msg.to.id) then
            text = text..reply_msg(msg.id, '', ok_cb, false)
      else
            text = text..''
       end
       else
        text = text..reply_msg(msg.id, 'سلام '..value..'', ok_cb, false)
     end
 return text
      end
  return {
   patterns = {
 "^[Ss]lm$",
 "^سلام$",
 "^[Ss]alam$",
 "^[Hh]i$",
 "^[Hh]ello$",
   }, 
   run = run 
 }

