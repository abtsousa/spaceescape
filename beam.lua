function beam_init()
  beam_warnings = {}
  beams={}
end

function beam_update()
  if (#beam_warnings<3 and stat(54)*32+stat(52)>=408 and stat(54)*32+stat(52)<=528 and stat(52)%16==8)  make_beam() --start at 12:24, end at 16:16
  foreach(beam_warnings,update_warning)
  foreach(beams,update_beam)
end

function beam_draw()
  foreach(beam_warnings,draw_warning)
  foreach(beams, draw_beam)
end

function make_beam()
  local b = {}
  b.x = rnd(120)
  b.y = 0
  b.w = 6
  b.h = 128
  add(beam_warnings,b)
end

function update_warning(b)
  if (stat(52)%16 == 0) then
    add(beams,b)
    b.time = time()+0.2
    del(beam_warnings,b)
  end
end

function update_beam(b)
  if (check_col(b)) ship_hit()
  if (time()>b.time) del(beams,b)
end

function draw_warning(b)
  line(b.x+3,8,b.x+3,128,2)
  palt(11,true)
  palt(1,false)
  spr(12,b.x,0)
  palt(1,true)
  palt(11,false)
end

function draw_beam(b)
  for i=-1,15,1 do spr(13,b.x,8*i+stat(56)%8) end --120/8 = 15 sprites
end