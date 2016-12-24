do
local function run(msg, matches)

hashfun = 'bot:help:fun'
hashmods = 'bot:help:mods'
hashadmin = 'bot:help:admin'
hashver = 'bot:ver'
hash = 'bot:help'


if matches[1] == 'sethelpfun' then
if not is_sudo(msg) then return end
redis:set(hashfun,'waiting:'..msg.from.id)
return reply_msg(msg.id, '<i>لطفا متن مورد نظر را ارسال کنید</i>', ok_cb, false)
else
if redis:get(hashfun) == 'waiting:'..msg.from.id then
redis:set(hashfun,msg.text)
return reply_msg(msg.id, '<i>با موفقیت انجام شد</i>', ok_cb, false)
end
end

if matches[1] == 'sethelpmods' then
if not is_sudo(msg) then return end

redis:set(hashmods,'waiting:'..msg.from.id)
return reply_msg(msg.id, '<i>لطفا متن مورد نظر را ارسال کنید</i>', ok_cb, false)
else
if redis:get(hashmods) == 'waiting:'..msg.from.id then
redis:set(hashmods,msg.text)
return reply_msg(msg.id, '<i>با موفقیت انجام شد</i>', ok_cb, false)
end
end


if matches[1] == 'sethelpadmin' then
if not is_sudo(msg) then return end

redis:set(hashadmin,'waiting:'..msg.from.id)
return reply_msg(msg.id, '<i>لطفا متن مورد نظر را ارسال کنید</i>', ok_cb, false)
else
if redis:get(hashadmin) == 'waiting:'..msg.from.id then
redis:set(hashadmin,msg.text)
return reply_msg(msg.id, '<i>با موفقیت انجام شد</i>', ok_cb, false)
end
end

if matches[1] == 'sethelp' then
if not is_sudo(msg) then return end
redis:set(hash,'waiting:'..msg.from.id)
return reply_msg(msg.id, '<i>لطفا متن مورد نظر را ارسال کنید</i>', ok_cb, false)
else
if redis:get(hash) == 'waiting:'..msg.from.id then
redis:set(hash,msg.text)
return reply_msg(msg.id, '<i>با موفقیت انجام شد</i>', ok_cb, false)
end
end

if matches[1] == 'setver' then
if not is_sudo(msg) then return end
redis:set(hashver,'waiting:'..msg.from.id)
return reply_msg(msg.id, '<i>لطفا متن مورد نظر را ارسال کنید</i>', ok_cb, false)
else
if redis:get(hashver) == 'waiting:'..msg.from.id then
redis:set(hashver,msg.text)
return reply_msg(msg.id, '<i>با موفقیت انجام شد</i>', ok_cb, false)
end
end


if matches[1] == 'helpfun' then
if not is_momod(msg) then return end
return reply_msg(msg.id, redis:get(hashfun), ok_cb, false)
end

if matches[1] == 'help' then
if not is_momod(msg) then return end
return reply_msg(msg.id, redis:get(hash), ok_cb, false)
end

if matches[1] == 'helpmods' then
if not is_owner(msg) then return end
return reply_msg(msg.id, redis:get(hashmods), ok_cb, false)
end


if matches[1] == 'helpadmin' then
if not is_admin(msg) then return end
return reply_msg(msg.id, redis:get(hashadmin), ok_cb, false)
end

if matches[1] == 'version' then
return reply_msg(msg.id, redis:get(hashver), ok_cb, false)
end

end

return {
    patterns = {
        '^[/!#](sethelpfun)$',
        '^[/!#](sethelpadmin)$',
        '^[/!#](sethelpmods)$',
        '^[/!#](sethelp)$',
        '^[/!#](helpfun)$',
        '^[/!#](helpmods)$',
        '^[/!#](helpadmin)$',
        '^[/!#](help)$',
        '[/!#](setver)$',
        '[/!#](version)$',
        '(.*)',
    },
    run = run,
    pre_process = pre_process
}
end
