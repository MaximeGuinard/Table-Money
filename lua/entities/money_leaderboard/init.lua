include("shared.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

util.AddNetworkString("SendMoneyLeaderboard")

timer.Create("SendMoneyLeaderboard", 5, 0, function()
    local Leaderboard = MySQLite.query ([[SELECT * FROM darkrp_player ORDER BY wallet DESC LIMIT 20]])
    local Index = 2
    for i = 2, 20, 2 do
        table.remove(Leaderboard, Index)
        Index = Index + 1
    end
    net.Start("SendMoneyLeaderboard")
    net.WriteTable(Leaderboard)
    net.Broadcast()
end)

function ENT:Initialize()
   
    
    self:SetModel("models/hunter/plates/plate075x075.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)

    self:SetMaterial("Models/effects/vol_light001")

    local phys = self:GetPhysicsObject()

    if phys and IsValid(phys) then
        phys:Wake()
    end
    
end

function ENT:OnRemove()

end
