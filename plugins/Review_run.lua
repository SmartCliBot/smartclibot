local function pre_process(msg)
if is_chat_msg(msg) or is_super_group(msg) then
    if msg and not is_whitelisted(msg.from.id) then 
	   if is_momod(msg) and not msg.service then return msg end
	local data = load_data(_config.moderation.data)
	local print_name = user_print_name(msg.from):gsub("‮", "") -- get rid of rtl in names
	local name_log = print_name:gsub("_", " ") -- name for log
	local to_chat = msg.to.type == 'chat'
	        if not data[tostring(msg.to.id)] then return msg end
	if data[tostring(msg.to.id)] and data[tostring(msg.to.id)]['settings'] then
		settings = data[tostring(msg.to.id)]['settings']
		end
	local link_flood = "kick"
	if data[tostring(msg.to.id)]['settings']['link_flood'] then
    	link_flood = data[tostring(msg.to.id)]['settings']['link_flood']
    end
	if settings.lock_arabic then
		lock_arabic = settings.lock_arabic
	else
		lock_arabic = 'no'
	end
	if settings.lock_rtl then
		lock_rtl = settings.lock_rtl
	else
		lock_rtl = 'no'
	end
		if settings.lock_tgservice then
		lock_tgservice = settings.lock_tgservice
	else
		lock_tgservice = 'no'
	end
	if settings.lock_link then
		lock_link = settings.lock_link
	else
		lock_link = 'no'
	end
	if settings.lock_member then
		lock_member = settings.lock_member
	else
		lock_member = 'no'
	end
	if settings.lock_spam then
		lock_spam = settings.lock_spam
	else
		lock_spam = 'no'
	end
	if settings.lock_sticker then
		lock_sticker = settings.lock_sticker
	else
		lock_sticker = 'no'
	end
	if settings.lock_contacts then
		lock_contacts = settings.lock_contacts
	else
		lock_contacts = 'no'
	end
	if settings.strict then
		strict = settings.strict
	else
		strict = 'no'
	end
	if settings.lock_fosh then
		lock_fosh = settings.lock_fosh
	else
	lock_fosh = 'no'
	end
	if settings.lock_suser then
		lock_suser = settings.lock_suser
	else
	lock_suser = 'no'
    end
	if settings.lock_slinks then
		lock_slinks = settings.lock_slinks
	else
	lock_slinks = 'no'
    end
	if settings.lock_smart then
		lock_smart = settings.lock_smart
	else
	lock_smart = 'no'
