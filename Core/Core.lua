-----------------------------------------------------------------------
-- Core
-----------------------------------------------------------------------
local _G = getfenv(0)

local UnitFactionGroup = _G.UnitFactionGroup
local factionGroup = UnitFactionGroup("player")
local C_AddOns = _G.C_AddOns
local GetAddOnInfo = C_AddOns.GetAddOnInfo
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local AceDB = LibStub("AceDB-3.0")
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")
local addon = LibStub("AceAddon-3.0"):NewAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

addon.Name = FOLDER_NAME
local _, locname, notes = GetAddOnInfo(addon.Name)
addon.LocName = locname
addon.Notes = notes


local function copy_faction_tables(faction)
	for k, v in pairs(private[faction].maps) do
		private.data.maps[k] = v
	end
	for k, v in pairs(private[faction].coords) do
		private.data.coords[k] = v
	end
end

-- //////////////////////////////////////////////////////////////////////////
function addon:OnInitialize()
	self.db = AceDB:New(private.addon_name.."DB", private.constants.defaults, true)
	
	private.db = self.db.profile

	self.db.RegisterCallback(self, "OnProfileChanged", "Refresh")
	self.db.RegisterCallback(self, "OnProfileCopied", "Refresh")
	self.db.RegisterCallback(self, "OnProfileReset", "Refresh")
	
	Atlas:RegisterModuleOptions(addon.Name, private.config.options, addon.LocName)
	--self:SetupOptions()

	if (private.db.all_faction or factionGroup == "Alliance") then
		copy_faction_tables("alliance")
	end
	if (private.db.all_faction or factionGroup == "Horde") then
		copy_faction_tables("horde")
	end
end


function addon:OnEnable()
	Atlas:RegisterPlugin(private.addon_name, L[private.category], private.data.maps, private.data.coords)
end

function addon:Refresh()

end