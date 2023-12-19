local toggled_teslaray

function tesla_init()
  tesla={}
  toggled_teslaray = false
  make_teslaray(120,(-121/480)*2,true,true)
  make_teslaray(120,(-121/480)*2,false,false) --TODO randomize
end

function tesla_update()
  foreach(tesla,update_teslaray)
  if (stat(52)%8 != 0) then toggled_teslaray = false
  elseif (not toggled_teslaray) then
    foreach(tesla,toggle_teslaray)
    toggled_teslaray=true
  end
  foreach(tesla,check_col_teslaray)
end

function tesla_draw()
  local tx, ty
  foreach(tesla,draw_teslaray)
end

function make_teslaray(radius, dr, xray, active)
  local t = {}
  t.r = radius      --the coordinate
  t.dr = dr         --delta radius
  t.xray = xray     --if horizontal
  t.active = active --if active
  if (t.xray) then t.w,t.h = 128,8
  else t.w,t.h = 8,128 end
  add(tesla,t)
end

function update_teslaray(t)
  t.r+=t.dr
  if (t.r<0 or t.r>120) t.dr*=-1
end

function check_col_teslaray(t)
  if (t.active) then
    if (t.xray) then tx,ty = 0,t.r else tx,ty = t.r,0 end
    if (check_col_xy(tx,ty,t.w,t.h)) ship_hit() 
  end
end

function toggle_teslaray(t)
  t.active = not t.active
end

function draw_teslaray(t)
  if (t.xray) then
    if (t.active) then
      for i=0,15,1 do spr(10,-5+8*i+stat(56)%8,t.r) end --120/8 = 15 sprites
      spr(8,0,t.r,1,1,false,stat(56)%8<4)
      spr(8,120,t.r,1,1,true,stat(56)%8<4) --flip_x
    else
      spr(6,0,t.r)
      spr(6,120,t.r,1,1,true) --flip_x
    end
  else --y ray
    if (t.active) then
      for i=0,15,1 do spr(11,t.r,-5+8*i+stat(56)%8) end --120/8 = 15 sprites
      spr(9,t.r,0,1,1,stat(56)%8<4,false)
      spr(9,t.r,120,1,1,stat(56)%8<4,true) --flip_y
    else
      spr(7,t.r,0)
      spr(7,t.r,120,1,1,false,true) --flip_y
    end
  end
end