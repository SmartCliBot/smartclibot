--Our Channel: @Radicall_team
--By: @Erorr_Yes

local function pre_process(msg)
	local timetoexpire = 'unknown'
	local expiretime = redis:hget ('expiretime', get_receiver(msg))
	local now = tonumber(os.time())
	local mamalitabar = "channel#id"..1071384176 --Put Your Telegram-ID Here
	local add_ex = '—---------------------------\n\n#Smart_News📣\n\nExpiration date Group[0]Days left\n\n<b>[Expire]\n</b>\n—----------------------------\n\n#اخبار_جدید_اسمارت 📣\n\nاز تاریخ انقضا گروه <i>'..msg.to.print_name..'</i>\n[ 0 ] روز باقی مانده است\n\n<i>(انقضا)\n</i>\n----------------------------------\n--| @Radicall_team |--'
	local add_exon = '—---------------------------\n\n#Smart_News📣\n\nExpiration date Group[1]Days left\n\n<b>[Expire]\n</b>\n—----------------------------\n\n#اخبار_جدید_اسمارت 📣\n\nاز تاریخ انقضا گروه <i>'..msg.to.print_name..'</i>\n[ 1 ] روز باقی مانده است\n\n<i>(انقضا)\n</i>\n----------------------------------\n--| @Radicall_team |--'
    local add_extw = '—---------------------------\n\n#Smart_News📣\n\nExpiration date Group[2]Days left\n\n<b>[Expire]\n</b>\n—----------------------------\n\n#اخبار_جدید_اسمارت 📣\n\nاز تاریخ انقضا گروه <i>'..msg.to.print_name..'</i>\n[ 2 ] روز باقی مانده است\n\n<i>(انقضا)\n</i>\n----------------------------------\n--| @Radicall_team |--'
    local add_exth = '—---------------------------\n\n#Smart_News📣\n\nExpiration date Group[3]Days left\n\n<b>[Expire]\n</b>\n—----------------------------\n\n#اخبار_جدید_اسمارت 📣\n\nاز تاریخ انقضا گروه <i>'..msg.to.print_name..'</i>\n[ 3 ] روز باقی مانده است\n\n<i>(انقضا)\n</i>\n----------------------------------\n--| @Radicall_team |--'
    local add_exfu = '—---------------------------\n\n#Smart_News📣\n\nExpiration date Group[4]Days left\n\n<b>[Expire]\n</b>\n—----------------------------\n\n#اخبار_جدید_اسمارت 📣\n\nاز تاریخ انقضا گروه <i>'..msg.to.print_name..'</i>\n[ 4 ] روز باقی مانده است\n\n<i>(انقضا)\n</i>\n----------------------------------\n--| @Radicall_team |--'
    local add_exfo = '—---------------------------\n\n#Smart_News📣\n\nExpiration date Group[5]Days left\n\n<b>[Expire]\n</b>\n—----------------------------\n\n#اخبار_جدید_اسمارت 📣\n\nاز تاریخ انقضا گروه <i>'..msg.to.print_name..'</i>\n[ 5 ] روز باقی مانده است\n\n<i>(انقضا)\n</i>\n----------------------------------\n--| @Radicall_team |--'
	if expiretime then  
	timetoexpire = math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
		if tonumber("0") > tonumber(timetoexpire) and not is_sudo(msg) then
		if msg.text:match('/') then
			return send_large_msg(get_receiver(msg), '<i>تاریخ انقضای گروه به پایان رسید!\nبرای شارژ مجدد گروه با تیم پشتیبانی در ارتباط باشید.</i>')
		else
			return
		end
	end
	if tonumber(timetoexpire) == 0 then
		if redis:hget('expires0',msg.to.id) then return msg end
		send_msg(mamalitabar, add_ex, ok_cb, false)
		send_large_msg(get_receiver(msg), '0 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.')
		redis:hset('expires0',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 1 then
		if redis:hget('expires1',msg.to.id) then return msg end
		send_msg(mamalitabar, add_exon, ok_cb, false)
		send_large_msg(get_receiver(msg), '1 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.')
		redis:hset('expires1',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 2 then
		if redis:hget('expires2',msg.to.id) then return msg end
		send_msg(mamalitabar, add_extw, ok_cb, false)
		send_large_msg(get_receiver(msg), '2 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.')
		redis:hset('expires2',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 3 then
		if redis:hget('expires3',msg.to.id) then return msg end
	    send_msg(mamalitabar, add_exth, ok_cb, false)
			send_large_msg(get_receiver(msg), '3 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.')
		redis:hset('expires3',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 4 then
		if redis:hget('expires4',msg.to.id) then return msg end
	  send_msg(mamalitabar, add_exfu, ok_cb, false)
		send_large_msg(get_receiver(msg), '4 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.')
		redis:hset('expires4',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 5 then
		if redis:hget('expires5',msg.to.id) then return msg end
		send_msg(mamalitabar, add_exfo, ok_cb, false)
		send_large_msg(get_receiver(msg), '5 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.')
		redis:hset('expires5',msg.to.id,'5')
	end
end
return msg
end
function run(msg, matches)
	if matches[1]:lower() == 'setexpire' then
		if not is_sudo(msg) then return end
		local time = os.time()
		local buytime = tonumber(os.time())
		local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
		redis:hset('expiretime',get_receiver(msg),timeexpire)
		return "تاریخ انقضای گروه:\nبه "..matches[2].. " روز دیگر تنظیم شد."
	end
	if matches[1]:lower() == 'expire' then
		local expiretime = redis:hget ('expiretime', get_receiver(msg))
		local expire = ''
		if not expiretime then 
		expire = expire..'نامحدود'
		else
			local now = tonumber(os.time())
			return (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1)
		end
	end

end
return {
  patterns = {
    "^[!/]([Ss]etexpire) (.*)$",
	"^[!/]([Ee]xpire)$",
  },
  run = run,
  pre_process = pre_process
}

--Our Channel: @Radicall_team
--By: @Erorr_Yes
