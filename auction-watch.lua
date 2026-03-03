local state = {

}

local frame = CreateFrame("Frame", "AuctionWatchFrame", UIParent)
frame:SetWidth(160)
frame:SetHeight(58)
frame:SetPoint("CENTER", UIParent, "CENTER", 0, 170)
frame:SetBackdrop({
  bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
  tile = true,
  tileSize = 16,
  edgeSize = 12,
  insets = { left = 3, right = 3, top = 3, bottom = 3 }
})
frame:SetBackdropColor(0.08, 0.08, 0.08, 0.9)
frame:EnableMouse(true)
frame:SetMovable(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", function()
  this:StartMoving()
end)
frame:SetScript("OnDragStop", function()
  this:StopMovingOrSizing()
end)

local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("TOP", frame, "TOP", 0, -8)
title:SetText("Auction Watch")

local acwText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
acwText:SetPoint("CENTER", frame, "CENTER", 0, -6)
acwText:SetText("0.00 yd/s")

local hintText = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
hintText:SetPoint("BOTTOM", frame, "BOTTOM", 0, 6)
hintText:SetText("/acw to toggle")


local function updateText()
  acwText:SetText("todo")
end

frame:SetScript("OnUpdate", function(self, elapsed)
  updateText()
end)

SLASH_AUCTIONWATCH1 = "/acw"
SlashCmdList["AUCTIONWATCH"] = function()
  if frame:IsShown() then
    frame:Hide()
  else
    frame:Show()
  end
end

-- frame:RegisterEvent("PLAYER_ENTERING_WORLD")
-- frame:SetScript("OnEvent", function()
  -- updateText(UPDATE_INTERVAL)
-- end)