end
		if msg and not msg.service and is_muted(msg.to.id, 'All: yes') or is_muted_user(msg.to.id, msg.from.id) and not msg.service then
			delete_msg(msg.id, ok_cb, false)
			if to_chat then
			--	kick_user(msg.from.id, msg.to.id)
			end
		end
		if msg.text then -- msg.text checks
			local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
			 local _nl, real_digits = string.gsub(msg.text, '%d', '')
			if lock_spam == "yes" and string.len(msg.text) > 2049 or ctrl_chars > 40 or real_digits > 2000 then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					delete_msg(msg.id, ok_cb, false)
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
			local is_bot = msg.text:match("?[Ss][Tt][Aa][Rr][Tt]=")
			if is_link_msg and lock_link == "yes" and not is_bot then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
		if msg.service then 
			if lock_tgservice == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if to_chat then
					return
				end
			end
		end
			local is_squig_msg = msg.text:match("[\216-\219][\128-\191]")
			if is_squig_msg and lock_arabic == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local print_name = msg.from.print_name
			local is_rtl = print_name:match("‮") or msg.text:match("‮")
			if is_rtl and lock_rtl == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
	     ---------------lock_fosh----------------
				local is_fosh_msg = msg.text:match("کص") or msg.text:match("کیر") or msg.text:match("کون") or msg.text:match("تخم") or msg.text:match("خایه") or msg.text:match("ممه") or msg.text:match("کسکش") or msg.text:match("کس کش") or msg.text:match("كص") or msg.text:match("كیر") or msg.text:match("كون") or msg.text:match("كسكش") or msg.text:match("كس كش") or msg.text:match("گایید") or msg.text:match("سیک") or msg.text:match("سیك") or msg.text:match("کس ننت") or msg.text:match("كس ننت") or msg.text:match("کوس") or msg.text:match("كوس") or msg.text:match("كوص") or msg.text:match("کوص") or msg.text:match("ک.ی.ر") or msg.text:match("ک ی ر") or msg.text:match("ک.یر") or msg.text:match("ک و ن") or msg.text:match("سکس") or msg.text:match("سكس") or msg.text:match("کث") or msg.text:match("كث") or msg.text:match("کس مادر") or msg.text:match("كس مادر") or msg.text:match("مادر کسده") or msg.text:match("جند") or msg.text:match("مادرکسده") or msg.text:match("مادر كسده") or msg.text:match("کس لیس") or msg.text:match("بیناموس") or msg.text:match("بی ناموس") or msg.text:match("چونی") or msg.text:match("[Bb][Kk]") or msg.text:match("[Bb].[Kk]") or msg.text:match("[Bb][Kk]") or msg.text:match("[Bb] [Kk]") or msg.text:match("حروم زاد") or msg.text:match("بگام") or msg.text:match("پدر سگ") or msg.text:match("کست") or msg.text:match("كست") or msg.text:match("لاشی") or msg.text:match("ننه سگ") or msg.text:match("^گی$") or msg.text:match("^لز$") or msg.text:match("خارکصد") or msg.text:match("خار کصد") or msg.text:match("خاركصد") or msg.text:match("خار كصد") or msg.text:match("[F][U][C][K]") or msg.text:match("[Kk][Ii][Rr]") or msg.text:match("[Kk][Oo][Nn]") or msg.text:match("[Kk][Oo][Ss] [Nn][Aa][Nn][Aa][Tt]") or msg.text:match("[Kk][Oo][Ss][Nn][Aa][Nn][Aa][Tt]")
			if is_fosh_msg and lock_fosh == "yes" then
				local fosh_hash = 'fosh_user:'..msg.to.id..':'..msg.from.id
        redis:incr(fosh_hash)
        local fosh_redis = redis:get(fosh_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if not is_momod(msg) and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				 delete_msg(msg.id, ok_cb, false)
				end
          if strict == "yes" and not is_momod(msg)  and not msg.service then
					  delete_msg(msg.id, ok_cb, false)
					   delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
            local fosh_hash = 'fosh_user:'..msg.to.id..':'..msg.from.id
	          end
          end
		  ---------------lock_username----------------
		  		local is_suser_msg = msg.text:match("@")
			if is_suser_msg and lock_suser == "yes" then
				local suser_hash = 'suser_user:'..msg.to.id..':'..msg.from.id
        redis:incr(suser_hash)
        local suser_redis = redis:get(suser_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if not is_momod(msg) and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				end
          if strict == "yes" and not is_momod(msg)  and not msg.service then
					  delete_msg(msg.id, ok_cb, false)
					   delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
            local suser_hash = 'suser_user:'..msg.to.id..':'..msg.from.id
	          end
      end
      ----------------------lock_warnlin------------------------------
      				local is_slinks_msg = msg.text:match("[Hh][Tt][Tt][Pp][Ss][:][/][/]") or msg.text:match("[Hh][Tt][Tt][Pp][:][/][/]") or msg.text:match("[Ww][Ww][Ww][.]") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.text:match("[.][Cc][Oo][Mm]")  or msg.text:match("[.][Ii][Rr]") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.text:match("[Hh][Tt][Tt][Pp]") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]") or msg.text:match("https?://[%w-_%.%?%.:/%+=&]+%")
			if is_slinks_msg and lock_slinks == "yes" then 
				local slinks_hash = 'slinks_user:'..msg.to.id..':'..msg.from.id
        redis:incr(slinks_hash)
        local slinks_redis = redis:get(slinks_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if not is_momod(msg) and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				 kick_user(msg.from.id, msg.to.id)
			 send_msg(get_receiver(msg), 'کاربر ('..msg.from.first_name..')['..msg.from.id..'] به دلیل ارسال تبلیغات اخراج شد',ok_cb,false)
				end
          if strict == "yes" and not is_momod(msg)  and not msg.service then
					  delete_msg(msg.id, ok_cb, false)
					   delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
            local slinks_hash = 'slinks_user:'..msg.to.id..':'..msg.from.id
	          end
      end
      --------------------lock_smart------------------------------------
            		local is_smart_msg = msg.text:match("[Hh][Tt][Tt][Pp][Ss][:][/][/]") or msg.text:match("[Hh][Tt][Tt][Pp][:][/][/]") or msg.text:match("[Ww][Ww][Ww][.]") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.text:match("[.][Cc][Oo][Mm]")  or msg.text:match("[.][Ii][Rr]") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.text:match("[Hh][Tt][Tt][Pp]") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]") or msg.text:match("https?://[%w-_%.%?%.:/%+=&]+%") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://[Ii][Nn][Ss][Tt][Aa][Gg][Rr][Aa][Mm].[Cc][Oo][Mm]/") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://[Ww][Ww][Ww].[Ii][Nn][Ss][Tt][Aa][Gg][Rr][Aa][Mm].[Cc][Oo][Mm]/") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.text:match("?start=")
			if is_smart_msg and lock_smart == "yes" then 
				local smart_hash = 'smart_user:'..msg.to.id..':'..msg.from.id
        redis:incr(smart_hash)
        local smart_redis = redis:get(smart_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if not is_momod(msg) and not msg.service then
				delete_msg(msg.id, ok_cb, false)
               delete_msg(msg.id, ok_cb, false)
				end
          if strict == "yes" and not is_momod(msg)  and not msg.service then
					  delete_msg(msg.id, ok_cb, false)
					   delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
            local smart_hash = 'smart_user:'..msg.to.id..':'..msg.from.id
	          end
      end
      --------------------------------------------------------

			if is_muted(msg.to.id, "Text: yes") and msg.text and not msg.media and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
		end
		if msg.media then -- msg.media checks
			if msg.media.title then
				local is_link_title = msg.media.title:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.title:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_title and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_title = msg.media.title:match("[\216-\219][\128-\191]")
				if is_squig_title and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			if msg.media.description then
				local is_link_desc = msg.media.description:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.description:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_desc and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_desc = msg.media.description:match("[\216-\219][\128-\191]")
				if is_squig_desc and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			if msg.media.caption then -- msg.media.caption checks
				local is_link_caption = msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_caption and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_caption = msg.media.caption:match("[\216-\219][\128-\191]")
					if is_squig_caption and lock_arabic == "yes" then
						delete_msg(msg.id, ok_cb, false)
						if strict == "yes" or to_chat then
							kick_user(msg.from.id, msg.to.id)
						end
					end
				if lock_sticker == "yes" and msg.media.caption:match("sticker.webp") then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			if msg.media.type:match("contact") and lock_contacts == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_photo_caption =  msg.media.caption and msg.media.caption:match("photo")--".jpg",
			if is_muted(msg.to.id, 'Photo: yes') and msg.media.type:match("photo") or is_photo_caption and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					--	kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_gif_caption =  msg.media.caption and msg.media.caption:match(".mp4")
			if is_muted(msg.to.id, 'Gifs: yes') and is_gif_caption and msg.media.type:match("document") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					--	kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, 'Audio: yes') and msg.media.type:match("audio") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_video_caption = msg.media.caption and msg.media.caption:lower(".mp4","video")
			if  is_muted(msg.to.id, 'Video: yes') and msg.media.type:match("video") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, 'Documents: yes') and msg.media.type:match("document") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
		end
		if msg.fwd_from then
			if msg.fwd_from.title then
				local is_link_title = msg.fwd_from.title:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.fwd_from.title:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_title and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_title = msg.fwd_from.title:match("[\216-\219][\128-\191]")
				if is_squig_title and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			if is_muted_user(msg.to.id, msg.fwd_from.peer_id) then
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
			end
		end
		if msg.service then -- msg.service checks
		local action = msg.action.type
			if action == 'chat_add_user_link' then
				local user_id = msg.from.id
				local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
				if string.len(msg.from.print_name) > 70 or ctrl_chars > 40 and lock_group_spam == 'yes' then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] joined and Service Msg deleted (#spam name)")
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						savelog(msg.to.id, name_log.." ["..msg.from.id.."] joined and kicked (#spam name)")
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local print_name = msg.from.print_name
				local is_rtl_name = print_name:match("‮")
				if is_rtl_name and lock_rtl == "yes" then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] joined and kicked (#RTL char in name)")
					kick_user(user_id, msg.to.id)
				end
				if lock_member == 'yes' then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] joined and kicked (#lockmember)")
					kick_user(user_id, msg.to.id)
					delete_msg(msg.id, ok_cb, false)
				end
			end
			if action == 'chat_add_user' and not is_momod2(msg.from.id, msg.to.id) then
				local user_id = msg.action.user.id
				if string.len(msg.action.user.print_name) > 70 and lock_group_spam == 'yes' then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] added ["..user_id.."]: Service Msg deleted (#spam name)")
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						savelog(msg.to.id, name_log.." ["..msg.from.id.."] added ["..user_id.."]: added user kicked (#spam name) ")
						delete_msg(msg.id, ok_cb, false)
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local print_name = msg.action.user.print_name
				local is_rtl_name = print_name:match("‮")
				if is_rtl_name and lock_rtl == "yes" then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] added ["..user_id.."]: added user kicked (#RTL char in name)")
					kick_user(user_id, msg.to.id)
				end
				if msg.to.type == 'channel' and lock_member == 'yes' then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] added ["..user_id.."]: added user kicked  (#lockmember)")
					kick_user(user_id, msg.to.id)
					delete_msg(msg.id, ok_cb, false)
				end
			end
		end
	end
end

	return msg
end
--End pre_process function
return {
	patterns = {},
	pre_process = pre_process
}
