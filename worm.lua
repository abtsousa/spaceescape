WORM_SPEED = 3

function worm_init()
  worm={}
  make_worm()
end

function worm_update()
  if (#worm < 8 and #worm>=1 and stat(50)%8!=worm[#worm].tick) make_worm()
  for worm_i,w in ipairs(worm) do
    move_worm(w)
    if (stat(50)%8 != w.tick) then w.changedir=false
    elseif (not w.changedir) then
      update_worm_direction(worm_i,w)
      w.changedir=true
    end
    if (check_col(w)) gameover_init()
  end
end

function worm_draw()
  foreach(worm,draw_worm)
end

function make_worm()
  local w={}
  w.x = 60
  w.y = 128
  w.w = 8
  w.h = 8
  w.tick = stat(50)%8
  w.changedir = false
  update_worm_direction(#worm+1,w)
  add(worm,w)
end

function move_worm(w)
  w.x += w.dx
  w.y += w.dy
end

function update_worm_direction(i,w)
  if (i == 1) then update_worm_direction_xy(w,p.x,p.y) -- worm head
  else w.dx,w.dy = worm[1].dx, worm[1].dy end -- worm body
end

function update_worm_direction_xy(w,px,py)
  local vec=sqrt((px-w.x)^2+(py-w.y)^2)
  w.dx = ((px-w.x)/vec) * WORM_SPEED
  w.dy = ((py-w.y)/vec) * WORM_SPEED
end

function draw_worm(w)
  spr(15,w.x,w.y)
end