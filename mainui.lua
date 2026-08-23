-- โหลด Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- สร้างหน้าต่างหลัก
local Window = Rayfield:CreateWindow({
   Name = "Map Dumper & Tool Hub",
   LoadingTitle = "กำลังโหลดระบบ...",
   LoadingSubtitle = "by Reina5910",
   ConfigurationSaving = { Enabled = false }
})

-- สร้าง Tab สำหรับสั่ง Dump
local DumpTab = Window:CreateTab("Dump Map", 4483362458)

-- ปุ่มสำหรับกด Dump แมพเป็นไฟล์ .rbxl
DumpTab:CreateButton({
   Name = "เริ่ม Dump แมพทั้งหมด (.rbxl)",
   Callback = function()
       Rayfield:Notify({
          Title = "กำลังดำเนินการ",
          Content = "เริ่มกระบวนการ Dump แมพ กรุณารอสักครู่...",
          Duration = 5,
          Image = 4483362458,
       })

       -- โหลดสคริปต์ Saveinstance เพื่อดึงแมพลงเครื่อง
       local Params = {
           RepoURL = "https://raw.githubusercontent.com/Luau-SaveInstance/saveinstance/main/",
           Options = {
               ReadMe = false,
               IsFolder = false,
               Decompile = true,
               DecompileTimeout = 10
           }
       }
       
       local saveinstance = loadstring(game:HttpGet(Params.RepoURL .. "saveinstance.luau", true))()
       saveinstance(Params.Options)

       Rayfield:Notify({
          Title = "สำเร็จ!",
          Content = "บันทึกแมพลงโฟลเดอร์ workspace เรียบร้อยแล้ว",
          Duration = 5,
          Image = 4483362458,
       })
   end,
})
