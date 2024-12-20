local Utils = {};

local function findProperty(property)
    for i, v in pairs(Utils.properties) do
        if i == property then
            return i;
        end
    end

    return nil;
end

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

return Utils;