--Our Channel: @Radicall_team
--By: @Erorr_Yes

--Begin supergrpup.lua
--Check members #Add supergroup
local function check_member_super(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  if type(result) == 'boolean' then
    print('This is a old message!')
    return reply_msg(msg.id, 'این پیام قدیمی است [پشتیبانی نمیشود]', ok_cb, false)
  end
  if success == 0 then
	send_large_msg(receiver, "<i>لطفا ابتدا من را ادمین کنید</i>")
  end
  for k,v in pairs(result) do
    local member_id = v.peer_id
    if member_id ~= our_id then
      -- SuperGroup configuration
      data[tostring(msg.to.id)] = {
        group_type = 'SuperGroup',
		long_id = msg.to.peer_id,
		moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.title, '_', ' '),
		  lock_arabic = 'no',
		  lock_bots = 'no',
		  lock_contacts = 'no',
		  lock_suser = 'no',
		  lock_inline = 'no',
		  lock_smart = 'no',
		  lock_fosh = 'no',
		  lock_link = "no",
		  lock_slinks = 'no',
          flood = 'yes',
		  lock_spam = 'yes',
		  lock_sticker = 'no',
		  member = 'no',
		  public = 'no',
		  lock_rtl = 'no',
		  lock_tgservice = 'yes',
		  lock_contacts = 'no',
		  expiretime = 'null',
		  strict = 'no'
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
	  local text = "<b>Done...\nSmart robot was active in supergroup\nversion: 3</b>"	  
      return reply_msg(msg.id, text, ok_cb, false)
    end
  end
end

--Check Members #rem supergroup
local function check_member_superrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  if type(result) == 'boolean' then
    print('This is a old message!')
    return reply_msg(msg.id, 'این پیام قدیمی است [پشتیبانی نمیشود]', ok_cb, false)
  end
  for k,v in pairs(result) do
    local member_id = v.id
    if member_id ~= our_id then
	  -- Group configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
	  local text = '<i>گروه از لیست مدیریتی ربات حذف شد</i>'
      return reply_msg(msg.id, text, ok_cb, false)
    end
  end
end

--Function to Add supergroup
local function superadd(msg)
	local data = load_data(_config.moderation.data)
	local receiver = get_receiver(msg)
    channel_get_users(receiver, check_member_super,{receiver = receiver, data = data, msg = msg})
end

--Function to remove supergroup
local function superrem(msg)
	local data = load_data(_config.moderation.data)
    local receiver = get_receiver(msg)
    channel_get_users(receiver, check_member_superrem,{receiver = receiver, data = data, msg = msg})
end

---------------------------rest group-------------------------------

local function reset_group(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  if type(result) == 'boolean' then
    print('This is a old message!')
    return reply_msg(msg.id, 'این پیام قدیمی است [پشتیبانی نمیشود]', ok_cb, false)
  end
  if success == 0 then
	send_large_msg(receiver, "<i>لطفا ابتدا من را ادمین کنید</i>")
  end
  for k,v in pairs(result) do
    local member_id = v.peer_id
    if member_id ~= our_id then
      -- SuperGroup configuration
      data[tostring(msg.to.id)] = {
        group_type = 'SuperGroup',
		long_id = msg.to.peer_id,
		moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.title, '_', ' '),
		  lock_arabic = 'no',
		  lock_bots = 'no',
		  lock_contacts = 'no',
		  lock_suser = 'no',
		  lock_inline = 'no',
		  lock_smart = 'no',
		  lock_fosh = 'no',
		  lock_link = "no",
		  lock_slinks = 'no',
          flood = 'yes',
		  lock_spam = 'yes',
		  lock_sticker = 'no',
		  member = 'no',
		  public = 'no',
		  lock_rtl = 'no',
		  lock_tgservice = 'yes',
		  lock_contacts = 'no',
		  expiretime = 'null',
		  strict = 'no'
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
	  local text = [[
	  
	  تنظیمات گروه بازنشانی شد☢

لطفا نسبت به تنظیم مجدد ربات اقدام کنید، اگر سوال یا مشکلی دارید با تیم پشتیبانی در ارتباط باشید

برای اضافه کردن تیم پشتیبانی میتوانید از دستور  دعوت سازنده  استفاده کنید

ورژن: 3 
----------------------------------
--| @Radicall_team |--

	  ]]

      return reply_msg(msg.id, text, ok_cb, false)
    end
  end
end

--Function to reset supergroup
local function resetadd(msg)
	local data = load_data(_config.moderation.data)
	local receiver = get_receiver(msg)
    channel_get_users(receiver, reset_group,{receiver = receiver, data = data, msg = msg})
end

--Function to reset supergroup
local function resetrem(msg)
	local data = load_data(_config.moderation.data)
    local receiver = get_receiver(msg)
    channel_get_users(receiver, reset_grouprem,{receiver = receiver, data = data, msg = msg})
end

--Get and output admins and bots in supergroup
local function callback(cb_extra, success, result)
local i = 1
local chat_name = string.gsub(cb_extra.msg.to.print_name, "_", " ")
local member_type = cb_extra.member_type
local text = member_type.." برای "..chat_name..":\n"
for k,v in pairsByKeys(result) do
if not v.first_name then
	name = " "
else
	vname = v.first_name:gsub("‮", "")
	name = vname:gsub("_", " ")
	end
		text = text.."\n"..i.." - "..name.."["..v.peer_id.."]"
		i = i + 1
	end
    send_large_msg(cb_extra.receiver, text)
end

local function callback_clean_bots (extra, success, result)
	local msg = extra.msg
	local receiver = 'channel#id'..msg.to.id
	local channel_id = msg.to.id
	for k,v in pairs(result) do
		local bot_id = v.peer_id
		kick_user(bot_id,channel_id)
	end
end

--Get and output info about supergroup
local function callback_info(cb_extra, success, result)
local title ="اطلاعات گروه: ["..result.title.."]\n\n"
local admin_num = "تعداد ادمین ها: "..result.admins_count.."\n"
local user_num = "تعداد کاربران: "..result.participants_count.."\n"
local kicked_num = "کاربران اخراج شده: "..result.kicked_count.."\n"
local channel_id = "آیدی: "..result.peer_id.."\n"
if result.username then
	channel_username = "Username: @"..result.username
else
	channel_username = ""
end
local text = title..admin_num..user_num..kicked_num..channel_id..channel_username
    send_large_msg(cb_extra.receiver, text)
end

--Get and output members of supergroup
local function callback_wholist(cb_extra, success, result)
local text = "کاربران موجود در #سوپرگروه\n "..cb_extra.receiver.."\n"
local i = 1
for k,v in pairsByKeys(result) do
if not v.print_name then
	name = " "
else
	vname = v.print_name:gsub("‮", "")
	name = vname:gsub("_", " ")
end
	if v.username then
		username = " @"..v.username
	else
		username = ""
	end
	text = text.."\n"..i.." - "..name.." "..username.." [ "..v.peer_id.." ]\n"
	--text = text.."\n"..username
	i = i + 1
end
    local file = io.open("./groups/lists/supergroups/"..cb_extra.receiver..".txt", "w")
    file:write(text)
    file:flush()
    file:close()
    --send_document(cb_extra.receiver,"./groups/lists/supergroups/"..cb_extra.receiver..".txt", ok_cb, false)
	post_msg(cb_extra.receiver, text, ok_cb, false)
end

--Get and output members of supergroup
local function callback_whofile(cb_extra, success, result)
local text = "کاربران موجود در #سوپرگروه\n "..cb_extra.receiver.."\n"
local i = 1
for k,v in pairsByKeys(result) do
if not v.print_name then
	name = " "
else
	vname = v.print_name:gsub("‮", "")
	name = vname:gsub("_", " ")
end
	if v.username then
		username = " @"..v.username
	else
		username = ""
	end
	text = text.."\n"..i.." - "..name.." "..username.." [ "..v.peer_id.." ]\n"
	--text = text.."\n"..username
	i = i + 1
end
    local file = io.open("./groups/lists/supergroups/"..cb_extra.receiver..".txt", "w")
    file:write(text)
    file:flush()
    file:close()
    send_document(cb_extra.receiver,"./groups/lists/supergroups/"..cb_extra.receiver..".txt", ok_cb, false)
	--post_msg(cb_extra.receiver, text, ok_cb, false)
end

--Get and output list of kicked users for supergroup
local function callback_kicked(cb_extra, success, result)
	--vardump(result)
	local text = "کاربران اخراج شده #سوپرگروه  "..cb_extra.receiver.."\n\n"
	local i = 1
	for k,v in pairsByKeys(result) do
		if not v.print_name then
			name = " "
		else
			vname = v.print_name:gsub("‮", "")
			name = vname:gsub("_", " ")
		end
		if v.username then
			name = name.." @"..v.username
		end
		text = text.."\n"..i.." - "..name.." [ "..v.peer_id.." ]\n"
		i = i + 1
	end
	local file = io.open("./groups/lists/supergroups/kicked/"..cb_extra.receiver..".txt", "w")
	file:write(text)
	file:flush()
	file:close()
	send_document(cb_extra.receiver,"./groups/lists/supergroups/kicked/"..cb_extra.receiver..".txt", ok_cb, false)
	--send_large_msg(cb_extra.receiver, text)
end

--Begin supergroup locks
local function lock_group_links(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'yes' then
    return reply_msg(msg.id, '<i>قفل لینک از قبل فعال بود</i>', ok_cb, false)
  else
    data[tostring(target)]['settings']['lock_link'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل لینک فعال شد</i>', ok_cb, false)
  end
end

local function unlock_group_links(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'no' then
    return 'قفل ارسال لینک از قبل غیر فعال بود'
  else
    data[tostring(target)]['settings']['lock_link'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل لینک غیرفعال شد</i>', ok_cb, false)
  end
end

local function lock_group_contacts(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_contacts_lock = data[tostring(target)]['settings']['lock_contacts']
  if group_contacts_lock == 'yes' then
    return reply_msg(msg.id, '<i>ارسال مخاطب از قبل ممنوع است</i>', ok_cb, false)
  else
    data[tostring(target)]['settings']['lock_contacts'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>ارسال مخاطب ممنوع شد\nاز این پس مخاطب های ارسال شده پاک خواهند شد</i>', ok_cb, false)
  end
end

local function unlock_group_contacts(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_contacts_lock = data[tostring(target)]['settings']['lock_contacts']
  if group_contacts_lock == 'no' then
    return reply_msg(msg.id, '<i>ارسال مخاطب از قبل نیز قفل نبود</i>', ok_cb, false)
  else
    data[tostring(target)]['settings']['lock_contacts'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل ارسال مخاطب غیرفعال شد</i>', ok_cb, false)
  end
end

local function lock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'yes' then
    return reply_msg(msg.id, '<i>قفل ربات از قبل فعال بود</i>', ok_cb, false)
  else
    data[tostring(target)]['settings']['lock_bots'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل ربات فعال شد</i>', ok_cb, false)
  end
end

local function unlock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'no' then
    return reply_msg(msg.id, '<i>قفل ربات از قبل غیرفعال بود</i>', ok_cb, false)
  else
    data[tostring(target)]['settings']['lock_bots'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل ربات غیرفعال شد</i>', ok_cb, false)
  end
end

local function lock_group_suser(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_suser_lock = data[tostring(target)]['settings']['lock_suser']
  if group_suser_lock == 'yes' then
    return reply_msg(msg.id, '<i>قفل یوزرنیم از قبل فعال است</i>', ok_cb, false)
  else
    data[tostring(target)]['settings']['lock_suser'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل یوزرنیم فعال شد\nاز این پس هر پیامی حاوی @ پاک خواهد شد</i>', ok_cb, false)
  end
end

local function unlock_group_suser(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_suser_lock = data[tostring(target)]['settings']['lock_suser']
  if group_suser_lock == 'no' then
    return reply_msg(msg.id, '<i>قفل یوزرنیم از قبل غیرفعال است</i>', ok_cb, false)
  else
    data[tostring(target)]['settings']['lock_suser'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل یوزرنیم غیرفعال شد</i>', ok_cb, false)
  end
end

local function lock_group_slinks(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_slinks_lock = data[tostring(target)]['settings']['lock_slinks']
  if group_slinks_lock == 'yes' then
    return 'قفل اخطار | حذف لینک از قبل فعال است'
  else
    data[tostring(target)]['settings']['lock_slinks'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل اخطار | حذف فعال شد\nاز این پس در صورت ارسال لینک کاربر نیز اخراج خواهد شد</i>', ok_cb, false)
  end
end

local function unlock_group_slinks(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_slinks_lock = data[tostring(target)]['settings']['lock_slinks']
  if group_slinks_lock == 'no' then
    return 'قفل اخطار|حذف لینک از قبل غیرفعال بود'
  else
    data[tostring(target)]['settings']['lock_slinks'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل اخطار|حذف لینک غیرفعال شد</i>', ok_cb, false)
  end
end

local function lock_group_smart(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_smart_lock = data[tostring(target)]['settings']['lock_smart']
  if group_smart_lock == 'yes' then
    return 'قفل پیشرفته تبلیغات از قبل فعال است'
  else
    data[tostring(target)]['settings']['lock_smart'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل پیشرفته تبلیغات فعال شد</i>', ok_cb, false)
  end
end

local function unlock_group_smart(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_smart_lock = data[tostring(target)]['settings']['lock_smart']
  if group_smart_lock_lock == 'no' then
    return 'قفل پیشرفته تبلیغات از قبل فعال نبود'
  else
    data[tostring(target)]['settings']['lock_smart'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل پیشرفته تبلیغات غیرفعال شد</i>', ok_cb, false)
  end
end

local function lock_group_inline(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_inline_lock = data[tostring(target)]['settings']['lock_inline']
  if group_inline_lock == 'yes' then
    return 'قفل پیام های شیشه ای از قبل فعال بود'
  else
    data[tostring(target)]['settings']['lock_inline'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل پیام های شیشه ای فعال شد\nاز این پس پیام های شیشه ای پاک خواهند شد</i>', ok_cb, false)
  end
end

local function unlock_group_inline(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_inline_lock = data[tostring(target)]['settings']['lock_inline']
  if group_inline_lock == 'no' then
    return 'قفل پیام های شیشه ای از قبل فعال نبود'
  else
    data[tostring(target)]['settings']['lock_inline'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل پیام های شیشه ای غیرفعال شد</i>', ok_cb, false)
  end
end

local function lock_group_fosh(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_fosh_lock = data[tostring(target)]['settings']['lock_fosh']
  if group_fosh_lock == 'yes' then
    return 'استفاده از کلمات توهین آمیز از قبل ممنوع بود'
  else
    data[tostring(target)]['settings']['lock_fosh'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل کلمات توهین آمیز فعال شد\nاز این پس کلمات توهین آمیز پاک خواهند شد</i>', ok_cb, false)
  end
end

local function unlock_group_fosh(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_fosh_lock = data[tostring(target)]['settings']['lock_fosh']
  if group_fosh_lock == 'no' then
    return 'قفل کلمات توهین آمیز از قبل غیرفعال بود'
  else
    data[tostring(target)]['settings']['lock_fosh'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل کلمات توهین آمیز غیرفعال شد</i>', ok_cb, false)
  end
end

local function lock_group_spam(msg, data, target)
  if not is_momod(msg) then
    return
  end
  if not is_owner(msg) then
    return "فقط مالک گروه!"
  end
  local group_spam_lock = data[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'yes' then
    return 'قفل اسپم از قبل فعال بود'
  else
    data[tostring(target)]['settings']['lock_spam'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'قفل اسپم فعال شد.'
  end
end

local function unlock_group_spam(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_spam_lock = data[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'no' then
    return 'قفل اسپم از قبل غیر فعال بود'
  else
    data[tostring(target)]['settings']['lock_spam'] = 'no'
    save_data(_config.moderation.data, data)
    return 'قفل اسپم غیر فعال شد.'
  end
end

local function lock_group_flood(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'yes' then
    return 'قفل پیام های مکرر از قبل فعال بود'
  else
    data[tostring(target)]['settings']['flood'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'قفل پیام های مکرر فعال شد.'
  end
end

local function unlock_group_flood(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'no' then
    return 'قفل پیام های مکرر از قبل غیر فعال بود'
  else
    data[tostring(target)]['settings']['flood'] = 'no'
    save_data(_config.moderation.data, data)
    return 'قفل پیام های مکرر غیر فعال شد.'
  end
end

local function lock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'yes' then
    return 'قفل فارسی|عربی از قبل فعال است'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'قفل فارسی|عربی فعال شد\nاز این پس چت های فارسی و عربی پاک خواهند شد'
  end
end

local function unlock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'no' then
    return 'قفل فارسی|عربی از قبل فعال نبود'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'no'
    save_data(_config.moderation.data, data)
    return 'قفل فارسی|عربی غیرفعال شد'
  end
end

local function lock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'yes' then
    return 'ورود اعضای جدید ممنوع بود'
  else
    data[tostring(target)]['settings']['lock_member'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'ورود اعضای جدید ممنوع شد'
end

local function unlock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'no' then
    return 'ورود اعضای جدید مجاز بود'
  else
    data[tostring(target)]['settings']['lock_member'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ورود اعضای جدید مجاز شد'
  end
end

local function lock_group_rtl(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['lock_rtl']
  if group_rtl_lock == 'yes' then
    return 'قفل آر تی ال از قبل فعال بود'
  else
    data[tostring(target)]['settings']['lock_rtl'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, 'قفل آر تی ال فعال شد', ok_cb, false)
  end
end

local function unlock_group_rtl(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['lock_rtl']
  if group_rtl_lock == 'no' then
    return 'قفل آر تی ال از قبل غیرفعال بود'
  else
    data[tostring(target)]['settings']['lock_rtl'] = 'no'
    save_data(_config.moderation.data, data)
    return 'قفل آر تی ال غیرفعال شد'
  end
end

local function lock_group_tgservice(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_tgservice_lock = data[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'yes' then
    return 'پیام های سرویسی از قبل پاک می شدند'
  else
    data[tostring(target)]['settings']['lock_tgservice'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'قفل پیام های سرویسی فعال شد\nورود | خروج افراد در گروه پاک خواهند شد'
  end
end

local function unlock_group_tgservice(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_tgservice_lock = data[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'no' then
    return 'قفل پیام های سرویسی از قبل فعال نبود'
  else
    data[tostring(target)]['settings']['lock_tgservice'] = 'no'
    save_data(_config.moderation.data, data)
    return 'قفل پیام های سرویسی غیر فعال شد'
  end
end

local function lock_group_sticker(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_sticker_lock = data[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'yes' then
    return 'قفل ارسال استیکر از قبل فعال بود'
  else
    data[tostring(target)]['settings']['lock_sticker'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل ارسال استیکر فعال شد</i>', ok_cb, false)
  end
end

local function unlock_group_sticker(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_sticker_lock = data[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'no' then
    return 'قفل ارسال استیکر از قبل فعال نبود'
  else
    data[tostring(target)]['settings']['lock_sticker'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>قفل ارسال استیکر غیرفعال شد</i>', ok_cb, false)
  end
end

local function lock_group_contacts(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_contacts_lock = data[tostring(target)]['settings']['lock_contacts']
  if group_contacts_lock == 'yes' then
    return 'ارسال مخاطب از قبل قفل بود'
  else
    data[tostring(target)]['settings']['lock_contacts'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, 'ارسال مخاطب ممنوع شد', ok_cb, false)
  end
end

local function unlock_group_contacts(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_contacts_lock = data[tostring(target)]['settings']['lock_contacts']
  if group_contacts_lock == 'no' then
    return 'ارسال مخاطب از قبل مجاز بود'
  else
    data[tostring(target)]['settings']['lock_contacts'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, 'ارسال مخاطب مجاز شد', ok_cb, false)
  end
end

local function enable_strict_rules(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_strict_lock = data[tostring(target)]['settings']['strict']
  if group_strict_lock == 'yes' then
    return reply_msg(msg.id, '<i>تنظیمات سختگیرانه در حال اجرا است</i>', ok_cb, false)
  else
    data[tostring(target)]['settings']['strict'] = 'yes'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, '<i>تنظیمات سختگیرانه فعال شد\nاز این پس در صورت ارسال هر گونه پیام قفل شده کاربر اخراج خواهد شد</i>', ok_cb, false)
  end
end

local function disable_strict_rules(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_strict_lock = data[tostring(target)]['settings']['strict']
  if group_strict_lock == 'no' then
    return reply_msg(msg.id, 'تنظیمات سختگیرانه از قبل نیز اجرا نمی شد', ok_cb, false)
  else
    data[tostring(target)]['settings']['strict'] = 'no'
    save_data(_config.moderation.data, data)
    return reply_msg(msg.id, 'تنظیمات سختگیرانه غیر فعال شد', ok_cb, false)
  end
end
--End supergroup locks

--'Set supergroup rules' function
local function set_rulesmod(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local data_cat = 'rules'
  data[tostring(target)][data_cat] = rules
  save_data(_config.moderation.data, data)
  return reply_msg(msg.id, 'قوانین گروه با موفقیت ثبت شد', ok_cb, false)
end

--'Get supergroup rules' function
local function get_rules(msg, data)
  local data_cat = 'rules'
  if not data[tostring(msg.to.id)][data_cat] then
    return reply_msg(msg.id, 'قوانینی تنظیم نشده است', ok_cb, false)
  end
  local rules = data[tostring(msg.to.id)][data_cat]
  local group_name = data[tostring(msg.to.id)]['settings']['set_name']
  local rules = group_name..' قوانین :\n\n'..rules:gsub("/n", " ")
  return rules
end

--Set supergroup to public or not public function
local function set_public_membermod(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران گروه!"
  end
  local group_public_lock = data[tostring(target)]['settings']['public']
  local long_id = data[tostring(target)]['long_id']
  if not long_id then
	data[tostring(target)]['long_id'] = msg.to.peer_id
	save_data(_config.moderation.data, data)
  end
  if group_public_lock == 'yes' then
    return 'Group is already public'
  else
    data[tostring(target)]['settings']['public'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'سوپر گروه هم اکنون: public'
end

local function unset_public_membermod(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_public_lock = data[tostring(target)]['settings']['public']
  local long_id = data[tostring(target)]['long_id']
  if not long_id then
	data[tostring(target)]['long_id'] = msg.to.peer_id
	save_data(_config.moderation.data, data)
  end
  if group_public_lock == 'no' then
    return 'این گروه عمومی نیست'
  else
    data[tostring(target)]['settings']['public'] = 'no'
	data[tostring(target)]['long_id'] = msg.to.long_id
    save_data(_config.moderation.data, data)
    return 'SuperGroup is now: not public'
  end
end

--Show supergroup settings; function
function show_supergroup_settingsmod(msg, target)
 	if not is_momod(msg) then
    	return
  	end
	local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['public'] then
			data[tostring(target)]['settings']['public'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_rtl'] then
			data[tostring(target)]['settings']['lock_rtl'] = 'no'
		end
end
      if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tgservice'] then
			data[tostring(target)]['settings']['lock_tgservice'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_member'] then
			data[tostring(target)]['settings']['lock_member'] = 'no'
		end
	end
	
	local expiretime = redis:hget('expiretime', get_receiver(msg))
    local expire = ''
  if not expiretime then
  expire = expire..'نامحدود!'
  else
   local now = tonumber(os.time())
   expire =  expire..math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
 end
 
  local settings = data[tostring(target)]['settings']
  local text = "<i>تنظیمات اختصاصی گروه شما🔻</i>\n--------------------------\n<b>🔖قفل تبلیغات پیشرفته > "..settings.lock_smart.."\n🔖قفل شیشه ای > "..settings.lock_inline.."\n🔖قفل لینک > "..settings.lock_link.."\n🔖قفل (اخطار|حذف) > "..settings.lock_slinks.."\n🔖قفل یوزرنیم > "..settings.lock_suser.."\n🔖قفل ربات > "..settings.lock_bots.."\n🔖قفل استیکر > "..settings.lock_sticker.."\n🔖قفل کلمات زشت > "..settings.lock_fosh.."\n‌🔖قفل مخاطب > "..settings.lock_contacts.."\n🔖قفل پیام های مکرر > "..settings.flood.."\n🔖تعداد پیام های مکرر > [ "..NUM_MSG_MAX.." ]\n🔖قفل اسپم > "..settings.lock_spam.."\n🔖قفل فارسی > "..settings.lock_arabic.."\n🔖قفل اعضا > "..settings.lock_member.."\n🔖قفل راستچین > "..settings.lock_rtl.."\n\n🔖گروه عمومی > "..settings.public.."\n🔖تنظیمات سختگیرانه > "..settings.strict.."\n🔖قفل پیام سرویسی > "..settings.lock_tgservice.."\n\n"..mutes_list(msg.to.id).."\n\nقفل فعال است = 🔐\nقفل غیرفعال است = 🔓\n\n📍نوع گروه : #سوپرگروه\n🗒شناسه سوپر گروه : [ "..msg.to.id.." ]\n🔻نام سوپر گروه > ".. string.gsub(msg.to.print_name, '_', ' ') .."\n🔻تاریخ انقضا گروه > ["..expire.."]\n\n🌐ربات ضد اسپم اسمارت🌐\n🔹ورژن ربات > V3.0\n\n--------------------------\nSMART BOT 🤖</b>" 
  local text = string.gsub(text, 'yes', '🔐')
  local text = string.gsub(text, 'no', '🔓')
  local text = string.gsub(text, 'All', 'همه')
  local text = string.gsub(text, 'Video', 'فیلم')
  local text = string.gsub(text, 'Text', 'متن')
  local text = string.gsub(text, 'Gifs', 'گیف')
  local text = string.gsub(text, 'Audio', 'صدا')
  local text = string.gsub(text, 'Photo', 'عکس')
  local text = string.gsub(text, 'Documents', 'فایل')
  return reply_msg(msg.id, text, ok_cb, false)
end

--Show supergroup settings pv; function
function show_supergroup_settingsmodpv(msg, target)
 	if not is_momod(msg) then
    	return
  	end
	local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['public'] then
			data[tostring(target)]['settings']['public'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_rtl'] then
			data[tostring(target)]['settings']['lock_rtl'] = 'no'
		end
end
      if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tgservice'] then
			data[tostring(target)]['settings']['lock_tgservice'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_member'] then
			data[tostring(target)]['settings']['lock_member'] = 'no'
		end
	end
	
	local expiretime = redis:hget('expiretime', get_receiver(msg))
    local expire = ''
  if not expiretime then
  expire = expire..'نامحدود!'
  else
   local now = tonumber(os.time())
   expire =  expire..math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
 end
 
  local settings = data[tostring(target)]['settings']
  local text =  "<i>تنظیمات اختصاصی گروه شما🔻</i>\n--------------------------\n<b>🔖قفل تبلیغات پیشرفته 🔙 "..settings.lock_smart.."\n🔖قفل شیشه ای 🔙 "..settings.lock_inline.."\n🔖قفل لینک 🔙 "..settings.lock_link.."\n🔖قفل (اخطار|حذف) 🔙 "..settings.lock_slinks.."\n🔖قفل یوزرنیم 🔙 "..settings.lock_suser.."\n🔖قفل ربات 🔙 "..settings.lock_bots.."\n🔖قفل استیکر 🔙 "..settings.lock_sticker.."\n🔖قفل کلمات زشت 🔙 "..settings.lock_fosh.."\n‌🔖قفل مخاطب 🔙 "..settings.lock_contacts.."\n🔖قفل پیام های مکرر 🔙 "..settings.flood.."\n🔖تعداد پیام های مکرر 🔙 [ "..NUM_MSG_MAX.." ]\n🔖قفل اسپم 🔙 "..settings.lock_spam.."\n🔖قفل فارسی 🔙 "..settings.lock_arabic.."\n🔖قفل اعضا 🔙 "..settings.lock_member.."\n🔖قفل راستچین 🔙 "..settings.lock_rtl.."\n\n🔖گروه عمومی 🔙 "..settings.public.."\n🔖تنظیمات سختگیرانه 🔙 "..settings.strict.."\n🔖قفل پیام سرویسی 🔙 "..settings.lock_tgservice.."\n\n"..mutes_list(msg.to.id).."\n\nقفل فعال است = 🔐\nقفل غیرفعال است = 🔓\n\n📍نوع گروه : #سوپرگروه\n🗒شناسه سوپر گروه : [ "..msg.to.id.." ]\n🔻نام سوپر گروه > ".. string.gsub(msg.to.print_name, '_', ' ') .."\n🔻تاریخ انقضا گروه > ["..expire.."]\n\n</b>🔖گروه سوالات و مشکلات:\nhttps://telegram.me/joinchat/EEUzMD_cBnA0U_vmQqcrUA\n\n🔖دستورات ربات:\nhttps://telegram.me/Radicall_team/252\n\n🔖🌐ربات ضد اسپم اسمارت🌐\n🔹ورژن ربات > V3.0\n\n--------------------------\nSMART BOT 🤖"
  local text = string.gsub(text, 'yes', '🔐')
  local text = string.gsub(text, 'no', '🔓')
  local text = string.gsub(text, 'All', 'همه')
  local text = string.gsub(text, 'Video', 'فیلم')
  local text = string.gsub(text, 'Text', 'متن')
  local text = string.gsub(text, 'Gifs', 'گیف')
  local text = string.gsub(text, 'Audio', 'صدا')
  local text = string.gsub(text, 'Photo', 'عکس')
  local text = string.gsub(text, 'Documents', 'فایل')
  send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
  return reply_msg(msg.id, '<i>تنظیمات گروه به خصوصی شما ارسال شد</i>', ok_cb, false)
end


local function promote_admin(receiver, member_username, user_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'channel#id', '')
  local member_tag_username = string.gsub(member_username, '@', '@')
  if not data[group] then
    return
  end
  if data[group]['moderators'][tostring(user_id)] then
    return send_large_msg(receiver, member_username..' is already a moderator.')
  end
  data[group]['moderators'][tostring(user_id)] = member_tag_username
  save_data(_config.moderation.data, data)
end

local function demote_admin(receiver, member_username, user_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'channel#id', '')
  if not data[group] then
    return
  end
  if not data[group]['moderators'][tostring(user_id)] then
    return send_large_msg(receiver, member_tag_username..' is not a moderator.')
  end
  data[group]['moderators'][tostring(user_id)] = nil
  save_data(_config.moderation.data, data)
end

local function promote2(receiver, member_username, user_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'channel#id', '')
  local member_tag_username = string.gsub(member_username, '@', '@')
  if not data[group] then
    return send_large_msg(receiver, 'SuperGroup is not added.')
  end
  if data[group]['moderators'][tostring(user_id)] then
    return send_large_msg(receiver, member_username..' یک مدیر است')
  end
  data[group]['moderators'][tostring(user_id)] = member_tag_username
  save_data(_config.moderation.data, data)
  send_large_msg(receiver, member_username..' مدیر شد')
end

local function demote2(receiver, member_username, user_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'channel#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'Group is not added.')
  end
  if not data[group]['moderators'][tostring(user_id)] then
    return send_large_msg(receiver, member_tag_username..' از قبل مدیر نبود')
  end
  data[group]['moderators'][tostring(user_id)] = nil
  save_data(_config.moderation.data, data)
  send_large_msg(receiver, member_username..' از مدیریت بر کنار شد')
end

local function modlist(msg)
  local data = load_data(_config.moderation.data)
  local groups = "groups"
  if not data[tostring(groups)][tostring(msg.to.id)] then
    return 'SuperGroup is not added.'
  end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['moderators']) == nil then
    return reply_msg(msg.id, '<i>مدیری در این گروه نیست</i>', ok_cb, false)
  end
  local i = 1
  local message = '\nلیست مدیران #سوپرگروه ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
  for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
    message = message ..i..' - '..v..' [' ..k.. '] \n'
    i = i + 1
  end
  return message
end

-- Start by reply actions
function get_message_callback(extra, success, result)
	local get_cmd = extra.get_cmd
	local msg = extra.msg
	local data = load_data(_config.moderation.data)
	local print_name = user_print_name(msg.from):gsub("‮", "")
	local name_log = print_name:gsub("_", " ")
	if type(result) == 'boolean' then
		print('This is a old message!')
		return
	end
	if get_cmd == "id" and not result.action then
		local channel = 'channel#id'..result.to.peer_id
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] obtained id for: ["..result.from.peer_id.."]")
		id1 = send_large_msg(channel, result.from.peer_id)
	elseif get_cmd == 'id' and result.action then
		local action = result.action.type
		if action == 'chat_add_user' or action == 'chat_del_user' or action == 'chat_rename' or action == 'chat_change_photo' then
			if result.action.user then
				user_id = result.action.user.peer_id
			else
				user_id = result.peer_id
			end
			local channel = 'channel#id'..result.to.peer_id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] obtained id by service msg for: ["..user_id.."]")
			id1 = send_large_msg(channel, user_id)
		end
	elseif get_cmd == "idfrom" then
		local channel = 'channel#id'..result.to.peer_id
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] obtained id for msg fwd from: ["..result.fwd_from.peer_id.."]")
		id2 = send_large_msg(channel, result.fwd_from.peer_id)
	elseif get_cmd == 'channel_block' and not result.action then
		local member_id = result.from.peer_id
		local channel_id = result.to.peer_id
    if member_id == msg.from.id then
      return send_large_msg("channel#id"..channel_id, "Leave using kickme command")
    end
    if is_momod2(member_id, channel_id) and not is_admin2(msg.from.id) then
			   return send_large_msg("channel#id"..channel_id, "You can't kick mods/owner/admins")
    end
    if is_admin2(member_id) then
         return send_large_msg("channel#id"..channel_id, "You can't kick other admins")
    end
		--savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: ["..user_id.."] by reply")
		kick_user(member_id, channel_id)
	elseif get_cmd == 'channel_block' and result.action and result.action.type == 'chat_add_user' then
		local user_id = result.action.user.peer_id
		local channel_id = result.to.peer_id
    if member_id == msg.from.id then
      return send_large_msg("channel#id"..channel_id, "Leave using kickme command")
    end
    if is_momod2(member_id, channel_id) and not is_admin2(msg.from.id) then
			   return send_large_msg("channel#id"..channel_id, "You can't kick mods/owner/admins")
    end
    if is_admin2(member_id) then
         return send_large_msg("channel#id"..channel_id, "You can't kick other admins")
    end
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: ["..user_id.."] by reply to sev. msg.")
		kick_user(user_id, channel_id)
	elseif get_cmd == "del" then
		delete_msg(result.id, ok_cb, false)
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] deleted a message by reply")
	elseif get_cmd == "setadmin" then
		local user_id = result.from.peer_id
		local channel_id = "channel#id"..result.to.peer_id
		channel_set_admin(channel_id, "user#id"..user_id, ok_cb, false)
		if result.from.username then
			text = "@"..result.from.username.." set as an admin"
		else
			text = "[ "..user_id.." ]set as an admin"
		end
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] set: ["..user_id.."] as admin by reply")
		send_large_msg(channel_id, text)
	elseif get_cmd == "demoteadmin" then
		local user_id = result.from.peer_id
		local channel_id = "channel#id"..result.to.peer_id
		if is_admin2(result.from.peer_id) then
			return send_large_msg(channel_id, "You can't demote global admins!")
		end
		channel_demote(channel_id, "user#id"..user_id, ok_cb, false)
		if result.from.username then
			text = "@"..result.from.username.." has been demoted from admin"
		else
			text = "[ "..user_id.." ] has been demoted from admin"
		end
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted: ["..user_id.."] from admin by reply")
		send_large_msg(channel_id, text)
	elseif get_cmd == "setowner" then
		local group_owner = data[tostring(result.to.peer_id)]['set_owner']
		if group_owner then
		local channel_id = 'channel#id'..result.to.peer_id
			if not is_admin2(tonumber(group_owner)) and not is_support(tonumber(group_owner)) then
				local user = "user#id"..group_owner
				channel_demote(channel_id, user, ok_cb, false)
			end
			local user_id = "user#id"..result.from.peer_id
			channel_set_admin(channel_id, user_id, ok_cb, false)
			data[tostring(result.to.peer_id)]['set_owner'] = tostring(result.from.peer_id)
			save_data(_config.moderation.data, data)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] set: ["..result.from.peer_id.."] as owner by reply")
			if result.from.username then
				text = "@"..result.from.username.." [ "..result.from.peer_id.." ] به عنوان مالک گروه تنظیم شد"
			else
				text = "[ "..result.from.peer_id.." ] به عنوان مالک گروه تنظیم شد"
			end
			send_large_msg(channel_id, text)
		end
	elseif get_cmd == "promote" then
		local receiver = result.to.peer_id
		local full_name = (result.from.first_name or '')..' '..(result.from.last_name or '')
		local member_name = full_name:gsub("‮", "")
		local member_username = member_name:gsub("_", " ")
		if result.from.username then
			member_username = '@'.. result.from.username
		end
		local member_id = result.from.peer_id
		if result.to.peer_type == 'channel' then
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] promoted mod: @"..member_username.."["..result.from.peer_id.."] by reply")
		promote2("channel#id"..result.to.peer_id, member_username, member_id)
	    --channel_set_mod(channel_id, user, ok_cb, false)
		end
	elseif get_cmd == "demote" then
		local full_name = (result.from.first_name or '')..' '..(result.from.last_name or '')
		local member_name = full_name:gsub("‮", "")
		local member_username = member_name:gsub("_", " ")
    if result.from.username then
		member_username = '@'.. result.from.username
    end
		local member_id = result.from.peer_id
		--local user = "user#id"..result.peer_id
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted mod: @"..member_username.."["..user_id.."] by reply")
		demote2("channel#id"..result.to.peer_id, member_username, member_id)
		--channel_demote(channel_id, user, ok_cb, false)
	elseif get_cmd == 'mute_user' then
		if result.service then
			local action = result.action.type
			if action == 'chat_add_user' or action == 'chat_del_user' or action == 'chat_rename' or action == 'chat_change_photo' then
				if result.action.user then
					user_id = result.action.user.peer_id
				end
			end
			if action == 'chat_add_user_link' then
				if result.from then
					user_id = result.from.peer_id
				end
			end
		else
			user_id = result.from.peer_id
		end
		local receiver = extra.receiver
		local chat_id = msg.to.id
		print(user_id)
		print(chat_id)
		if is_muted_user(chat_id, user_id) then
			unmute_user(chat_id, user_id)
			send_large_msg(receiver, "["..user_id.."] از لیست کاربران بیصدا پاک شد")
		elseif is_admin1(msg) then
			mute_user(chat_id, user_id)
			send_large_msg(receiver, " ["..user_id.."] به لیست کاربران بیصدا اضافه شد ")
		end
	end
end
-- End by reply actions

--By ID actions
local function cb_user_info(extra, success, result)
	local receiver = extra.receiver
	local user_id = result.peer_id
	local get_cmd = extra.get_cmd
	local data = load_data(_config.moderation.data)
	--[[if get_cmd == "setadmin" then
		local user_id = "user#id"..result.peer_id
		channel_set_admin(receiver, user_id, ok_cb, false)
		if result.username then
			text = "@"..result.username.." has been set as an admin"
		else
			text = "[ "..result.peer_id.." ] has been set as an admin"
		end
			send_large_msg(receiver, text)]]
	if get_cmd == "demoteadmin" then
		if is_admin2(result.peer_id) then
			return send_large_msg(receiver, "شما نمیتوانید ادمین جهانی را عزل کنید")
		end
		local user_id = "user#id"..result.peer_id
		channel_demote(receiver, user_id, ok_cb, false)
		if result.username then
			text = "@"..result.username.." has been demoted from admin"
			send_large_msg(receiver, text)
		else
			text = "[ "..result.peer_id.." ] has been demoted from admin"
			send_large_msg(receiver, text)
		end
	elseif get_cmd == "promote" then
		if result.username then
			member_username = "@"..result.username
		else
			member_username = string.gsub(result.print_name, '_', ' ')
		end
		promote2(receiver, member_username, user_id)
	elseif get_cmd == "demote" then
		if result.username then
			member_username = "@"..result.username
		else
			member_username = string.gsub(result.print_name, '_', ' ')
		end
		demote2(receiver, member_username, user_id)
	end
end

-- Begin resolve username actions
local function callbackres(extra, success, result)
  local member_id = result.peer_id
  local member_username = "@"..result.username
  local get_cmd = extra.get_cmd
	if get_cmd == "res" then
		local user = result.peer_id
		local name = string.gsub(result.print_name, "_", " ")
		local channel = 'channel#id'..extra.channelid
		send_large_msg(channel, user..'\n'..name)
		return user
	elseif get_cmd == "id" then
		local user = result.peer_id
		local channel = 'channel#id'..extra.channelid
		send_large_msg(channel, user)
		return user
  elseif get_cmd == "invite" then
    local receiver = extra.channel
    local user_id = "user#id"..result.peer_id
    channel_invite(receiver, user_id, ok_cb, false)
	--[[elseif get_cmd == "channel_block" then
		local user_id = result.peer_id
		local channel_id = extra.channelid
    local sender = extra.sender
    if member_id == sender then
      return send_large_msg("channel#id"..channel_id, "Leave using kickme command")
    end
		if is_momod2(member_id, channel_id) and not is_admin2(sender) then
			   return send_large_msg("channel#id"..channel_id, "You can't kick mods/owner/admins")
    end
    if is_admin2(member_id) then
         return send_large_msg("channel#id"..channel_id, "You can't kick other admins")
    end
		kick_user(user_id, channel_id)
	elseif get_cmd == "setadmin" then
		local user_id = "user#id"..result.peer_id
		local channel_id = extra.channel
		channel_set_admin(channel_id, user_id, ok_cb, false)
		if result.username then
			text = "@"..result.username.." has been set as an admin"
			send_large_msg(channel_id, text)
		else
			text = "@"..result.peer_id.." has been set as an admin"
			send_large_msg(channel_id, text)
		end
	elseif get_cmd == "setowner" then
		local receiver = extra.channel
		local channel = string.gsub(receiver, 'channel#id', '')
		local from_id = extra.from_id
		local group_owner = data[tostring(channel)]['set_owner']
		if group_owner then
			local user = "user#id"..group_owner
			if not is_admin2(group_owner) and not is_support(group_owner) then
				channel_demote(receiver, user, ok_cb, false)
			end
			local user_id = "user#id"..result.peer_id
			channel_set_admin(receiver, user_id, ok_cb, false)
			data[tostring(channel)]['set_owner'] = tostring(result.peer_id)
			save_data(_config.moderation.data, data)
			savelog(channel, name_log.." ["..from_id.."] set ["..result.peer_id.."] as owner by username")
		if result.username then
			text = member_username.." [ "..result.peer_id.." ] added as owner"
		else
			text = "[ "..result.peer_id.." ] added as owner"
		end
		send_large_msg(receiver, text)
  end]]
	elseif get_cmd == "promote" then
		local receiver = extra.channel
		local user_id = result.peer_id
		--local user = "user#id"..result.peer_id
		promote2(receiver, member_username, user_id)
		--channel_set_mod(receiver, user, ok_cb, false)
	elseif get_cmd == "demote" then
		local receiver = extra.channel
		local user_id = result.peer_id
		local user = "user#id"..result.peer_id
		demote2(receiver, member_username, user_id)
	elseif get_cmd == "demoteadmin" then
		local user_id = "user#id"..result.peer_id
		local channel_id = extra.channel
		if is_admin2(result.peer_id) then
			return send_large_msg(channel_id, "You can't demote global admins!")
		end
		channel_demote(channel_id, user_id, ok_cb, false)
		if result.username then
			text = "@"..result.username.." has been demoted from admin"
			send_large_msg(channel_id, text)
		else
			text = "@"..result.peer_id.." has been demoted from admin"
			send_large_msg(channel_id, text)
		end
		local receiver = extra.channel
		local user_id = result.peer_id
		demote_admin(receiver, member_username, user_id)
	elseif get_cmd == 'mute_user' then
		local user_id = result.peer_id
		local receiver = extra.receiver
		local chat_id = string.gsub(receiver, 'channel#id', '')
		if is_muted_user(chat_id, user_id) then
			unmute_user(chat_id, user_id)
			send_large_msg(receiver, " ["..user_id.."] از لیست کاربران بیصدا پاک شد")
		elseif is_owner(extra.msg) then
			mute_user(chat_id, user_id)
			send_large_msg(receiver, " ["..user_id.."] به لیست کاربران بیصدا اضافه شد")
		end
	end
end
--End resolve username actions

--Begin non-channel_invite username actions
local function in_channel_cb(cb_extra, success, result)
  local get_cmd = cb_extra.get_cmd
  local receiver = cb_extra.receiver
  local msg = cb_extra.msg
  local data = load_data(_config.moderation.data)
  local print_name = user_print_name(cb_extra.msg.from):gsub("‮", "")
  local name_log = print_name:gsub("_", " ")
  local member = cb_extra.username
  local memberid = cb_extra.user_id
  if member then
    text = 'No user @'..member..' in this SuperGroup.'
  else
    text = 'No user ['..memberid..'] in this SuperGroup.'
  end
if get_cmd == "channel_block" then
  for k,v in pairs(result) do
    vusername = v.username
    vpeer_id = tostring(v.peer_id)
    if vusername == member or vpeer_id == memberid then
     local user_id = v.peer_id
     local channel_id = cb_extra.msg.to.id
     local sender = cb_extra.msg.from.id
      if user_id == sender then
        return send_large_msg("channel#id"..channel_id, "Leave using kickme command")
      end
      if is_momod2(user_id, channel_id) and not is_admin2(sender) then
        return send_large_msg("channel#id"..channel_id, "You can't kick mods/owner/admins")
      end
      if is_admin2(user_id) then
        return send_large_msg("channel#id"..channel_id, "You can't kick other admins")
      end
      if v.username then
        text = ""
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: @"..v.username.." ["..v.peer_id.."]")
      else
        text = ""
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: ["..v.peer_id.."]")
      end
      kick_user(user_id, channel_id)
      return
    end
  end
elseif get_cmd == "setadmin" then
   for k,v in pairs(result) do
    vusername = v.username
    vpeer_id = tostring(v.peer_id)
    if vusername == member or vpeer_id == memberid then
      local user_id = "user#id"..v.peer_id
      local channel_id = "channel#id"..cb_extra.msg.to.id
      channel_set_admin(channel_id, user_id, ok_cb, false)
      if v.username then
        text = "@"..v.username.." ["..v.peer_id.."] has been set as an admin"
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] set admin @"..v.username.." ["..v.peer_id.."]")
      else
        text = "["..v.peer_id.."] has been set as an admin"
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] set admin "..v.peer_id)
      end
	  if v.username then
		member_username = "@"..v.username
	  else
		member_username = string.gsub(v.print_name, '_', ' ')
	  end
		local receiver = channel_id
		local user_id = v.peer_id
		promote_admin(receiver, member_username, user_id)

    end
    send_large_msg(channel_id, text)
    return
 end
 elseif get_cmd == 'setowner' then
	for k,v in pairs(result) do
		vusername = v.username
		vpeer_id = tostring(v.peer_id)
		if vusername == member or vpeer_id == memberid then
			local channel = string.gsub(receiver, 'channel#id', '')
			local from_id = cb_extra.msg.from.id
			local group_owner = data[tostring(channel)]['set_owner']
			if group_owner then
				if not is_admin2(tonumber(group_owner)) and not is_support(tonumber(group_owner)) then
					local user = "user#id"..group_owner
					channel_demote(receiver, user, ok_cb, false)
				end
					local user_id = "user#id"..v.peer_id
					channel_set_admin(receiver, user_id, ok_cb, false)
					data[tostring(channel)]['set_owner'] = tostring(v.peer_id)
					save_data(_config.moderation.data, data)
					savelog(channel, name_log.."["..from_id.."] set ["..v.peer_id.."] as owner by username")
				if result.username then
					text = member_username.."<b> ["..v.peer_id.."]</b> به عنوان مالک گروه تنظیم شد"
				else
					text = "<b>["..v.peer_id.."]</b> به عنوان مالک گروه تنظیم شد"
				end
			end
		elseif memberid and vusername ~= member and vpeer_id ~= memberid then
			local channel = string.gsub(receiver, 'channel#id', '')
			local from_id = cb_extra.msg.from.id
			local group_owner = data[tostring(channel)]['set_owner']
			if group_owner then
				if not is_admin2(tonumber(group_owner)) and not is_support(tonumber(group_owner)) then
					local user = "user#id"..group_owner
					channel_demote(receiver, user, ok_cb, false)
				end
				data[tostring(channel)]['set_owner'] = tostring(memberid)
				save_data(_config.moderation.data, data)
				savelog(channel, name_log.."["..from_id.."] set ["..memberid.."] as owner by username")
				text = "<b>["..memberid.."]</b> به عنوان مالک گروه تنظیم شد"
			end
		end
	end
 end
send_large_msg(receiver, text)
end
--End non-channel_invite username actions

--'Set supergroup photo' function
local function set_supergroup_photo(msg, success, result)
  local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)] then
      return
  end
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/photos/channel_photo_'..msg.to.id..'.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    channel_set_photo(receiver, file, ok_cb, false)
    data[tostring(msg.to.id)]['settings']['set_photo'] = file
    save_data(_config.moderation.data, data)
    send_large_msg(receiver, 'لطفا صبر کنید...', ok_cb, false)
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'خطایی رخ داد لطفا مجددا اقدام نمیاد', ok_cb, false)
  end
end

--Run function
local function run(msg, matches)
	if msg.to.type == 'chat' then
		if matches[1] == 'tosuper' then
			if not is_admin1(msg) then
				return
			end
			local receiver = get_receiver(msg)
			chat_upgrade(receiver, ok_cb, false)
		end
	elseif msg.to.type == 'channel'then
		if matches[1]:lower() == 'tosuper' then
			if not is_admin1(msg) then
				return
			end
			return reply_msg(msg.id, 'هم اکنون #سوپرگروه است', ok_cb, false)
		end
	end
	if msg.to.type == 'channel' then
	local support_id = msg.from.id
	local receiver = get_receiver(msg)
	local print_name = user_print_name(msg.from):gsub("‮", "")
	local name_log = print_name:gsub("_", " ")
	local data = load_data(_config.moderation.data)
		if matches[1]:lower() == 'add' and not matches[2] then
			if not is_admin1(msg) and not is_support(support_id) then
				return
			end
			if is_super_group(msg) then
				return reply_msg(msg.id, '<i>اطلاعات این گروه از قبل در سرور ذخیره شده است</i>', ok_cb, false)
			end
			print("SuperGroup "..msg.to.print_name.."("..msg.to.id..") added")
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] added SuperGroup")
			superadd(msg)
			set_mutes(msg.to.id)
			channel_set_admin(receiver, 'user#id'..msg.from.id, ok_cb, false)
		end

		if matches[1]:lower() == 'rem' and is_admin1(msg) and not matches[2] then
			if not is_super_group(msg) then
				return reply_msg(msg.id, '<i>از قبل نیز اطلاعاتی از این گروه در سرور ذخیره نشده بود</i>', ok_cb, false)
			end
			print("SuperGroup "..msg.to.print_name.."("..msg.to.id..") removed")
			superrem(msg)
			rem_mutes(msg.to.id)
		end

		if not data[tostring(msg.to.id)] then
			return
		end
		-----------------------------------------------------
			if matches[1]:lower() == 'reset group' and not matches[2] then
			if not is_owner(msg) and not is_support(support_id) then
				return
			end
			
			resetrem(msg)
			rem_mutes(msg.to.id)
			resetadd(msg)
			set_mutes(msg.to.id)
			channel_set_admin(receiver, 'user#id'..msg.from.id, ok_cb, false)
		end
		----------------------------------------------------
		
		if matches[1]:lower() == "setwelcome" and is_owner(msg) then
local alirezapt = "welcome"..msg.to.id
redis:set(alirezapt, matches[2])
local alireza = "><i>متن خوش آمد گویی با موفقیت تنظیم شد</i>"
return reply_msg(msg.id, alireza, ok_cb, false)
end
if matches[1] == "delete welcome" and is_owner(msg) then
local alirezapt = "welcome"..msg.to.id
redis:del(alirezapt)
local alireza = "><i>متن خوش آمد گویی حذف شد\nو بصورت اتوماتیک بروی پیش فرض تنظیم شد</i>"
return reply_msg(msg.id, alireza, ok_cb, false)
end
if matches[1]:lower() == "welcome" and is_owner(msg) then
if matches[2]:lower() == "on" then
redis:set("welcome:"..msg.to.id, true)
return reply_msg(msg.id, '<i>سیستم خوش آمد گویی روشن شد\nهم اکنون تنظیمات بروی پیش فرض قرار دارد برای تنظیم بصورت انتخابی به شکل زیر عمل کنید\n\n</i><b>/setwelcome [متن مورد نظر]</b>', ok_cb, false)
end
if matches[2]:lower() == "off" then
redis:del("welcome:"..msg.to.id)
return reply_msg(msg.id, '><i>سیستم خوش آمد گویی بصورت کامل متوقف شد</i>', ok_cb, false)
end
end
if redis:get("welcome:"..msg.to.id) then
if matches[1] == "chat_add_user_link" then
local alirezapt = "welcome"..msg.to.id
  local cliapi = redis:get(alirezapt)
            if cliapi then
local alireza = '> <code>'..cliapi..'</code>'
return reply_msg(msg.id, alireza, ok_cb, false)
else
if not cliapi then
local text = '><i>سلام</i>  '
..'{'..msg.from.print_name..'}--'
..'[@'..(msg.from.username or "---")..']\n'
..'<i>به گروه</i>  '
..'(<b>'..msg.to.title..'</b>)  '
..'<i>خوش آمدید</i>'
return reply_msg(msg.id, text, ok_cb, false)
end
end
end
end
-----------------------------------------------------------------------------

		if matches[1]:lower() == "infogroup" then
			if not is_owner(msg) then
				return
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup info")
			channel_info(receiver, callback_info, {receiver = receiver, msg = msg})
		end

		if matches[1]:lower() == "admins" then
			if not is_owner(msg) and not is_support(msg.from.id) then
				return
			end
			member_type = 'Admins'
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup Admins list")
			admins = channel_get_admins(receiver,callback, {receiver = receiver, msg = msg, member_type = member_type})
		end

		if matches[1]:lower() == "owner" then
			local group_owner = data[tostring(msg.to.id)]['set_owner']
			if not group_owner then
				return "<i>مالک گروه تنظیم نشده است لطفا با تیم پشتیبانی در ارتباط باشید!</i>"
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] used /owner")
			local hour = os.date("%M") * 10
 local holder_hash = 'holder:'..hour..':'..msg.from.id
 local is_holder = redis:get(holder_hash)
if is_holder then
    return "<i>برای جلوگیری از اسپم شما هر 10 دقیقه مجاز به مشاهده مالکین سوپر گروه هستید</i>"
     elseif not is_holder then
     redis:set(holder_hash, true)
			send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/owner.webp", ok_cb, false)
			local text = ">مالک #سوپرگروه [<b>"..group_owner.."</b>] است"
			return reply_msg(msg.id, text, ok_cb, false)
		end
		end
				if matches[1]:lower() == "owner pv" then
		if not is_owner(msg) then
				return "<i>مالک گروه تنظیم نشده است لطفا با تیم پشتیبانی در ارتباط باشید!</i>"
			end
			local group_owner = data[tostring(msg.to.id)]['set_owner']
			if not group_owner then
				return 
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] used /owner")
			local text = "🎫مالک سوپر گروه ["..group_owner..']'
			send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
			--send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return  reply_msg(msg.id, '<i>اطلاعات مالک سوپر گروه به خصوصی شما ارسال شد</i>', ok_cb, false)
		end
		
		if matches[1]:lower() == "modlist" and is_momod(msg) then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group modlist")
			return modlist(msg)
			-- channel_get_admins(receiver,callback, {receiver = receiver})
		end

		if matches[1]:lower() == "bots" and is_momod(msg) then
			member_type = 'Bots'
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup bots list")
			channel_get_bots(receiver, callback, {receiver = receiver, msg = msg, member_type = member_type})
		end

		if matches[1]:lower() == "who list" and not matches[2] and is_momod(msg) then
			local user_id = msg.from.peer_id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup users list")
			channel_get_users(receiver, callback_wholist, {receiver = receiver})
		end

		if matches[1]:lower() == "who file" and not matches[2] and is_owner(msg) then
			local user_id = msg.from.peer_id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup users list")
			channel_get_users(receiver, callback_whofile, {receiver = receiver})
		end 
		
		if matches[1]:lower() == "kicked" and is_momod(msg) then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested Kicked users list")
			channel_get_kicked(receiver, callback_kicked, {receiver = receiver})
		end

		if matches[1]:lower() == 'del' and is_momod(msg) then
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'del',
					msg = msg
				}
				delete_msg(msg.id, ok_cb, false)
				get_message(msg.reply_id, get_message_callback, cbreply_extra)
			end
		end

		if matches[1]:lower() == 'block' and is_momod(msg) then
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'channel_block',
					msg = msg
				}
				get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1]:lower() == 'block' and matches[2] and string.match(matches[2], '^%d+$') then
				--[[local user_id = matches[2]
				local channel_id = msg.to.id
				if is_momod2(user_id, channel_id) and not is_admin2(user_id) then
					return send_large_msg(receiver, "You can't kick mods/owner/admins")
				end
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: [ user#id"..user_id.." ]")
				kick_user(user_id, channel_id)]]
				local get_cmd = 'channel_block'
				local msg = msg
				local user_id = matches[2]
				channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, user_id=user_id})
			elseif matches[1]:lower() == "block" and matches[2] and not string.match(matches[2], '^%d+$') then
			--[[local cbres_extra = {
					channelid = msg.to.id,
					get_cmd = 'channel_block',
					sender = msg.from.id
				}
			    local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: @"..username)
				resolve_username(username, callbackres, cbres_extra)]]
			local get_cmd = 'channel_block'
			local msg = msg
			local username = matches[2]
			local username = string.gsub(matches[2], '@', '')
			channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, username=username})
			end
		end

		if matches[1]:lower() == 'id' then
			if type(msg.reply_id) ~= "nil" and is_momod(msg) and not matches[2] then
				local cbreply_extra = {
					get_cmd = 'id',
					msg = msg
				}
				get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif type(msg.reply_id) ~= "nil" and matches[2] == "from" and is_momod(msg) then
				local cbreply_extra = {
					get_cmd = 'idfrom',
					msg = msg
				}
				get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif msg.text:match("@[%a%d]") then
				local cbres_extra = {
					channelid = msg.to.id,
					get_cmd = 'id'
				}
				local username = matches[2]
				local username = username:gsub("@","")
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested ID for: @"..username)
				resolve_username(username,  callbackres, cbres_extra)
			else
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup ID")
					if is_momod(msg) then
				return "نام گروه : ".. string.gsub(msg.to.print_name, '_', ' ') .."\nآیدی گروه : "..msg.to.id.."\n\nآیدی شما : "..msg.from.id.."\nلینک خصوصی شما : Telegram.me/"..msg.from.username.."\n\n🔰ربات ضد اسپم اسمارت🔰"
			end
		end
end 

		if matches[1]:lower() == 'kickme' then
			if msg.to.type == 'channel' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] left via kickme")
				channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false)
			end
		end

		if matches[1]:lower() == 'newlink' and is_momod(msg)then
			local function callback_link (extra , success, result)
			local receiver = get_receiver(msg)
				if success == 0 then
					send_large_msg(receiver, '<i>امکان پذیر نیست\nتنها سازنده گروه دسترسی ساخت لینک جدید را دارد</i>')
					data[tostring(msg.to.id)]['settings']['set_link'] = nil
					save_data(_config.moderation.data, data)
				else
					send_large_msg(receiver, "Created a new link")
					data[tostring(msg.to.id)]['settings']['set_link'] = result
					save_data(_config.moderation.data, data)
				end
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] attempted to create a new SuperGroup link")
			export_channel_link(receiver, callback_link, false)
		end

		if matches[1]:lower() == 'setlink' and is_owner(msg) then
			data[tostring(msg.to.id)]['settings']['set_link'] = 'waiting'
			save_data(_config.moderation.data, data)
			return reply_msg(msg.id, '<i>لطفا لینک جدید را ارسال کنید</i>', ok_cb, false)
		end

		if msg.text then
			if msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") and data[tostring(msg.to.id)]['settings']['set_link'] == 'waiting' and is_owner(msg) then
				data[tostring(msg.to.id)]['settings']['set_link'] = msg.text
				save_data(_config.moderation.data, data)
				return reply_msg(msg.id, '<i>لینک جدید با موفقیت تنظیم شد</i>', ok_cb, false)
			end
		end

		if matches[1]:lower() == 'link' then
			if not is_momod(msg) then
				return
			end
			local group_link = data[tostring(msg.to.id)]['settings']['set_link']
			if not group_link then
				local text = "ابتدا با دستور [ !newlink ] لینک جدید را بسازید\nاگر من سازنده گروه نیستم با دستور [ !setlink ] لینک را تنظیم کنید"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
			local hour = os.date("%M") * 5
 local link_hash = 'link:'..hour..':'..msg.from.id
 local is_link = redis:get(link_hash)
if is_link then
   local text = "<i>برای جلوگیری از اسپم دریافت لینک گروه هر 5 دقیقه امکان پذیر است!</i>"
   return reply_msg(msg.id, text, ok_cb, false)
     elseif not is_link then
     redis:set(link_hash, true)
	 local hash = 'group:'..msg.to.id
			local text = '> <i>نام گروه:</i> [<b>'..msg.to.title..'</b>]\n> <i>لینک ورود به گروه:</i>\n'..group_link.. '\n'
			return reply_msg(msg.id, text, ok_cb, false)
			
		end
        end

				if matches[1]:lower() == 'link pv' then
			if not is_owner(msg) then
				return
			end
			local group_link = data[tostring(msg.to.id)]['settings']['set_link']
			if not group_link then
				local text = "ابتدا با دستور [ !newlink ] لینک جدید را بسازید\nاگر من سازنده گروه نیستم با دستور [ !setlink ] لینک را تنظیم کنید"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
			local text = '> <i>نام گروه:</i> [<b>'..msg.to.title..'</b>]\n> <i>لینک ورود به گروه:</i>\n'..group_link.. '\n'
			 send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return reply_msg(msg.id, '<i>لینک به pv ارسال شد\nاگر لینک را دریافت نکردید ممکن است که من ریپورت شده باشم ابتدا به من پیام بدهید تا به توانم به شما پیام بدهم</i>', ok_cb, false)
		end
		
		
		if matches[1]:lower() == "invite" and is_sudo(msg) then
			local cbres_extra = {
				channel = get_receiver(msg),
				get_cmd = "invite"
			}
			local username = matches[2]
			local username = username:gsub("@","")
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] invited @"..username)
			resolve_username(username,  callbackres, cbres_extra)
		end

		if matches[1]:lower() == 'res' and is_owner(msg) then
			local cbres_extra = {
				channelid = msg.to.id,
				get_cmd = 'res'
			}
			local username = matches[2]
			local username = username:gsub("@","")
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] resolved username: @"..username)
			resolve_username(username,  callbackres, cbres_extra)
		end

		--[[if matches[1] == 'kick' and is_momod(msg) then
			local receiver = channel..matches[3]
			local user = "user#id"..matches[2]
			chaannel_kick(receiver, user, ok_cb, false)
		end]]

			if matches[1]:lower() == 'setadmin' then
				if not is_support(msg.from.id) and not is_owner(msg) then
					return
				end
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'setadmin',
					msg = msg
				}
				setadmin = get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1]:lower() == 'setadmin' and matches[2] and string.match(matches[2], '^%d+$') then
			--[[]	local receiver = get_receiver(msg)
				local user_id = "user#id"..matches[2]
				local get_cmd = 'setadmin'
				user_info(user_id, cb_user_info, {receiver = receiver, get_cmd = get_cmd})]]
				local get_cmd = 'setadmin'
				local msg = msg
				local user_id = matches[2]
				channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, user_id=user_id})
			elseif matches[1]:lower() == 'setadmin' and matches[2] and not string.match(matches[2], '^%d+$') then
				--[[local cbres_extra = {
					channel = get_receiver(msg),
					get_cmd = 'setadmin'
				}
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] set admin @"..username)
				resolve_username(username, callbackres, cbres_extra)]]
				local get_cmd = 'setadmin'
				local msg = msg
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, username=username})
			end
		end

		if matches[1]:lower() == 'demoteadmin' then
			if not is_support(msg.from.id) and not is_owner(msg) then
				return
			end
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'demoteadmin',
					msg = msg
				}
				demoteadmin = get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1]:lower() == 'demoteadmin' and matches[2] and string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local user_id = "user#id"..matches[2]
				local get_cmd = 'demoteadmin'
				user_info(user_id, cb_user_info, {receiver = receiver, get_cmd = get_cmd})
			elseif matches[1]:lower() == 'demoteadmin' and matches[2] and not string.match(matches[2], '^%d+$') then
				local cbres_extra = {
					channel = get_receiver(msg),
					get_cmd = 'demoteadmin'
				}
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted admin @"..username)
				resolve_username(username, callbackres, cbres_extra)
			end
		end

		if matches[1]:lower() == 'setowner' and is_owner(msg) then
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'setowner',
					msg = msg
				}
				setowner = get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1]:lower() == 'setowner' and matches[2] and string.match(matches[2], '^%d+$') then
		--[[	local group_owner = data[tostring(msg.to.id)]['set_owner']
				if group_owner then
					local receiver = get_receiver(msg)
					local user_id = "user#id"..group_owner
					if not is_admin2(group_owner) and not is_support(group_owner) then
						channel_demote(receiver, user_id, ok_cb, false)
					end
					local user = "user#id"..matches[2]
					channel_set_admin(receiver, user, ok_cb, false)
					data[tostring(msg.to.id)]['set_owner'] = tostring(matches[2])
					save_data(_config.moderation.data, data)
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set ["..matches[2].."] as owner")
					local text = "[ "..matches[2].." ] added as owner"
					return text
				end]]
				local	get_cmd = 'setowner'
				local	msg = msg
				local user_id = matches[2]
				channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, user_id=user_id})
			elseif matches[1] == 'setowner' and matches[2] and not string.match(matches[2], '^%d+$') then
				local	get_cmd = 'setowner'
				local	msg = msg
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, username=username})
			end
		end

		if matches[1]:lower() == 'promote' then
		  if not is_momod(msg) then
				return
			end
			if not is_owner(msg) then
				return "<i>تنها مالک گروه میتواند شخصی را مدیر کند</i>"
			end
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'promote',
					msg = msg
				}
				promote = get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1]:lower() == 'promote' and matches[2] and string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local user_id = "user#id"..matches[2]
				local get_cmd = 'promote'
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] promoted user#id"..matches[2])
				user_info(user_id, cb_user_info, {receiver = receiver, get_cmd = get_cmd})
			elseif matches[1]:lower() == 'promote' and matches[2] and not string.match(matches[2], '^%d+$') then
				local cbres_extra = {
					channel = get_receiver(msg),
					get_cmd = 'promote',
				}
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] promoted @"..username)
				return resolve_username(username, callbackres, cbres_extra)
			end
		end

		if matches[1]:lower() == 'mp' and is_sudo(msg) then
			channel = get_receiver(msg)
			user_id = 'user#id'..matches[2]
			channel_set_mod(channel, user_id, ok_cb, false)
			return "ok"
		end
		if matches[1]:lower() == 'md' and is_sudo(msg) then
			channel = get_receiver(msg)
			user_id = 'user#id'..matches[2]
			channel_demote(channel, user_id, ok_cb, false)
			return "ok"
		end

		if matches[1]:lower() == 'demote' then
			if not is_momod(msg) then
				return
			end
			if not is_owner(msg) then
				return "Only owner/support/admin can promote"
			end
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'demote',
					msg = msg
				}
				demote = get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1] == 'demote' and matches[2] and string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local user_id = "user#id"..matches[2]
				local get_cmd = 'demote'
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted user#id"..matches[2])
				user_info(user_id, cb_user_info, {receiver = receiver, get_cmd = get_cmd})
			elseif matches[1] == 'demote' and matches[2] and not string.match(matches[2], '^%d+$') then
				local cbres_extra = {
					channel = get_receiver(msg),
					get_cmd = 'demote'
				}
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted @"..username)
				return resolve_username(username, callbackres, cbres_extra)
			end
		end

		if matches[1]:lower() == "setname" and is_momod(msg) then
			local receiver = get_receiver(msg)
			local set_name = string.gsub(matches[2], '_', '')
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] renamed SuperGroup to: "..matches[2])
			rename_channel(receiver, set_name, ok_cb, false)
		end

		if msg.service and msg.action.type == 'chat_rename' then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] renamed SuperGroup to: "..msg.to.title)
			data[tostring(msg.to.id)]['settings']['set_name'] = msg.to.title
			save_data(_config.moderation.data, data)
		end

		if matches[1]:lower() == "setabout" and is_momod(msg) then
			local receiver = get_receiver(msg)
			local about_text = matches[2]
			local data_cat = 'description'
			local target = msg.to.id
			data[tostring(target)][data_cat] = about_text
			save_data(_config.moderation.data, data)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup description to: "..about_text)
			channel_set_about(receiver, about_text, ok_cb, false)
			return "توضیحات پروفایل گروه تغییر کرد"
		end

		if matches[1]:lower() == "setusername" and is_admin1(msg) then
			local function ok_username_cb (extra, success, result)
				local receiver = extra.receiver
				if success == 1 then
					send_large_msg(receiver, "SuperGroup username Set.\n\nSelect the chat again to see the changes.")
				elseif success == 0 then
					send_large_msg(receiver, "Failed to set SuperGroup username.\nUsername may already be taken.\n\nNote: Username can use a-z, 0-9 and underscores.\nMinimum length is 5 characters.")
				end
			end
			local username = string.gsub(matches[2], '@', '')
			channel_set_username(receiver, username, ok_username_cb, {receiver=receiver})
		end

		if matches[1]:lower() == 'setrules' and is_momod(msg) then
			rules = matches[2]
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group rules to ["..matches[2].."]")
			return set_rulesmod(msg, data, target)
		end

		if msg.media then
			if msg.media.type == 'photo' and data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' and is_momod(msg) then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] set new SuperGroup photo")
				load_photo(msg.id, set_supergroup_photo, msg)
				return
			end
		end
		if matches[1]:lower() == 'setphoto' and is_momod(msg) then
			data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
			save_data(_config.moderation.data, data)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] started setting new SuperGroup photo")
			return reply_msg(msg.id, '<i>لطفا عکس مورد نظر را ارسال کنید</i>', ok_cb, false)
		end

		if matches[1]:lower() == 'clean' then
			if not is_momod(msg) then
				return
			end
			if not is_momod(msg) then
				return ""
			end
			if matches[2]:lower() == 'modlist' then
				if next(data[tostring(msg.to.id)]['moderators']) == nil  then
				return reply_msg(msg.id, '<i>مدیری برای پاکسازی در این گروه نیست</i>', ok_cb, false)
			end
			
				for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
					data[tostring(msg.to.id)]['moderators'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned modlist")
				return reply_msg(msg.id, '<i>لیست مدیران پاک شد</i>', ok_cb, false)
			end
			if matches[2]:lower() == 'rules' then
				local data_cat = 'rules'
				if data[tostring(msg.to.id)][data_cat] == nil then
					return reply_msg(msg.id, '<i>قوانینی ثبت نشده است که آن را پاک کنید!</i>', ok_cb, false)
				end
				data[tostring(msg.to.id)][data_cat] = nil
				save_data(_config.moderation.data, data)
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned rules")
				return reply_msg(msg.id, '<i>تمام قوانین پاک شدند</i>', ok_cb, false)
			end
			if matches[2]:lower() == 'about' then
				local receiver = get_receiver(msg)
				local about_text = ' '
				local data_cat = 'description'
				if data[tostring(msg.to.id)][data_cat] == nil then
					return 'About is not set'
				end
				data[tostring(msg.to.id)][data_cat] = nil
				save_data(_config.moderation.data, data)
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned about")
				channel_set_about(receiver, about_text, ok_cb, false)
				return "About has been cleaned"
			end
			if matches[2]:lower() == 'mutelist' then
				chat_id = msg.to.id
				local hash =  'mute_user:'..chat_id
					redis:del(hash)
				return reply_msg(msg.id,  '<i>لیست افراد بیصدا شده پاکسازی شد</i>', ok_cb, false)
			end
			if matches[2]:lower() == 'username' and is_admin1(msg) then
				local function ok_username_cb (extra, success, result)
					local receiver = extra.receiver
					if success == 1 then
						send_large_msg(receiver, "SuperGroup username cleaned.")
					elseif success == 0 then
						send_large_msg(receiver, "Failed to clean SuperGroup username.")
					end
				end
				local username = ""
				channel_set_username(receiver, username, ok_username_cb, {receiver=receiver})
			end
			if matches[2]:lower() == "bots" and is_momod(msg) then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked all SuperGroup bots")
				channel_get_bots(receiver, callback_clean_bots, {msg = msg})
			end
		end

		if matches[1]:lower() == 'lock' and is_momod(msg) then
			local target = msg.to.id
			if matches[2]:lower() == 'links' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked link posting ")
				return lock_group_links(msg, data, target)
			end
			if matches[2]:lower() == 'bots' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked bots posting ")
				return lock_group_bots(msg, data, target)
			end
			if matches[2]:lower() == 'username' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked suser posting ")
				return lock_group_suser(msg, data, target)
			end
			if matches[2]:lower() == 'warnlin' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked slinks posting ")
				return lock_group_slinks(msg, data, target)
			end
			if matches[2]:lower() == 'smart' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked smart posting ")
				return lock_group_smart(msg, data, target)
			end
			if matches[2]:lower() == 'fosh' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked fosh posting ")
				return lock_group_fosh(msg, data, target)
			end
			if matches[2]:lower()== 'inline' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked inline posting ")
				return lock_group_inline(msg, data, target)
			end
			if matches[2]:lower() == 'spam' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked spam ")
				return lock_group_spam(msg, data, target)
			end
			if matches[2]:lower() == 'flood' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked flood ")
				return lock_group_flood(msg, data, target)
			end
			if matches[2]:lower() == 'arabic' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked arabic ")
				return lock_group_arabic(msg, data, target)
			end
			if matches[2]:lower() == 'member' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked member ")
				return lock_group_membermod(msg, data, target)
			end
			if matches[2]:lower() == 'rtl' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked rtl chars. in names")
				return lock_group_rtl(msg, data, target)
			end
			if matches[2]:lower() == 'tgservice' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked Tgservice Actions")
				return lock_group_tgservice(msg, data, target)
			end
			if matches[2]:lower() == 'sticker' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked sticker posting")
				return lock_group_sticker(msg, data, target)
			end
			if matches[2]:lower() == 'contacts' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked contact posting")
				return lock_group_contacts(msg, data, target)
			end
			if matches[2]:lower() == 'strict' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked enabled strict settings")
				return enable_strict_rules(msg, data, target)
			end
		end

		if matches[1]:lower() == 'unlock' and is_momod(msg) then
			local target = msg.to.id
			if matches[2]:lower() == 'links' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked link posting")
				return unlock_group_links(msg, data, target)
			end
			if matches[2]:lower() == 'bots' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked bots posting")
				return unlock_group_bots(msg, data, target)
			end
			if matches[2]:lower() == 'username' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked suser posting")
				return unlock_group_suser(msg, data, target)
			end
			if matches[2]:lower() == 'warnlin' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked slink posting")
				return unlock_group_slinks(msg, data, target)
			end
			if matches[2]:lower() == 'smart' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked smart posting")
				return unlock_group_smart(msg, data, target)
			end
			if matches[2]:lower() == 'fosh' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked fosh posting")
				return unlock_group_fosh(msg, data, target)
			end
			if matches[2]:lower() == 'inline' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked inline posting")
				return unlock_group_inline(msg, data, target)
			end
			if matches[2]:lower() == 'spam' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked spam")
				return unlock_group_spam(msg, data, target)
			end
			if matches[2]:lower() == 'flood' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked flood")
				return unlock_group_flood(msg, data, target)
			end
			if matches[2]:lower() == 'arabic' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked Arabic")
				return unlock_group_arabic(msg, data, target)
			end
			if matches[2]:lower() == 'member' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked member ")
				return unlock_group_membermod(msg, data, target)
			end
			if matches[2]:lower() == 'rtl' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked RTL chars. in names")
				return unlock_group_rtl(msg, data, target)
			end
				if matches[2]:lower() == 'tgservice' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked tgservice actions")
				return unlock_group_tgservice(msg, data, target)
			end
			if matches[2]:lower() == 'sticker' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked sticker posting")
				return unlock_group_sticker(msg, data, target)
			end
			if matches[2]:lower() == 'contacts' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked contact posting")
				return unlock_group_contacts(msg, data, target)
			end
			if matches[2]:lower() == 'strict' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked disabled strict settings")
				return disable_strict_rules(msg, data, target)
			end
		end

		if matches[1]:lower() == 'setflood' then
			if not is_momod(msg) then
				return
			end
			if tonumber(matches[2]) < 5 or tonumber(matches[2]) > 20 then
				return reply_msg(msg.id, '<i>خطا‼️\nاین عدد باید بین [5-20] باشد</i>', ok_cb, false)
			end
			local flood_max = matches[2]
			data[tostring(msg.to.id)]['settings']['flood_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] set flood to ["..matches[2].."]")
			return reply_msg(msg.id, '<i>حساسیت پیام های مکرر بروی </i><b>[' ..matches[2].. ']</b><i> تنظیم شد</i>', ok_cb, false)
		end
		if matches[1]:lower() == 'public' and is_momod(msg) then
			local target = msg.to.id
			if matches[2]:lower() == 'yes' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] set group to: public")
				return set_public_membermod(msg, data, target)
			end
			if matches[2]:lower() == 'no' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: not public")
				return unset_public_membermod(msg, data, target)
			end
		end

		if matches[1]:lower() == 'mute' and is_owner(msg) then
			local chat_id = msg.to.id
			if matches[2]:lower() == 'audio' then
			local msg_type = 'Audio'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال صدا ممنوع شد\nاز این پس صدا های ارسالی حذف خواهند شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال صدا از قبل ممنوع بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'photo' then
			local msg_type = 'Photo'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال عکس ممنوع شد\nاز این پس عکس های ارسالی پاک خواهند شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال عکس از قبل ممنوع بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'video' then
			local msg_type = 'Video'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال فیلم ممنوع شد\nاز این پس فیلم های ارسالی پاک خواهند شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال فیلم از قبل ممنوع بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'gifs' then
			local msg_type = 'Gifs'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال گیف ممنوع شد\nاز این پس گیف های ارسالی پاک خواهند شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال گیف از قبل ممنوع بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'documents' then
			local msg_type = 'Documents'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال فایل ممنوع شد\nاز این پس فایل های ارسالی پاک خواهند شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال فایل از قبل ممنوع بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'text' then
			local msg_type = 'Text'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال متن ممنوع شد\nاز این پس متن های ارسالی پاک خواهند شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال متن از قبل ممنوع بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'all' then
			local msg_type = 'All'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>گروه قفل شد\nاز این پس تمامی پیام های ارسالی پاک خواهند شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>گروه از قبل قفل بود</i>', ok_cb, false)
				end
			end
		end
		if matches[1]:lower() == 'unmute' and is_momod(msg) then
			local chat_id = msg.to.id
			if matches[2]:lower() == 'audio' then
			local msg_type = 'Audio'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال صدا آزاد شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال صدا از قبل آزاد بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'photo' then
			local msg_type = 'Photo'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال عکس آزاد شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال عکس از قبل آزاد بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'video' then
			local msg_type = 'Video'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال فیلم آزاد شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال فیلم از قبل آزاد بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'gifs' then
			local msg_type = 'Gifs'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال گیف آزاد شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال گیف از قبل آزاد بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'documents' then
			local msg_type = 'Documents'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال فایل آزاد شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال فایل از قبل آزاد بود</i>', ok_cb, false)
				end
			end
			if matches[2]:lower() == 'text' then
			local msg_type = 'Text'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute message")
					unmute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>ارسال متن آزاد شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>ارسال متن از قبل آزاد بود</i>', ok_cb, false)
					end
			end
			if matches[2]:lower() == 'all' then
			local msg_type = 'All'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					return reply_msg(msg.id, '<i>قفل گروه غیرفعال شد</i>', ok_cb, false)
				else
					return reply_msg(msg.id, '<i>گروه قفل نیست!</i>', ok_cb, false)
				end
			end
		end


		if matches[1]:lower() == "muteuser" and is_momod(msg) then
			local chat_id = msg.to.id
			local hash = "mute_user"..chat_id
			local user_id = ""
			if type(msg.reply_id) ~= "nil" then
				local receiver = get_receiver(msg)
				local get_cmd = "mute_user"
				muteuser = get_message(msg.reply_id, get_message_callback, {receiver = receiver, get_cmd = get_cmd, msg = msg})
			elseif matches[1]:lower() == "muteuser" and matches[2] and string.match(matches[2], '^%d+$') then
				local user_id = matches[2]
				if is_muted_user(chat_id, user_id) then
					unmute_user(chat_id, user_id)
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] removed ["..user_id.."] from the muted users list")
				return "["..user_id.."] از لیست کاربرات بیصدا پاک شد 🔊"
				elseif is_owner(msg) then
					mute_user(chat_id, user_id)
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] added ["..user_id.."] to the muted users list")
				return "["..user_id.."] به لیست کاربران بیصدا اضافه شد🔇"
				end
			elseif matches[1]:lower() == "muteuser" and matches[2] and not string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local get_cmd = "mute_user"
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				resolve_username(username, callbackres, {receiver = receiver, get_cmd = get_cmd, msg=msg})
			end
		end

		if matches[1]:lower() == "muteslist" and is_momod(msg) then
			local chat_id = msg.to.id
			if not has_mutes(chat_id) then
				set_mutes(chat_id)
				return mutes_list(chat_id)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup muteslist")
			return mutes_list(chat_id)
		end
		if matches[1]:lower() == "mutelist" and is_momod(msg) then
			local chat_id = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup mutelist")
			return muted_user_list(chat_id)
		end

		if matches[1]:lower() == 'settings' and is_momod(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingsmod(msg, target)
		end

		if matches[1]:lower() == 'settings pv' and is_momod(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingsmodpv(msg, target)
		end
		
		if matches[1]:lower() == 'rules' then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group rules")
			return get_rules(msg, data)
		end

				if matches[1]:lower() == 'nerkh' or matches[1]:lower() == 'نرخ' then
			text = [[
			💵نرخ فروش گروه با ربات 
نرخ فروش گروه با ربات پیشرفته 
🚫SMART BOT ❌NO PV❌

🌟برای گروه های زیر 1000 نفر ماهانه 
🔆با یک ربات🔆  5 هزار تومان
🔆با دو ربات🔆  7 هزار تومان

➖➖➖➖➖
🌟برای گروه های بالای 1000 نفر ماهانه 
🔆با یک ربات🔆  10 هزار تومان 
🔆با دو ربات🔆 12 هزار تومان

➖➖➖➖➖
🌟برای گروه های بالای 3000 نفر ماهانه 
🔆با یک ربات🔆  15 هزار تومان 
🔆با دو ربات🔆  17 هزار تومان

➖➖➖➖➖
🌟برای گروه های 5000 نفر ماهانه 
🔆با یک ربات🔆  20 هزار تومان 
🔆با دو ربات🔆 22 هزار تومان

➖➖➖➖➖

توجه داشته باشید به هیچ وجه نباید ربات رو از گروه حذف کنید و در صورت داشتن هرگونه مشکل فقط اون رو از ادمینی گروه بردارید و به بنده مراجعه کنید

🆔 @Erorr_Yes
➖➖➖➖➖
لازم به ذکره اولویت بصورت پرداخت کارت به کارت میباشد

➖➖➖➖➖
🔵راه های ارتباط با ما

🔘 @Erorr_Yes
🔘 @Tabar_repBot
			]]
			reply_msg(msg.id, text, ok_cb, false)
		end
		
		if matches[1]:lower() == 'bot' or matches[1]:lower() == 'ربات' then
		 text = {
"<b>Online</b>🏴",
"<i>آنلاین</i>🏴",
"<i>ربات آنلاین و آماده به کار میباشد</i>🏴",
"<b>active</b>🏴",
"<b>Pong</b>🏴",
"<b>Hum :D</b>🏴",
"<b>Smart Bot Online</b>🏴",
"<b>Yes</b>🏴",
"<i>ربات فعال است</i>🏴",
"<i>اسمارت ورژن 3 فعال است</i>🏴",
"<b>Version 3 active</b>🏴",
"<b>Smart No pv ONE Active</b>🏴",
"<i>ربات آنلاین است!!!\nهمچنین شما میتوانید برای خرید ربات یا شارژ گروه خود عبارت  نرخ  را ارسال کنید و با ما در ارتباط باشید</i>",
}
		local b = text[math.random(#text)]
     reply_msg(msg.id, b, ok_cb, false)
		end
		
		if matches[1]:lower() == 'help' and  not is_owner(msg) then
			text = {
"<i>شما مجاز نیستید!!!\nمیتوانید برای مشاهده راهنما وارد کانال ما شوید</i>",
"<i>شما مجاز به مشاهده دستورات نیستید\nلطفا مجددا تلاش نکنید</i>",
"<i>شما فقط از طریق کانال میتوانید راهنما ربات را مشاهده کنید</i>",
"<i>شما دسترسی لازم برای مشاهده راهنما را ندارید</i>",
"<i>شما مجاز نیستید</i>",
"<i>دسترسی لازم را ندارید</i>",
}
			local c = text[math.random(#text)]
			reply_msg(msg.id, c, ok_cb, false)

		elseif matches[1] == 'help' and is_owner(msg) then
			local name_log = user_print_name(msg.from)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /superhelp")
			return super_help()
		end

		if matches[1] == 'peer_id' and is_admin1(msg)then
			text = msg.to.peer_id
			reply_msg(msg.id, text, ok_cb, false)
			post_large_msg(receiver, text)
		end

		if matches[1] == 'msg.to.id' and is_admin1(msg) then
			text = msg.to.id
			reply_msg(msg.id, text, ok_cb, false)
			post_large_msg(receiver, text)
		end

		--Admin Join Service Message
		if msg.service then
		local action = msg.action.type
			if action == 'chat_add_user_link' then
				if is_owner2(msg.from.id) then
					local receiver = get_receiver(msg)
					local user = "user#id"..msg.from.id
					savelog(msg.to.id, name_log.." Admin ["..msg.from.id.."] joined the SuperGroup via link")
					channel_set_admin(receiver, user, ok_cb, false)
				end
				if is_support(msg.from.id) and not is_owner2(msg.from.id) then
					local receiver = get_receiver(msg)
					local user = "user#id"..msg.from.id
					savelog(msg.to.id, name_log.." Support member ["..msg.from.id.."] joined the SuperGroup")
					channel_set_mod(receiver, user, ok_cb, false)
				end
			end
			if action == 'chat_add_user' then
				if is_owner2(msg.action.user.id) then
					local receiver = get_receiver(msg)
					local user = "user#id"..msg.action.user.id
					savelog(msg.to.id, name_log.." Admin ["..msg.action.user.id.."] added to the SuperGroup by [ "..msg.from.id.." ]")
					channel_set_admin(receiver, user, ok_cb, false)
				end
				if is_support(msg.action.user.id) and not is_owner2(msg.action.user.id) then
					local receiver = get_receiver(msg)
					local user = "user#id"..msg.action.user.id
					savelog(msg.to.id, name_log.." Support member ["..msg.action.user.id.."] added to the SuperGroup by [ "..msg.from.id.." ]")
					channel_set_mod(receiver, user, ok_cb, false)
				end
			end
		end
		if matches[1] == 'msg.to.peer_id' then
			post_large_msg(receiver, msg.to.peer_id)
		end
	end
end

local function pre_process(msg)
  if not msg.text and msg.media then
    msg.text = '['..msg.media.type..']'
  end
  return msg
end

return {
  patterns = {
	"^[#!/]([Aa][Dd][Dd])$",
	"^[#!/]([Rr][Ee][Mm])$",
	"^[#!/]([Mm][Oo][Vv][Ee]) (.*)$",
	"^[#!/]([Rr][Ee][Ss][Ee][Tt] [Gg][Rr][Oo][Uu][Pp])$",
	"^[!/#]([Ww][Ee][Ll][Cc][Oo][Mm][Ee]) ([Oo][Nn])$",
	"^[!/#]([Ww][Ee][Ll][Cc][Oo][Mm][Ee]) ([Oo][Ff][Ff])$", 
	"^[!/#]([Ss][Ee][Tt][Ww][Ee][Ll][Cc][Oo][Mm][Ee]) (.*)$",
	"^[!/#]([d][Ee][Ll][Ee][t][Ee] [Ww][Ee][l][Cc][Oo][Mm][Ee])$",
	"^[#!/]([Ii][Nn][Ff][Oo][Gg][Rr][Oo][Uu][Pp])$",
	"^[#!/]([Aa][d][m][i][n][s])$",
	"^[#!/]([Oo][Ww][Nn][Ee][Rr])$",
	"^[#!/]([Oo][Ww][Nn][Ee][Rr] [Pp][Vv])$",
	"^[#!/]([Mm][Oo][Dd][Ll][Ii][Ss][Tt])$",
	"^[#!/]([Bb][Oo][Tt][Ss])$",
	"^[#!/]([Ww][Hh][Oo] [Ll][Ii][Ss][Tt])$",
	"^[#!/]([Ww][Hh][Oo] [Ff][Ii][Ll][Ee])$",
	"^[#!/]([Kk][Ii][Cc][Kk][Ee][Dd])$",
    "^[#!/]([Bb][Ll][Oo][Cc][Kk]) (.*)",
	"^[#!/]([Bb][Ll][Oo][Cc][Kk])",
	"^[#!/]([Tt][Oo][Ss][Uu][Pp][Ee][Rr])$",
	"^[#!/]([Ii][Dd])$",
	"^[#!/]([Ii][Dd]) (.*)$",
	"^[#!/]([Kk][Ii][Cc][Kk][Mm][Ee])$",
	"^[#!/]([Kk][Ii][Cc][Kk]) (.*)$",
	"^[#!/]([Nn][Ee][Ww][Ll][Ii][Nn][Kk])$",
	"^[#!/]([Ss][Ee][Tt][Ll][Ii][Nn][Kk])$",
	"^[#!/]([Ll][Ii][Nn][Kk])$",
	"^[#!/]([Ll][Ii][Nn][Kk] [Pp][Vv])$",
	"^[#!/]([Rr][Ee][Ss]) (.*)$",
	"^[#!/]([Ss][Ee][Tt][Aa][Dd][Mm][Ii][Nn]) (.*)$",
	"^[#!/]([Ss][Ee][Tt][Aa][Dd][Mm][Ii][Nn])",
	"^[#!/]([Dd][Ee][Mm][Oo][Tt][Ee][Aa][Dd][Mm][Ii][Nn]) (.*)$",
	"^[#!/]([Dd][Ee][Mm][Oo][Tt][Ee][Aa][Dd][Mm][Ii][Nn])",
	"^[#!/]([Ss][Ee][Tt][Oo][Ww][Nn][Ee][Rr]) (.*)$",
	"^[#!/]([Ss][Ee][Tt][Oo][Ww][Nn][Ee][Rr])$",
	"^[#!/]([Pp][Rr][Oo][Mm][Oo][Tt][Ee]) (.*)$",
	"^[#!/]([Pp][Rr][Oo][Mm][Oo][Tt][Ee])",
	"^[#!/]([Dd][Ee][Mm][Oo][Tt][Ee]) (.*)$",
	"^[#!/]([Dd][Ee][Mm][Oo][Tt][Ee])",
	"^[#!/]([Ss][Ee][Tt][Nn][Aa][Mm][Ee]) (.*)$",
	"^[#!/]([Ss][Ee][Tt][Aa][Bb][Oo][Uu][Tt]) (.*)$",
	"^[#!/]([Ss][Ee][Tt][Rr][Uu][Ll][Ee][Ss]) (.*)$",
	"^[#!/]([Ss][Ee][Tt][Pp][Hh][Oo][Tt][Oo])$",
	"^[#!/]([Ss][Ee][Tt][Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
	"^[#!/]([Dd][Ee][l])$",
	"^[#!/]([Ll][Oo][Cc][Kk]) (.*)$",
	"^[#!/]([Uu][Nn][Ll][Oo][Cc][Kk]) (.*)$",
	"^[#!/]([Mm][Uu][Tt][Ee]) ([^%s]+)$",
	"^[#!/]([Uu][Nn][Mm][Uu][Tt][Ee]) ([^%s]+)$",
	"^[#!/]([Mm][Uu][Tt][Ee][Uu][Ss][Ee][Rr])$",
	"^[#!/]([Mm][Uu][Tt][Ee][Uu][Ss][Ee][Rr]) (.*)$",
	"^[#!/]([Pp][Uu][Bb][Ll][Ii][Cc]) (.*)$",
	"^[#!/]([Ss][Ee][Tt][Tt][Ii][Nn][Gg][Ss])$",
	"^[#!/]([Ss][Ee][Tt][Tt][Ii][Nn][Gg][Ss] [Pp][Vv])$",
	"^[#!/]([Rr][Uu][Ll][Ee][Ss])",
	"^[#!/]([Nn][Ee][Rr][Kk][Hh])",
	"^(نرخ)$",
	"^[Bb][Oo][Tt]$",
	"^(ربات)$",
	"^[#!/]([Ss][Ee][Tt][Ff][Ll][Oo][Oo][Dd]) (%d+)$",
	"^[#!/]([Cc][Ll][Ee][Aa][Nn]) (.*)$",
	"^[#!/]([Hh][Ee][Ll][Pp])$",
	"^[#!/]([Mm][Uu][Tt][Ee][Ll][Ii][Ss][Tt])$",
    "[#!/]([Mm][Pp]) (.*)",
	"[#!/]([Mm][Dd]) (.*)",
    "^([https?://w]*.?telegram.me/joinchat/%S+)$",
	"%[(document)%]",
	"%[(photo)%]",
	"%[(video)%]",
	"%[(audio)%]",
	"%[(contact)%]",
	"^!!tgservice (.+)$",
  },
  run = run,
  pre_process = pre_process
}

--Our Channel: @Radicall_team
--By: @Erorr_Yes
