-- โหลด Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- สร้างหน้าต่างหลัก (Window)
local Window = Rayfield:CreateWindow({
   Name = "My Custom Hub",
   LoadingTitle = "กำลังโหลดระบบ...",
   LoadingSubtitle = "by YourName",
   ConfigurationSaving = {
      Enabled = false
   }
})

-- สร้าง Tab หลัก
local MainTab = Window:CreateTab("หน้าหลัก", 4483362458) -- เลขหลังคือ Icon ID

-- สร้างปุ่มกด (Button)
MainTab:CreateButton({
   Name = "วาร์ปไปจุดเกิด (Spawn)",
   Callback = function()
       if game.Players.LocalPlayer.Character then
           game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 50, 0))
       end
   end,
})

-- สร้างปุ่มเปิด/ปิด (Toggle)
MainTab:CreateToggle({
   Name = "เดินเร็ว (Speed Boost)",
   CurrentValue = false,
   Flag = "SpeedToggle",
   Callback = function(Value)
       local Humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
       if Humanoid then
           Humanoid.WalkSpeed = Value and 32 or 16
       end
   end,
})

-- แสดงแจ้งเตือนเมื่อโหลดเสร็จ
Rayfield:Notify({
   Title = "สำเร็จ!",
   Content = "โหลด UI เรียบร้อยแล้ว",
   Duration = 3,
   Image = 4483362458,
})