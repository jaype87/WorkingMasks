local MaskEfficiency = 0
local prevSicknessLevel = -1

local MaskEfficiencyTable = {
    -- Vanilla
    ["Base.Hat_DustMask"] = 0.5,                            -- Dust Mask
    ["Base.Hat_GasMask"] = 1.0,                             -- Gas Mask
    ["Base.Hat_NBCmask"] = 1.0,                             -- Nuclear Biochemical Mask
    ["Base.Hat_SurgicalMask_Blue"] = 0.5,                   -- Medical Mask
    ["Base.Hat_SurgicalMask_Green"] = 0.5,                  -- Medical Mask
    ["Base.Hat_BandanaMaskTINT"] = 0.25,                    -- Bandana (Face)
    ["Base.Hat_BandanaMask"] = 0.25,                        -- Bandana (Face)
    -- Authentic Z
    ["AuthenticZClothing.Hat_BandanaMaskDesert"] = 0.25,    -- Desert Bandana (Face)
    ["AuthenticZClothing.Hat_BandanaMaskRed"] = 0.25,       -- Red Bandana (Face),
    ["AuthenticZClothing.Hat_GasMask"] = 1.0,               -- Gas Mask
    ["AuthenticZClothing.CEDAHazmatSuit"] = 1.0,            -- Green CEDA Hazmat Suit
    ["AuthenticZClothing.CEDAHazmatSuitBlack"] = 1.0,       -- Black CEDA Hazmat Suit
    ["AuthenticZClothing.CEDAHazmatSuitBlue"] = 1.0,        -- Blue CEDA Hazmat Suit
    ["AuthenticZClothing.CEDAHazmatSuitRed"] = 1.0,         -- Red CEDA Hazmat Suit
    ["AuthenticZClothing.HazmatSuit2"] = 1.0,               -- Hazmat Suit
    ["AuthenticZBackpacks+.Hat_GasMask"] = 1.0,             -- Gas Mask
    -- Shark and Peach's Military Uniform Improvements
    ["SMUIClothing.Hat_M17"] = 1.0,                         -- M17 Gas Mask
    ["SMUIClothing.Hat_M40"] = 1.0,                         -- M40 Gas Mask
    ["SMUIClothing.Hat_Shemagh"] = 0.25,                    -- Shemagh
    ["SMUIClothing.Hat_ShemaghWoodland"] = 0.25,            -- Woodland Pattern Shemagh
    ["SMUIClothing.Hat_ShemaghDesert"] = 0.25,              -- Desert Pattern Shemagh
    ["SMUIClothing.Hat_M17Doff"] = 1.0,                     -- M17 w/ Doff Hood
    ["SMUIClothing.Hat_M40Doff"] = 1.0,                     -- M40 w/ Doff Hood
    ["SMUIClothing.Hat_MarkIV"] = 1.0,                      -- Mark IV Gas Mask,
    ["SMUIClothing.Hat_M9"] = 1.0,                          -- M9 Gas Mask
    ["SMUIClothing.Mask_ExtremeColdWeather"] = 0.25,        -- Extreme Cold Weather Mask
    -- Shark's Law Enforcement Overhaul
    ["SLEOClothing.Hat_PoliceBalaclava"] = 0.25,            -- Police Balaclava
    ["SLEOClothing.Hat_PoliceM17"] = 1.0,                   -- M17 Gas Mask
    -- Britas Armor
    ["Base.Hat_MCU_GasMask"] = 1.0,                         -- MCU 2/P Gas Mask
    ["Base.Hat_M45_GasMask"] = 1.0,                         -- M45 Gas Mask
    ["Base.Hat_M50"] = 1.0,                                 -- Avon Protection M50 Gas Mask
    ["Base.Hat_FM53"] = 1.0,                                -- Avon Protection FM53 Gas Mask
    ["Base.Hat_MSA_Gas_Mask"] = 1.0,                        -- MSA Millennium Gas Mask
    ["Base.Hat_MSA_Gas_Mask_AMP"] = 1.0,                    -- MSA Millennium Gas Mask w/ VPU
    ["Base.Bag_Shemagh_Half"] = 0.25,                       -- Half Balaclava Mask
    ["Base.K1_Gasmask"] = 1.0,
    ["Base.K1_Half"] = 1.0,
    ["Base.K1_Hood"] = 1.0,
    ["Base.PMK1_Gasmask"] = 1.0,
    ["Base.PMK1_Half"] = 1.0,
    ["Base.PMK2_Gasmask"] = 1.0,
    ["Base.PMK2_Half"] = 1.0,
    ["Base.S10_Gasmask"] = 1.0,
    ["Base.S10_Gasmask_Set"] = 1.0,
    ["Base.GP4U_Gasmask"] = 1.0,
    ["Base.MM1_Gasmask"] = 1.0,
    ["Base.SHMS_Gasmask"] = 1.0,
    ["Base.SHMS_Gasmask_Set"] = 1.0,
    ["Base.GP5M_Gasmask"] = 1.0,
    ["Base.PMG_Gasmask"] = 1.0,
    ["Base.GM15_Gasmask"] = 1.0,
    ["Base.GM17_Gasmask"] = 1.0,
    -- Swatpack
    ["Base.Hat_SwatGasMask"] = 1.0,                         -- Swat Gas Mask
    ["Base.Hat_Balaclava_Swat"] = 0.25,                     -- Balaclava Swat
    -- ADVANCED GEAR
    ["Base.SniperVeil"] = 0.25,                             -- SniperVeil
    -- Paw Low Loot
    ["Base.HECU Gas Mask"] = 1.0,                           -- HECU Gas Mask
    ["Base.BalaTight"] = 0.25,                              -- Tight Balaclava
    ["Base.BalaTight2"] = 0.25,                             -- Tight Balaclava (Open)
    ["Base.RogueMask"] = 1.0,                               -- Rogue Gas Mask
    -- Undead Survivor
    ["UndeadSurvivor.StalkerMask"] = 1.0,                   -- Stalker Mask
    ["UndeadSurvivor.PrepperMask"] = 1.0,                   -- Prepper Gasmask
    ["UndeadSurvivor.NomadMask"] = 0.25,                    -- Nomad Mask
    ["UndeadSurvivor.OminousNomadMask"] = 0.25,             -- Ominous Nomad Mask
    ["UndeadSurvivor.HeadhunterGasmask"] = 1.0,             -- Headhunter Gasmask
    ["UndeadSurvivor.DeadlyHeadhunterGasmask"] = 1.0,             -- DeadlyHeadhunterGasmask
    -- Scrap Armor
    ["Base.Hat_Rebreather"] = 1.0,                          -- Rebreather
    -- They Knew
    ["TheyKnew.MysteriousHazmat"] = 1.0,                    -- Mysterious NBC Suit
    -- Toxic Fog
    ["Base.Hat_GasMask_Improvised"] = 1.0,                  -- Improvised Gas Mask
    -- Stalker Armor Pack
    ["Base.GP5GasMask"] = 1.0,
    ["Base.M40GasMask"] = 1.0,
    ["Base.PPM88"] = 1.0,
    ["Base.GP10Z"] = 1.0,
    ["Base.SovietPMG"] = 1.0,
    ["Base.CS2aGasMask"] = 1.0,
    ["Base.PBF1"] = 1.0,
    ["Base.PBF1CS"] = 1.0,
    ["Base.PBF1Duty"] = 1.0,
    ["Base.PBF1Freedom"] = 1.0,
    ["Base.PBF2"] = 1.0,
    ["Base.PBF2CS"] = 1.0,
    ["Base.PBF2Duty"] = 1.0,
    ["Base.PBF2Freedom"] = 1.0,
    ["Base.RespiratorGold"] = 1.0,
    ["Base.RespiratorSilver"] = 1.0,
    ["Base.RespiratorCS"] = 1.0,
    ["Base.RespiratorFreedom"] = 1.0,
    ["Base.RespiratorDuty"] = 1.0,
    ["Base.RespiratorMonolith"] = 1.0,
    -- Asura Chi
    ["AsuraChi.chiGasMask"] = 1.0,
    -- slyy's Spicy Attire
    ["slyyAttire.slyyHat_PlagueDocMask"] = 0.25,
    -- Insurgent - Black Ops Profession
    ["Insurgent.Hat_GasMaskInsurgent"] = 1.0,
}


