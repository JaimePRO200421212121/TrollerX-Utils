local Utils = {};

local function findProperty(property)
    for i, v in pairs(Utils.properties) do
        if i == property then
            return i;
        end
    end

    return nil;
end

Utils.services = {
    ["CoreGui"] = game:GetService("CoreGui"),
    ["Players"] = game:GetService("Players"),
    ["TextService"] = game:GetService("TextService"),
    ["UserInputService"] = game:GetService("UserInputService"),
    ["TweenService"] = game:GetService("TweenService"),
    ["HttpService"] = game:GetService("HttpService"),
    ["MarketplaceService"] = game:GetService("MarketplaceService"),
    ["RunService"] = game:GetService("RunService"),
    ["TeleportService"] = game:GetService("TeleportService"),
    ["StarterGui"] = game:GetService("StarterGui"),
    ["GuiService"] = game:GetService("GuiService"),
    ["Lighting"] = game:GetService("Lighting"),
    ["ContextActionService"] = game:GetService("ContextActionService"),
    ["NetworkClient"] = game:GetService("NetworkClient"),
    ["ReplicatedStorage"] = game:GetService("ReplicatedStorage"),
    ["GroupService"] = game:GetService("GroupService"),
    ["PathService"] = game:GetService("PathfindingService"),
    ["SoundService"] = game:GetService("SoundService"),
    ["Teams"] = game:GetService("Teams"),
    ["StarterPlayer"] = game:GetService("StarterPlayer"),
    ["InsertService"] = game:GetService("InsertService"),
    ["ChatService"] = game:GetService("Chat"),
    ["ProximityPromptService"] = game:GetService("ProximityPromptService"),
    ["StatsService"] = game:GetService("Stats"),
    ["MaterialService"] = game:GetService("MaterialService"),
    ["AvatarEditorService"] = game:GetService("AvatarEditorService"),
    ["TextChatService"] = game:GetService("TextChatService"),
    ["VirtualUser"] = game:GetService("VirtualUser")
};

Utils.properties = {
    ["NoClip"] = false,
    ["Float"] = false,
    ["Fly"] = false
};

Utils.bindFunctions = {
    ["NoClipping"] = nil,
    ["Floating"] = nil,
    ["Flying"] = nil
};

function Utils:enable(property)
    local p = findProperty(property);

    if p ~= nil then
        Utils.properties[p] = true;
        Utils.enableFunctions[p]();
    end
end

function Utils:disable(property)
    local p = findProperty(property);

    if p ~= nil then
        Utils.properties[p] = false;
        Utils.disableFunctions[p]();
    end
end

function Utils:NoClip(player)
    Utils:enable("NoClip");
    wait(0.1)
    local function NoClipLoop(plr)
        local plr = player;

        if Utils.properties["NoClip"] == true and plr.Character ~= nil then
            for _, child in pairs(plr.Character:GetDescendants()) do
                if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= "TrollerPart" then
                    child.CanCollide = false;
                end
            end
        end
    end

    Utils:bind(NoClipLoop, "NoClipping");

    Utils.services.RunService.Stepped:Connect(NoClipLoop);
end

return Utils;
