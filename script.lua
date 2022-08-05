function getstorage(itemm)
for a, b in pairs(game:GetService("Workspace").DinerPlaceHolder.Storages:GetChildren()) do
    if b.Name == itemm then
        local e = {string.gsub(b.ObjQuantity.Value.Text, "x", "")}
        return tonumber(e[1])
    end
end
end
function addtoplate(ing, plate)
local storage = getstorage(ing)
    if storage <= 0 and (not string.find(ing, "Cooked")) then
        local args = {
            [1] = "Ingredient",
            [2] = {
                ["Ingredient_Name"] = ing
            }
        }
    game:GetService("ReplicatedStorage").Remotes.Purchase:InvokeServer(unpack(args))
    elseif storage <= 0 and (string.find(ing, "Cooked")) then
        local f = {string.gsub(ing, "Cooked", "Uncooked")}
        local storage2 = getstorage(f[1])
        if storage2 <= 0 then
                local args = {
            [1] = "Ingredient",
            [2] = {
                ["Ingredient_Name"] = f[1]
            }
        }
    game:GetService("ReplicatedStorage").Remotes.Purchase:InvokeServer(unpack(args))
        end
            local args = {
        [1] = "AcquireIngredient",
        [2] = {
            ["Storage"] = true,
            ["Ingredient"] = f[1]
        }
    }
    game:GetService("ReplicatedStorage").Remotes.Cook:InvokeServer(unpack(args))
    task.wait(0.5)
    local args = {
    [1] = "CookIngredient",
    [2] = {
        ["Target"] = workspace.DinerPlaceHolder.Stations.SmallGrill.Connectables.Grill_Prepart,
        ["CFrame"] = CFrame.new(Vector3.new(206.7144317626953, 5.657492160797119, -101.46929168701172), Vector3.new(-0, -0, -1)),
        ["Station"] = workspace.DinerPlaceHolder.Stations.SmallGrill,
        ["Ingredient"] = f[1]
    }
}

game:GetService("ReplicatedStorage").Remotes.Cook:InvokeServer(unpack(args))
repeat task.wait() until game:GetService("Workspace").DinerPlaceHolder.Temporary:FindFirstChild(ing)
local args = {
    [1] = "GrabIngredient",
    [2] = {
        ["Ingredient"] = ing,
        ["Object"] = workspace.DinerPlaceHolder.Temporary:FindFirstChild(ing),
        ["SendToPlayer"] = false
    }
}

game:GetService("ReplicatedStorage").Remotes.Cook:InvokeServer(unpack(args))
local args = {
    [1] = "PlaceIngredient",
    [2] = {
        ["Ingredient"] = ing,
        ["Plate"] = plate
    }
    }
game:GetService("ReplicatedStorage").Remotes.Cook:InvokeServer(unpack(args))
return
    end
    local args = {
        [1] = "AcquireIngredient",
        [2] = {
            ["Storage"] = true,
            ["Ingredient"] = ing
        }
    }
    game:GetService("ReplicatedStorage").Remotes.Cook:InvokeServer(unpack(args))
    local args = {
    [1] = "PlaceIngredient",
    [2] = {
        ["Ingredient"] = ing,
        ["Plate"] = plate
    }
    }
    game:GetService("ReplicatedStorage").Remotes.Cook:InvokeServer(unpack(args))

end
function getifhasdish(sittable)
    local g = {}
    for s, t in pairs(game:GetService("Workspace").DishesToWorkWith:GetChildren()) do table.insert(g, t.Name) end
    local amogus = false
    for e, f in pairs(sittable:GetChildren()) do
        if table.find(g, f.Name) and typeof(amogus) ~= "table" then amogus = {f, true} end
    end
    if typeof(amogus) == "table" then return unpack(amogus) end
    return amogus
end
while on and task.wait() do
for _, v in pairs(game:GetService("Workspace").DinerPlaceHolder.Sittables:GetChildren()) do
    if getifhasdish(v) and v:FindFirstChild("Table") and v:FindFirstChild("Table"):FindFirstChild("Attachment"):FindFirstChild("Take Order") then
    local mom = true
    if v:FindFirstChild("Served_Wait_To_Destroy") then
        if v:FindFirstChild("Served_Wait_To_Destroy").Value == getifhasdish(v).Value then
            mom = false
        end
    end
    if mom == false then return end
    local chr = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local hrp = chr:WaitForChild("HumanoidRootPart")
    hrp.CFrame = v:FindFirstChild("Table").CFrame
    task.wait(0.5)
    fireproximityprompt(v:FindFirstChild("Table"):FindFirstChild("Attachment"):FindFirstChild("Take Order"))
    task.wait(0.5)
    hrp.CFrame = CFrame.new(200.054306, 6.15326071, -97.0426636, 0.999997139, -2.80691097e-08, 0.00240109209, 2.80770749e-08, 1, -3.28348504e-09, -0.00240109209, 3.35089134e-09, 0.999997139)
    task.wait(0.5)
    local item = getifhasdish(v).Name
    local plate = game:GetService("ReplicatedStorage").Remotes.ChangeMenu:InvokeServer(item, "CreatePlate")
    task.wait()
    local args = {
        [1] = {
            ["PlateShelf"] = workspace.DinerPlaceHolder.PlateShelves.PlateShelf,
            ["Position"] = Vector3.new(200, 6.333000183105469, -101)
        }
    }
    game:GetService("ReplicatedStorage").Remotes.Plating:InvokeServer(unpack(args))
    task.wait(2)
    pcall(function()
    if (not plate:FindFirstChild("PlatePlaceHolder") and plate:FindFirstChild("PlatePlaceHolder"):FindFirstChild("RequiredAtt") and plate:FindFirstChild("PlatePlaceHolder"):FindFirstChild("RequiredAtt"):FindFirstChild("BillboardGui") and plate:FindFirstChild("PlatePlaceHolder"):FindFirstChild("RequiredAtt"):FindFirstChild("BillboardGui"):FindFirstChild("IngredientsNeededHolder") and plate:FindFirstChild("PlatePlaceHolder"):FindFirstChild("RequiredAtt"):FindFirstChild("BillboardGui"):FindFirstChild("IngredientsNeededHolder"):FindFirstChild("H")) then return end
    end)
    for c, d in pairs(plate.PlatePlaceHolder.RequiredAtt.BillboardGui.IngredientsNeededHolder.H:GetChildren()) do
        if d.ClassName == "Frame" and d.Name ~= "Name_Holder" and d.Name ~= "Ingredient_Needed" then
            addtoplate(d.Name, plate)
        end
    end
    plate.PlatePlaceHolder.ChildAdded:Wait()
    task.wait(0.25)
    local args = {
    [1] = {
        ["Object"] = plate
    }
    }
    game:GetService("ReplicatedStorage").Remotes.Plating:InvokeServer(unpack(args))
    hrp.CFrame = v:FindFirstChildOfClass("ObjectValue").Value:FindFirstChild("HumanoidRootPart").CFrame
    task.wait(0.5)
    local args = {
    [1] = {
        ["NPC"] = v:FindFirstChildOfClass("ObjectValue").Value
    }
    }
    game:GetService("ReplicatedStorage").Remotes.Plating:InvokeServer(unpack(args))
end
end
end