local function setEfficiencyForItem(maskItem)
    local type = maskItem:getFullType()
    local maskEfficiencyRaw = 0
    if MaskEfficiencyTable[type] ~= nil  then
        MaskEfficiency = MaskEfficiencyTable[type] * maskItem:getCondition() / maskItem:getConditionMax()
    else
--[[        local tags = ScriptManager.instance:getItem(type):getTags()
        for i=0,tags:size() do
            local tag = tags:get(i)
            if tag == "GasMask" or tag == "HazmatSuit" then
                MaskEfficiency = 1
                return
            end
        end]]
        MaskEfficiency = 0
    end
end

local function UpdateMaskEfficiency(player)
    local wornItems = player:getWornItems()
    local maskItem = wornItems:getItem("Mask")
    if maskItem then
        setEfficiencyForItem(maskItem)
    else
        maskItem = wornItems:getItem("MaskEyes")
        if maskItem then
            setEfficiencyForItem(maskItem)
        else
            maskItem = wornItems:getItem("MaskFull")
            if maskItem then
                setEfficiencyForItem(maskItem)
            else
                maskItem = wornItems:getItem("FullHat")
                if maskItem then
                    setEfficiencyForItem(maskItem)
                else
                    maskItem = wornItems:getItem("FullSuitHead")
                    if maskItem then
                        setEfficiencyForItem(maskItem)
                    else
                        maskItem = wornItems:getItem("Scarf")
                        if maskItem then
                            setEfficiencyForItem(maskItem)
                        else
                            MaskEfficiency = 0
                        end
                    end
                end
            end
        end
    end
