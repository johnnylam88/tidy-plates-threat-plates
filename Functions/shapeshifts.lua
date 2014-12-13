local _, ns = ...
local t = ns.ThreatPlates

local class = t.Class()
local AuraType = {
	DEATHKNIGHT = "presences",
	DRUID = "shapeshifts",
	MONK = "monk_stances",
	WARRIOR = "stances",
}
local function ShapeshiftUpdate()
	local db = TidyPlatesThreat.db.char[AuraType[class]]	
	if db.ON then
		local k = GetShapeshiftForm()
		local spellID = (k > 0) and select(5, GetShapeshiftFormInfo(k)) or 0
		TidyPlatesThreat.db.char.spec[t.Active()] = db[spellID]
		t.Update()
	end
end

TidyPlatesThreat.ShapeshiftUpdate = ShapeshiftUpdate