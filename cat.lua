-- cat - customizable antiaim toggles


oink.ui_context("cat") -- first we create da context



-- air aa - turns on antiaim when in air, make it jitter or spin to confuse resolvers. would make it automatically but woob hasn't added enum support yet for oink.config_set 


oink.ui_checkbox("air aa")


oink.event_remove("view_render_post", "cat_airaa")
oink.event_listen("view_render_post", "cat_airaa", function()

    if oink.ui_get("cat", "air aa") then

        local ply = LocalPlayer()
        if not ply:OnGround() then
            oink.config_set("misc.aa.enabled", true)
        -- oink.log(0xff0000ff, "[debug] air aa has been turned on")
        else
        oink.config_set("misc.aa.enabled", false)
        -- oink.log(0xff0000ff, "[debug] air aa has been turned of")
        end
    end
end)



-- fakelag conditions - allows you to set fakelag ticks for X movement type



oink.ui_checkbox("fakelag conditions")


oink.event_remove("view_render_post", "cat_fl_cond")
oink.event_listen("view_render_post", "cat_fl_cond", function()

local ply = LocalPlayer()

if oink.ui_get("cat", "fakelag conditions") then
    oink.ui_button("EDIT THE VALUES IN THE CODE, SLIDER SUPPORT COMING SOONISH")

    if not ply:OnGround() then
        oink.config_set("misc.aa.fakelag", 14,14)


hook.Add( "KeyRelease", "PlayerIdle", function( ply, key )
    if oink.ui_get("cat", "fakelag conditions") == true then
        if key == IN_FORWARD or key == IN_BACK or key == IN_MOVELEFT or key == IN_MOVERIGHT then
        oink.config_set("misc.aa.fakelag", 6,6) -- you can change this


hook.Add( "KeyPress", "PlayerWalking", function( ply, key )
if oink.ui_get("cat", "fakelag conditions") == true then
  if key == IN_FORWARD or key == IN_BACK or key == IN_MOVELEFT or key == IN_MOVERIGHT then
  oink.config_set("misc.aa.fakelag", 10,10) -- you can change this

end
end
end)
end
end
end)
end
end
end)
