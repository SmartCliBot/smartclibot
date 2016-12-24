local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '"'..#result..'"<i> پيام اخير سوپر گروه حذف شد!</i>', ok_cb, false)
     else
    send_msg(extra.chatid, '<i>تعداد پيام مورد نظر شما پاک شد!</i>', ok_cb, false)
  end
end
local function run(msg, matches)
  if matches[1] == 'حذف' and is_owner(msg) or 'rmsg' and is_owner(msg) then
    if msg.to.type == 'channel' then
      if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
        return reply_msg(msg.id, '<i>این عدد باید بین [1] تا [100] باشد\nمحدودیت از سمت تلگرام اعمال شده</i>', ok_cb, false)
      end
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
    else
      return reply_msg(msg.id, '<i>فقط در سوپر گروه امکان پذیر است</i>', ok_cb, false)
    end
  else
    return "<i>شما دسترسی لازم را ندارید!</i>"
  end
end
return {
    patterns = {
        '^(حذف) (%d*)$',
        '^[!/#](rmsg) (%d*)$'
    },
    run = run
}
