-- โหลด Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Map Dumper",
   LoadingTitle = "กำลังโหลด...",
   ConfigurationSaving = { Enabled = false }
})

local DumpTab = Window:CreateTab("Dump Map", 4483362458)

DumpTab:CreateButton({
   Name = "เริ่ม Dump แมพ (.rbxl)",
   Callback = function()
       Rayfield:Notify({
          Title = "กำลังเริ่ม Dump",
          Content = "กรุณารอสักครู่ ห้ามปิดเกม...",
          Duration = 5,
       })

       -- ดึง Universal Saveinstance Script โดยตรง
       local Params = {
           RepoURL = "https://raw.githubusercontent.com/Luau-SaveInstance/saveinstance/main/",
           Options = {
               ReadMe = false,
               IsFolder = false,
               Decompile = false -- ปิด Decompile เพื่อให้รันง่ายขึ้นบน Executor ทั่วไป
           }
       }
       
       local success, err = pcall(function()
           local saveinstance = loadstring(game:HttpGet(Params.RepoURL .. "saveinstance.luau", true))()
           saveinstance(Params.Options)
       end)

       if success then
           Rayfield:Notify({
              Title = "สำเร็จ!",
              Content = "ตรวจสอบไฟล์ได้ที่โฟลเดอร์ workspace",
              Duration = 5,
           })
       else
           Rayfield:Notify({
              Title = "ล้มเหลว",
              Content = "Executor ไม่สามารถเขียนไฟล์ลงเครื่องได้",
              Duration = 5,
           })
       end
   end,
})
