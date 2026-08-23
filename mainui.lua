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
          Content = "เริ่มกระบวนการ Dump แมพ...",
          Duration = 3,
          Image = 4483362458,
       })

       -- ตรวจสอบว่า Executor มีฟังก์ชัน saveinstance หรือ saveplace อยู่แล้วหรือไม่
       local savefunc = saveinstance or saveplace or (save_instance and save_instance)
       
       if savefunc then
           savefunc()
           Rayfield:Notify({
              Title = "สำเร็จ!",
              Content = "บันทึกแมพลงโฟลเดอร์ workspace เรียบร้อยแล้ว",
              Duration = 5,
              Image = 4483362458,
           })
       else
           -- กรณี Executor ไม่มีฟังก์ชันในตัว ให้ดึงสคริปต์สำรองที่เสถียร
           local status, err = pcall(function()
               local save = loadstring(game:HttpGet("https://raw.githubusercontent.com/Luau-SaveInstance/saveinstance/main/saveinstance.luau"))()
               save({Decompile = false}) -- ปิด Decompile ชั่วคราวเพื่อป้องกันค้าง
           end)

           if status then
               Rayfield:Notify({
                  Title = "สำเร็จ!",
                  Content = "บันทึกแมพเรียบร้อยแล้ว",
                  Duration = 5,
                  Image = 4483362458,
               })
           else
               Rayfield:Notify({
                  Title = "ผิดพลาด",
                  Content = "Executor ของคุณไม่รองรับการเซฟแมพ",
                  Duration = 5,
                  Image = 4483362458,
               })
           end
       end
   end,
})
