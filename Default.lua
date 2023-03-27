local tbl = 
{--收藏品
	accept_collect = 
	{
		[0] = 
		{
			check_gp = false,
			func = "---collect accept\nif MadaoFish.wait_collect_items[self.id] then\n    if buffs[MadaoFish.buffs[\"Patience II\"]] then\n        local gp = Player.gp.current\n        if gp >= MadaoFish.skill_cost[\"Identical Cast\"] + MadaoFish.skill_cost[\"Powerful Hookset\"] - 25 then\n            return true\n        end\n    end\nelse\n\t\treturn true\nend\n",
			use = true,
		},
	},
	blank = 
	{
		[0] = 
		{
			use = false,
		},
	},
	--抛竿
	cast = 
	{
		[0] = 
		{
			use = false,
		},
		--以小钓大二
		[268] = 
		{
			auto = false,
			check_gp = false,
			func = "--mooch2\nreturn MadaoFish.Is_Fish_Mooch(self.id, self.last_fish_id or 0, self.fish_loc, true)",
			use = true,
		},
		--cn抛竿
		[289] = 
		{
			check_gp = false,
			func = "--fish cast\n--d(self.fish_loc)\nif MadaoFish.patience_items[self.id] then -- buffs[MadaoFish.buffs[\"Surface Slap\"]] then\n    if buffs[MadaoFish.buffs[\"Surface Slap\"]] and not buffs[MadaoFish.buffs[\"Patience II\"]] then\n        madao(\"Patient2 is not ready yet with surface slap? wierd\")\n        return false\n    end\n    if buffs[MadaoFish.buffs[\"Patience II\"]] then\n        if Player.gp.current > 35 then\n            return true\n        end\n    else\n        return true\n    end\nelseif buffs[MadaoFish.buffs[\"Patience II\"]] then\n    if Player.gp.current > 35 then\n        return true\n    end\nelse\n    return true\nend",
			use = true,
		},
		--以小钓大
		[297] = 
		{
			auto = false,
			check_gp = false,
			func = "--mooch\nreturn MadaoFish.Is_Fish_Mooch(self.id, self.last_fish_id or 0, self.fish_loc , false)",
			use = true,
		},
	},
	--改变位置
	change_location = 
	{
		[0] = 
		{
			use = false,
		},
	},
	--强心剂
	cordial = 
	{--强心剂
		[6141] = 
		{
			check_gp = false,
			func = "--- cordial\nif self.last_fish_id and self.last_fish_id > 0 and not Player:IsMoving() then\n    if MadaoFish.Is_Fish_Mooch(self.id, self.last_fish_id or 0, self.fish_loc, true) or\n            MadaoFish.Is_Fish_Mooch(self.id, self.last_fish_id or 0, self.fish_loc, false) then\n        return false\n    end\nend\nif MadaoFish.patience_items[self.id] and Player.gp.max > 560 + 200 then\n    if buffs[MadaoFish.buffs[\"Patience II\"]] and Player.gp.current + 300 < Player.gp.max then\n        return true\n    end\nelse\n    if Player.gp.current + 300 < Player.gp.max then\n        return true\n    end\nend",
			use = true,
		},
		--高级强心剂
		[12669] = 
		{
			check_gp = false,
			func = "---high cordial\nif MadaoFish.patience_items[self.id] and Player.gp.max > 560 + 200 then\n    if buffs[MadaoFish.buffs[\"Patience II\"]] and Player.gp.current + 400 < Player.gp.max or Player.gp.current < 250 then\n        return true\n    end\nelse\n    if Player.gp.current + 400 < Player.gp.max then\n        return true\n    end\nend",
			use = true,
		},
		--轻形强心剂
		[16911] = 
		{
			check_gp = false,
			func = "---water cordial\nif MadaoFish.patience_items[self.id] and Player.gp.max > 560 + 200 then\n    if buffs[MadaoFish.buffs[\"Patience II\"]] and Player.gp.current + 150 < Player.gp.max then\n        return true\n    end\nelse\n    if Player.gp.current + 150 < Player.gp.max then\n        return true\n    end\nend",
			use = true,
		},
		[1006141] = 
		{
			check_gp = false,
			func = "---hq cordial\nif MadaoFish.patience_items[self.id] and Player.gp.max > 560 + 200 then\n    if buffs[MadaoFish.buffs[\"Patience II\"]] and Player.gp.current + 350 < Player.gp.max then\n        return true\n    end\nelse\n    if Player.gp.current + 350 < Player.gp.max then\n        return true\n    end\nend",
			use = true,
		},
		[1016911] = 
		{
			check_gp = false,
			func = "---hq water cordial\nif MadaoFish.patience_items[self.id] and Player.gp.max > 560 + 200 then\n    if buffs[MadaoFish.buffs[\"Patience II\"]] and Player.gp.current + 200 < Player.gp.max then\n        return true\n    end\nelse\n    if Player.gp.current + 200 < Player.gp.max then\n        return true\n    end\nend",
			use = true,
		},
	},
	--钓鱼技能
	skill = 
	{
		[100] = 
		{
			use = false,
		},
		--以小钓大二
		[268] = 
		{
			use = false,
		},
		--双提
		[269] = 
		{
			check_gp = false,
			func = "---double hook\nif self.id == 30487 then\n    if self.bait_id == 27590 then\n        return true\n    end\nelseif self.id == 38935 then\n    --Jhinga / Versatile Lure\n    if Player.status == 36 and Player:GetBait() == 29717 then\n        if os.clock() - self.last_cast_time >= 20 then\n            return true\n        end\n    end\nelseif Settings.MadoaBase.bigMode ~= 2 and not self.collect and self.amount > 0 and not buffs[MadaoFish.buffs[\"Patience II\"]] then\n    MadaoFish.hit_status = { [36] = 1, [37] = 2, [38] = 3 }\n    local this_hook_str = MadaoFish.Get_HookStrength(self.id)\n    local yeild = MadaoFish.Get_DoublHookYeild(self.id)\n    local dr = MadaoFish.Get_HookDuration(self.id)\n    local slap = MadaoFish.Get_SurfaceSlap_Assigned(self.id)\n    local timepassed = os.clock() - self.last_cast_time\n    if yeild >= 2 then\n        if (dr == 0 or dr < timepassed) and (slap == 0 or buffs[MadaoFish.buffs[\"Surface Slap\"]]) then\n            local status = Player.status\n            local hkstr = MadaoFish.hit_status[status] or 99\n            if this_hook_str > 0 and hkstr == this_hook_str then\n                return true\n            end\n        elseif buffs[MadaoFish.buffs[\"Identical Cast\"]] then\n            return true\n        end\n    end\nend\n\n",
			use = true,
		},
		--提钩
		[296] = 
		{
			check_gp = false,
			func = "--hook\nif not buffs[MadaoFish.buffs[\"Patience II\"]] then\n    if buffs[MadaoFish.buffs[\"Surface Slap\"]] then\n        local status = Player.status\n        local this_hook_str = MadaoFish.Get_HookStrength(self.id)\n        local hkstr = MadaoFish.hit_status[status]\n        local dr = MadaoFish.Get_HookDuration(self.id)\n        local timepassed = os.clock() - self.last_cast_time\n        if hkstr == this_hook_str and (dr == 0 or dr < timepassed) then\n            return true\n        end\n    else\n        return true\n    end\nelse\n    madao(\"hook. patient buff is active\")\nend \n",
			use = true,
		},
		--中断
		[299] = 
		{
			check_gp = false,
			func = "---quit / fish skill\nif self.id == 30487 and self.bait_id and self.bait_id == 27590 then\n    if self.last_cast_time then\n        local time_sinse = os.clock() - self.last_cast_time\n\t\t\t\t\t\t\t\td(\"TimeSinse BlueCrab \"..time_sinse)\n        if time_sinse > 8 then\n            madao(\"quit casting, blue crab\")\n            return true\n        end\n    end\nend",
			use = true,
		},
		--钓组
		[4100] = 
		{
			check_gp = false,
			func = "--snagging\nif not buffs[MadaoFish.buffs[\"Snagging\"]] and MadaoFish.Is_Snagging(self.id) then\n    return true\nend\n",
			use = true,
		},
		--耐心
		[4102] = 
		{
			check_gp = false,
			func = "",
			use = false,
		},
		--强力提钩
		[4103] = 
		{
			auto = false,
			check_gp = false,
			func = "--powerful hook\nif buffs[MadaoFish.buffs[\"Patience II\"]] then\nd(\"checking powerful hook // patience 2 valid\")\n    local status = Player.status\n    local this_hook_str = MadaoFish.Get_HookStrength(self.id)\n    local hkstr = MadaoFish.hit_status[status]\n    if hkstr and hkstr >= 2 and hkstr == this_hook_str then\n        if not MadaoFish.Is_OppositeHook_Patient(self.id) then\n            return true\n        end\n    end\n    ---check mooch\n    if MadaoFish.Is_CurrentHookStr_Mooch(self.fish_loc, hkstr, self.id) then\n        return true\n    end\nend",
			use = true,
		},
		--撒饵
		[4104] = 
		{
			check_gp = false,
			func = "if Settings.MadaoBase.bigMode == 2 and not buffs[MadaoFish.buffs[\"Chum\"]] then\n    return true\nend",
			use = true,
		},
		--鱼眼
		[4105] = 
		{
			use = false,
		},
		--耐心二
		[4106] = 
		{
			check_gp = false,
			func = "--patience 2\n-- self.gp_current: possible gp usage >> when unspoil gather node task assigned\nif MadaoFish.Is_Fish_Mooch(self.id, self.last_fish_id or 0, self.fish_loc, true) or\n        MadaoFish.Is_Fish_Mooch(self.id, self.last_fish_id or 0, self.fish_loc, false) then\n    return false\nend\nif not buffs[MadaoFish.buffs[\"Patience II\"]] then\n    if MadaoFish.patience_items[self.id] then\n        if self.cordial then\n            if self.id == 27515 and buffs[MadaoFish.buffs[\"Surface Slap\"]] then\n                local gp = Player.gp.current\n                local ac = ActionList:Get(1, 1055)\n                local cd = ac.cdmax - ac.cd\n                if self.gp_current > 560 and cd == 0 then\n                    return true\n                end\n            end\n        end\n    elseif MadaoFish.Check_FishID_Has_Mooch(self.id, self.fish_loc) and Settings.MadaoBase.bigMode ~= 2 then\n        madao(\"patience2 check\")\n        ---check mooch 2 valid\n        local ac = ActionList:Get(1, 268)\n        if table.valid(ac) and ac.usable then\n            if (ac.cd > 0 and (ac.cdmax - ac.cd > 30)) then\n                madao(\"fish has mooch bait. mooch2 is invalid\")\n                return true\n            end\n            --            if ac.cd == 0 and MadaoFish.Is_Fish_Mooch(self.id, Player:GetLastCatchId(), self.fish_loc, true) then\n            --                madao(\"mooch2 is valid to cast for current fish. use patience2 \")\n            --                return true\n            --            end\n        end\n    end\nend",
			use = true,
		},
		--精准提钩
		[4179] = 
		{
			auto = false,
			check_gp = false,
			func = "--precision hook\nif buffs[MadaoFish.buffs[\"Patience II\"]] then\nd(\"checking precison hook // patience 2 valid\")\n    local status = Player.status\n    local this_hook_str = MadaoFish.Get_HookStrength(self.id)\n    local hkstr = MadaoFish.hit_status[status]\n    if hkstr and hkstr == 1 and hkstr == this_hook_str then\n        if not MadaoFish.Is_OppositeHook_Patient(self.id) then\n            return true\n        end\n    end\n    ---check mooch\n    if MadaoFish.Is_CurrentHookStr_Mooch(self.fish_loc, hkstr, self.id) then\n        return true\n    end\nend",
			use = true,
		},
		--拍击水面
		[4595] = 
		{
			check_gp = false,
			func = "--Surface Slap\nif not buffs[MadaoFish.buffs[\"Surface Slap\"]] then\n    if MadaoFish.surface_slap[self.id] == MadaoFish.Get_LastCatchId() then\n  madao(\"surface slap active / pre-assign\")\n        local ac = ActionList:Get(1, 1055)\n        local cd = ac.cdmax - ac.cd\n        if self.id == 27515 then\n            if self.gp_current > 560 + 200 and cd == 0 then\n                return true\n            end\n        end\n    else\n        local slap = MadaoFish.Get_SurfaceSlap_Assigned(self.id)\n        if slap > 0 and MadaoFish.Get_LastCatchId() == slap then\n            madao(\"surface slap active / from Database\")\n            return true\n        end\n    end\nend",
			use = true,
		},
		--专一垂钓
		[4596] = 
		{
			check_gp = false,
			func = "--\"Identical Cast\"\nif self.amount > 1 and not buffs[MadaoFish.buffs[\"Identical Cast\"]] and MadaoFish.Get_LastCatchId() == self.id then\n    --predator case shb\n    if self.id == 27515 then\n        if self.cordial and Player.gp.max > 560 + 200 then\n            if buffs[MadaoFish.buffs[\"Patience II\"]] then\n                return true\n            end\n        else\n            return true\n        end\n    else\n        if Player:GetLastCatchId() == self.id and self.last_casting_id ~= 289 then\n            if buffs[MadaoFish.buffs[\"Patience II\"]] then\n                if Player.gp.current > 350 + 35 then\n                    return true\n                end\n            else\n                return true\n            end\n        end\n    end\nend\n",
			use = true,
		},
		--刺鱼
		[7632] = 
		{
			check_gp = false,
			func = "---gig for veteran trade // gig slow fish for veteran trade\nif table.valid(spear_window_data) and table.valid(spear_window_data.fish_data)\n        and self.gp_current + 50 > Player.gp.max then\n    if spear_window_data.wariness < 200 then\n        local veteran_trade = MadaoFishSk.skill_list[\"Veteran Trade\"]\n        if not self.skill_timers[veteran_trade] then\n            for itemid, b in pairs(spear_window_data.fish_data) do\n                if b.gig_castable then\n                    if b.speed <= 200 then\n                        return true\n                    end\n                end\n            end\n        end\n    end\nend",
			use = true,
		},
		--熟练技巧刺鱼
		[7906] = 
		{
			check_gp = false,
			func = "---veteran trade test\nif table.valid(spear_window_data) and table.valid(spear_window_data.fish_data)\n        and Player.gp.current + 50 > Player.gp.max then\n    local target = Player:GetTarget()\n    if self.last_catch_id and self.last_catch_id > 0 and\n            not self.target_list_spear[self.last_catch_id] then\n        return true\n    end\nend",
			use = true,
		},
		--嘉惠
		[7909] = 
		{
			check_gp = false,
			func = "--get huge fish\nif table.valid(spear_window_data) and table.valid(spear_window_data.fish_data)\n        and self.gp_current > 100 then\n    if spear_window_data.wariness < 970 then\n        for itemid, b in pairs(spear_window_data.fish_data) do\n            if self.target_list_collect[itemid] then\n                local th1, th2\n                if b.speed >= 300 then\n                    th1, th2 = 850, 1000\n                else\n                    th1, th2 = 700, 800\n                end\n                if b.timeleft > th1 and b.timeleft < th2 then\n                    return true\n                end\n            end\n        end\n    end\nend",
			use = true,
		},
		--恩宠
		[26804] = 
		{
			check_gp = false,
			func = "---restore gp 150\nif Player.gp.current < 400 then\n    if self.tasktype == \"spear\" then\n        local target = Player:GetTarget()\n        if table.valid(target) then\n            ---self.shadow >> shadow mote active, shadowmote >> contentid 22\n            if not self.shadow or target.contentid == 22 then\n                local ch\n                for itemid, b in pairs(spear_window_data.fish_data) do\n                    if self.target_list_spear[self.last_catch_id] then\n                        ch = true\n                        break\n                    end\n                end\n                if not ch then\n                    return true\n                end\n            end\n        end\n    else\n        return true\n    end\nend",
			use = true,
		},
		--熟练渔技，强制以小钓大
		[26805] = 
		{
			use = false,
		},
		--大鱼捕手
		[26806] = 
		{
			use = false,
		},
		--精聚鱼眼
		[26870] = 
		{
			use = false,
		},
		--闭气
		[26871] = 
		{
			check_gp = false,
			func = "if table.valid(spear_window_data) and table.valid(spear_window_data.fish_data)\n        and self.gp_current > 300 then\n    local target = Player:GetTarget()\n    if table.valid(target) and target.contentid == 22 then\n        if spear_window_data.wariness > 300 then\n            return true\n        end\n    end\nend",
			use = true,
		},
		--电水流
		[26872] = 
		{
			check_gp = false,
			func = "if table.valid(spear_window_data) then\n    if spear_window_data.catch and spear_window_data.catch >= 10 then\n        local target = Player:GetTarget()\n        local targets\n        if table.valid(target) and target.contentid == 22 then\n            targets = self.shadow_target_list\n        else\n            targets = self.target_list_spear\n        end\n        if table.valid(spear_window_data.fish_data) then\n            local count = 0\n            for itemid, _ in pairs(spear_window_data.fish_data) do\n                if targets[itemid] then\n                    count = count + 1\n                end\n            end\n            if count >= 2 then\n                return true\n            end\n        end\n    end\nend",
			use = true,
		},
		--三提
		[27523] = 
		{
			check_gp = false,
			func = "---triple hook\nif self.id == 38935 then\n    --Jhinga / Versatile Lure\n    if Player.status == 36 and Player:GetBait() == 29717 then\n        if os.clock() - self.last_cast_time >= 20 then\n            return true\n        end\n    end\nend",
			use = true,
		},
	},
	spear_blank = 
	{
		[0] = 
		{
			use = false,
		},
	},
	--换鱼饵
	swap_bait = 
	{
		[0] = 
		{
			use = false,
		},
	},
}



return tbl