end


local function ApplyMaskEfficiency(player)
    local bodyDamage = player:getBodyDamage()
	if prevSicknessLevel < 0.0 then --get initial value
		prevSicknessLevel = bodyDamage:getFoodSicknessLevel()
	end
    local currentSickness = bodyDamage:getFoodSicknessLevel()
    if MaskEfficiency > 0.0 and currentSickness > 0.0 then
        local newSickness = currentSickness
        local gameTimeMultiplier = GameTime.getInstance():getMultiplier()
        local deltaSicknessLevel = currentSickness - prevSicknessLevel
        local poisonLevel = bodyDamage:getPoisonLevel()
        if deltaSicknessLevel > 0 then
            -- we cannot get the number of corpses, because that value is not exposed in lua, so we calculate it backwards ourselves
            local sicknessFromCorpses
            if poisonLevel > 0.0 then --use different formula if poisoned
                --original formula for 41.65
                sicknessFromCorpses = deltaSicknessLevel - ((bodyDamage:getInfectionGrowthRate() * (2 + Math.round(bodyDamage:getPoisonLevel() / 10.0))) * gameTimeMultiplier)
            else
                sicknessFromCorpses = deltaSicknessLevel
            end
            local sicknessFromCorpseRate = BodyDamage.getSicknessFromCorpsesRate(6) -- Damage is calculated for any corpse above 5
            local estimatedCorpses = sicknessFromCorpses / sicknessFromCorpseRate / gameTimeMultiplier
            local sicknessFromCorpsesAdjusted = Math.min(Math.ceil(estimatedCorpses), 20) * sicknessFromCorpseRate * gameTimeMultiplier-- capped at 20 corpses
            if sicknessFromCorpses > 0 then
                newSickness = newSickness - (sicknessFromCorpsesAdjusted * MaskEfficiency)
            end
        end
        if newSickness < 0 then
            newSickness = 0
        end
        bodyDamage:setFoodSicknessLevel(newSickness);
        prevSicknessLevel = newSickness
    else
        prevSicknessLevel = currentSickness
    end
end

local function OnCreatePlayer(playerIndex, player)
    if (playerIndex == 0) then
        UpdateMaskEfficiency(player)
    end
end

Events.OnClothingUpdated.Add(UpdateMaskEfficiency)
Events.OnPlayerUpdate.Add(ApplyMaskEfficiency)
Events.OnCreatePlayer.Add(OnCreatePlayer)