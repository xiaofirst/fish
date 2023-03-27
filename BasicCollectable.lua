local tbl = 
{
	accept_collect = 
	{
		[0] = 
		{
			check_gp = false,
			func = "return true",
			use = true,
		},
	},
	blank = 
	{
		[0] = 
		{
			check_gp = false,
			func = "self.TargetTug = nil",
			use = true,
		},
	},
	cast = 
	{
		[0] = 
		{
			use = false,
		},
		[268] = 
		{
			use = false,
		},
		[289] = 
		{
			check_gp = false,
			func = "return true",
			use = true,
		},
		[297] = 
		{
			use = false,
		},
	},
	change_location = 
	{
		[0] = 
		{
			use = false,
		},
	},
	cordial = 
	{
		[6141] = 
		{
			check_gp = false,
			func = "if Player.gp.current + 300 < Player.gp.max then\n\t\treturn true\nend",
			use = true,
		},
		[12669] = 
		{
			check_gp = false,
			func = "if Player.gp.current + 400 < Player.gp.max then\n\t\treturn true\nend",
			use = true,
		},
		[16911] = 
		{
			check_gp = false,
			func = "if Player.gp.current + 150 < Player.gp.max then\n\t\treturn true\nend",
			use = true,
		},
		[1006141] = 
		{
			check_gp = false,
			func = "if Player.gp.current + 350 < Player.gp.max then\n\t\treturn true\nend",
			use = true,
		},
		[1016911] = 
		{
			check_gp = false,
			func = "if Player.gp.current + 200 < Player.gp.max then\n\t\treturn true\nend",
			use = true,
		},
	},
	skill = 
	{
		[269] = 
		{
			use = false,
		},
		[296] = 
		{
			check_gp = false,
			func = "d(\"Basic Collectable Hook\")\nif self.TargetTug ~= nil then\n    return tug == self.TargetTug\nelse\n    return true\nend",
			use = true,
		},
		[299] = 
		{
			use = false,
		},
		[4100] = 
		{
			use = false,
		},
		[4102] = 
		{
			use = false,
		},
		[4103] = 
		{
			check_gp = false,
			func = "d(\"Basic Precision Hookset\")\nlocal isUnderPatience = false\nfor _, buff in pairs(Player.buffs) do\n    if buff.id == 764 then\n        isUnderPatience = true\n    end\nend\nif not isUnderPatience then\n    return false\nend\nlocal status = Player.status\nlocal hitStatus = {\n    [36] = 1,\n    [37] = 2,\n    [38] = 3\n}\nlocal tug = hitStatus[status] or 0\nd(\"Baisc Collectable Tug = \" .. tug)\nif self.TargetTug ~= nil then\n    return tug == self.TargetTug\nelse\n    return tug == 2 or tug == 3\nend",
			use = true,
		},
		[4104] = 
		{
			use = false,
		},
		[4105] = 
		{
			use = false,
		},
		[4106] = 
		{
			check_gp = false,
			func = "d(\"Basic Collectable PatienceII\")\nreturn true",
			use = true,
		},
		[4179] = 
		{
			check_gp = false,
			func = "d(\"Basic Precision Hookset\")\nlocal isUnderPatience = false\nfor _, buff in pairs(Player.buffs) do\n    if buff.id == 764 then\n        isUnderPatience = true\n    end\nend\nif not isUnderPatience then\n    return false\nend\nlocal status = Player.status\nlocal hitStatus = {\n    [36] = 1,\n    [37] = 2,\n    [38] = 3\n}\nlocal tug = hitStatus[status] or 0\nd(\"Baisc Collectable Tug = \" .. tug)\nif self.TargetTug ~= nil then\n    return tug == self.TargetTug\nelse\n    return tug == 1\nend",
			use = true,
		},
		[4595] = 
		{
			use = false,
		},
		[4596] = 
		{
			use = false,
		},
		[26804] = 
		{
			check_gp = false,
			func = "d(\"Basic Collectable Thaliak's Favor\")\nif Player.gp.max - Player.gp.current < 150 then\n    return false\nend\n\nlocal artStacks = 0\nlocal buffs = Player.buffs\nfor _, v in pairs(buffs) do\n   \tif v.id == 2778 then\n     \t  artStacks = v.stacks\n    end\nend\n\nif artStacks >= 3 then\n\t\treturn true\nend\n",
			use = true,
		},
		[26805] = 
		{
			use = false,
		},
		[26806] = 
		{
			use = false,
		},
		[27523] = 
		{
			use = false,
		},
	},
	swap_bait = 
	{
		[0] = 
		{
			use = false,
		},
	},
}



return tbl