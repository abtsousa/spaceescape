function tesla_init()
  tesla={}
  make_teslaray(120,-1,1,1)
  make_teslaray(120,-1,0,0) --TODO randomize
end

function tesla_update()
  foreach(tesla,update_teslaray)
end

function tesla_draw()
  foreach(tesla,draw_teslaray)
end

function make_teslaray(radius, dr, xray, active)
  local t
  t.r = radius      --the coordinate
  t.dr = dr         --delta radius
  t.xray = xray     --if horizontal
  t.active = active --if active
  add(tesla,t)
end

function update_teslaray(t)
  t.r+=t.dr
end

function toggle_teslaray(t)
  t.active = not t.active
end

function draw_teslaray(t)

end