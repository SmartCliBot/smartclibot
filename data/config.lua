do local _ = {
  about_text = "",
  disabled_channels = {
    ["channel#id1057210089"] = false,
    ["channel#id1071384176"] = false,
    ["channel#id1092373280"] = false,
    ["channel#id1096812266"] = false
  },
  enabled_plugins = {
    "Review_run",
    "admin",
    "onservice",
    "inrealm",
    "ingroup",
    "inpm",
    "banhammer",
    "anti_spam",
    "set",
    "get",
    "invite",
    "all",
    "leave_ban",
    "smartgroup",
    "filter",
    "del_acc",
    "clean_member",
    "addsudo",
    "plugins",
    "time(smart)",
    "active",
    "on_off",
    "info",
    "lock_inline",
    "lock_fwd",
    "rank_hi",
    "join_rank",
    "rmsg(smart)",
    "sethelp",
    "expire(smart)",
    "join_pass",
    "analysis_messages",
  },
  help_text = "Commands list :\n\n!kick [username|id]\nYou can also do it by reply\n\n!ban [ username|id]\nYou can also do it by reply\n\n!unban [id]\nYou can also do it by reply\n\n!who\nMembers list\n\n!modlist\nModerators list\n\n!promote [username]\nPromote someone\n\n!demote [username]\nDemote someone\n\n!kickme\nWill kick user\n\n!about\nGroup description\n\n!setphoto\nSet and locks group photo\n\n!setname [name]\nSet group name\n\n!rules\nGroup rules\n\n!id\nreturn group id or user id\n\n!help\nReturns help text\n\n!lock [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict]\nLock group settings\n*rtl: Kick user if Right To Left Char. is in name*\n\n!unlock [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict]\nUnlock group settings\n*rtl: Kick user if Right To Left Char. is in name*\n\n!mute [all|audio|gifs|photo|video]\nmute group message types\n*If \"muted\" message type: user is kicked if message type is posted \n\n!unmute [all|audio|gifs|photo|video]\nUnmute group message types\n*If \"unmuted\" message type: user is not kicked if message type is posted \n\n!set rules <text>\nSet <text> as rules\n\n!set about <text>\nSet <text> as about\n\n!settings\nReturns group settings\n\n!muteslist\nReturns mutes for chat\n\n!muteuser [username]\nMute a user in chat\n*user is kicked if they talk\n*only owners can mute | mods and owners can unmute\n\n!mutelist\nReturns list of muted users in chat\n\n!newlink\ncreate/revoke your group link\n\n!link\nreturns group link\n\n!owner\nreturns group owner id\n\n!setowner [id]\nWill set id as owner\n\n!setflood [value]\nSet [value] as flood sensitivity\n\n!stats\nSimple message statistics\n\n!save [value] <text>\nSave <text> as [value]\n\n!get [value]\nReturns text of [value]\n\n!clean [modlist|rules|about]\nWill clear [modlist|rules|about] and set it to nil\n\n!res [username]\nreturns user id\n\"!res @username\"\n\n!log\nReturns group logs\n\n!banlist\nwill return group ban list\n\n**You can use \"#\", \"!\", or \"/\" to begin all commands\n\n\n*Only owner and mods can add bots in group\n\n\n*Only moderators and owner can use kick,ban,unban,newlink,link,setphoto,setname,lock,unlock,set rules,set about and settings commands\n\n*Only owner can use res,setowner,promote,demote and log commands\n\n",
  help_text_realm = "Realm Commands:\n\n!creategroup [Name]\nCreate a group\n\n!createrealm [Name]\nCreate a realm\n\n!setname [Name]\nSet realm name\n\n!setabout [group|sgroup] [GroupID] [Text]\nSet a group's about text\n\n!setrules [GroupID] [Text]\nSet a group's rules\n\n!lock [GroupID] [setting]\nLock a group's setting\n\n!unlock [GroupID] [setting]\nUnock a group's setting\n\n!settings [group|sgroup] [GroupID]\nSet settings for GroupID\n\n!wholist\nGet a list of members in group/realm\n\n!who\nGet a file of members in group/realm\n\n!type\nGet group type\n\n!kill chat [GroupID]\nKick all memebers and delete group\n\n!kill realm [RealmID]\nKick all members and delete realm\n\n!addadmin [id|username]\nPromote an admin by id OR username *Sudo only\n\n!removeadmin [id|username]\nDemote an admin by id OR username *Sudo only\n\n!list groups\nGet a list of all groups\n\n!list realms\nGet a list of all realms\n\n!support\nPromote user to support\n\n!-support\nDemote user from support\n\n!log\nGet a logfile of current group or realm\n\n!broadcast [text]\n!broadcast Hello !\nSend text to all groups\nOnly sudo users can run this command\n\n!bc [group_id] [text]\n!bc 123456789 Hello !\nThis command will send text to [group_id]\n\n\n**You can use \"#\", \"!\", or \"/\" to begin all commands\n\n\n*Only admins and sudo can add bots in group\n\n\n*Only admins and sudo can use kick,ban,unban,newlink,setphoto,setname,lock,unlock,set rules,set about and settings commands\n\n*Only admins and sudo can use res, setowner, commands\n",
  help_text_super = "",
  moderation = {
    data = "data/moderation.json"
  },
  sudo_users = {
    272970544
  }
}
return _
end