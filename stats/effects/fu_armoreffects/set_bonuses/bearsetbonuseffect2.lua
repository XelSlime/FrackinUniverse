require "/stats/effects/fu_armoreffects/setbonuses_common.lua"

weaponBonus={
	{stat = "critChance", amount = 4.5},
	{stat = "powerMultiplier", baseMultiplier = 1.25}
}

armorBonus={
	{stat = "iceStatusImmunity", amount = 1},
	{stat = "grit", amount = 0.3}
}

setName="fu_bearset2"

function init()
	setSEBonusInit(setName)
	weaponBonusHandle=effect.addStatModifierGroup({})
	checkWeapons()
	armorBonusHandle=effect.addStatModifierGroup(armorBonus)
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		checkWeapons()
	end
end

function checkArmor()
	effect.setStatModifierGroup( armorBonusHandle,setBonusMultiply(armorBonus,level))
end

function checkWeapons()
local weaponSword=weaponCheck({ "axe", "hammer", "broadsword", "spear" })

	if weaponSword["either"] then
		effect.setStatModifierGroup(weaponBonusHandle,weaponBonus)
	else
		effect.setStatModifierGroup(weaponBonusHandle,{})
	end
	
end