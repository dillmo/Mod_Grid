front = "<?xml version=\"1.0\" ?>\n"..
        "<enemy>\n"..
        "<behaviour>\n"..
        "<root x=\"110\" y=\"40\">\n"..
        "<normal>\n"
back = "</normal>\n"..
       "</root>\n"..
       "</behaviour>\n"..
       "</enemy>\n"
collisionGroups = {}
collisionGroups[0] = "PLAYERS"
collisionGroups[1] = "CREEPS"
collisionGroups[2] = "NAMED_AREAS"
collisionGroups[3] = "INVINCIBLE_OBSTACLES"
collisionGroups[4] = "DESTROYABLE_OBSTACLES"
collisionGroups[5] = "PROJECTILES"
collisionGroups[6] = "SHOPS"
collisionGroups[7] = "JUMPPADS"

for toolkit = 0, 7 do
  local file = io.output("..\\bin\\Mod_Grid_"..collisionGroups[toolkit]..".xml")

  file:write(front)

  for h = 0, 19 do
    for k = 0, 19 do
      local xOffset = h * 0.1 - 0.95
      local yOffset = k * 0.1 - 0.95
      local output = "<condition id=\"isInArea\">\n"..
                     "<string id=\"condition\" values=\"yesno\">yes</string>\n"..
                     "<string id=\"collision groups\" values=\"collison groups\" multiselect=\"true\">"..collisionGroups[toolkit]..";;</string>\n"..
                     "<string id=\"check green obstacles only\" values=\"yesno\">no</string>\n"..
                     "<string id=\"count characters out of combat\" values=\"yesno\">yes</string>\n"..
                     "<string id=\"teams\" values=\"teams\" multiselect=\"true\">OWN_TEAM;;ENEMY_TEAM;;NEUTRAL_TEAM;;</string>\n"..
                     "<string id=\"areaName\"></string>\n"..
                     "<float id=\"xOffset\">"..xOffset.."</float>\n"..
                     "<float id=\"yOffset\">"..yOffset.."</float>\n"..
                     "<float id=\"width\">0.10</float>\n"..
                     "<float id=\"height\">0.10</float>\n"..
                     "<string id=\"check line of sight\" values=\"yesno\">no</string>\n"..
                     "<string id=\"ignore invisibility\" values=\"yesno\">no</string>\n"..
                     "<string id=\"Comment\">"..h..", "..k.."</string>\n"..
                     "<normal>\n"..
                     "<action id=\"setBool\">"..
                     "<string id=\"id\">"..h.."_"..k.."</string>\n"..
                     "<string id=\"value\" values=\"flagtoggle\">yes</string>\n"..
                     "</action>\n"..
                     "</normal>\n"..
                     "<else>\n"..
                     "<action id=\"setBool\">"..
                     "<string id=\"id\">"..h.."_"..k.."</string>\n"..
                     "<string id=\"value\" values=\"flagtoggle\">no</string>\n"..
                     "</action>\n"..
                     "</else>\n"..
                     "</condition>\n"
      file:write(output)
    end
  end

  file:write(back)

  file:flush()
  file:close()
end
