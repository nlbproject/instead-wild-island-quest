--$Name:NLBB_Wed Oct 21 11:56:22 OMST 2026$
--$Version:0.1$
--$Author:Unknown$
instead_version '2.3.0'

--package.cpath = './?.so'
require 'luapassing'

require 'prefs'
require 'xact'
require 'nouse'
require 'hideinv'
--require 'para'
require 'dash'
require 'snapshots'
require 'theme'
require 'timer'
require 'modules/nlb'
require 'modules/fonts'
require 'modules/paginator'
require 'modules/vn'
require 'modules/gobj'
require 'dice/modules/big_pig'
game.codepage='UTF-8';
stead.scene_delim = '^';

game.act = function() nlb:curloc().lasttext = 'Nothing happens.'; p(nlb:curloc().lasttext); nlb:curloc().wastext = true; end;
game.inv = function() nlb:curloc().lasttext = 'Hm... This is strange thing...'; p(nlb:curloc().lasttext); nlb:curloc().wastext = true; end;
game.nouse = function() nlb:curloc().lasttext = 'Does not work...'; p(nlb:curloc().lasttext); nlb:curloc().wastext = true; end;
game.forcedsc = false;
paginator.delim = '\n[ \t]*\n'
function exec(s)
    p('$'..s:gsub('\n', '^')..'$^^')
end
function update_action_count()
    _action_count_diff_prev = _action_count_diff;
    _action_count_diff = nlb:count_get(0);
    if _action_count_diff <= _action_count_diff_prev then
        return false;
    end
    return true;
end
function has_action()
    if _action_count_diff < _needs_action_count then
        return false;
    end
    nlb:count_reset();
    return true;
end
function init()
    statsAPI.init();
    if dice then
        paginator:set_onproceed(function()
            dice:hide(true);
            -- Use code below if you want smooth rollout animation and text change on next step
            --if dice:hide() then
            --    return
            --end
        end);
    end
    vn:scene(nil);
    nlbticks = stead.ticks();
    _export_lang = 'en';
    _action_count_diff = 0;
    _action_count_diff_prev = 0;
    _needs_action_count = 3;
    _syscall_showmenubtn:act();
    format.quotes = false;
    if not prefs.achievements_max then
        prefs.achievements_max = {};
    end
    if not prefs.achievements_ids then
        prefs.achievements_ids = {};
    end
    prefs:store();
    nlb:resendAchievements(statsAPI);
    initializeVariables();
end

_version_obj = gobj {
    nam = 'version_obj',
    system_type = true,
    pic = 'gfx/version.png',
    txtfn = function(s) return { [1] = {['text'] = '0.1', ['color'] = 'white' } }; end,
    eff = 'left-top@0,0',
    iarm = {[0] = {0, 16}}

}

-- In INSTEAD, when using the snapshots module, you will run into unpredictable behaviour if the variable is not initialized yet.
-- More specifically, if the value is nil, it won't be included in the snapshot & therefore will not be overwritten when the snapshot is loaded.
-- So, for example, if the flag was initially nil, then you make snapshot, then you walked into location which sets this flag to true,
-- than when loading the snapshot the value of the flag will NOT change back to nil.
-- That's why we should initialize all nil variables on start (so that they equal false or 0 or '', but not nil).
function initializeVariables()
    if _langRoom == nil then
        _langRoom = false;
    end
    if _shed == nil then
        _shed = false;
    end
    if _isCave == nil then
        _isCave = false;
    end
    if _english == nil then
        _english = false;
    end
    if _room == nil then
        _room = false;
    end
    if _library == nil then
        _library = false;
    end
    if _haveDoyle == nil then
        _haveDoyle = false;
    end
    if _haveRifle == nil then
        _haveRifle = false;
    end
    if _haveIren == nil then
        _haveIren = false;
    end
    if _haveLighter == nil then
        _haveLighter = false;
    end
    if _haveHerbicide == nil then
        _haveHerbicide = false;
    end
    if _haveConan == nil then
        _haveConan = false;
    end
    if _haveLGlass == nil then
        _haveLGlass = false;
    end
    if _shootAirCave == nil then
        _shootAirCave = false;
    end
    if _travellerHouse == nil then
        _travellerHouse = false;
    end
    if _inventorHouse == nil then
        _inventorHouse = false;
    end
    if _hunterHouse == nil then
        _hunterHouse = false;
    end
end

-- tagsObj2
v_b2c6873a_69ac_46a9_8016_2b8028936bd3 = nlbobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'b2c6873a-69ac-46a9-8016-2b8028936bd3',
    deref = function(s) return stead.deref(v_b2c6873a_69ac_46a9_8016_2b8028936bd3); end,
    nam = 'tagsObj2',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_room = nlb:pop(_tagsArg2.listnam);
if ((_isCave)) then
_room.tag = 'Cave';
else
if ((_haveDoyle)) then
_room.tag = 'NotCaveDoyle';
else
_room.tag = 'NotCave';
end;
end;
    end,
};

_tagsObj2 = v_b2c6873a_69ac_46a9_8016_2b8028936bd3
-- langObj
v_a5d4643d_8956_4d4d_abe9_4e4fa6129c69 = nlbobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'a5d4643d-8956-4d4d-abe9-4e4fa6129c69',
    deref = function(s) return stead.deref(v_a5d4643d_8956_4d4d_abe9_4e4fa6129c69); end,
    nam = 'langObj',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_langRoom = nlb:pop(_langArg.listnam);
_english =  false ;
if ((_english)) then
_langRoom.tag = 'English';
else
_langRoom.tag = 'Russian';
end;
    end,
};

_langObj = v_a5d4643d_8956_4d4d_abe9_4e4fa6129c69
-- tagsObj
v_f9f7d9ab_4120_41d6_a152_c60995c984e6 = nlbobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'f9f7d9ab-4120-41d6-a152-c60995c984e6',
    deref = function(s) return stead.deref(v_f9f7d9ab_4120_41d6_a152_c60995c984e6); end,
    nam = 'tagsObj',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_room = nlb:pop(_tagsArg.listnam);
if ((_haveConan and _haveDoyle and _haveIren)) then
_room.tag = 'ConanDoyleIrene';
elseif ((_haveConan and _haveDoyle)) then
_room.tag = 'ConanDoyle';
elseif ((_haveConan and _haveIren)) then
_room.tag = 'ConanIrene';
elseif ((_haveDoyle and _haveIren)) then
_room.tag = 'DoyleIrene';
elseif ((_haveConan)) then
_room.tag = 'Conan';
elseif ((_haveDoyle)) then
_room.tag = 'Doyle';
elseif ((_haveIren)) then
_room.tag = 'Irene';
else
_room.tag = 'Henry';
end;
    end,
};

_tagsObj = v_f9f7d9ab_4120_41d6_a152_c60995c984e6
-- herbicide
v_d0896d82_0284_43f2_85ad_3ecd3925457c = nlbobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'd0896d82-0284-43f2-85ad-3ecd3925457c',
    deref = function(s) return stead.deref(v_d0896d82_0284_43f2_85ad_3ecd3925457c); end,
    nam = 'herbicide',
    snd = function(s) 
    end,
    disp = function(s) return "herbicide" end,
    dscf = function(s) return "{herbicide}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
};

_herbicide = v_d0896d82_0284_43f2_85ad_3ecd3925457c
-- rifle
v_47d7b7dd_a20f_438f_80f8_b87807f952d1 = nlbmenu {
    var { tag = ''; container = function() return nil; end; },
    nlbid = '47d7b7dd-a20f-438f-80f8-b87807f952d1',
    deref = function(s) return stead.deref(v_47d7b7dd_a20f_438f_80f8_b87807f952d1); end,
    nam = 'rifle',
    snd = function(s) 
    end,
    disp = function(s) return "Rifle" end,
    dscf = function(s) return "{Rifle}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    tak = function(s)
        s.act(s);
        return true;
    end,
    menu = function(s)
        return s.act(s);
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
};

_rifle = v_47d7b7dd_a20f_438f_80f8_b87807f952d1
-- lighter
v_fd8560c2_3ab4_433d_9fd3_78e916aedb43 = nlbmenu {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'fd8560c2-3ab4-433d-9fd3-78e916aedb43',
    deref = function(s) return stead.deref(v_fd8560c2_3ab4_433d_9fd3_78e916aedb43); end,
    nam = 'lighter',
    snd = function(s) 
    end,
    disp = function(s) return "Lighter" end,
    dscf = function(s) return "{Lighter}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    tak = function(s)
        s.act(s);
        return true;
    end,
    menu = function(s)
        return s.act(s);
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
};

_lighter = v_fd8560c2_3ab4_433d_9fd3_78e916aedb43
-- lglass
v_aa30603b_c44f_4577_b460_b621b8bc1faa = nlbobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'aa30603b-c44f-4577-b460-b621b8bc1faa',
    deref = function(s) return stead.deref(v_aa30603b_c44f_4577_b460_b621b8bc1faa); end,
    nam = 'lglass',
    snd = function(s) 
    end,
    disp = function(s) return "Spyglass" end,
    dscf = function(s) return "{Spyglass}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
};

_lglass = v_aa30603b_c44f_4577_b460_b621b8bc1faa
-- 1.From the author
main, v_9d1a6d26_d597_4296_a209_c507bb2bd355 = room { nam = 'main', enter = function(s) nlb:nlbwalk(s, v_9d1a6d26_d597_4296_a209_c507bb2bd355, true); end }, vnr {
    nam = "1.From the author",
    notes = '1.From the author',
    bgimg = function(s)
        if (true) then
            return 'images/026.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("This gamebook features a very simple combat system. There is no strength or stamina because all your heroes are just kids, and it\'s unlikely that they will achieve success through brute force.");
pn();
pn(" Instead, luck is taken into consideration because it invisibly influences everyone\'s life. Before starting your adventure, roll an ordinary six-sided die (d6) and record the result.");
pn();
pn(" This is your luck, and it won\'t change during the course of the game. If you encounter situations that require you to test your luck, follow the instructions provided in the text.");
pn();
pn(" Remember that the success of your adventure depends on your actions, not on dice rolls. As a rule, you will only need to test your luck in case of emergency, when only a miracle can save you.");
pn();
pn(" So, make thorough preparations for the adventure. Additionally, write down the names of your companion characters and items you have on your traveler sheet. Do not forget that all characters have their strengths and weaknesses.");
pn();
pn("");
pn();
pn("Enjoy the game!");
pn();
    end,
    walk_to = "v_9d1a6d26_d597_4296_a209_c507bb2bd355_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_9d1a6d26_d597_4296_a209_c507bb2bd355_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_4.ogg', 0);
    end,
    sndout = function(s) end,
};

v_9d1a6d26_d597_4296_a209_c507bb2bd355_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_9cd06fd5_6e0b_44ae_a04a_07ff7c20c0e2);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_9cd06fd5_6e0b_44ae_a04a_07ff7c20c0e2 = menu {
    nam = "v_9cd06fd5_6e0b_44ae_a04a_07ff7c20c0e2",
    dsc = function(s) return "{Start the game}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_9d1a6d26_d597_4296_a209_c507bb2bd355, v_28f18357_b890_4eb3_8a09_8ab780cc802a, false); 
    end
}

-- 2.Another World
v_28f18357_b890_4eb3_8a09_8ab780cc802a = vnr {
    nam = "2.Another World",
    notes = '2.Another World',
    bgimg = function(s)
        if (true) then
            return 'images/001.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The valley is covered with mist, and dusk has already fallen. You and your friends—Doyle, Conan, and Irene—are making their way through the coastal shrubbery, closer and closer to the edge of the island.");
pn();
pn(" Black, crooked branches often emerge from the fog, swaying as if alive. It\'s cool outside, and a chilly wind is blowing.");
pn();
pn(" Sometimes you can hear grinding sounds, typical of the floating of ice when the edges of ice blocks clash.");
pn();
pn("");
pn();
pn("");
pn();
pn("Finally, you pass through the shrubbery and come to the edge of the island. Usually, it resembles the edge of a chasm, but today everything is different.");
pn();
pn(" Today, an unknown and mysterious land is floating past the edge of your home. This is the famous Wild Island where Cyrus Paganel was on an expedition. You\'ve heard about it many times, and now you see the island with your own eyes.");
pn();
pn("");
pn();
pn("");
pn();
pn("\"Quickly!\" screams Conan. \"Or we won\'t make it!\"");
pn();
pn("");
pn();
pn("Your friends run towards the edge and jump over one by one. Even Doyle is already on the other side, waving to you.");
pn();
pn("");
pn();
pn("\"Henry! Come to us.\"");
pn();
pn("");
pn();
pn("You run towards them. There is the edge of the island, there is the fearsome chasm. Wild Island is slowly drifting ahead, resembling a black river.");
pn();
    end,
    walk_to = "v_28f18357_b890_4eb3_8a09_8ab780cc802a_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_28f18357_b890_4eb3_8a09_8ab780cc802a_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_haveConan =  false ;
_haveLGlass =  false ;
_haveLighter =  false ;
_haveIren =  false ;
_haveDoyle =  false ;
_haveHerbicide =  false ;
_haveRifle =  false ;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_22.ogg', 0);
    end,
    sndout = function(s) end,
};

v_28f18357_b890_4eb3_8a09_8ab780cc802a_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_624a4565_9b0a_42a4_a58b_e003f06cda11);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_624a4565_9b0a_42a4_a58b_e003f06cda11 = menu {
    nam = "v_624a4565_9b0a_42a4_a58b_e003f06cda11",
    dsc = function(s) return "{Having gathered your strength, you jump...}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_28f18357_b890_4eb3_8a09_8ab780cc802a, v_ffe1ed80_5652_4e2f_86da_cb4aed21410f, false); 
    end
}

-- Congratulations!
v_13ebd3d5_334b_4194_8f20_d189ea66a973 = vnr {
    nam = '...',
    notes = 'Congratulations!',
    bgimg = function(s)
        if (true) then
            return 'images/100.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    walk_to = "v_13ebd3d5_334b_4194_8f20_d189ea66a973_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_13ebd3d5_334b_4194_8f20_d189ea66a973_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return 0, 0, vn.scr_w, vn.scr_h;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

v_13ebd3d5_334b_4194_8f20_d189ea66a973_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    dsc = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(_try_again);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_end('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 4.By the spot the island floated to
v_b70d51a3_29a1_4884_84a3_6557956a94a9 = vnr {
    nam = '...',
    notes = '4.By the spot the island floated to',
    bgimg = function(s)
        if (true) then
            return 'images/026.1.3.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Suddenly, a small fluffy animal jumps right out onto the shore. With one long hop, it is in front of you.");
pn();
pn(" Snoopy is barking furiously at it. The frightened animal jumps back. Now Snoopy breaks loose and chases the animal before you can stop him. They both vanish into the forest before you know it.");
pn();
pn("");
pn();
    end,
    walk_to = "v_b70d51a3_29a1_4884_84a3_6557956a94a9_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b70d51a3_29a1_4884_84a3_6557956a94a9_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_3.ogg', 0);
    end,
    sndout = function(s) end,
};

v_b70d51a3_29a1_4884_84a3_6557956a94a9_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_b70d51a3_29a1_4884_84a3_6557956a94a9, v_21ead0b1_66eb_460a_aba9_2c2efa5aec54, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 5.Beginning
v_21ead0b1_66eb_460a_aba9_2c2efa5aec54 = vnr {
    nam = '...',
    notes = '5.Beginning',
    bgimg = function(s)
        if (true) then
            return 'images/027.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Snoopy, stop, Snoopy!\"");
pn();
pn("Without thinking about the danger, you rush after your loyal friend. With a single jump, you cross the roaring precipice. Once again, Snoopy\'s silhouette flickers among the trees and disappears behind them.");
pn();
pn("A few adults, who saw your desperate act, run towards you, screaming something. You continue to rush after Snoopy, moving deeper into the unfamiliar forest, guided by distant barking.");
pn();
pn(" Although you run as fast as possible, the barking becomes more and more distant. Eventually, you\'re out of breath, feeling pain in your chest; you have no more strength to keep running.");
pn();
pn("");
pn();
pn("The Wild Island forest surrounds you, and you instantly realize that you\'ve gone too far. It\'s necessary to return for help, but it\'s not so easy to find the way back.");
pn();
pn(" You could follow your trail, but there is a dense carpet of musty foliage on the ground, making it impossible to see any footprints.");
pn();
pn(" You try to listen for the roar of clashing edges of two islands, but it is lost in the noise of disturbed inhabitants of the forest. It seems you\'re completely lost.");
pn();
pn("");
pn();
    end,
    walk_to = "v_21ead0b1_66eb_460a_aba9_2c2efa5aec54_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_21ead0b1_66eb_460a_aba9_2c2efa5aec54_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_isCave =  false ;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_21ead0b1_66eb_460a_aba9_2c2efa5aec54_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_21ead0b1_66eb_460a_aba9_2c2efa5aec54, v_64405c42_1edc_438e_a351_6953473a350e, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 6.Conan rescued everyone to the underbrush
v_0523f06f_19b0_4fd8_a48f_8a2c786b09be = vnr {
    nam = '...',
    notes = '6.Conan rescued everyone to the underbrush',
    bgimg = function(s)
        if (s.tag == 'ConanDoyle') then
            return 'images/060.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/129.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You take the backpack off your back and sink slowly to the ground, right onto the soft underlayer of grass. You can hardly keep your eyes open, your mind is clouded...");
pn();
pn("");
pn();
pn("\"Hey, Henry, what\'s wrong with you?\" you hear a worried voice of Conan.");
pn();
pn("");
pn();
pn("\"Nothing ... eh... Conan, let\'s rest for a little. Maybe take a nap?\"");
pn();
pn("");
pn();
pn("\"What are you talking about?! Listen, you\'re so pale! Henry!..\"");
pn();
pn("");
pn();
pn("Everything is swimming before your eyes. As if you are looking from aside, you see Conan pull your arm, trying to pick up Doyle, who is lying next to you. Then you lapse into deep oblivion.");
pn();
pn("");
pn();
pn("When you regain consciousness, you find yourself in the shade with no sick fragrance to be scented. You slowly open your eyes.");
pn();
pn(" It seems to be the very underbrush you wanted to reach. You sit, leaning your back against the tree; Doyle still unconscious is not far. Conan is sitting nearby, watching you intently.");
pn();
pn("");
pn();
pn("");
pn();
pn("\"I thought you\'d never...\" he exhales with relief.");
pn();
pn("");
pn();
pn("\"What happened to me?\"");
pn();
pn("");
pn();
pn("\"Maybe it\'s all those damn plants. Even I got a headache pulling you two out of there. You just went all weak at the knees and fell with no response.\"");
pn();
pn("");
pn();
pn("\"Thanks, buddy...\"");
pn();
pn("");
pn();
pn("You hardly stand up. After a while, Doyle opens his eyes with a low groan.");
pn();
    end,
    walk_to = "v_0523f06f_19b0_4fd8_a48f_8a2c786b09be_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_0523f06f_19b0_4fd8_a48f_8a2c786b09be_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_18.ogg', 0);
    end,
    sndout = function(s) end,
};

v_0523f06f_19b0_4fd8_a48f_8a2c786b09be_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_0523f06f_19b0_4fd8_a48f_8a2c786b09be, v_f3698e8c_c032_4b8b_9fc8_040c5fc65e4d, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 7.You fall asleep hardly believing in your luck
v_214e9f88_e774_40e8_b7bc_209cfeeccc42 = vnr {
    nam = '...',
    notes = '7.You fall asleep hardly believing in your luck',
    bgimg = function(s)
        if (s.tag == 'ConanDoyle') then
            return 'images/037.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/037.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/113.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/113.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Embracing each other, you all finally give way to tears. It appears that only by a miracle did you manage to escape certain death. At last, you pull yourself together.");
pn();
pn("\"Ok, we defeated him, didn\'t we?\" you say, trying to make your voice sound confident. \"Conan, good job! What would we do without you?\"");
pn();
pn("It is hard to tell in the darkness, but it seems that Conan blushes and he is trying to smile. You pull a blanket out of the backpack.");
pn();
pn("\"Let\'s try to sleep now. In the morning, we\'ll decide what to do next.\"");
pn();
pn("You don\'t have to say it twice; in a minute, everybody sleeps like a dog.");
pn();
    end,
    walk_to = "v_214e9f88_e774_40e8_b7bc_209cfeeccc42_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_214e9f88_e774_40e8_b7bc_209cfeeccc42_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_15.ogg', 0);
    end,
    sndout = function(s) end,
};

v_214e9f88_e774_40e8_b7bc_209cfeeccc42_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_214e9f88_e774_40e8_b7bc_209cfeeccc42, v_afb2a291_7982_4026_8100_9b2fc7a826fc, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 8.Dawn in the cave
v_7e8667a4_9787_45f2_8937_ee4cc820e2d2 = vnr {
    nam = '...',
    notes = '8.Dawn in the cave',
    bgimg = function(s)
        if (true) then
            return 'images/049.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Morning chill awakens you. Of course, the fire by the entrance is long gone. You\'re very lucky that nobody else was interested in you during the night.");
pn();
pn("Your friends sleep side by side in a row, embracing each other to keep warm. You wake them up. The hood of Irene\'s cloak is soiled in clay, Doyle\'s hair stands on end, but all in all, everyone is in good spirits.");
pn();
pn("After discussing once again what happened yesterday and eating a piece of bread found in the bag, you decide to keep going. It\'s time to get out of this forest.");
pn();
    end,
    walk_to = "v_7e8667a4_9787_45f2_8937_ee4cc820e2d2_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_7e8667a4_9787_45f2_8937_ee4cc820e2d2_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_2.ogg', 0);
    end,
    sndout = function(s) end,
};

v_7e8667a4_9787_45f2_8937_ee4cc820e2d2_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_7e8667a4_9787_45f2_8937_ee4cc820e2d2, v_dd64149c_4cdf_4aad_b626_1426318a5327, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 9.The plant is done for 2
v_d1a7a8ac_308a_4293_823f_fb8fb9eaab45 = vnr {
    nam = '...',
    notes = '9.The plant is done for 2',
    bgimg = function(s)
        if (true) then
            return 'images/067.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You recall the canister with herbicide taken from the shed. It\'s time to find out if it is fit for something other than extermination of weeds.");
pn();
pn("");
pn();
pn("Trying not to make abrupt movements, you carefully take the canister, remove the stopper, and shower the branch adhered to Irene with chemical liquid.");
pn();
pn(" The fuzz, covered with shining drops, begins to turn dark and shrink before your eyes, but the stubborn plant keeps holding the girl. Irene starts to cry.");
pn();
pn("");
pn();
pn("");
pn();
pn("\"Wait, now it will take effect,\" you try to calm her down, being not so sure about success too.");
pn();
pn("");
pn();
pn("Quite a lot of time has passed before the substance finally kills the sticky fuzz adhered to Irene\'s arm.");
pn();
pn(" You take her very carefully by the shoulders, pull her out of the plant. Both of you fall powerlessly on the grass, gasping for air.");
pn();
pn(" Irene is embracing you tightly, shaking in sobbing. So you sit on the ground, holding each other, trying not to think about the gruesome fate that you miraculously managed to escape.");
pn();
pn("");
pn();
pn("");
pn();
pn("Having recovered yourselves, you go back. Now it is clear that the path through the lilac plants is deadly dangerous, so you have no other option but to make your way through the thick shrubs of white flower bushes.");
pn();
    end,
    walk_to = "v_d1a7a8ac_308a_4293_823f_fb8fb9eaab45_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_d1a7a8ac_308a_4293_823f_fb8fb9eaab45_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_14.ogg', 0);
    end,
    sndout = function(s) end,
};

v_d1a7a8ac_308a_4293_823f_fb8fb9eaab45_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_d1a7a8ac_308a_4293_823f_fb8fb9eaab45, v_00e98bcd_db76_4738_8d60_cb2016cdab51, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 10.Inside the cave
v_da2538f2_1e98_4787_ac73_f86051c3bb42 = vnr {
    nam = '...',
    notes = '10.Inside the cave',
    bgimg = function(s)
        if (s.tag == 'DoyleIrene') then
            return 'images/044.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/105.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You can see that Irene cheered up.");
pn();
pn("");
pn();
pn("\"Now we can sleep with no worry! My father said we may not fear predators while we are in caves.\"");
pn();
pn("");
pn();
pn("\"Provided they cannot come in!\" you said in a worried voice. \"We need to build a fire by the entrance.\"");
pn();
pn("");
pn();
pn("Near the cave, you collected lots of last year\'s dry branches for firewood. This should suffice.");
pn();
pn("");
pn();
pn("\"So, let\'s try to ignite,\" Doyle fishes the lighter out from the pocket.");
pn();
pn("");
pn();
pn("Dry branches burn like gunpowder. If only there were enough firewood till morning. Well, it looks like it\'s time to go to sleep.");
pn();
    end,
    walk_to = "v_da2538f2_1e98_4787_ac73_f86051c3bb42_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_da2538f2_1e98_4787_ac73_f86051c3bb42_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_6.ogg', 0);
    end,
    sndout = function(s) end,
};

v_da2538f2_1e98_4787_ac73_f86051c3bb42_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_da2538f2_1e98_4787_ac73_f86051c3bb42, v_78ffdc16_1a44_48b3_9c17_959ecd93f25c, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 11.Doyle fears the height
v_91abebdc_63cc_44a1_9d59_3c756140a8b9 = vnr {
    nam = '...',
    notes = '11.Doyle fears the height',
    bgimg = function(s)
        if (true) then
            return 'images/031.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You recollect a book that you have read recently about Robinson Crusoe. Once on the island, Robinson spent his first night on a tree to avoid predator attacks. Good idea! It\'s useful to read books after all!");
pn();
pn("\"We take rest on the tree!\" you declare.");
pn();
pn("Doyle takes you aside, feeling embarrassed.");
pn();
pn("\"Henry, e-e-eh, you see I have a fear of heights, I feel giddy at once... Just don\'t tell anyone, please.\"");
pn();
pn("Well, it\'s a pity; the plan was very good. It appears you have to come up with something else.");
pn();
    end,
    walk_to = "v_91abebdc_63cc_44a1_9d59_3c756140a8b9_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_91abebdc_63cc_44a1_9d59_3c756140a8b9_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_91abebdc_63cc_44a1_9d59_3c756140a8b9_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_f67d739e_1ee8_4b02_a6dc_d03470b8f696);
if (_haveIren) then
        put(v_1da1e253_a417_4ffd_853e_ca5df852cb90);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_f67d739e_1ee8_4b02_a6dc_d03470b8f696 = menu {
    nam = "v_f67d739e_1ee8_4b02_a6dc_d03470b8f696",
    dsc = function(s) return "{Make shelter of branches on the glade}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_91abebdc_63cc_44a1_9d59_3c756140a8b9, v_b98d5019_ca4d_47d8_860c_834c4d09fd4a, false); 
    end
}

v_1da1e253_a417_4ffd_853e_ca5df852cb90 = menu {
    nam = "v_1da1e253_a417_4ffd_853e_ca5df852cb90",
    dsc = function(s) return "{Ask Irene for advice}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_91abebdc_63cc_44a1_9d59_3c756140a8b9, v_43775dd7_53c0_4737_aa5c_835c5ef5f81f, false); 
    end
}

-- 12.Happy end
v_4c830444_262f_49fd_9c4c_705c2abf0e11 = vnr {
    nam = '...',
    notes = '12.Happy end',
    bgimg = function(s)
        if (true) then
            return 'images/095.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You fight the incentive to run away immediately, but it looks like there is nothing to fear. It\'s clear that the natives feel a mix of adoration, fear, and admiration toward you.");
pn();
pn(" In their opinion, you are true gods restoring their fire. And, in principle, you almost didn\'t lie to them. Well, maybe a little bit.");
pn();
pn("");
pn();
pn("");
pn();
pn("Doyle grew bolder and speaks to the chief about something, then turns to you and says, \"The entire tribe thanks us.");
pn();
pn(" I told them that we came from the Gods\' Island. The chief knows how to get to the shore and promised to provide us with his best warriors. They will accompany us.\"");
pn();
pn("");
pn();
    end,
    walk_to = "v_4c830444_262f_49fd_9c4c_705c2abf0e11_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_4c830444_262f_49fd_9c4c_705c2abf0e11_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_7.ogg', 0);
    end,
    sndout = function(s) end,
};

v_4c830444_262f_49fd_9c4c_705c2abf0e11_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_4c830444_262f_49fd_9c4c_705c2abf0e11, v_7892eb0c_f134_44c9_b25d_650fe58f963e, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 13.Through the underbrush
v_84e6f39f_4457_411a_9fc2_a3ac7f7923f5 = vnr {
    nam = '...',
    notes = '13.Through the underbrush',
    bgimg = function(s)
        if (true) then
            return 'images/071.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You finally reach the underbrush. It\'s not as hot here compared to the open country, and the sickly sweet smell that was making you giddy is fainter now.");
pn();
pn(" This is quite timely, as the floral fragrance was already starting to make you dizzy. You fix your eyes on the objective, moving along the edge of the forest.");
pn();
pn(" It looks like it\'s just a stone\'s throw to the lake; in fact, it takes much longer before you step onto its oozy shore.");
pn();
pn("");
pn();
    end,
    walk_to = "v_84e6f39f_4457_411a_9fc2_a3ac7f7923f5_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_84e6f39f_4457_411a_9fc2_a3ac7f7923f5_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_84e6f39f_4457_411a_9fc2_a3ac7f7923f5_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_84e6f39f_4457_411a_9fc2_a3ac7f7923f5, v_55a03675_030b_48f2_9447_28d7a6dd1ce9, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 14.Fire in front of the shelter of branches
v_23d04f0f_26c4_4588_ab2f_de6ff62f0f02 = vnr {
    nam = '...',
    notes = '14.Fire in front of the shelter of branches',
    bgimg = function(s)
        if (s.tag == 'Doyle') then
            return 'images/034.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/034.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/103.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/103.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Henry, wait!\" says Doyle. \"Let\'s start a fire first!\"");
pn();
pn("");
pn();
pn("Everybody agrees. After picking dry branches, which lie about everywhere, you build a small fire. Doyle bends over it and flicks a lighter. Dry wood ignites easily; now the fire crackles cozily by the entrance of your flimsy shelter.");
pn();
pn("");
pn();
pn("It\'s getting dark very soon. In a few hours you can see only the nearest trees, lit by the fire, and all the rest behind them is hidden in pitch darkness.");
pn();
pn("");
pn();
pn("You\'re all tired and scared, but it\'s difficult to get to sleep. The jungle outside is full of weird and dreadful sounds.");
pn();
pn(" In thickets unknown animals howl and scream in fear, and you can often hear strange rustles. Some apelike creatures come down the trees and look at your fire with curiosity. You look at them.");
pn();
pn("");
pn();
pn("");
pn();
pn("Suddenly these creatures begin to scream loudly, frightened. One by one they rush up on the trees with lightning speed.");
pn();
pn(" For a moment, silence falls upon the jungle. Then, branches on the trees are pushed apart and a large, hairy, coal-black beast steps out into the glade.");
pn();
pn("");
pn();
pn("");
pn();
pn("Its long messy hair hangs down, with its saber long fangs gleaming in the light of the fire. The beast stands still, looking at your fire. The creature\'s nostrils move; it obviously scents you.");
pn();
pn("");
pn();
pn("The predator comes closer, and then stops, hesitating as if some unseen barrier restrained it. The creature is certainly afraid of fire, but your shelter is so unsafe... You\'ve got to do something, until it\'s not too late.");
pn();
    end,
    walk_to = "v_23d04f0f_26c4_4588_ab2f_de6ff62f0f02_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_23d04f0f_26c4_4588_ab2f_de6ff62f0f02_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_4.ogg', 0);
    end,
    sndout = function(s) end,
};

v_23d04f0f_26c4_4588_ab2f_de6ff62f0f02_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_10989d28_c491_4c70_b1cc_0ee399a59f55);
if (_haveConan) then
        put(v_8a1e49d6_fc91_468f_8d0a_bea585a343e7);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_10989d28_c491_4c70_b1cc_0ee399a59f55 = menu {
    nam = "v_10989d28_c491_4c70_b1cc_0ee399a59f55",
    dsc = function(s) return "{Wait}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_23d04f0f_26c4_4588_ab2f_de6ff62f0f02, v_57a64d23_4ca5_48d4_9ea9_60a147fd1200, false); 
    end
}

v_8a1e49d6_fc91_468f_8d0a_bea585a343e7 = menu {
    nam = "v_8a1e49d6_fc91_468f_8d0a_bea585a343e7",
    dsc = function(s) return "{Throw a firebrand at the beast (Conan)}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_23d04f0f_26c4_4588_ab2f_de6ff62f0f02, v_d431c77f_4ada_48ca_9abf_3cc36fd0170e, false); 
    end
}

-- 15.The beast attacks in the dark. Bad end.
v_fa0fc196_061d_4428_abed_fcdb0cb7d061 = vnr {
    nam = '...',
    notes = '15.The beast attacks in the dark. Bad end.',
    bgimg = function(s)
        if (s.tag == 'Doyle') then
            return 'images/038.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/038.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/102.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/102.jpg';
        elseif (s.tag == 'Henry') then
            return 'images/111.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/111.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/111.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/111.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Suddenly, one of the walls of your shelter collapses, and you\'re horrified to see sparkling eyes, enormous fangs, and smell the stinking breath of the predator right in front of you. Fear seizes you, and you are unable to take any measures. Your adventure ends here.");
pn();
    end,
    walk_to = "v_fa0fc196_061d_4428_abed_fcdb0cb7d061_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_fa0fc196_061d_4428_abed_fcdb0cb7d061_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_7.ogg', 0);
    end,
    sndout = function(s) end,
};

v_fa0fc196_061d_4428_abed_fcdb0cb7d061_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_fa0fc196_061d_4428_abed_fcdb0cb7d061_b70d51a3_29a1_4884_84a3_6557956a94a9__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_fa0fc196_061d_4428_abed_fcdb0cb7d061_b70d51a3_29a1_4884_84a3_6557956a94a9__Return = menu {
    nam = "v_fa0fc196_061d_4428_abed_fcdb0cb7d061_b70d51a3_29a1_4884_84a3_6557956a94a9__Return",
    dsc = function(s) return "{Try again}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_fa0fc196_061d_4428_abed_fcdb0cb7d061, v_b70d51a3_29a1_4884_84a3_6557956a94a9, false); 
    end
}

-- 16.
v_f6a6bdf4_b806_486b_8d17_fb4e077271c2 = vnr {
    nam = '...',
    notes = '16.',
    bgimg = function(s)
        if (true) then
            return 'images/074.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("At first, you think it\'s your parents who came to help, but then you obviously discern half-naked bodies wriggling in some wild dance. No, those are certainly not your parents, but savages, dwellers of the Wild Island!");
pn();
pn("");
pn();
pn("Your first inclination is to run away from here as fast as possible! Then you calm down, and curiosity takes over.");
pn();
pn(" You don\'t know where to run anyway; the savages apparently can\'t see you. Perhaps by observing them, you\'ll find out how to get out of here.");
pn();
pn("");
pn();
pn("");
pn();
pn("You carefully tiptoe your way through rustling tangles of reed to the opposite shore. Yes, exactly, these are natives, the inhabitants of the Wild Island.");
pn();
pn(" They\'re dressed in loincloths, holding stone spears and clubs in their hands. Savages dance around a high pole with a totem, the meaning of which is hidden from you.");
pn();
pn("");
pn();
    end,
    walk_to = "v_f6a6bdf4_b806_486b_8d17_fb4e077271c2_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_f6a6bdf4_b806_486b_8d17_fb4e077271c2_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_f6a6bdf4_b806_486b_8d17_fb4e077271c2_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if (_haveLighter) then
        put(v_3a10a270_d766_4b16_ab55_d4e4c5f0b78a);
end;
if (_haveIren) then
        put(v_e953938d_20c1_4817_8429_e5859630486d);
end;
        put(v_eba82b21_2446_4c6b_8709_8be68b6ca3da);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_3a10a270_d766_4b16_ab55_d4e4c5f0b78a = menu {
    nam = "v_3a10a270_d766_4b16_ab55_d4e4c5f0b78a",
    dsc = function(s) return "{Ignite the torches and scare the savages off}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_f6a6bdf4_b806_486b_8d17_fb4e077271c2, v_a8684619_ae21_4f94_8dc0_04c65ca2a9be, false); 
    end
}

v_e953938d_20c1_4817_8429_e5859630486d = menu {
    nam = "v_e953938d_20c1_4817_8429_e5859630486d",
    dsc = function(s) return "{Ask Irene to look for Snoopy}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_f6a6bdf4_b806_486b_8d17_fb4e077271c2, v_dc5f6d05_7ef5_4ffe_8082_7cc8c5a9c8a8, false); 
    end
}

v_eba82b21_2446_4c6b_8709_8be68b6ca3da = menu {
    nam = "v_eba82b21_2446_4c6b_8709_8be68b6ca3da",
    dsc = function(s) return "{Wait}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_f6a6bdf4_b806_486b_8d17_fb4e077271c2, v_a92d3ab3_382d_4e49_add5_c50adacb6ac0, false); 
    end
}

-- 17.Trying to pull Irene out, you got stuck. Bad end.
v_95cef0c7_4983_4034_b06c_9c88f69dcb40 = vnr {
    nam = '...',
    notes = '17.Trying to pull Irene out, you got stuck. Bad end.',
    bgimg = function(s)
        if (true) then
            return 'images/070.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You come closer to the dangerous plant and try to cut a branch, but accidentally grab it with your hand.");
pn();
pn(" Covered with small drops, the fuzz instantly adheres to your skin. Another moment passes, and both your hands are entrapped.");
pn();
pn("");
pn();
pn("");
pn();
pn("Irene starts to cry. You try to calm her down, beginning to realize that this is the end. The spots of skin which are unprotected by clothing start to burn.");
pn();
pn(" At first, just a bit, but then the burning pain becomes intolerable. There is nobody around, no one will help you. Your adventure ends here.");
pn();
pn("");
pn();
    end,
    walk_to = "v_95cef0c7_4983_4034_b06c_9c88f69dcb40_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_95cef0c7_4983_4034_b06c_9c88f69dcb40_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_16.ogg', 0);
    end,
    sndout = function(s) end,
};

v_95cef0c7_4983_4034_b06c_9c88f69dcb40_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_95cef0c7_4983_4034_b06c_9c88f69dcb40_b70d51a3_29a1_4884_84a3_6557956a94a9__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_95cef0c7_4983_4034_b06c_9c88f69dcb40_b70d51a3_29a1_4884_84a3_6557956a94a9__Return = menu {
    nam = "v_95cef0c7_4983_4034_b06c_9c88f69dcb40_b70d51a3_29a1_4884_84a3_6557956a94a9__Return",
    dsc = function(s) return "{Try again}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_95cef0c7_4983_4034_b06c_9c88f69dcb40, v_b70d51a3_29a1_4884_84a3_6557956a94a9, false); 
    end
}

-- 18.They want to sacrifice snoopy
v_e7ea2780_e7c1_4b1c_b9f6_0043ed9384f7 = vnr {
    nam = '...',
    notes = '18.They want to sacrifice snoopy',
    bgimg = function(s)
        if (true) then
            return 'images/088.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Maybe a sharp mind can do better than brute force?");
pn();
pn("");
pn();
pn("\"Doyle, have you studied the indigenous language? Listen, maybe you\'ll understand something.\"");
pn();
pn("");
pn();
pn("Doyle nods and listens to what the savages are saying, then turns to you.");
pn();
pn("");
pn();
pn("\"Well, I\'ve got two news for you. The bad news is that they want to sacrifice Snoopy. This tribe recently lost their fire, now they dance to make gods give them new fire.\"");
pn();
pn("");
pn();
pn("\"And the good one?\"");
pn();
pn("");
pn();
pn("\"You see,\" Doyle slyly winks, \"in theory, we could pretend to be gods. If they get fire, I can probably come to an agreement with them!\"");
pn();
pn("");
pn();
pn("In any case, the plan is risky. But few things in life can be done without risk.");
pn();
    end,
    walk_to = "v_e7ea2780_e7c1_4b1c_b9f6_0043ed9384f7_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_e7ea2780_e7c1_4b1c_b9f6_0043ed9384f7_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_4.ogg', 0);
    end,
    sndout = function(s) end,
};

v_e7ea2780_e7c1_4b1c_b9f6_0043ed9384f7_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if (_haveLighter) then
        put(v_cd09a157_f8c1_4fe3_99d4_5ba400c0226e);
end;
if ( not _haveLighter) then
        put(v_61abd725_03ce_48f8_b45a_a6605e9bb9e8);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_cd09a157_f8c1_4fe3_99d4_5ba400c0226e = menu {
    nam = "v_cd09a157_f8c1_4fe3_99d4_5ba400c0226e",
    dsc = function(s) return "{Pretend to be God carrying the lighter with fire}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_e7ea2780_e7c1_4b1c_b9f6_0043ed9384f7, v_859fea18_5b44_43d6_a59a_b51fa226ff02, false); 
    end
}

v_61abd725_03ce_48f8_b45a_a6605e9bb9e8 = menu {
    nam = "v_61abd725_03ce_48f8_b45a_a6605e9bb9e8",
    dsc = function(s) return "{You have nothing to create fire}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_e7ea2780_e7c1_4b1c_b9f6_0043ed9384f7, v_320b91a3_2142_4853_978c_ce972e32429c, false); 
    end
}

-- 19.Morning
v_dd64149c_4cdf_4aad_b626_1426318a5327 = vnr {
    nam = '...',
    notes = '19.Morning',
    bgimg = function(s)
        if (true) then
            return 'images/051.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The night darkens, and the outlines of centuries-old trees nearby become clearer. You hear the first birdsong, accompanied by the chirring of insects from the grass.");
pn();
pn(" You need to keep moving; today, it\'s crucial to exit this forest and return home at all costs. The overnight stay clearly demonstrated that it\'s better not to linger here.");
pn();
pn("");
pn();
pn("");
pn();
pn("You hastily pack your belongings and begin to march, attempting to follow some semblance of a path trodden by wild animals.");
pn();
pn(" At least there\'s hope that it will lead you to a water source, and from there, you can find your way out.");
pn();
pn("");
pn();
pn("");
pn();
pn("You\'ve been walking for quite some time, but the forest seems unending. Finally, the gaps between the trees widen, and you come to an edge.");
pn();
pn(" You let out an involuntary scream of joy; ahead, in the lowland, you can discern a vague silhouette of a body of water.");
pn();
pn(" Firstly, you need to reach it. The animal trail leads to another wood, smaller than the one you\'ve just passed, consisting only of short shrubs.");
pn();
pn(" This underbrush is surrounded by fields where tall grass grows. Gusts of wind sway the plants on the fields, making it seem like you\'re close to the vast lake. It\'s time to choose the best route to the water.");
pn();
pn("");
pn();
    end,
    walk_to = "v_dd64149c_4cdf_4aad_b626_1426318a5327_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_dd64149c_4cdf_4aad_b626_1426318a5327_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_4.ogg', 0);
    end,
    sndout = function(s) end,
};

v_dd64149c_4cdf_4aad_b626_1426318a5327_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_c5ec14ad_32bc_493f_b9c9_e6dc3d961eb6);
        put(v_9086a54b_e5da_4966_ba52_6b2d6c152a39);
if (_haveLGlass) then
        put(v_d253ad4e_f6d6_4f7d_8c50_723d7c4f9b81);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_c5ec14ad_32bc_493f_b9c9_e6dc3d961eb6 = menu {
    nam = "v_c5ec14ad_32bc_493f_b9c9_e6dc3d961eb6",
    dsc = function(s) return "{Go through the fields}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dd64149c_4cdf_4aad_b626_1426318a5327, v_538400ba_ef91_49aa_a3ef_5ad720c15e29, false); 
    end
}

v_9086a54b_e5da_4966_ba52_6b2d6c152a39 = menu {
    nam = "v_9086a54b_e5da_4966_ba52_6b2d6c152a39",
    dsc = function(s) return "{Follow animal path through the thicket}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dd64149c_4cdf_4aad_b626_1426318a5327, v_b339854a_79da_483b_8bb0_913dc1d59ea2, false); 
    end
}

v_d253ad4e_f6d6_4f7d_8c50_723d7c4f9b81 = menu {
    nam = "v_d253ad4e_f6d6_4f7d_8c50_723d7c4f9b81",
    dsc = function(s) return "{Use spyglass}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dd64149c_4cdf_4aad_b626_1426318a5327, v_15ccffbe_6991_41c3_83d2_96eadb9a5db7, false); 
    end
}

-- 20.Conan is ready
v_20f27cfd_70a9_48d1_afe5_29256154c65c = vnr {
    nam = '...',
    notes = '20.Conan is ready',
    bgimg = function(s)
        if (s.tag == 'ConanDoyle') then
            return 'images/039.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/039.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/114.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/114.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Conan, keep the rifle ready!\" you whisper urgently. \"Some beast is close!\"");
pn();
pn("Conan nods in agreement, takes the rifle, and starts scanning the darkness. Suddenly, one of the walls of your shelter collapses, and you\'re horrified to see sparkling eyes and enormous fangs. You can smell the stinking breath of the predator right in front of you.");
pn();
    end,
    walk_to = "v_20f27cfd_70a9_48d1_afe5_29256154c65c_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_20f27cfd_70a9_48d1_afe5_29256154c65c_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_13.ogg', 0);
    end,
    sndout = function(s) end,
};

v_20f27cfd_70a9_48d1_afe5_29256154c65c_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_95a7c3e9_0d9a_460a_a911_5c2149d8848e);
        put(v_9c61272c_73fc_4615_b953_79b86a93938f);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_95a7c3e9_0d9a_460a_a911_5c2149d8848e = menu {
    nam = "v_95a7c3e9_0d9a_460a_a911_5c2149d8848e",
    dsc = function(s) return "{Shoot the rifle at the beast}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_20f27cfd_70a9_48d1_afe5_29256154c65c, v_8827a70f_7e36_407f_af59_828075bb42c2, false); 
    end
}

v_9c61272c_73fc_4615_b953_79b86a93938f = menu {
    nam = "v_9c61272c_73fc_4615_b953_79b86a93938f",
    dsc = function(s) return "{Shoot in the air off the rifle}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_20f27cfd_70a9_48d1_afe5_29256154c65c, v_37737a36_05a2_45db_97f9_589334f38072, false); 
    end
}

-- 21.In front of lulling fields
v_538400ba_ef91_49aa_a3ef_5ad720c15e29 = vnr {
    nam = '...',
    notes = '21.In front of lulling fields',
    bgimg = function(s)
        if (true) then
            return 'images/052.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You approach a big meadow with tall plants, topped by panicles of small white flowers. Their fragrance is very strong, sickly sweet.");
pn();
pn(" You can clearly smell it even here, on the edge of the field. In the lowland behind the meadow, your objective can be seen - a small lake; it seems there are no hindrances on your way.");
pn();
pn("");
pn();
    end,
    walk_to = "v_538400ba_ef91_49aa_a3ef_5ad720c15e29_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_538400ba_ef91_49aa_a3ef_5ad720c15e29_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_538400ba_ef91_49aa_a3ef_5ad720c15e29_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_6ac32382_6428_4764_83ba_fa9c022fbed6);
        put(v_9e748fa3_da85_4b55_8979_9d23a3fa3ee3);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_6ac32382_6428_4764_83ba_fa9c022fbed6 = menu {
    nam = "v_6ac32382_6428_4764_83ba_fa9c022fbed6",
    dsc = function(s) return "{Go through the meadow}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_538400ba_ef91_49aa_a3ef_5ad720c15e29, v_65b0fd86_332d_4eb1_8f17_8cd58a848eed, false); 
    end
}

v_9e748fa3_da85_4b55_8979_9d23a3fa3ee3 = menu {
    nam = "v_9e748fa3_da85_4b55_8979_9d23a3fa3ee3",
    dsc = function(s) return "{Try to bypass the meadow}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_538400ba_ef91_49aa_a3ef_5ad720c15e29, v_6b4aa99f_9212_4da4_8f23_37a0e4f5504a, false); 
    end
}

-- 22.Cutting the path through
v_03deb608_0e48_4cd2_991c_5ffc61df0012 = vnr {
    nam = '...',
    notes = '22.Cutting the path through',
    bgimg = function(s)
        if (true) then
            return 'images/065.1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Now it is clear that the path through the lilac plants is deadly dangerous, so you have no other option but to make your way through the thick shrubs of white flower bushes.");
pn();
pn(" It\'s not an easy task to go through them, but your machete helps to clear the way. You make good progress, and soon you see the water body through gaps between bushes.");
pn();
pn("");
pn();
    end,
    walk_to = "v_03deb608_0e48_4cd2_991c_5ffc61df0012_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_03deb608_0e48_4cd2_991c_5ffc61df0012_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_10.ogg', 0);
    end,
    sndout = function(s) end,
};

v_03deb608_0e48_4cd2_991c_5ffc61df0012_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_03deb608_0e48_4cd2_991c_5ffc61df0012, v_50864ff8_7ab3_41f9_918d_bc7b3ac0f573, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 23.Saving Irene. Try luck
v_dcd7b9a1_135a_4f6e_a8dd_fcf3217f901e = vnr {
    nam = '...',
    notes = '23.Saving Irene. Try luck',
    bgimg = function(s)
        if (true) then
            return 'images/069.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You rush to her aid. There is a hand-made machete in your backpack, crafted by you and your dad. Your father grumbled all the time that such a knife is not a toy for kids, but perhaps now it will help you to save your life.");
pn();
pn("");
pn();
pn("Meanwhile, Irene starts to flounder frantically among the branches; soon her arms and legs are solidly trapped.");
pn();
pn("");
pn();
pn("\"Stop, don\'t, let me try.\"");
pn();
pn("");
pn();
pn("The fate of the heroes is in your hands. Decide whether they will be lucky or not.");
pn();
    end,
    walk_to = "v_dcd7b9a1_135a_4f6e_a8dd_fcf3217f901e_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_dcd7b9a1_135a_4f6e_a8dd_fcf3217f901e_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_15.ogg', 0);
    end,
    sndout = function(s) end,
};

v_dcd7b9a1_135a_4f6e_a8dd_fcf3217f901e_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_ffe556ce_6b26_4b53_b4ad_2757d1c1737b);
        put(v_0dcca6ff_0cfe_41d8_95cf_9f6c04bb618f);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_ffe556ce_6b26_4b53_b4ad_2757d1c1737b = menu {
    nam = "v_ffe556ce_6b26_4b53_b4ad_2757d1c1737b",
    dsc = function(s) return "{The heroes are lucky}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dcd7b9a1_135a_4f6e_a8dd_fcf3217f901e, v_36dafe71_a4dd_46d4_ae0f_85e9f8f7ad00, false); 
    end
}

v_0dcca6ff_0cfe_41d8_95cf_9f6c04bb618f = menu {
    nam = "v_0dcca6ff_0cfe_41d8_95cf_9f6c04bb618f",
    dsc = function(s) return "{The heroes are unlucky}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dcd7b9a1_135a_4f6e_a8dd_fcf3217f901e, v_95cef0c7_4983_4034_b06c_9c88f69dcb40, false); 
    end
}

-- 24.Savages
v_55a03675_030b_48f2_9447_28d7a6dd1ce9 = vnr {
    nam = '...',
    notes = '24.Savages',
    bgimg = function(s)
        if (true) then
            return 'images/073.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You greedily fall to the water, drinking. The water is pure, cool, and delicious. Only now, after the long walk to the lake, do you realize how thirsty you really were.");
pn();
pn("");
pn();
pn("When you quench your thirst, you look around. The lake is not very large; its shores are covered in silt and tangles of reeds. On the opposite shore, sunken snags, tangles of rushes, and...");
pn();
    end,
    walk_to = "v_55a03675_030b_48f2_9447_28d7a6dd1ce9_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_55a03675_030b_48f2_9447_28d7a6dd1ce9_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_7.ogg', 0);
    end,
    sndout = function(s) end,
};

v_55a03675_030b_48f2_9447_28d7a6dd1ce9_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_55a03675_030b_48f2_9447_28d7a6dd1ce9, v_02bffc3e_a5ea_4c74_bfa2_8ee390ccbc5c, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 25.
v_b1b28006_2688_4961_b886_7be42bc3c666 = vnr {
    nam = '...',
    notes = '25.',
    bgimg = function(s)
        if (true) then
            return 'images/093.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Grol nuktauru! Trort ugga!\" At first, Doyle\'s voice trembles, but then he pulls himself together and pronounces this gibberish quite menacingly. You don\'t know what that means, but you feel that it takes effect upon the savages.");
pn();
pn("You bring the torch to the lighter; bright fire blazes up, illuminating frightened painted faces. One of the natives tries to look brave.");
pn();
pn(" He has a high headwear of motley bird feathers; evidently, this is the chief of the tribe or the shaman.");
pn();
pn("");
pn();
    end,
    walk_to = "v_b1b28006_2688_4961_b886_7be42bc3c666_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b1b28006_2688_4961_b886_7be42bc3c666_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

v_b1b28006_2688_4961_b886_7be42bc3c666_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_b1b28006_2688_4961_b886_7be42bc3c666, v_fb964da4_e566_45f4_8e7a_3a84f652586a, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 26.Almost happy end
v_63a90193_5791_4ef1_ace1_9dc7b60bb850 = vnr {
    nam = '...',
    notes = '26.Almost happy end',
    bgimg = function(s)
        if (s.tag == 'Conan') then
            return 'images/085.1.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/085.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/085.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You rush to the cage, pulling out branches locking its door. Snoopy puts his paws on your shoulders, trying to lick your face.");
pn();
pn("\"Wait, boy, not now,\" you push him away.");
pn();
pn("Finally, the cage is opened. It\'s dangerous to stay here any longer; most likely, the savages will get brave enough to return soon. You run into the forest, in the opposite direction the savages ran.");
pn();
pn("Soon, the clearing of savages is left far behind. You have no idea where to run next, and your recent deed seems to you total madness now.");
pn();
pn(" But looking at the happy Snoopy running by your side, you come to the conclusion that even crazy deeds have their uses sometimes.");
pn();
pn("");
pn();
    end,
    walk_to = "v_63a90193_5791_4ef1_ace1_9dc7b60bb850_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_63a90193_5791_4ef1_ace1_9dc7b60bb850_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_11.ogg', 0);
    end,
    sndout = function(s) end,
};

v_63a90193_5791_4ef1_ace1_9dc7b60bb850_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_63a90193_5791_4ef1_ace1_9dc7b60bb850, v_80764ae4_b641_4eb4_ab7c_a1795174e8f4, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 27.Beast approaches
v_4b55bf8d_b578_41c1_b1de_0233f57828c6 = vnr {
    nam = '...',
    notes = '27.Beast approaches',
    bgimg = function(s)
        if (s.tag == 'Doyle') then
            return 'images/033.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/033.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/101.jpg';
        elseif (s.tag == 'Henry') then
            return 'images/110.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/110.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/112.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/112.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/112.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You get into your unsafe refuge. It is almost completely dark around; you can see no further than at arm\'s length.");
pn();
pn(" The night jungle is full of life. Somebody bustles about in the trees; you can hear weird rustles and sighs coming from the thicket.");
pn();
pn("");
pn();
pn("Suddenly, forest animals begin to scream especially loudly. You can hear some small, rapid animals climbing up the trees.");
pn();
pn(" It seems that a large predator is approaching. You do your best to discern something in the darkness, but in vain. Besides, it is getting quiet outside...");
pn();
pn("");
pn();
    end,
    walk_to = "v_4b55bf8d_b578_41c1_b1de_0233f57828c6_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_4b55bf8d_b578_41c1_b1de_0233f57828c6_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_6.ogg', 0);
    end,
    sndout = function(s) end,
};

v_4b55bf8d_b578_41c1_b1de_0233f57828c6_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_3bf75209_35b9_4dee_a3f7_d30563bb9715);
if (_haveRifle) then
        put(v_6676ed93_4a27_4987_a187_535d880d9712);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_3bf75209_35b9_4dee_a3f7_d30563bb9715 = menu {
    nam = "v_3bf75209_35b9_4dee_a3f7_d30563bb9715",
    dsc = function(s) return "{Wait}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_4b55bf8d_b578_41c1_b1de_0233f57828c6, v_fa0fc196_061d_4428_abed_fcdb0cb7d061, false); 
    end
}

v_6676ed93_4a27_4987_a187_535d880d9712 = menu {
    nam = "v_6676ed93_4a27_4987_a187_535d880d9712",
    dsc = function(s) return "{\"Conan, keep the rifle in readiness!\"}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_4b55bf8d_b578_41c1_b1de_0233f57828c6, v_20f27cfd_70a9_48d1_afe5_29256154c65c, false); 
    end
}

-- 28.Doyle fainted
v_975210f5_73da_47d8_9442_52a22d36693e = vnr {
    nam = '...',
    notes = '28.Doyle fainted',
    bgimg = function(s)
        if (s.tag == 'Doyle') then
            return 'images/056.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/056.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/119.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/119.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Suddenly, Doyle grabs your shoulder and sinks silently to the ground. His face turns pale, his eyes roll up. You barely manage to hold him, and he collapses in your arms.");
pn();
pn("\"Doyle, Doyle!\" you slap him on the cheeks, trying to revive your friend.");
pn();
pn("At least you see that he is alive; you can hear him breathing and wheezing slightly. You put him down carefully and think desperately about what to do.");
pn();
    end,
    walk_to = "v_975210f5_73da_47d8_9442_52a22d36693e_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_975210f5_73da_47d8_9442_52a22d36693e_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_975210f5_73da_47d8_9442_52a22d36693e_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if ( not _haveConan) then
        put(v_f0a9fa3a_e2c3_4794_b8ba_ca2e37aa52e2);
end;
if (_haveConan) then
        put(v_6f4a2db1_c734_4a81_94ae_f996e85b1285);
end;
        put(v_fb1fc83e_ad74_4b3a_b910_48976212f9ca);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_f0a9fa3a_e2c3_4794_b8ba_ca2e37aa52e2 = menu {
    nam = "v_f0a9fa3a_e2c3_4794_b8ba_ca2e37aa52e2",
    dsc = function(s) return "{Make an attempt to pull Doyle out}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_975210f5_73da_47d8_9442_52a22d36693e, v_d3c6998c_6914_4189_9cf1_ed651f4182e1, false); 
    end
}

v_6f4a2db1_c734_4a81_94ae_f996e85b1285 = menu {
    nam = "v_6f4a2db1_c734_4a81_94ae_f996e85b1285",
    dsc = function(s) return "{Ask Conan to pull Doyle out}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_975210f5_73da_47d8_9442_52a22d36693e, v_6f61a343_3a8f_482c_a60d_f92adc4d6427, false); 
    end
}

v_fb1fc83e_ad74_4b3a_b910_48976212f9ca = menu {
    nam = "v_fb1fc83e_ad74_4b3a_b910_48976212f9ca",
    dsc = function(s) return "{Wait until Doyle regain consciousness}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_975210f5_73da_47d8_9442_52a22d36693e, v_93bcf4f8_7fb9_4edc_8a1a_1ce09acfc530, false); 
    end
}

-- 29.You have nothing to create fire
v_320b91a3_2142_4853_978c_ce972e32429c = vnr {
    nam = '...',
    notes = '29.You have nothing to create fire',
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Most likely Doyle\'s idea would work, although the plan is risky. But unfortunately, you\'ve got nothing to ignite the fire.");
pn();
pn(" You check your rucksack for matches, but there is nothing. At this moment, you regret that neither you nor your friends smoke. Apparently, you can only wait.");
pn();
pn("");
pn();
    end,
    walk_to = "v_320b91a3_2142_4853_978c_ce972e32429c_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_320b91a3_2142_4853_978c_ce972e32429c_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

v_320b91a3_2142_4853_978c_ce972e32429c_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_8780b67d_2d53_457e_8f88_eff97242e964);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_8780b67d_2d53_457e_8f88_eff97242e964 = menu {
    nam = "v_8780b67d_2d53_457e_8f88_eff97242e964",
    dsc = function(s) return "{Wait}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_320b91a3_2142_4853_978c_ce972e32429c, v_a92d3ab3_382d_4e49_add5_c50adacb6ac0, false); 
    end
}

-- 30.Conan wants to fire
v_a130a920_848e_4373_8458_9130d62849d1 = vnr {
    nam = '...',
    notes = '30.Conan wants to fire',
    bgimg = function(s)
        if (s.tag == 'ConanIrene') then
            return 'images/080.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/080.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/130.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/130.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Conan holds the rifle with a bellicose air.");
pn();
pn("\"Henry, let\'s shoot them all! Look at those mugs, they\'re surely cannibals! Then we\'ll decide what to do.\"");
pn();
pn("You want to rescue Snoopy; the savages\' dance does not foreshadow anything good. But Conan\'s proposal seems very dangerous.");
pn();
pn(" Will you be able to defeat a group of strong armed men, even if they are armed only with spears and clubs? After all, they are not wild beasts, but humans. Is there no other way?");
pn();
pn("");
pn();
    end,
    walk_to = "v_a130a920_848e_4373_8458_9130d62849d1_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_a130a920_848e_4373_8458_9130d62849d1_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_4.ogg', 0);
    end,
    sndout = function(s) end,
};

v_a130a920_848e_4373_8458_9130d62849d1_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_2f1cb58a_aa3d_4bd1_91db_b653462d19f1);
        put(v_82a654ae_5dd4_46a8_946e_be2edc5a4b02);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_2f1cb58a_aa3d_4bd1_91db_b653462d19f1 = menu {
    nam = "v_2f1cb58a_aa3d_4bd1_91db_b653462d19f1",
    dsc = function(s) return "{Shoot!}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_a130a920_848e_4373_8458_9130d62849d1, v_979fc173_0a10_41b2_8d2a_296dc6970e6e, false); 
    end
}

v_82a654ae_5dd4_46a8_946e_be2edc5a4b02 = menu {
    nam = "v_82a654ae_5dd4_46a8_946e_be2edc5a4b02",
    dsc = function(s) return "{Dissuade Conan to fire}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_a130a920_848e_4373_8458_9130d62849d1, v_dfe8595d_b446_4f47_96ad_aa2fee687cc8, false); 
    end
}

-- 31.
v_fb964da4_e566_45f4_8e7a_3a84f652586a = vnr {
    nam = '...',
    notes = '31.',
    bgimg = function(s)
        if (true) then
            return 'images/094.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Kumanu kom!\" imperiously says Doyle.");
pn();
pn("");
pn();
pn("The Chief slowly comes to you, without taking his eyes off the flame. You give him the torch, and he accepts it with a slightly shaking hand. He could hardly believe the flame was real.");
pn();
pn("");
pn();
pn("\"Ugga!\" shouts the chief, lifting the torch high. \"Ugga nok!\"");
pn();
pn("");
pn();
pn("\"Ugga!\" echo his fellow tribesmen.");
pn();
pn("");
pn();
pn("\"Rezhak dadd!\" drowning yells of the natives, thunderously herald Doyle, pointing at Snoopy.");
pn();
pn("");
pn();
pn("A few savages rush up to the cage, get Snoopy, and drag him by the rope to you. You understand that Doyle requested a due sacrifice.");
pn();
pn(" Finally, Snoopy is near. He yelps and tries to lick your nose; by shaking hands, you try to calm him down.");
pn();
pn(" The savages that brought Snoopy promptly run back and kneel. Only the chief remains standing. He looks with gratitude at the torch in his hand, and his eyes shine with happiness.");
pn();
pn("");
pn();
    end,
    walk_to = "v_fb964da4_e566_45f4_8e7a_3a84f652586a_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_fb964da4_e566_45f4_8e7a_3a84f652586a_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

v_fb964da4_e566_45f4_8e7a_3a84f652586a_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_fb964da4_e566_45f4_8e7a_3a84f652586a, v_4c830444_262f_49fd_9c4c_705c2abf0e11, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 32.
v_c7dcd833_6fda_47e7_8195_3fe886708a42 = vnr {
    nam = '...',
    notes = '32.',
    bgimg = function(s)
        if (s.tag == 'Conan') then
            return 'images/090.2.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/090.2.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/090.2.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/091.jpg';
        elseif (s.tag == 'Henry') then
            return 'images/099.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/099.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/107.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Beobras comes out of the bushes – Conan\'s father! He is girded by an ammunition belt and holds a shotgun in his hands. Your parents and a large group of men appear from behind the trees.");
pn();
pn("");
pn();
pn("\"Well, Henry, I will give you a proper spanking when we get back!\" father shakes his fist at you.");
pn();
pn("");
pn();
pn("Suddenly, you feel great tiredness, mixed with relief and disappointment. Yes, you survived the night in the jungle, coped with other dangers, but the price for your release was too high...");
pn();
pn(" Adventures are not always the same as books describe them. You close your eyes and give way to your tears.");
pn();
pn("");
pn();
    end,
    walk_to = "v_c7dcd833_6fda_47e7_8195_3fe886708a42_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_c7dcd833_6fda_47e7_8195_3fe886708a42_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_3.ogg', 0);
    end,
    sndout = function(s) end,
};

v_c7dcd833_6fda_47e7_8195_3fe886708a42_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_c7dcd833_6fda_47e7_8195_3fe886708a42_13ebd3d5_334b_4194_8f20_d189ea66a973__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_c7dcd833_6fda_47e7_8195_3fe886708a42_13ebd3d5_334b_4194_8f20_d189ea66a973__Return = menu {
    nam = "v_c7dcd833_6fda_47e7_8195_3fe886708a42_13ebd3d5_334b_4194_8f20_d189ea66a973__Return",
    dsc = function(s) return "{The End}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_c7dcd833_6fda_47e7_8195_3fe886708a42, v_13ebd3d5_334b_4194_8f20_d189ea66a973, false); 
    end
}

-- 33.The savages flee
v_c0b6aa6f_dc2c_485f_a25c_659cfaa84341 = vnr {
    nam = '...',
    notes = '33.The savages flee',
    bgimg = function(s)
        if (s.tag == 'Conan') then
            return 'images/084.1.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/084.1.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/084.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/084_1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("It looks like your surprise deadly attack made you dreadful opponents in the eyes of the natives, almost equal to gods.");
pn();
pn(" Some savages dropped their spears and ran into the forest yelling in fear. Some fell on their knees shaking, covering their heads with their hands.");
pn();
pn(" When you found yourselves on the clearing where the natives were dancing, some sudden movement from the right drew your attention.");
pn();
pn(" You quickly turn and see a cage with Snoopy in it. He barks and jumps at the cage bars, showing his joy, as if he is not captured on the alien island.");
pn();
pn("");
pn();
pn("");
pn();
pn("But you don\'t look at Snoopy. You look at one of the savages, slain by Conan\'s shot. This is a young bloke, a bit older than you.");
pn();
pn(" A grimace of pain, astonishment, and fear is solidified on his once handsome face. A large pool of blood shows black beneath him. It seems the bullet pierced his heart, and death was instantaneous.");
pn();
pn("");
pn();
pn("");
pn();
pn("\"These were enemies!\" you reiterate to yourself. \"They deserved it! These were enemies!\"");
pn();
    end,
    walk_to = "v_c0b6aa6f_dc2c_485f_a25c_659cfaa84341_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_c0b6aa6f_dc2c_485f_a25c_659cfaa84341_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_11.ogg', 0);
    end,
    sndout = function(s) end,
};

v_c0b6aa6f_dc2c_485f_a25c_659cfaa84341_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_c0b6aa6f_dc2c_485f_a25c_659cfaa84341, v_63a90193_5791_4ef1_ace1_9dc7b60bb850, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 34.The beast got scared of shooting and ran away
v_37737a36_05a2_45db_97f9_589334f38072 = vnr {
    nam = '...',
    notes = '34.The beast got scared of shooting and ran away',
    bgimg = function(s)
        if (s.tag == 'NotCaveDoyle') then
            return 'images/040.jpg';
        elseif (s.tag == 'Cave') then
            return 'images/047.jpg';
        elseif (s.tag == 'NotCave') then
            return 'images/125.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Conan!\" you whisper urgently, \"the rifle...shoot!\"");
pn();
pn("");
pn();
pn("Trembling with fear, Conan takes his father\'s double-barrelled rifle and points it at the beast... And at that moment, it occurs to you that it might not be so easy to kill the predator. Maybe it\'s better to scare him off?");
pn();
pn("");
pn();
pn("\"Wait, don\'t shoot at him, shoot in the air!\"");
pn();
pn("");
pn();
pn("In another situation, Conan would probably argue, but now he is too scared. A shot rings out. The beast snorts abruptly and steps back.");
pn();
pn("");
pn();
pn("\"Shoot again, from the other barrel! Shoo, dog, buzz off, A-A-A-A!\"");
pn();
pn("");
pn();
pn("Conan shoots once again. You can hear the screams of animals, running away deeper into the forest. You shout as loudly as possible, advancing towards the predator.");
pn();
pn(" And just when you think that you are done for, the beast wavers. Its frightful burning eyes vanish into the thicket, and a ringing silence falls upon the glade.");
pn();
pn("");
pn();
    end,
    walk_to = "v_37737a36_05a2_45db_97f9_589334f38072_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_37737a36_05a2_45db_97f9_589334f38072_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg2 then
            stead.add_var { _tagsArg2 = nlb:clonelst(listobj, "_tagsArg2"); }
        end;
        nlb:push(_tagsArg2.listnam, s);
nlb:acta(v_b2c6873a_69ac_46a9_8016_2b8028936bd3);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_11.ogg', 0);
    end,
    sndout = function(s) end,
};

v_37737a36_05a2_45db_97f9_589334f38072_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_37737a36_05a2_45db_97f9_589334f38072, v_214e9f88_e774_40e8_b7bc_209cfeeccc42, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 35.Overnight stay on the glade
v_b98d5019_ca4d_47d8_860c_834c4d09fd4a = vnr {
    nam = '...',
    notes = '35.Overnight stay on the glade',
    bgimg = function(s)
        if (s.tag == 'Doyle') then
            return 'images/032.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/032.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/032.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/032.jpg';
        elseif (s.tag == 'Henry') then
            return 'images/109.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/109.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/109.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/109.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("After thinking for a moment, you decide that staying overnight on the glade is not so bad after all. Besides, you aren\'t going to sleep like that on the ground; any Mech-City boy can make a plain shelter of fallen branches.");
pn();
pn(" Soon, you proudly admire the assembled structure... Unfortunately, you are not in your courtyard, but in the alien, dangerous forest. It\'s getting dark. It\'s time to get ready for sleep.");
pn();
pn("");
pn();
    end,
    walk_to = "v_b98d5019_ca4d_47d8_860c_834c4d09fd4a_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b98d5019_ca4d_47d8_860c_834c4d09fd4a_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_b98d5019_ca4d_47d8_860c_834c4d09fd4a_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if (_haveLighter) then
        put(v_dc5e5fa3_d324_4fa6_a382_04987ac23c49);
end;
        put(v_29da5c5f_473b_4bc4_8b01_034ac3da79cc);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_dc5e5fa3_d324_4fa6_a382_04987ac23c49 = menu {
    nam = "v_dc5e5fa3_d324_4fa6_a382_04987ac23c49",
    dsc = function(s) return "{Build a fire}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_b98d5019_ca4d_47d8_860c_834c4d09fd4a, v_23d04f0f_26c4_4588_ab2f_de6ff62f0f02, false); 
    end
}

v_29da5c5f_473b_4bc4_8b01_034ac3da79cc = menu {
    nam = "v_29da5c5f_473b_4bc4_8b01_034ac3da79cc",
    dsc = function(s) return "{Go to sleep}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_b98d5019_ca4d_47d8_860c_834c4d09fd4a, v_4b55bf8d_b578_41c1_b1de_0233f57828c6, false); 
    end
}

-- 36.The beast attacked. Bad end
v_0b938d42_2253_452d_afd8_7677f15c722b = vnr {
    nam = '...',
    notes = '36.The beast attacked. Bad end',
    bgimg = function(s)
        if (s.tag == 'NotCave') then
            return 'images/041.jpg';
        elseif (s.tag == 'NotCaveDoyle') then
            return 'images/041.jpg';
        elseif (s.tag == 'Cave') then
            return 'images/046.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Conan!\" you whisper urgently, \"the rifle...shoot!\"");
pn();
pn("Trembling with fear, Conan points father\'s double-barrelled rifle at the beast. Seconds crawl slowly, agonizingly slowly...");
pn();
pn("Finally, he fires. The hushed jungle is torn by a wild howl. For a moment, you think that you\'ve made it, but the beast seems to be intact.");
pn();
pn(" Conan has probably managed to injure it, but the wound is not lethal. Evidently, the beast is furious.");
pn();
pn("");
pn();
pn("Conan is about to shoot the second barrel, but at that moment the predator advances. You hear the awful screams of your friends and try to flee, but it\'s too late. Your adventure ends here.");
pn();
    end,
    walk_to = "v_0b938d42_2253_452d_afd8_7677f15c722b_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_0b938d42_2253_452d_afd8_7677f15c722b_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg2 then
            stead.add_var { _tagsArg2 = nlb:clonelst(listobj, "_tagsArg2"); }
        end;
        nlb:push(_tagsArg2.listnam, s);
nlb:acta(v_b2c6873a_69ac_46a9_8016_2b8028936bd3);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_12.ogg', 0);
    end,
    sndout = function(s) end,
};

v_0b938d42_2253_452d_afd8_7677f15c722b_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_0b938d42_2253_452d_afd8_7677f15c722b_b70d51a3_29a1_4884_84a3_6557956a94a9__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_0b938d42_2253_452d_afd8_7677f15c722b_b70d51a3_29a1_4884_84a3_6557956a94a9__Return = menu {
    nam = "v_0b938d42_2253_452d_afd8_7677f15c722b_b70d51a3_29a1_4884_84a3_6557956a94a9__Return",
    dsc = function(s) return "{Try again}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_0b938d42_2253_452d_afd8_7677f15c722b, v_b70d51a3_29a1_4884_84a3_6557956a94a9, false); 
    end
}

-- 37.
v_11e1935e_b7e4_4475_a482_5b4d9bbf4afd = vnr {
    nam = '...',
    notes = '37.',
    bgimg = function(s)
        if (true) then
            return 'images/075.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You promptly make a few torches of dry reed. Of course, they won\'t burn long, but you bet on the element of surprise.");
pn();
pn(" At last, everything is prepared. Your heart thumps, but you think it\'s better to do something than just sit and wait. Doyle cracks the lighter, and the torches instantly ignite. Time to go!");
pn();
pn("");
pn();
    end,
    walk_to = "v_11e1935e_b7e4_4475_a482_5b4d9bbf4afd_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_11e1935e_b7e4_4475_a482_5b4d9bbf4afd_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

v_11e1935e_b7e4_4475_a482_5b4d9bbf4afd_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_11e1935e_b7e4_4475_a482_5b4d9bbf4afd, v_13dbbd92_15d4_406d_8aca_0e7f197119c1, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 38.Sedative fields
v_65b0fd86_332d_4eb1_8f17_8cd58a848eed = vnr {
    nam = '...',
    notes = '38.Sedative fields',
    bgimg = function(s)
        if (s.tag == 'Conan') then
            return 'images/053.1.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/053.1.jpg';
        elseif (s.tag == 'Henry') then
            return 'images/053.jpg';
        elseif (s.tag == 'Doyle') then
            return 'images/055.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/116.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/118.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/118.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/122.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You push through the wall of tall, odorous plants. A strong, sickly sweet smell surrounds you from all sides, shrouding you in its scent.");
pn();
pn(" It feels as though you\'re parting not just the stems, but the very wall of smell, which is almost tangible.");
pn();
pn(" It\'s very damp here, and the ground is slippery. But the objective appears to be so close, and you\'re stubbornly marching forward.");
pn();
pn("");
pn();
pn("");
pn();
pn("Despite the inconveniences, you advance pretty fast. It\'s strange, but you have no more worries about your fate; even the scary night in the forest comes to your mind as if it had happened long ago to somebody else.");
pn();
pn(" Somehow you start thinking that as soon as you reach water, your adventure will be over, you will find Snoopy, and go home to take a nap.");
pn();
pn("");
pn();
pn("");
pn();
pn("Yeah, it\'s a good idea - to take a nap... A slight wind is blowing; waves are running through the meadow, and the ground doesn\'t seem damp anymore. Maybe you should really take a nap. Just half an hour...");
pn();
    end,
    walk_to = "v_65b0fd86_332d_4eb1_8f17_8cd58a848eed_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_65b0fd86_332d_4eb1_8f17_8cd58a848eed_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_65b0fd86_332d_4eb1_8f17_8cd58a848eed_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if ( not _haveConan) then
        put(v_61f822b8_08d3_46c8_8d34_504f89b868bd);
end;
if (_haveConan) then
        put(v_712053c4_7df8_408a_a097_44403881bab3);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_61f822b8_08d3_46c8_8d34_504f89b868bd = menu {
    nam = "v_61f822b8_08d3_46c8_8d34_504f89b868bd",
    dsc = function(s) return "{Take a nap}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_65b0fd86_332d_4eb1_8f17_8cd58a848eed, v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8, false); 
    end
}

v_712053c4_7df8_408a_a097_44403881bab3 = menu {
    nam = "v_712053c4_7df8_408a_a097_44403881bab3",
    dsc = function(s) return "{Next}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_65b0fd86_332d_4eb1_8f17_8cd58a848eed, v_a9360c02_a11a_47ba_8e0b_b2806be7cad4, false); 
    end
}

-- 39.Beast got away being scared of fire
v_d431c77f_4ada_48ca_9abf_3cc36fd0170e = vnr {
    nam = '...',
    notes = '39.Beast got away being scared of fire',
    bgimg = function(s)
        if (s.tag == 'ConanDoyle') then
            return 'images/036.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/104.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You freeze on the spot, trying hastily to come up with something, but your body refuses to obey; you can\'t even think.");
pn();
pn(" Suddenly, Conan springs to the fire with a war cry, snatches out a flaming firebrand, and hurls it at the chest of the dreadful beast.");
pn();
pn(" It recoils with a wild howl filling the forest. Conan keeps throwing burning branches at the beast, shouting as loud as he can.");
pn();
pn("");
pn();
pn("");
pn();
pn("The beast retreats. It is an old, experienced predator that knows how painfully the fire can bite. Moving backwards, it roars with fright and anger once again, and then in the twinkling of an eye, the creature disappears into the thicket. Conan collapses to the ground.");
pn();
    end,
    walk_to = "v_d431c77f_4ada_48ca_9abf_3cc36fd0170e_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_d431c77f_4ada_48ca_9abf_3cc36fd0170e_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_d431c77f_4ada_48ca_9abf_3cc36fd0170e_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_d431c77f_4ada_48ca_9abf_3cc36fd0170e, v_214e9f88_e774_40e8_b7bc_209cfeeccc42, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 40.The savages are astonished and release Snoopy
v_859fea18_5b44_43d6_a59a_b51fa226ff02 = vnr {
    nam = '...',
    notes = '40.The savages are astonished and release Snoopy',
    bgimg = function(s)
        if (true) then
            return 'images/092.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You promptly roll up something like a torch from dry reed. Doyle cracks the flint, and a tongue of flame appears from his fist.");
pn();
pn(" Together you come out in front of the savages. They immediately stop dancing and aim tips of spears at you, but when they see the waving flame above Doyle\'s hand, the spears begin to shiver. Some savages instantly fall on their knees and begin to mumble something, lifting up their hands.");
pn();
pn("");
pn();
    end,
    walk_to = "v_859fea18_5b44_43d6_a59a_b51fa226ff02_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_859fea18_5b44_43d6_a59a_b51fa226ff02_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_859fea18_5b44_43d6_a59a_b51fa226ff02_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_859fea18_5b44_43d6_a59a_b51fa226ff02, v_b1b28006_2688_4961_b886_7be42bc3c666, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 41.Check your luck
v_8827a70f_7e36_407f_af59_828075bb42c2 = vnr {
    nam = '...',
    notes = '41.Check your luck',
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The fate of the heroes is in your hands. Decide whether they will be lucky or not.");
pn();
    end,
    walk_to = "v_8827a70f_7e36_407f_af59_828075bb42c2_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_8827a70f_7e36_407f_af59_828075bb42c2_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

v_8827a70f_7e36_407f_af59_828075bb42c2_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_cdee481d_6485_40f1_a240_f6dcf1b07b92);
        put(v_fb0c3ef9_7662_43b3_ac6e_0ed0b8932d51);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_cdee481d_6485_40f1_a240_f6dcf1b07b92 = menu {
    nam = "v_cdee481d_6485_40f1_a240_f6dcf1b07b92",
    dsc = function(s) return "{The heroes are lucky}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_8827a70f_7e36_407f_af59_828075bb42c2, v_548e4fa8_0fdc_4af5_809b_b9cafebff02c, false); 
    end
}

v_fb0c3ef9_7662_43b3_ac6e_0ed0b8932d51 = menu {
    nam = "v_fb0c3ef9_7662_43b3_ac6e_0ed0b8932d51",
    dsc = function(s) return "{The heroes are unlucky}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_8827a70f_7e36_407f_af59_828075bb42c2, v_0b938d42_2253_452d_afd8_7677f15c722b, false); 
    end
}

-- 42.Keep on going
v_f3698e8c_c032_4b8b_9fc8_040c5fc65e4d = vnr {
    nam = '...',
    notes = '42.Keep on going',
    bgimg = function(s)
        if (true) then
            return 'images/071.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("After having some rest, you continue along the edge of the forest. It looks like the lake is just a stone\'s throw away, but in fact, it takes much time before you step onto its oozy shore.");
pn();
    end,
    walk_to = "v_f3698e8c_c032_4b8b_9fc8_040c5fc65e4d_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_f3698e8c_c032_4b8b_9fc8_040c5fc65e4d_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_18.ogg', 0);
    end,
    sndout = function(s) end,
};

v_f3698e8c_c032_4b8b_9fc8_040c5fc65e4d_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_f3698e8c_c032_4b8b_9fc8_040c5fc65e4d, v_55a03675_030b_48f2_9447_28d7a6dd1ce9, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 43.Conan pulled everyone out
v_6f61a343_3a8f_482c_a60d_f92adc4d6427 = vnr {
    nam = '...',
    notes = '43.Conan pulled everyone out',
    bgimg = function(s)
        if (true) then
            return 'images/059.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Henry, what happened to him?!\" asks Conan worriedly.");
pn();
pn("");
pn();
pn("\"This is the plants\' smell. Quickly, we\'ve got to pull him out of here! It\'s high time we cleared off!\"");
pn();
pn("");
pn();
pn("Together you grab Doyle and drag him towards the underbrush. Soon the smell makes you feel giddy, but you desperately make one last burst and reach the objective.");
pn();
pn(" Carrying Doyle away from hazardous fields as far as possible, you both fall on the ground fully exhausted.");
pn();
pn("");
pn();
    end,
    walk_to = "v_6f61a343_3a8f_482c_a60d_f92adc4d6427_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_6f61a343_3a8f_482c_a60d_f92adc4d6427_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_6f61a343_3a8f_482c_a60d_f92adc4d6427_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_6f61a343_3a8f_482c_a60d_f92adc4d6427, v_f3698e8c_c032_4b8b_9fc8_040c5fc65e4d, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 44.You managed to save Irene
v_36dafe71_a4dd_46d4_ae0f_85e9f8f7ad00 = vnr {
    nam = '...',
    notes = '44.You managed to save Irene',
    bgimg = function(s)
        if (true) then
            return 'images/068.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("By swift and accurate stroke, you chop off the predatory branch adhered to Irene. Then you grab her shoulders, pull back, and both of you fall powerlessly on the grass, gasping for air.");
pn();
pn(" Irene embraces you tightly, shaking in sobs. So you sit on the ground, holding each other, trying not to think about the gruesome fate that you miraculously managed to escape. Irene sobs louder and cuddles tighter up to you. You wipe her tears, feeling a strange emotion.");
pn();
pn("");
pn();
    end,
    walk_to = "v_36dafe71_a4dd_46d4_ae0f_85e9f8f7ad00_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_36dafe71_a4dd_46d4_ae0f_85e9f8f7ad00_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_17.ogg', 0);
    end,
    sndout = function(s) end,
};

v_36dafe71_a4dd_46d4_ae0f_85e9f8f7ad00_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_36dafe71_a4dd_46d4_ae0f_85e9f8f7ad00, v_03deb608_0e48_4cd2_991c_5ffc61df0012, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 45.Beast OK
v_e8670409_2f74_43ef_abbb_4cc22d3ab107 = vnr {
    nam = '...',
    notes = '45.Beast OK',
    bgimg = function(s)
        if (s.tag == 'Henry') then
            return 'images/030.1.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/030.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/030.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/124.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("It\'s very dark, and you can\'t see further than at arm\'s length. You can hear some animals moving up and down the adjacent trees; you are becoming a bit nervous.");
pn();
pn(" No one can guarantee that all predators of the island are unable to climb trees. Still, the decision is made, and there is no way to change it.");
pn();
pn("");
pn();
pn("");
pn();
pn("Suddenly, a loud roaring, snapping of twigs, and a heartrending screech are heard from below. Soon the screech stops, replaced by blood-chilling silence, and you hear horrible sounds of flesh being torn apart.");
pn();
pn(" It looks like some large predator caught its prey. You press yourself to the trunk of the tree, trying not to make any noise.");
pn();
pn(" Horrible sounds subside soon. After some time, the night is full of sounds again, made by forest inhabitants. Your eyes are becoming heavy, your mind is getting clouded... You fall asleep.");
pn();
pn("");
pn();
    end,
    walk_to = "v_e8670409_2f74_43ef_abbb_4cc22d3ab107_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_e8670409_2f74_43ef_abbb_4cc22d3ab107_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_e8670409_2f74_43ef_abbb_4cc22d3ab107_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_e8670409_2f74_43ef_abbb_4cc22d3ab107, v_dd64149c_4cdf_4aad_b626_1426318a5327, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 46.
v_7892eb0c_f134_44c9_b25d_650fe58f963e = vnr {
    nam = '...',
    notes = '46.',
    bgimg = function(s)
        if (s.tag == 'DoyleIrene') then
            return 'images/096.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/096.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("After a while, you walk through the jungle, barely catching up with the stout natives. At last, you hear the rumble and feel tremors under your feet. Soon, you reach the edge of the Wild Island. Your heart thumps because home is very close.");
pn();
pn("");
pn();
pn("By an easy jump, you cross the precipice, trying not to look down. You turn around and see your guides lifting their hands up to the sky. You wave farewell to them.");
pn();
pn("");
pn();
pn("Your return is right in time. Once more, the Wild Island strikes the opposite shore and stately floats away. You follow it with your eyes. Who knows if you will see it so close again in your life.");
pn();
pn("");
pn();
pn("\"Do you think anyone will believe us, or not?\" thoughtfully asked Doyle.");
pn();
pn("");
pn();
pn("\"I don\'t know if someone will believe us, but corporal punishment is guaranteed!\" you grin.");
pn();
pn("");
pn();
pn("You take Snoopy by the dog leash and go home. No matter what adults and kids on the street will say, you know for sure where you\'ve been and what you experienced. And the most important thing is, you know that you won!");
pn();
    end,
    walk_to = "v_7892eb0c_f134_44c9_b25d_650fe58f963e_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_7892eb0c_f134_44c9_b25d_650fe58f963e_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_3.ogg', 0);
    end,
    sndout = function(s) end,
};

v_7892eb0c_f134_44c9_b25d_650fe58f963e_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_7892eb0c_f134_44c9_b25d_650fe58f963e_13ebd3d5_334b_4194_8f20_d189ea66a973__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_7892eb0c_f134_44c9_b25d_650fe58f963e_13ebd3d5_334b_4194_8f20_d189ea66a973__Return = menu {
    nam = "v_7892eb0c_f134_44c9_b25d_650fe58f963e_13ebd3d5_334b_4194_8f20_d189ea66a973__Return",
    dsc = function(s) return "{The End}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_7892eb0c_f134_44c9_b25d_650fe58f963e, v_13ebd3d5_334b_4194_8f20_d189ea66a973, false); 
    end
}

-- 47.Preparations for the overnight stay on the tree
v_7b5fdea2_b92f_49a2_ae02_ea83f9fa1923 = vnr {
    nam = '...',
    notes = '47.Preparations for the overnight stay on the tree',
    bgimg = function(s)
        if (s.tag == 'Conan') then
            return 'images/029.1.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/029.1.jpg';
        elseif (s.tag == 'Henry') then
            return 'images/029.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/123.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You recall a book you recently read about Robinson Crusoe. Once on the island, Robinson spent his first night in a tree to avoid predator attacks. Good idea! It\'s useful to read books after all!");
pn();
pn("");
pn();
pn("It\'s fortunate that you and your friends won the cup of Mech-City in tree climbing. In no time, you find a suitable tree and climb it. Resting on the branches might not be as comfortable as on the ground, but it\'s certainly safer.");
pn();
pn("");
pn();
pn("Meanwhile, darkness falls, and the sounds of the night jungle surround you. It would be wise to take a nap to conserve strength for tomorrow.");
pn();
    end,
    walk_to = "v_7b5fdea2_b92f_49a2_ae02_ea83f9fa1923_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_7b5fdea2_b92f_49a2_ae02_ea83f9fa1923_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_7b5fdea2_b92f_49a2_ae02_ea83f9fa1923_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_7b5fdea2_b92f_49a2_ae02_ea83f9fa1923, v_e8670409_2f74_43ef_abbb_4cc22d3ab107, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 48.The plant is destroyed 
v_92a0f71b_4f24_46b4_8860_7c5ecdd30fe9 = vnr {
    nam = '...',
    notes = '48.The plant is destroyed ',
    bgimg = function(s)
        if (true) then
            return 'images/065.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Trying not to make any abrupt movements, you carefully take the canister of herbicide with your free hand, remove the stopper with your teeth, and shower the predatory branch adhered to your arm.");
pn();
pn(" The fuzz, covered with shining drops, begins to turn dark and shrink before your eyes, but the stubborn plant keeps holding you.");
pn();
pn(" Quite a lot of time passes before the substance finally kills the clammy fuzz stuck to your arm. You step back very carefully and fall powerlessly on the grass, gasping for air.");
pn();
pn("");
pn();
pn("");
pn();
pn("When you recover completely, you go back. Now it is clear that the path through the lilac plants is deadly dangerous, so you have no other option but to make your way through the thick shrubs of white flower bushes.");
pn();
    end,
    walk_to = "v_92a0f71b_4f24_46b4_8860_7c5ecdd30fe9_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_92a0f71b_4f24_46b4_8860_7c5ecdd30fe9_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_12.ogg', 0);
    end,
    sndout = function(s) end,
};

v_92a0f71b_4f24_46b4_8860_7c5ecdd30fe9_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_92a0f71b_4f24_46b4_8860_7c5ecdd30fe9, v_00e98bcd_db76_4738_8d60_cb2016cdab51, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 49.Conan pulled out
v_a9360c02_a11a_47ba_8e0b_b2806be7cad4 = vnr {
    nam = '...',
    notes = '49.Conan pulled out',
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You take the rucksack off your back and slowly sink to the ground, right onto the soft underlayer of herbs. You can hardly keep your eyes open, your mind clouds...");
pn();
pn("");
pn();
pn("\"Hey, Henry, what\'s wrong with you?\" you hear the worried voice of Conan.");
pn();
pn("");
pn();
pn("\"Nothing ... eh... Conan, let\'s rest a little. Maybe take a nap?\"");
pn();
pn("");
pn();
pn("\"What are you talking about?! Listen, you\'re so pale! Henry!..\"");
pn();
pn("");
pn();
pn("Everything is swimming before your eyes. Like from aside, you see Conan pulling your arm, trying to pick you up. Then comes deep oblivion.");
pn();
    end,
    walk_to = "v_a9360c02_a11a_47ba_8e0b_b2806be7cad4_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_a9360c02_a11a_47ba_8e0b_b2806be7cad4_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_a9360c02_a11a_47ba_8e0b_b2806be7cad4_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_a9360c02_a11a_47ba_8e0b_b2806be7cad4, v_115c4e79_648f_4fd1_832c_a9d48e45d7e1, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 50.Predatory plant
v_3c5af7f4_ad7a_41ca_9650_285197e26b9b = vnr {
    nam = '...',
    notes = '50.Predatory plant',
    bgimg = function(s)
        if (true) then
            return 'images/062.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You bravely walk to the shrubs of lilac plants, and when you touch branches in order to move them apart, you feel something humid and sticky on your hand!");
pn();
pn(" The branch is entirely covered with fuzz glittering with drops of limpid liquid. You try to jerk your hand away and release it, but all in vain, the fuzz is holding it tenaciously.");
pn();
pn(" Other branches are trembling eagerly near you as if they were alive. You feel like a fly, trapped in a web. You need to pull yourself together and find a way out.");
pn();
pn("");
pn();
    end,
    walk_to = "v_3c5af7f4_ad7a_41ca_9650_285197e26b9b_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_3c5af7f4_ad7a_41ca_9650_285197e26b9b_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_10.ogg', 0);
    end,
    sndout = function(s) end,
};

v_3c5af7f4_ad7a_41ca_9650_285197e26b9b_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if (_haveHerbicide) then
        put(v_ef06535c_41a6_4bee_a325_7610518a5bee);
end;
        put(v_d8cc54ca_68da_488d_93f3_13cc60587543);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_ef06535c_41a6_4bee_a325_7610518a5bee = menu {
    nam = "v_ef06535c_41a6_4bee_a325_7610518a5bee",
    dsc = function(s) return "{Use herbicide}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_3c5af7f4_ad7a_41ca_9650_285197e26b9b, v_92a0f71b_4f24_46b4_8860_7c5ecdd30fe9, false); 
    end
}

v_d8cc54ca_68da_488d_93f3_13cc60587543 = menu {
    nam = "v_d8cc54ca_68da_488d_93f3_13cc60587543",
    dsc = function(s) return "{Try to break away}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_3c5af7f4_ad7a_41ca_9650_285197e26b9b, v_0b5f981a_d3be_4338_90b0_6a63768b590d, false); 
    end
}

-- 51.Bypassing the fields
v_6b4aa99f_9212_4da4_8f23_37a0e4f5504a = vnr {
    nam = '...',
    notes = '51.Bypassing the fields',
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("It comes to your mind that you heard about these plants somewhere. And there was a strange word...seda...");
pn();
pn("seti... Anyway, you don\'t like their smell, and if you go deep into the field, it will obviously become stronger.");
pn();
pn("");
pn();
pn("");
pn();
pn("Having made the decision, you move along the field edge, trying to avoid at least these plants. However, their rows are limitless; it seems that there is no end to it.");
pn();
pn(" You can see sparse underbrush up ahead that you can walk through towards the lake. You wish to reach it soon because it\'s getting hot, and the smell is still strong.");
pn();
pn("");
pn();
    end,
    walk_to = "v_6b4aa99f_9212_4da4_8f23_37a0e4f5504a_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_6b4aa99f_9212_4da4_8f23_37a0e4f5504a_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_6b4aa99f_9212_4da4_8f23_37a0e4f5504a_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if (_haveDoyle) then
        nlb:nlbwalk(v_6b4aa99f_9212_4da4_8f23_37a0e4f5504a, v_975210f5_73da_47d8_9442_52a22d36693e, false); 
    return;
end;
if ( not _haveDoyle) then
        nlb:nlbwalk(v_6b4aa99f_9212_4da4_8f23_37a0e4f5504a, v_84e6f39f_4457_411a_9fc2_a3ac7f7923f5, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 52.
v_31a24a48_d860_4458_8691_6600ebbb57e0 = vnr {
    nam = '...',
    notes = '52.',
    bgimg = function(s)
        if (s.tag == 'Conan') then
            return 'images/090.1.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/090.1.jpg';
        elseif (s.tag == 'Doyle') then
            return 'images/090.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/090.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/106.jpg';
        elseif (s.tag == 'Henry') then
            return 'images/098.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/098.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/106.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("After some time, you are already tied up by the pole with the totem. The savages continue their dancing around it, and the expressions on their faces you don\'t like at all.");
pn();
pn("");
pn();
pn("Suddenly, there is a clap of a shot. The savage nearest to you snatches at his chest, then takes his blood-stained hand to his eyes and falls dead.");
pn();
pn(" Several more shots sound, finding their targets. The savages begin to panic. Some of them fall on the ground shaking, covering their heads with their hands.");
pn();
pn(" But most of them run away, dropping their weapons. Soon, only corpses and sparsely scattered people trembling in fear can be seen on the clearing.");
pn();
pn("");
pn();
    end,
    walk_to = "v_31a24a48_d860_4458_8691_6600ebbb57e0_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_31a24a48_d860_4458_8691_6600ebbb57e0_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_2.ogg', 0);
    end,
    sndout = function(s) end,
};

v_31a24a48_d860_4458_8691_6600ebbb57e0_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_31a24a48_d860_4458_8691_6600ebbb57e0, v_c7dcd833_6fda_47e7_8195_3fe886708a42, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 53.Facing predatory plants
v_b339854a_79da_483b_8bb0_913dc1d59ea2 = vnr {
    nam = '...',
    notes = '53.Facing predatory plants',
    bgimg = function(s)
        if (true) then
            return 'images/061.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You walk along the animal trail pretty fast. It\'s quite easy; you don\'t even have to move branches apart.");
pn();
pn(" You are surrounded by short bushes, richly studded with white flowers. They are so numerous that you can hardly see the leaves. Their smell is rather nice.");
pn();
pn("");
pn();
pn("");
pn();
pn("You are almost halfway to your destination. Thickets become denser. Actually, you see some new plants.");
pn();
pn(" These are short, one-meter-high bushes, with beautiful lilac flowers. A pleasant sweetish smell is coming from them.");
pn();
pn(" It\'s strange, but there is almost no grass near these bushes. The bushes with white flowers form a rather dense living wall, with lilac bushes growing quite sparsely.");
pn();
pn(" You need to decide whether to thread your way through the thickets of white bushes or try to go through the lilac ones.");
pn();
pn("");
pn();
    end,
    walk_to = "v_b339854a_79da_483b_8bb0_913dc1d59ea2_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b339854a_79da_483b_8bb0_913dc1d59ea2_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_9.ogg', 0);
    end,
    sndout = function(s) end,
};

v_b339854a_79da_483b_8bb0_913dc1d59ea2_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_cfc20c6b_1c04_4b88_b399_71d9dfd53ada);
        put(v_28181655_d2a2_4d29_b66a_e088d908a379);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_cfc20c6b_1c04_4b88_b399_71d9dfd53ada = menu {
    nam = "v_cfc20c6b_1c04_4b88_b399_71d9dfd53ada",
    dsc = function(s) return "{Go through the thickets of lilac flower bushes}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_b339854a_79da_483b_8bb0_913dc1d59ea2, v_3c5af7f4_ad7a_41ca_9650_285197e26b9b, false); 
    end
}

v_28181655_d2a2_4d29_b66a_e088d908a379 = menu {
    nam = "v_28181655_d2a2_4d29_b66a_e088d908a379",
    dsc = function(s) return "{Try to thread your way through the thickets of white flower bushes}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_b339854a_79da_483b_8bb0_913dc1d59ea2, v_ce29eada_1358_450c_8c4a_d09a4b7015ef, false); 
    end
}

-- 54.Dissuade Conan to fire
v_dfe8595d_b446_4f47_96ad_aa2fee687cc8 = vnr {
    nam = '...',
    notes = '54.Dissuade Conan to fire',
    bgimg = function(s)
        if (s.tag == 'ConanIrene') then
            return 'images/081.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/081.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/130.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/130.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Conan, no!\" you say firmly. \"First, those are people; secondly, there are too many of them. They will just kill us! There must be another way.\"");
pn();
pn("\"As you wish,\" Conan disappointedly lowers the rifle and spits. \"I don\'t see another way.\"");
pn();
    end,
    walk_to = "v_dfe8595d_b446_4f47_96ad_aa2fee687cc8_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_dfe8595d_b446_4f47_96ad_aa2fee687cc8_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_4.ogg', 0);
    end,
    sndout = function(s) end,
};

v_dfe8595d_b446_4f47_96ad_aa2fee687cc8_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_92d353d9_23b8_42c5_89b7_cfab208443d5);
if (_haveDoyle) then
        put(v_1643a9de_102c_4b67_97de_dc55a2c350f4);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_92d353d9_23b8_42c5_89b7_cfab208443d5 = menu {
    nam = "v_92d353d9_23b8_42c5_89b7_cfab208443d5",
    dsc = function(s) return "{Wait}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dfe8595d_b446_4f47_96ad_aa2fee687cc8, v_a92d3ab3_382d_4e49_add5_c50adacb6ac0, false); 
    end
}

v_1643a9de_102c_4b67_97de_dc55a2c350f4 = menu {
    nam = "v_1643a9de_102c_4b67_97de_dc55a2c350f4",
    dsc = function(s) return "{Ask Doyle to negotiate with the savages}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dfe8595d_b446_4f47_96ad_aa2fee687cc8, v_e7ea2780_e7c1_4b1c_b9f6_0043ed9384f7, false); 
    end
}

-- 55.You managed to break free
v_d8f6c96f_b19e_49fe_a111_69e0dbf6fd10 = vnr {
    nam = '...',
    notes = '55.You managed to break free',
    bgimg = function(s)
        if (true) then
            return 'images/064.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You manage to retrieve a long hand-made machete from your backpack, feeling somewhat like a comic book hero.");
pn();
pn(" You and your dad made this machete just for fun, although he often grumbled about it not being a toy for kids. Now, though, he might be glad that his creation could potentially save his son\'s life.");
pn();
pn("");
pn();
pn("With a swift stroke, you sever the dreadful branch and quickly jump out of the bush. The sticky branches shake as if in fury.");
pn();
pn(" Disgusted, you use the knife to remove the branch that had clung to your hand just in time, as your skin begins to burn.");
pn();
pn("");
pn();
    end,
    walk_to = "v_d8f6c96f_b19e_49fe_a111_69e0dbf6fd10_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_d8f6c96f_b19e_49fe_a111_69e0dbf6fd10_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_10.ogg', 0);
    end,
    sndout = function(s) end,
};

v_d8f6c96f_b19e_49fe_a111_69e0dbf6fd10_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_d8f6c96f_b19e_49fe_a111_69e0dbf6fd10, v_03deb608_0e48_4cd2_991c_5ffc61df0012, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 56.You step to the lake shore
v_00e98bcd_db76_4738_8d60_cb2016cdab51 = vnr {
    nam = '...',
    notes = '56.You step to the lake shore',
    bgimg = function(s)
        if (true) then
            return 'images/065.1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("When it becomes too difficult to move the shrubs apart with your hands, you take a long hand-made machete, reminiscent of the kind comic book heroes wield, out of your backpack.");
pn();
pn(" You made the machete with your dad, just for fun. Your father grumbled all the time that such a knife is not a toy for kids.");
pn();
pn(" Probably, now he would be glad for you. You fancy yourself as an adventurer, who ventures through the jungle in search of treasure.");
pn();
pn(" You make good progress, and soon you catch glimpses of the lake through gaps between the bushes, the lake that you are heading for.");
pn();
pn("");
pn();
    end,
    walk_to = "v_00e98bcd_db76_4738_8d60_cb2016cdab51_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_00e98bcd_db76_4738_8d60_cb2016cdab51_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_10.ogg', 0);
    end,
    sndout = function(s) end,
};

v_00e98bcd_db76_4738_8d60_cb2016cdab51_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_00e98bcd_db76_4738_8d60_cb2016cdab51, v_50864ff8_7ab3_41f9_918d_bc7b3ac0f573, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 57.
v_02bffc3e_a5ea_4c74_bfa2_8ee390ccbc5c = vnr {
    nam = '...',
    notes = '57.',
    bgimg = function(s)
        if (s.tag == 'Henry') then
            return 'images/074.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/074.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/074.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/074.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/074.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/087.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/108.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You can\'t believe your eyes. The rush interferes with your line of sight, but you can clearly discern some movement behind it. It looks like there are people on the other shore!");
pn();
    end,
    walk_to = "v_02bffc3e_a5ea_4c74_bfa2_8ee390ccbc5c_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_02bffc3e_a5ea_4c74_bfa2_8ee390ccbc5c_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_02bffc3e_a5ea_4c74_bfa2_8ee390ccbc5c_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_02bffc3e_a5ea_4c74_bfa2_8ee390ccbc5c, v_f6a6bdf4_b806_486b_8d17_fb4e077271c2, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 58.Ask Irene for advice
v_43775dd7_53c0_4737_aa5c_835c5ef5f81f = vnr {
    nam = '...',
    notes = '58.Ask Irene for advice',
    bgimg = function(s)
        if (true) then
            return 'images/043.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Irene, the traveler\'s daughter, would likely know how to handle such situations, given her father\'s guidance.");
pn();
pn("\"Hey, Irene! Did your father tell you where they usually stayed overnight in these situations?\"");
pn();
pn("\"They tried to find a cave for shelter,\" she replied.");
pn();
pn("\"He said it was dangerous to stay out in the open. This place is swarming with... with predators, Henry!\"");
pn();
pn("She shivers and appears on the verge of tears.");
pn();
pn("\"Henry, what are we going to do? Night is falling, what if something happens to us? What if we get eaten?\"");
pn();
pn("\"Just like you said, we\'ll find a cave. Everything will be fine.\"");
pn();
pn("You reassure Irene, though your own voice trembles with uncertainty. You have no idea where to look for a cave.");
pn();
pn(" Maybe there are none in this part of the island. However, luck seems to be on your side today. Close to the glade, you find a spacious and dry grotto, providing everyone with much-needed relief. Now, you can focus on preparing for the night. Or should you attend to something else first?");
pn();
pn("");
pn();
    end,
    walk_to = "v_43775dd7_53c0_4737_aa5c_835c5ef5f81f_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_43775dd7_53c0_4737_aa5c_835c5ef5f81f_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_isCave = true;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_43775dd7_53c0_4737_aa5c_835c5ef5f81f_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if (_haveLighter) then
        put(v_741f6d20_d6d0_4371_a20f_46fdafd63aac);
end;
        put(v_216df93b_f24f_4855_8d87_a1b92d8c5af8);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_741f6d20_d6d0_4371_a20f_46fdafd63aac = menu {
    nam = "v_741f6d20_d6d0_4371_a20f_46fdafd63aac",
    dsc = function(s) return "{Build a fire by the entrance}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_43775dd7_53c0_4737_aa5c_835c5ef5f81f, v_da2538f2_1e98_4787_ac73_f86051c3bb42, false); 
    end
}

v_216df93b_f24f_4855_8d87_a1b92d8c5af8 = menu {
    nam = "v_216df93b_f24f_4855_8d87_a1b92d8c5af8",
    dsc = function(s) return "{Next}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_43775dd7_53c0_4737_aa5c_835c5ef5f81f, v_cb262572_0c17_48b9_8fe9_46064125bfb0, false); 
    end
}

-- 59.Nothing to defend with. Bad end.
v_2bbc9b52_dde8_46cc_b2ed_238a30a2a2dd = vnr {
    nam = '...',
    notes = '59.Nothing to defend with. Bad end.',
    bgimg = function(s)
        if (s.tag == 'Cave') then
            return 'images/046.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The unknown predator is drawing closer, its sparkling eyes fixed on you. You step back into the depths of the cave, desperately trying to think of a solution before you\'re cornered. Fear grips you; there seems to be no escape. Your adventure comes to an end here.");
pn();
    end,
    walk_to = "v_2bbc9b52_dde8_46cc_b2ed_238a30a2a2dd_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_2bbc9b52_dde8_46cc_b2ed_238a30a2a2dd_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg2 then
            stead.add_var { _tagsArg2 = nlb:clonelst(listobj, "_tagsArg2"); }
        end;
        nlb:push(_tagsArg2.listnam, s);
nlb:acta(v_b2c6873a_69ac_46a9_8016_2b8028936bd3);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_10.ogg', 0);
    end,
    sndout = function(s) end,
};

v_2bbc9b52_dde8_46cc_b2ed_238a30a2a2dd_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_2bbc9b52_dde8_46cc_b2ed_238a30a2a2dd_b70d51a3_29a1_4884_84a3_6557956a94a9__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_2bbc9b52_dde8_46cc_b2ed_238a30a2a2dd_b70d51a3_29a1_4884_84a3_6557956a94a9__Return = menu {
    nam = "v_2bbc9b52_dde8_46cc_b2ed_238a30a2a2dd_b70d51a3_29a1_4884_84a3_6557956a94a9__Return",
    dsc = function(s) return "{Try again}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_2bbc9b52_dde8_46cc_b2ed_238a30a2a2dd, v_b70d51a3_29a1_4884_84a3_6557956a94a9, false); 
    end
}

-- 60.Conan\'s attack. Luck check
v_979fc173_0a10_41b2_8d2a_296dc6970e6e = vnr {
    nam = '...',
    notes = '60.Conan\'s attack. Luck check',
    bgimg = function(s)
        if (true) then
            return 'images/082.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Shoot!\" you urge Conan. \"Let\'s take down those brutes!\"");
pn();
pn("Conan nods, deftly reloading the rifle and selecting his target with precision. A deafening gunshot echoes through the air.");
pn();
pn(" The nearest savage staggers and collapses, a dark pool spreading beneath him. Conan lets out a fierce cry and fires the second barrel. Another adversary falls.");
pn();
pn("");
pn();
pn("The fate of the heroes is in your hands. Decide whether they will be lucky or not.");
pn();
    end,
    walk_to = "v_979fc173_0a10_41b2_8d2a_296dc6970e6e_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_979fc173_0a10_41b2_8d2a_296dc6970e6e_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_9.ogg', 0);
    end,
    sndout = function(s) end,
};

v_979fc173_0a10_41b2_8d2a_296dc6970e6e_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_2231098d_2952_4ea6_a12b_35b333b87ce1);
        put(v_5adc7cc4_ddf9_4033_894e_2f2d6a1a32f5);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_2231098d_2952_4ea6_a12b_35b333b87ce1 = menu {
    nam = "v_2231098d_2952_4ea6_a12b_35b333b87ce1",
    dsc = function(s) return "{The heroes are lucky}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_979fc173_0a10_41b2_8d2a_296dc6970e6e, v_c0b6aa6f_dc2c_485f_a25c_659cfaa84341, false); 
    end
}

v_5adc7cc4_ddf9_4033_894e_2f2d6a1a32f5 = menu {
    nam = "v_5adc7cc4_ddf9_4033_894e_2f2d6a1a32f5",
    dsc = function(s) return "{The heroes are unlucky}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_979fc173_0a10_41b2_8d2a_296dc6970e6e, v_2471e41d_d7e2_4547_9f7d_ac1942e5b8bd, false); 
    end
}

-- 61.
v_13dbbd92_15d4_406d_8aca_0e7f197119c1 = vnr {
    nam = '...',
    notes = '61.',
    bgimg = function(s)
        if (true) then
            return 'images/076.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("With terrible screams, you burst out of the thickets, running toward the savages, waving the burning torches.");
pn();
pn(" Your sudden appearance had the effect of an exploded bomb. Some savages dropped their spears and fled into the forest, yelling in fear.");
pn();
pn(" Others fell to their knees, shaking and covering their heads with their hands. As you reached the clearing where the natives were dancing, a sudden movement from the right caught your attention.");
pn();
pn(" You quickly turned and saw a cage with Snoopy inside. He barked and jumped at the cage bars, showing his joy as if he were not captive on the alien island.");
pn();
pn("");
pn();
    end,
    walk_to = "v_13dbbd92_15d4_406d_8aca_0e7f197119c1_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_13dbbd92_15d4_406d_8aca_0e7f197119c1_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_13.ogg', 0);
    end,
    sndout = function(s) end,
};

v_13dbbd92_15d4_406d_8aca_0e7f197119c1_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_13dbbd92_15d4_406d_8aca_0e7f197119c1, v_00ef923e_9aeb_4621_a722_04cec90242b1, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 62.
v_50864ff8_7ab3_41f9_918d_bc7b3ac0f573 = vnr {
    nam = '...',
    notes = '62.',
    bgimg = function(s)
        if (true) then
            return 'images/071.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Finally, the last bushes yield to your pressure, and with a sense of relief, you step onto the oozy shore of the lake, leaving the thick shrubbery behind.");
pn();
    end,
    walk_to = "v_50864ff8_7ab3_41f9_918d_bc7b3ac0f573_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_50864ff8_7ab3_41f9_918d_bc7b3ac0f573_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_7.ogg', 0);
    end,
    sndout = function(s) end,
};

v_50864ff8_7ab3_41f9_918d_bc7b3ac0f573_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_50864ff8_7ab3_41f9_918d_bc7b3ac0f573, v_55a03675_030b_48f2_9447_28d7a6dd1ce9, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 63.The plant ate you. Bad end.
v_a0604c13_f14f_4a35_bc49_667262816240 = vnr {
    nam = '...',
    notes = '63.The plant ate you. Bad end.',
    bgimg = function(s)
        if (true) then
            return 'images/063.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Desperately trying to break free, you reach for a hand-made machete in your bag, but the dreadful branches surround you from all sides, making every new movement increasingly difficult. Soon, your arms and legs are tightly ensnared by the plant.");
pn();
pn("The patches of skin uncovered by clothing begin to burn. Initially, it\'s just a little discomfort, but soon the burning pain becomes intolerable.");
pn();
pn(" The wind muffles your weak cries for help, and before long, your body hangs upon the predatory branches, which greedily drain your life. Your adventure ends here.");
pn();
pn("");
pn();
    end,
    walk_to = "v_a0604c13_f14f_4a35_bc49_667262816240_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_a0604c13_f14f_4a35_bc49_667262816240_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_11.ogg', 0);
    end,
    sndout = function(s) end,
};

v_a0604c13_f14f_4a35_bc49_667262816240_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_a0604c13_f14f_4a35_bc49_667262816240_b70d51a3_29a1_4884_84a3_6557956a94a9__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_a0604c13_f14f_4a35_bc49_667262816240_b70d51a3_29a1_4884_84a3_6557956a94a9__Return = menu {
    nam = "v_a0604c13_f14f_4a35_bc49_667262816240_b70d51a3_29a1_4884_84a3_6557956a94a9__Return",
    dsc = function(s) return "{Try again}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_a0604c13_f14f_4a35_bc49_667262816240, v_b70d51a3_29a1_4884_84a3_6557956a94a9, false); 
    end
}

-- 64.Bypass danger using spyglass
v_15ccffbe_6991_41c3_83d2_96eadb9a5db7 = vnr {
    nam = '...',
    notes = '64.Bypass danger using spyglass',
    bgimg = function(s)
        if (true) then
            return 'images/071.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You think of the spyglass, a gift from Cyrus. Standing on the upland, with the path leading to the lowland, perhaps using the spyglass will help you find a more convenient route? You don\'t want to force your way through the thicket again or trudge through tall plants.");
pn();
pn("");
pn();
pn("The spyglass is old but still serves its purpose. You adjust the focus and survey the surroundings, imagining yourself as a pirate captain.");
pn();
pn(" It seems there\'s not only a direct path to the water, but also a detour. You can simply follow the edge of the forest you just emerged from. As far as you can see, there are no obstacles, and it\'s not as hot there as in the open ground.");
pn();
pn("");
pn();
pn("");
pn();
pn("It\'s a long walk, but you\'re confident that this decision is the right one. After some time, you step onto the silty lakeside.");
pn();
    end,
    walk_to = "v_15ccffbe_6991_41c3_83d2_96eadb9a5db7_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_15ccffbe_6991_41c3_83d2_96eadb9a5db7_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_4.ogg', 0);
    end,
    sndout = function(s) end,
};

v_15ccffbe_6991_41c3_83d2_96eadb9a5db7_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_15ccffbe_6991_41c3_83d2_96eadb9a5db7, v_55a03675_030b_48f2_9447_28d7a6dd1ce9, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 65.
v_80764ae4_b641_4eb4_ab7c_a1795174e8f4 = vnr {
    nam = '...',
    notes = '65.',
    bgimg = function(s)
        if (s.tag == 'DoyleIrene') then
            return 'images/078.1.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/086.1.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/086.1.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/086.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/086.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("After some time it gets dark again. It seems you\'ll have to survive another night in the jungle. Suddenly, Snoopy starts to bark.");
pn();
pn(" You lift your eyes and see Beobras, Conan\'s father! He is girded by an ammunition belt and holds a shotgun in his hands.");
pn();
pn("");
pn();
pn("");
pn();
pn("\"Henry! Henry! They\'re here, everyone!\" The old hunter drops the shotgun on the ground and runs towards you. You run to meet him. Your parents and a large group of men appear from behind the trees.");
pn();
pn("");
pn();
pn("\"Well, Henry, I will give you a proper spanking when we get back!\" Father shakes his fist at you, but smiles and tears run down his cheeks.");
pn();
pn(" And you feel great tiredness and relief at the same time. You survived the night in the jungle, coped with other dangers, overcame the savages, and rescued your Snoopy. Now you can return home. Return as the winners!");
pn();
pn("");
pn();
    end,
    walk_to = "v_80764ae4_b641_4eb4_ab7c_a1795174e8f4_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_80764ae4_b641_4eb4_ab7c_a1795174e8f4_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_3.ogg', 0);
    end,
    sndout = function(s) end,
};

v_80764ae4_b641_4eb4_ab7c_a1795174e8f4_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_80764ae4_b641_4eb4_ab7c_a1795174e8f4_13ebd3d5_334b_4194_8f20_d189ea66a973__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_80764ae4_b641_4eb4_ab7c_a1795174e8f4_13ebd3d5_334b_4194_8f20_d189ea66a973__Return = menu {
    nam = "v_80764ae4_b641_4eb4_ab7c_a1795174e8f4_13ebd3d5_334b_4194_8f20_d189ea66a973__Return",
    dsc = function(s) return "{The End}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_80764ae4_b641_4eb4_ab7c_a1795174e8f4, v_13ebd3d5_334b_4194_8f20_d189ea66a973, false); 
    end
}

-- 66.Adults wasted the savages. Not very happy ending.
v_a92d3ab3_382d_4e49_add5_c50adacb6ac0 = vnr {
    nam = '...',
    notes = '66.Adults wasted the savages. Not very happy ending.',
    bgimg = function(s)
        if (s.tag == 'DoyleIrene') then
            return 'images/089.1.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/089.1.jpg';
        elseif (s.tag == 'Conan') then
            return 'images/089.2.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/089.2.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/089.2.jpg';
        elseif (s.tag == 'Henry') then
            return 'images/097.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/097.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You have no idea what to do in this situation. You have no option except to wait. The weird dance of savages continues quite long; there\'s no end to it.");
pn();
pn(" Looking at the sharp monotonous movements, you start to doze without noticing it. All of a sudden, right in front of you, the reed is being drawn apart, and a scary-looking painted face appears.");
pn();
pn(" They\'ve spotted us! You rush back, but that path is already cut off. The savages surround you from all sides.");
pn();
pn(" You defend yourselves as hard as you can, biting the attackers a few times, but the enemy is evidently stronger.");
pn();
pn("");
pn();
    end,
    walk_to = "v_a92d3ab3_382d_4e49_add5_c50adacb6ac0_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_a92d3ab3_382d_4e49_add5_c50adacb6ac0_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_a92d3ab3_382d_4e49_add5_c50adacb6ac0_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_a92d3ab3_382d_4e49_add5_c50adacb6ac0, v_31a24a48_d860_4458_8691_6600ebbb57e0, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 67.Almost happy end
v_00ef923e_9aeb_4621_a722_04cec90242b1 = vnr {
    nam = '...',
    notes = '67.Almost happy end',
    bgimg = function(s)
        if (s.tag == 'DoyleIrene') then
            return 'images/077.1.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/077.1.jpg';
        elseif (s.tag == 'Doyle') then
            return 'images/077.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/077.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You rush to the cage, pulling out branches locking its door. Snoopy puts his paws on your shoulders, trying to lick your face.");
pn();
pn("");
pn();
pn("\"Wait, boy, not now,\" you push him away.");
pn();
pn("");
pn();
pn("Finally, the cage is opened. It\'s dangerous to stay here longer; most likely, the savages will get brave enough to return soon. You run to the forest, in the opposite direction the savages ran.");
pn();
pn("");
pn();
pn("Soon, the clearing of savages is left far behind. You have no idea where to run next, and your recent deed seems to you total madness now.");
pn();
pn(" But looking at happy Snoopy, running by your side, you come to the conclusion that even crazy deeds have their uses sometimes.");
pn();
pn("");
pn();
    end,
    walk_to = "v_00ef923e_9aeb_4621_a722_04cec90242b1_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_00ef923e_9aeb_4621_a722_04cec90242b1_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_11.ogg', 0);
    end,
    sndout = function(s) end,
};

v_00ef923e_9aeb_4621_a722_04cec90242b1_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_00ef923e_9aeb_4621_a722_04cec90242b1, v_80764ae4_b641_4eb4_ab7c_a1795174e8f4, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 68.You start to get sleepy
v_93bcf4f8_7fb9_4edc_8a1a_1ce09acfc530 = vnr {
    nam = '...',
    notes = '68.You start to get sleepy',
    bgimg = function(s)
        if (s.tag == 'Doyle') then
            return 'images/058.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/058.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/120.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/120.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You decide to take your time and wait until Doyle regains consciousness and is able to walk again. Time passes, and you start to feel tired and giddy too.");
pn();
pn(" Sometimes the wind brings waves of a sickly sweet fragrance that seduces you. How nice it would be to take a nap, just a little…");
pn();
pn("");
pn();
    end,
    walk_to = "v_93bcf4f8_7fb9_4edc_8a1a_1ce09acfc530_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_93bcf4f8_7fb9_4edc_8a1a_1ce09acfc530_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_93bcf4f8_7fb9_4edc_8a1a_1ce09acfc530_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if ( not _haveConan) then
        put(v_b52a5248_e65a_4523_aadb_5f83e2542bc3);
end;
if (_haveConan) then
        put(v_cb445b07_cc13_4fc3_949d_55f92c4ce8e5);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_b52a5248_e65a_4523_aadb_5f83e2542bc3 = menu {
    nam = "v_b52a5248_e65a_4523_aadb_5f83e2542bc3",
    dsc = function(s) return "{Take a nap}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_93bcf4f8_7fb9_4edc_8a1a_1ce09acfc530, v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8, false); 
    end
}

v_cb445b07_cc13_4fc3_949d_55f92c4ce8e5 = menu {
    nam = "v_cb445b07_cc13_4fc3_949d_55f92c4ce8e5",
    dsc = function(s) return "{Next}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_93bcf4f8_7fb9_4edc_8a1a_1ce09acfc530, v_0523f06f_19b0_4fd8_a48f_8a2c786b09be, false); 
    end
}

-- 69.
v_115c4e79_648f_4fd1_832c_a9d48e45d7e1 = vnr {
    nam = '...',
    notes = '69.',
    bgimg = function(s)
        if (s.tag == 'Conan') then
            return 'images/072_fireflies.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/126.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/127.jpg';
        elseif (s.tag == 'ConanDoyle') then
            return 'images/128.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("When you regain consciousness, you can hear water splashing somewhere very close. You slowly open your eyes.");
pn();
pn(" It looks like this is the very lake you wanted to reach. Conan is sitting on the shore, intently watching you.");
pn();
pn("");
pn();
pn("\"I thought you\'d never...\" he exhales with relief.");
pn();
pn("\"What happened to me?\"");
pn();
pn("\"It looks like those damn plants. Even I got a headache pulling you out of there. You just became weak in the knees and fell with no response.\"");
pn();
pn("\"Thanks, buddy...\"");
pn();
pn("You struggle to stand up.");
pn();
    end,
    walk_to = "v_115c4e79_648f_4fd1_832c_a9d48e45d7e1_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_115c4e79_648f_4fd1_832c_a9d48e45d7e1_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

v_115c4e79_648f_4fd1_832c_a9d48e45d7e1_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_115c4e79_648f_4fd1_832c_a9d48e45d7e1, v_55a03675_030b_48f2_9447_28d7a6dd1ce9, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 70.Can\'t pull out by yourself
v_d3c6998c_6914_4189_9cf1_ed651f4182e1 = vnr {
    nam = '...',
    notes = '70.Can\'t pull out by yourself',
    bgimg = function(s)
        if (true) then
            return 'images/057.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Now it becomes obvious that staying close to these plants is very dangerous. Time is pressing: you grab Doyle and start to drag him towards the underbrush, but you get tired pretty soon.");
pn();
pn(" Of course, now you would appreciate Conan\'s help; he probably never gets tired. Unfortunately, he is not with you. The smell makes you feel giddy, and you regret that no more strength has been left to keep going.");
pn();
pn("");
pn();
    end,
    walk_to = "v_d3c6998c_6914_4189_9cf1_ed651f4182e1_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_d3c6998c_6914_4189_9cf1_ed651f4182e1_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_d3c6998c_6914_4189_9cf1_ed651f4182e1_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_d3c6998c_6914_4189_9cf1_ed651f4182e1, v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 71.Conan hit the eye!
v_548e4fa8_0fdc_4af5_809b_b9cafebff02c = vnr {
    nam = '...',
    notes = '71.Conan hit the eye!',
    bgimg = function(s)
        if (s.tag == 'NotCave') then
            return 'images/042.jpg';
        elseif (s.tag == 'NotCaveDoyle') then
            return 'images/042.jpg';
        elseif (s.tag == 'Cave') then
            return 'images/133.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("\"Conan!\" you whisper urgently, \"the rifle... shoot!\"");
pn();
pn("Trembling with fear, Conan points his father\'s double-barrelled rifle at the beast. Seconds crawl slowly, agonizingly slowly...");
pn();
pn("Finally, he fires. You expect a wild roar from the furious predator, but instead, it staggers, steps backwards, and falls silently to the ground.");
pn();
pn(" Only a few minutes later, you pull yourself together and dare to approach the beast. It turns out that by some miracle, Conan hit it in the eye, and its death was instantaneous. Unbelievable luck!");
pn();
pn("");
pn();
    end,
    walk_to = "v_548e4fa8_0fdc_4af5_809b_b9cafebff02c_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_548e4fa8_0fdc_4af5_809b_b9cafebff02c_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg2 then
            stead.add_var { _tagsArg2 = nlb:clonelst(listobj, "_tagsArg2"); }
        end;
        nlb:push(_tagsArg2.listnam, s);
nlb:acta(v_b2c6873a_69ac_46a9_8016_2b8028936bd3);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_14.ogg', 0);
    end,
    sndout = function(s) end,
};

v_548e4fa8_0fdc_4af5_809b_b9cafebff02c_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_548e4fa8_0fdc_4af5_809b_b9cafebff02c, v_214e9f88_e774_40e8_b7bc_209cfeeccc42, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 72.You fell asleep. Bad end.
v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8 = vnr {
    nam = '...',
    notes = '72.You fell asleep. Bad end.',
    bgimg = function(s)
        if (s.tag == 'Henry') then
            return 'images/054.jpg';
        elseif (s.tag == 'Doyle') then
            return 'images/058.jpg';
        elseif (s.tag == 'Irene') then
            return 'images/117.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/121.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You take the backpack off your back and slowly sink to the ground, resting on the soft underlayer of grass.");
pn();
pn(" You can hardly keep your eyes open, and your mind is clouded. It\'s strange, considering you just had a good rest... The night wasn\'t pleasant, but still...");
pn();
pn("");
pn();
pn("You close your eyes and fall into a deep slumber from which you will never awaken. The fragrance of flowers acts like a narcotic, lulling you into unconsciousness. Your adventure ends here.");
pn();
    end,
    walk_to = "v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8_b70d51a3_29a1_4884_84a3_6557956a94a9__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8_b70d51a3_29a1_4884_84a3_6557956a94a9__Return = menu {
    nam = "v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8_b70d51a3_29a1_4884_84a3_6557956a94a9__Return",
    dsc = function(s) return "{Try again}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_9fea6b63_3df7_4b01_b0e4_093b8878e4f8, v_b70d51a3_29a1_4884_84a3_6557956a94a9, false); 
    end
}

-- 73.You go through fine plants
v_ce29eada_1358_450c_8c4a_d09a4b7015ef = vnr {
    nam = '...',
    notes = '73.You go through fine plants',
    bgimg = function(s)
        if (true) then
            return 'images/065.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You start making your way through the thickets of white flower plants. The bushes grow rather densely, and it\'s not so easy to force your way through, but you\'re pretty sure that the choice was right. Those beautiful lilac plants somehow alert you.");
pn();
    end,
    walk_to = "v_ce29eada_1358_450c_8c4a_d09a4b7015ef_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_ce29eada_1358_450c_8c4a_d09a4b7015ef_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_10.ogg', 0);
    end,
    sndout = function(s) end,
};

v_ce29eada_1358_450c_8c4a_d09a4b7015ef_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if (_haveIren) then
        nlb:nlbwalk(v_ce29eada_1358_450c_8c4a_d09a4b7015ef, v_b12e31c5_84a4_4d7f_a3b2_3343effa98ef, false); 
    return;
end;
if ( not _haveIren) then
        nlb:nlbwalk(v_ce29eada_1358_450c_8c4a_d09a4b7015ef, v_00e98bcd_db76_4738_8d60_cb2016cdab51, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 74.The beast attacks. Bad end.
v_57a64d23_4ca5_48d4_9ea9_60a147fd1200 = vnr {
    nam = '...',
    notes = '74.The beast attacks. Bad end.',
    bgimg = function(s)
        if (true) then
            return 'images/035.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The beast roars, then turns around and goes back into the thicket. You think it\'s all over, when suddenly one of the walls of your shelter collapses and you\'re horrified to see sparkling eyes, enormous fangs, and smell the stinking breath of the predator right in front of you.");
pn();
pn(" Fear seizes you, and you are unable to take any measures. Your adventure ends here.");
pn();
pn("");
pn();
    end,
    walk_to = "v_57a64d23_4ca5_48d4_9ea9_60a147fd1200_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_57a64d23_4ca5_48d4_9ea9_60a147fd1200_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_57a64d23_4ca5_48d4_9ea9_60a147fd1200_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_57a64d23_4ca5_48d4_9ea9_60a147fd1200_b70d51a3_29a1_4884_84a3_6557956a94a9__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_57a64d23_4ca5_48d4_9ea9_60a147fd1200_b70d51a3_29a1_4884_84a3_6557956a94a9__Return = menu {
    nam = "v_57a64d23_4ca5_48d4_9ea9_60a147fd1200_b70d51a3_29a1_4884_84a3_6557956a94a9__Return",
    dsc = function(s) return "{Try again}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_57a64d23_4ca5_48d4_9ea9_60a147fd1200, v_b70d51a3_29a1_4884_84a3_6557956a94a9, false); 
    end
}

-- 75.Don\'t build a fire
v_cb262572_0c17_48b9_8fe9_46064125bfb0 = vnr {
    nam = '...',
    notes = '75.Don\'t build a fire',
    bgimg = function(s)
        if (s.tag == 'Irene') then
            return 'images/045.1.jpg';
        elseif (s.tag == 'DoyleIrene') then
            return 'images/045.jpg';
        elseif (s.tag == 'ConanIrene') then
            return 'images/045.1.jpg';
        elseif (s.tag == 'ConanDoyleIrene') then
            return 'images/045.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You can see that Irene has cheered up.");
pn();
pn("\"Now we can sleep with no worries! My father said we may not fear predators while we are in caves.\"");
pn();
pn("\"Well, perhaps...\"");
pn();
pn("This cave is a good shelter, which can protect you from the dangers of the forest during the night; the only thing that bothers you is the open entrance.");
pn();
pn("");
pn();
pn("It\'s getting dark outside very soon. In a few hours, you can hardly recognize objects at arm\'s length; the rest is hidden in impenetrable darkness.");
pn();
pn(" You are all tired and scared. The jungle outside is filled with strange and frightening sounds. Some animals scream and howl in the thicket, and weird rustles can be heard all the time. No wonder you can\'t fall asleep in such circumstances.");
pn();
pn("");
pn();
pn("Suddenly, forest animals begin to scream especially loud. You can hear some small, rapid animals climbing up the trees. It seems that a large predator is approaching.");
pn();
pn("To your horror, you hear the rustle of moving branches and see the sparkling eyes of a predator, who is breathing loudly. You\'ve got to do something before it\'s too late.");
pn();
    end,
    walk_to = "v_cb262572_0c17_48b9_8fe9_46064125bfb0_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_cb262572_0c17_48b9_8fe9_46064125bfb0_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _tagsArg then
            stead.add_var { _tagsArg = nlb:clonelst(listobj, "_tagsArg"); }
        end;
        nlb:push(_tagsArg.listnam, s);
nlb:acta(v_f9f7d9ab_4120_41d6_a152_c60995c984e6);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_9.ogg', 0);
    end,
    sndout = function(s) end,
};

v_cb262572_0c17_48b9_8fe9_46064125bfb0_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if (_haveRifle) then
        put(v_f79067c8_ae15_41b2_9db6_66662cec3f03);
end;
if (_haveRifle) then
        put(v_05abc35d_3322_4096_9447_10be9dbe128f);
end;
if ( not _haveRifle) then
        put(v_28176eb1_e2fc_43b9_8b2a_75d536d800b4);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_f79067c8_ae15_41b2_9db6_66662cec3f03 = menu {
    nam = "v_f79067c8_ae15_41b2_9db6_66662cec3f03",
    dsc = function(s) return "{Shoot with the rifle in the air}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_cb262572_0c17_48b9_8fe9_46064125bfb0, v_37737a36_05a2_45db_97f9_589334f38072, false); 
    end
}

v_05abc35d_3322_4096_9447_10be9dbe128f = menu {
    nam = "v_05abc35d_3322_4096_9447_10be9dbe128f",
    dsc = function(s) return "{Shoot the rifle at the beast}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_cb262572_0c17_48b9_8fe9_46064125bfb0, v_8827a70f_7e36_407f_af59_828075bb42c2, false); 
    end
}

v_28176eb1_e2fc_43b9_8b2a_75d536d800b4 = menu {
    nam = "v_28176eb1_e2fc_43b9_8b2a_75d536d800b4",
    dsc = function(s) return "{Next}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_cb262572_0c17_48b9_8fe9_46064125bfb0, v_2bbc9b52_dde8_46cc_b2ed_238a30a2a2dd, false); 
    end
}

-- 76.Beast didn\'t cross the fire
v_78ffdc16_1a44_48b3_9c17_959ecd93f25c = vnr {
    nam = '...',
    notes = '76.Beast didn\'t cross the fire',
    bgimg = function(s)
        if (true) then
            return 'images/048.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("It gets dark very soon. In a few hours, you can see only the nearest trees, lit by the fire, and all the rest behind them is hidden in pitch darkness.");
pn();
pn("You are all tired and scared, but it\'s difficult to fall asleep. The jungle outside is full of weird and dreadful sounds.");
pn();
pn(" In the thickets, unknown animals howl and scream in fear, and you can often hear strange rustles. Some apelike creatures come down from the trees and look at your fire with curiosity. You look at them.");
pn();
pn("");
pn();
pn("Suddenly, these creatures begin to scream loudly, frightened. One by one, they rush back up into the trees with lightning speed.");
pn();
pn(" For a moment, silence falls upon the jungle. Then, branches on the trees are pushed apart, and a large, hairy, coal-black beast steps out onto the glade.");
pn();
pn("");
pn();
pn("Its long, messy hair hangs down, with its saber-like fangs gleaming in the light of the fire. The beast stands still, looking at your fire. The creature\'s nostrils move; it obviously senses you.");
pn();
pn("The predator comes closer, then stops, hesitating, as if some unseen barrier restrained it. A few tedious minutes pass, which seem like an eternity. Finally, the monster roars with disappointment, turns around, and goes back into the thicket.");
pn();
pn("Your heart is thumping madly. Then tiredness takes over, and you start to fall asleep. Your last thought is that you ought to sleep in turns to keep the fire.");
pn();
    end,
    walk_to = "v_78ffdc16_1a44_48b3_9c17_959ecd93f25c_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_78ffdc16_1a44_48b3_9c17_959ecd93f25c_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_night_3.ogg', 0);
    end,
    sndout = function(s) end,
};

v_78ffdc16_1a44_48b3_9c17_959ecd93f25c_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_78ffdc16_1a44_48b3_9c17_959ecd93f25c, v_7e8667a4_9787_45f2_8937_ee4cc820e2d2, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 77.The savages got scared and ran away
v_a8684619_ae21_4f94_8dc0_04c65ca2a9be = vnr {
    nam = '...',
    notes = '77.The savages got scared and ran away',
    bgimg = function(s)
        if (true) then
            return 'images/088.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You\'ve got a sudden idea.");
pn();
pn("\"Doyle, let\'s make torches! Look, take this reed...\"");
pn();
pn("From what you\'ve heard about the dwellers of the Wild Island, you know that they worship fire. So, the appearance of men with torches will certainly scare them. And then it will be clear what to do.");
pn();
    end,
    walk_to = "v_a8684619_ae21_4f94_8dc0_04c65ca2a9be_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_a8684619_ae21_4f94_8dc0_04c65ca2a9be_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_14.ogg', 0);
    end,
    sndout = function(s) end,
};

v_a8684619_ae21_4f94_8dc0_04c65ca2a9be_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_a8684619_ae21_4f94_8dc0_04c65ca2a9be, v_11e1935e_b7e4_4475_a482_5b4d9bbf4afd, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 78.Trying luck
v_0b5f981a_d3be_4338_90b0_6a63768b590d = vnr {
    nam = '...',
    notes = '78.Trying luck',
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The fate of the heroes is in your hands. Decide whether they will be lucky or not.");
pn();
    end,
    walk_to = "v_0b5f981a_d3be_4338_90b0_6a63768b590d_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_0b5f981a_d3be_4338_90b0_6a63768b590d_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_10.ogg', 0);
    end,
    sndout = function(s) end,
};

v_0b5f981a_d3be_4338_90b0_6a63768b590d_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_a2c49bf4_6ca0_4b59_898a_b2c2b4179300);
        put(v_36aff5e9_5f60_4ac2_8ffb_7176017ce65a);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_a2c49bf4_6ca0_4b59_898a_b2c2b4179300 = menu {
    nam = "v_a2c49bf4_6ca0_4b59_898a_b2c2b4179300",
    dsc = function(s) return "{The heroes are lucky}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_0b5f981a_d3be_4338_90b0_6a63768b590d, v_d8f6c96f_b19e_49fe_a111_69e0dbf6fd10, false); 
    end
}

v_36aff5e9_5f60_4ac2_8ffb_7176017ce65a = menu {
    nam = "v_36aff5e9_5f60_4ac2_8ffb_7176017ce65a",
    dsc = function(s) return "{The heroes are unlucky}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_0b5f981a_d3be_4338_90b0_6a63768b590d, v_a0604c13_f14f_4a35_bc49_667262816240, false); 
    end
}

-- 79.Irene went for the flower and got trapped
v_b12e31c5_84a4_4d7f_a3b2_3343effa98ef = vnr {
    nam = '...',
    notes = '79.Irene went for the flower and got trapped',
    bgimg = function(s)
        if (true) then
            return 'images/066.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Being busy clearing the path, you can\'t see what is happening around you. At the same time, curious Irene comes right to the lilac plants. Suddenly, you hear her frightened scream:");
pn();
pn("");
pn();
pn("\"Henry, a-a-a, Henry, help!\"");
pn();
pn("");
pn();
pn("You rush back and stand still. Irene\'s hand is adhered to branches of a plant, close to a lilac flower.");
pn();
pn("");
pn();
pn("\"I just wanted to smell a flower, but it won\'t let me go! Henry!\"");
pn();
pn("");
pn();
pn("Irene pulls the branch back, but it\'s as if it grew fast to her hand. Other branches sway in dangerous proximity to her. You have to do something urgently.");
pn();
    end,
    walk_to = "v_b12e31c5_84a4_4d7f_a3b2_3343effa98ef_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b12e31c5_84a4_4d7f_a3b2_3343effa98ef_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_13.ogg', 0);
    end,
    sndout = function(s) end,
};

v_b12e31c5_84a4_4d7f_a3b2_3343effa98ef_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if (_haveHerbicide) then
        put(v_a30b78cd_27b4_42f3_aa31_9510426d7424);
end;
        put(v_6dbddf2e_98ba_4bd7_afe8_1b8af7fd8352);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_a30b78cd_27b4_42f3_aa31_9510426d7424 = menu {
    nam = "v_a30b78cd_27b4_42f3_aa31_9510426d7424",
    dsc = function(s) return "{Use herbicide}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_b12e31c5_84a4_4d7f_a3b2_3343effa98ef, v_d1a7a8ac_308a_4293_823f_fb8fb9eaab45, false); 
    end
}

v_6dbddf2e_98ba_4bd7_afe8_1b8af7fd8352 = menu {
    nam = "v_6dbddf2e_98ba_4bd7_afe8_1b8af7fd8352",
    dsc = function(s) return "{Try to pull Irene out}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_b12e31c5_84a4_4d7f_a3b2_3343effa98ef, v_dcd7b9a1_135a_4f6e_a8dd_fcf3217f901e, false); 
    end
}

-- 80.Morning in the forest
v_afb2a291_7982_4026_8100_9b2fc7a826fc = vnr {
    nam = '...',
    notes = '80.Morning in the forest',
    bgimg = function(s)
        if (true) then
            return 'images/115.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Morning chill awakens you. It is already dawn; all night fears are in the past. Conan is near you, waving his arms in an attempt to get warm.");
pn();
pn("");
pn();
pn("\"We really gave that beast a run for its money, didn\'t we, Henry?\" he smiled.");
pn();
pn("");
pn();
pn("\"Yeah, exactly!\"");
pn();
pn("");
pn();
pn("You roll up the blanket and put it back into the backpack. It\'s time to get out of this damn forest...");
pn();
    end,
    walk_to = "v_afb2a291_7982_4026_8100_9b2fc7a826fc_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_afb2a291_7982_4026_8100_9b2fc7a826fc_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_2.ogg', 0);
    end,
    sndout = function(s) end,
};

v_afb2a291_7982_4026_8100_9b2fc7a826fc_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_afb2a291_7982_4026_8100_9b2fc7a826fc, v_dd64149c_4cdf_4aad_b626_1426318a5327, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 81.The savages outnumbered you. You died.
v_2471e41d_d7e2_4547_9f7d_ac1942e5b8bd = vnr {
    nam = '...',
    notes = '81.The savages outnumbered you. You died.',
    bgimg = function(s)
        if (true) then
            return 'images/083.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Suddenly, the reed is being moved apart and a scary painted face appears right in front of you, then another one!");
pn();
pn(" It would seem that your surprise deadly attack should have made you look like dreadful opponents in the eyes of the savages, almost equal to gods, but it seems they have courage. They certainly won\'t stand under your fire, like targets in a shooting gallery!");
pn();
pn("");
pn();
pn("");
pn();
pn("Swearing, Conan takes new rounds, trying to reload the rifle with shaking hands... And all of a sudden, he falls, making a death rattle.");
pn();
pn(" A short javelin protrudes from his side. You don\'t have time to do anything before a second spear hits your chest, and everything goes dark before your eyes. Your adventure ends here.");
pn();
pn("");
pn();
    end,
    walk_to = "v_2471e41d_d7e2_4547_9f7d_ac1942e5b8bd_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_2471e41d_d7e2_4547_9f7d_ac1942e5b8bd_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_10.ogg', 0);
    end,
    sndout = function(s) end,
};

v_2471e41d_d7e2_4547_9f7d_ac1942e5b8bd_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_2471e41d_d7e2_4547_9f7d_ac1942e5b8bd_b70d51a3_29a1_4884_84a3_6557956a94a9__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_2471e41d_d7e2_4547_9f7d_ac1942e5b8bd_b70d51a3_29a1_4884_84a3_6557956a94a9__Return = menu {
    nam = "v_2471e41d_d7e2_4547_9f7d_ac1942e5b8bd_b70d51a3_29a1_4884_84a3_6557956a94a9__Return",
    dsc = function(s) return "{Try again}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_2471e41d_d7e2_4547_9f7d_ac1942e5b8bd, v_b70d51a3_29a1_4884_84a3_6557956a94a9, false); 
    end
}

-- 82.Found him!
v_dc5f6d05_7ef5_4ffe_8082_7cc8c5a9c8a8 = vnr {
    nam = '...',
    notes = '82.Found him!',
    bgimg = function(s)
        if (true) then
            return 'images/079.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("From here, you can\'t see well what is going on in the savages\' clearing, and coming closer is dangerous. Fortunately, Irene is with you.");
pn();
pn("");
pn();
pn("\"Irene, can you look what is going on there?\"");
pn();
pn("");
pn();
pn("\"Easily!\"");
pn();
pn("");
pn();
pn("You didn\'t have time to reply before she disappeared into the thickets. After some time, the reeds finally move apart, and Irene returns.");
pn();
pn("");
pn();
pn("\"Henry, Henry, they\'ve got Snoopy,\" she quietly gabbles, \"he\'s in the cage, very close.\"");
pn();
pn("");
pn();
pn("Carefully following Irene, you sneak closer to the clearing where the savages are dancing. So it is; Snoopy is sitting in the cage not far away.");
pn();
    end,
    walk_to = "v_dc5f6d05_7ef5_4ffe_8082_7cc8c5a9c8a8_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_dc5f6d05_7ef5_4ffe_8082_7cc8c5a9c8a8_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_savages_4.ogg', 0);
    end,
    sndout = function(s) end,
};

v_dc5f6d05_7ef5_4ffe_8082_7cc8c5a9c8a8_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if (_haveRifle) then
        put(v_176955ca_f797_44ed_a9f7_b36175476439);
end;
if (_haveDoyle) then
        put(v_4b50b0b0_39a1_4548_a805_e3f997279adf);
end;
        put(v_90567ecd_3174_4399_80fc_ff0800bc2ea6);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_176955ca_f797_44ed_a9f7_b36175476439 = menu {
    nam = "v_176955ca_f797_44ed_a9f7_b36175476439",
    dsc = function(s) return "{Conan wants to fire}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dc5f6d05_7ef5_4ffe_8082_7cc8c5a9c8a8, v_a130a920_848e_4373_8458_9130d62849d1, false); 
    end
}

v_4b50b0b0_39a1_4548_a805_e3f997279adf = menu {
    nam = "v_4b50b0b0_39a1_4548_a805_e3f997279adf",
    dsc = function(s) return "{Ask Doyle to negotiate with the savages}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dc5f6d05_7ef5_4ffe_8082_7cc8c5a9c8a8, v_e7ea2780_e7c1_4b1c_b9f6_0043ed9384f7, false); 
    end
}

v_90567ecd_3174_4399_80fc_ff0800bc2ea6 = menu {
    nam = "v_90567ecd_3174_4399_80fc_ff0800bc2ea6",
    dsc = function(s) return "{Wait}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dc5f6d05_7ef5_4ffe_8082_7cc8c5a9c8a8, v_a92d3ab3_382d_4e49_add5_c50adacb6ac0, false); 
    end
}

-- 83.overnight stay
v_64405c42_1edc_438e_a351_6953473a350e = vnr {
    nam = '...',
    notes = '83.overnight stay',
    bgimg = function(s)
        if (true) then
            return 'images/028.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("A long time has already elapsed, and it\'s getting dark in the jungle. It looks like the night is falling.");
pn();
pn(" It\'s useless and dangerous to look for a way out in the dark. You are scared; tears are welling up in your eyes, but it is clear that you won\'t return home today. Apparently, you\'ll have to stay overnight here.");
pn();
pn("");
pn();
pn("");
pn();
pn("You come across a small forest glade and look around. Will it be safe to settle here? Or should you find a safer place while it\'s not too dark?");
pn();
    end,
    walk_to = "v_64405c42_1edc_438e_a351_6953473a350e_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_64405c42_1edc_438e_a351_6953473a350e_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_64405c42_1edc_438e_a351_6953473a350e_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_4f7db60c_0593_4f7d_8d73_c2b1c73cb16c);
if ( not _haveDoyle) then
        put(v_05f78c04_508b_4312_88bc_2451551fbfd3);
end;
if (_haveIren) then
        put(v_c5df5ac2_d501_4de6_a94b_31b560c11c2c);
end;
if (_haveDoyle and (_haveIren or _haveConan)) then
        put(v_62a497a4_d42e_4c21_97d1_2a236cd2b421);
end;
if (_haveDoyle and not (_haveIren or _haveConan)) then
        put(v_96baa3d4_57bd_49ed_87c4_c93ced96f968);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_4f7db60c_0593_4f7d_8d73_c2b1c73cb16c = menu {
    nam = "v_4f7db60c_0593_4f7d_8d73_c2b1c73cb16c",
    dsc = function(s) return "{Make shelter of branches on the glade}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_64405c42_1edc_438e_a351_6953473a350e, v_b98d5019_ca4d_47d8_860c_834c4d09fd4a, false); 
    end
}

v_05f78c04_508b_4312_88bc_2451551fbfd3 = menu {
    nam = "v_05f78c04_508b_4312_88bc_2451551fbfd3",
    dsc = function(s) return "{Take rest on the tree branches}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_64405c42_1edc_438e_a351_6953473a350e, v_7b5fdea2_b92f_49a2_ae02_ea83f9fa1923, false); 
    end
}

v_c5df5ac2_d501_4de6_a94b_31b560c11c2c = menu {
    nam = "v_c5df5ac2_d501_4de6_a94b_31b560c11c2c",
    dsc = function(s) return "{Ask Irene for advice}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_64405c42_1edc_438e_a351_6953473a350e, v_43775dd7_53c0_4737_aa5c_835c5ef5f81f, false); 
    end
}

v_62a497a4_d42e_4c21_97d1_2a236cd2b421 = menu {
    nam = "v_62a497a4_d42e_4c21_97d1_2a236cd2b421",
    dsc = function(s) return "{Try to take rest on the tree branches}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_64405c42_1edc_438e_a351_6953473a350e, v_91abebdc_63cc_44a1_9d59_3c756140a8b9, false); 
    end
}

v_96baa3d4_57bd_49ed_87c4_c93ced96f968 = menu {
    nam = "v_96baa3d4_57bd_49ed_87c4_c93ced96f968",
    dsc = function(s) return "{Try to take rest on the tree branches}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_64405c42_1edc_438e_a351_6953473a350e, v_6fde7ee8_9f3b_44d2_8a28_02dc17bd624f, false); 
    end
}

-- 84.Doyle fears the height
v_6fde7ee8_9f3b_44d2_8a28_02dc17bd624f = vnr {
    nam = '...',
    notes = '84.Doyle fears the height',
    bgimg = function(s)
        if (true) then
            return 'images/031.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You recall a book you recently read about Robinson Crusoe. Robinson, upon finding himself on the island, spent his first night in a tree to avoid predator attacks. Good idea! It\'s useful to read books after all!");
pn();
pn("");
pn();
pn("\"We\'ll take rest on the tree!\" you say to Doyle.");
pn();
pn("");
pn();
pn("\"Henry, e-e-eh, you see I have a fear of heights, I feel giddy at once... Just don\'t tell anyone, please,\" he asks, embarrassed.");
pn();
pn("");
pn();
pn("Well, it\'s a pity; the plan was very good. It appears you have to come up with something else.");
pn();
    end,
    walk_to = "v_6fde7ee8_9f3b_44d2_8a28_02dc17bd624f_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_6fde7ee8_9f3b_44d2_8a28_02dc17bd624f_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_6fde7ee8_9f3b_44d2_8a28_02dc17bd624f_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_ce87d03d_5876_4c47_87b0_31e7092bef3c);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_ce87d03d_5876_4c47_87b0_31e7092bef3c = menu {
    nam = "v_ce87d03d_5876_4c47_87b0_31e7092bef3c",
    dsc = function(s) return "{Make shelter of branches on the glade}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_6fde7ee8_9f3b_44d2_8a28_02dc17bd624f, v_b98d5019_ca4d_47d8_860c_834c4d09fd4a, false); 
    end
}

-- 85
v_be7d0e00_c9c8_4481_a6af_a9da5f172408 = vnr {
    nam = '...',
    notes = '85',
    bgimg = function(s)
        if (true) then
            return 'images/026.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The Wild Island is floating slowly, very close to you. Sometimes the island\'s edges collide, making a deep rumbling noise.");
pn();
pn(" Lumps of ground and sand masses come off and fall into the abyss. The earth shakes under your feet. This is an enchanting and scary sight at the same time; now the idea of jumping over to another island doesn\'t seem so fascinating anymore.");
pn();
pn("");
pn();
pn("");
pn();
pn("You look closely at the alien shores floating by. There is a tangle of tall grass with pointed acinaciform leaves.");
pn();
pn(" Tall trees are enmeshed in lianas. Some birds, disturbed by the sound of collision, fly out of bushes from time to time. You can hear the howls of unseen animals in the alien forest.");
pn();
pn("");
pn();
    end,
    walk_to = "v_be7d0e00_c9c8_4481_a6af_a9da5f172408_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_be7d0e00_c9c8_4481_a6af_a9da5f172408_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_3.ogg', 0);
    end,
    sndout = function(s) end,
};

v_be7d0e00_c9c8_4481_a6af_a9da5f172408_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_be7d0e00_c9c8_4481_a6af_a9da5f172408, v_b70d51a3_29a1_4884_84a3_6557956a94a9, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 86.By the house
v_aae627de_099e_4f0a_81a3_53aae7643ade = vnr {
    nam = '...',
    notes = '86.By the house',
    bgimg = function(s)
        if (true) then
            return 'images/003.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You stand in front of your house, surrounded by a garden overgrown with weeds. In the center of the garden, an old shed can be seen where you like to play with friends.");
pn();
pn(" Snoopy jumps by your feet, occasionally running aside towards something that interests him. What do you wish to do?");
pn();
pn("");
pn();
    end,
    walk_to = "v_aae627de_099e_4f0a_81a3_53aae7643ade_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_aae627de_099e_4f0a_81a3_53aae7643ade_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_2.ogg', 0);
    end,
    sndout = function(s) end,
};

v_aae627de_099e_4f0a_81a3_53aae7643ade_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if ( not _shed) then
        put(v_668cee21_ddad_45c7_b947_9bd98760939b);
end;
        put(v_aae627de_099e_4f0a_81a3_53aae7643ade_59045708_6d29_4c8f_a6df_cb607f257eb7__Traverse);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_668cee21_ddad_45c7_b947_9bd98760939b = menu {
    nam = "v_668cee21_ddad_45c7_b947_9bd98760939b",
    dsc = function(s) return "{Go to the shed}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_aae627de_099e_4f0a_81a3_53aae7643ade, v_599e5e30_e43e_4fb2_b0a7_b21cc30f0fb8, false); 
    end
}

v_aae627de_099e_4f0a_81a3_53aae7643ade_59045708_6d29_4c8f_a6df_cb607f257eb7__Traverse = menu {
    nam = "v_aae627de_099e_4f0a_81a3_53aae7643ade_59045708_6d29_4c8f_a6df_cb607f257eb7__Traverse",
    dsc = function(s) return "{Go to the city centre}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_aae627de_099e_4f0a_81a3_53aae7643ade, v_59045708_6d29_4c8f_a6df_cb607f257eb7, false); 
    end
}

-- 87.Square
v_59045708_6d29_4c8f_a6df_cb607f257eb7 = vnr {
    nam = '...',
    notes = '87.Square',
    bgimg = function(s)
        if (true) then
            return 'images/005.1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You\'re on the main square of Mech-City. People bustle about like ants, going about their errands. You can visit many interesting places, but the most important thing is not to miss the approaching time.");
pn();
pn("");
pn();
pn("On the western edge of the square, you can see the house of the famous Mech-City huntsman Beobras Beowulf, the father of your friend Conan. You can drop in to see him if you like; Conan will certainly want to join you.");
pn();
pn("");
pn();
pn("There is a library in the northwest where you can look for something interesting, something that may prove useful.");
pn();
pn("");
pn();
pn("In the northeast, there is the house of the inventor Nikolas Swift, the father of your friend Doyle. Doyle is probably at home because he likes to spend his free time in his father\'s workshop. They say knowledge is power; maybe it\'s wise to invite him to go with you.");
pn();
pn("");
pn();
pn("The house of traveler Cyrus Paganel is on the eastern edge of the square. It is he who was on Wild Island, and he can tell you something that is not written even in Doyle\'s books.");
pn();
pn("");
pn();
pn("You can also return home and stay there for a while, or go to the place where Wild Island is expected to float and just wait for its approach. It\'s up to you to decide.");
pn();
    end,
    walk_to = "v_59045708_6d29_4c8f_a6df_cb607f257eb7_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_59045708_6d29_4c8f_a6df_cb607f257eb7_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_19.ogg', 0);
    end,
    sndout = function(s) end,
};

v_59045708_6d29_4c8f_a6df_cb607f257eb7_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
if ( not _hunterHouse) then
        put(v_0619bf1d_0b1b_4f15_8a5e_f158ae84e011);
end;
if ( not _inventorHouse) then
        put(v_ce947a56_67e1_48b9_96d9_ac41948e246b);
end;
if ( not _travellerHouse) then
        put(v_518fb8a4_3ea6_4af5_a13f_c48f81a081d4);
end;
        put(v_b4ea86a5_d4e9_4151_9288_96660f2deb9b);
        put(v_780cc8ef_08cb_4cc7_ac2c_ed1ded0e0570);
if ( not _library) then
        put(v_e3d143c4_38d2_4838_964e_3952feca4d47);
end;
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_0619bf1d_0b1b_4f15_8a5e_f158ae84e011 = menu {
    nam = "v_0619bf1d_0b1b_4f15_8a5e_f158ae84e011",
    dsc = function(s) return "{Visit the huntsman}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_59045708_6d29_4c8f_a6df_cb607f257eb7, v_094c0e54_62d5_41c0_8292_89029ea22e39, false); 
    end
}

v_ce947a56_67e1_48b9_96d9_ac41948e246b = menu {
    nam = "v_ce947a56_67e1_48b9_96d9_ac41948e246b",
    dsc = function(s) return "{Visit the inventor}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_59045708_6d29_4c8f_a6df_cb607f257eb7, v_559abe26_1c41_49eb_8d45_914e314dab36, false); 
    end
}

v_518fb8a4_3ea6_4af5_a13f_c48f81a081d4 = menu {
    nam = "v_518fb8a4_3ea6_4af5_a13f_c48f81a081d4",
    dsc = function(s) return "{Visit the traveler}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_59045708_6d29_4c8f_a6df_cb607f257eb7, v_fb9e3ef2_71da_4aa7_a148_39a5554666a5, false); 
    end
}

v_b4ea86a5_d4e9_4151_9288_96660f2deb9b = menu {
    nam = "v_b4ea86a5_d4e9_4151_9288_96660f2deb9b",
    dsc = function(s) return "{Go home}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_59045708_6d29_4c8f_a6df_cb607f257eb7, v_dafadce4_fc15_44e9_a1ff_7c026447d446, false); 
    end
}

v_780cc8ef_08cb_4cc7_ac2c_ed1ded0e0570 = menu {
    nam = "v_780cc8ef_08cb_4cc7_ac2c_ed1ded0e0570",
    dsc = function(s) return "{Wait for the island approaching}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_59045708_6d29_4c8f_a6df_cb607f257eb7, v_3e62618c_5603_44fe_8329_2e02aa03919d, false); 
    end
}

v_e3d143c4_38d2_4838_964e_3952feca4d47 = menu {
    nam = "v_e3d143c4_38d2_4838_964e_3952feca4d47",
    dsc = function(s) return "{Go to the library}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_59045708_6d29_4c8f_a6df_cb607f257eb7, v_c70038c3_a602_4bad_8802_c218d2036e86, false); 
    end
}

-- 88.Library entrance
v_c70038c3_a602_4bad_8802_c218d2036e86 = vnr {
    nam = '...',
    notes = '88.Library entrance',
    bgimg = function(s)
        if (true) then
            return 'images/008.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The Mech-City library towers above you, an enormous building with a roof crowned by a pointed steeple, topped with a book and a gear.");
pn();
pn(" Here, you can gain access to the knowledge available to the city\'s scholars, provided you know what you are looking for.");
pn();
pn(" Sometimes, the doors of the library open, and people go in and out. You notice the honor roll nearby.");
pn();
pn("");
pn();
    end,
    walk_to = "v_c70038c3_a602_4bad_8802_c218d2036e86_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_c70038c3_a602_4bad_8802_c218d2036e86_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_library = true;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

v_c70038c3_a602_4bad_8802_c218d2036e86_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_df0a9941_9bb3_4264_8774_710a8825dc3f);
        put(v_d432df19_2289_4c34_9f18_1fe1500006c1);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_df0a9941_9bb3_4264_8774_710a8825dc3f = menu {
    nam = "v_df0a9941_9bb3_4264_8774_710a8825dc3f",
    dsc = function(s) return "{Look at the honour roll}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_c70038c3_a602_4bad_8802_c218d2036e86, v_b4e2d7e0_cd88_4d53_8616_96744fbe613b, false); 
    end
}

v_d432df19_2289_4c34_9f18_1fe1500006c1 = menu {
    nam = "v_d432df19_2289_4c34_9f18_1fe1500006c1",
    dsc = function(s) return "{Go inside}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_c70038c3_a602_4bad_8802_c218d2036e86, v_944ab039_a844_40ce_9b23_39a774aaef37, false); 
    end
}

-- 89.The road home
v_dafadce4_fc15_44e9_a1ff_7c026447d446 = vnr {
    nam = '...',
    notes = '89.The road home',
    bgimg = function(s)
        if (true) then
            return 'images/005.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You leave the square and quickly head to your house. Its roof can already be seen at the end of the street.");
pn();
    end,
    walk_to = "v_dafadce4_fc15_44e9_a1ff_7c026447d446_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_dafadce4_fc15_44e9_a1ff_7c026447d446_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_20.ogg', 0);
    end,
    sndout = function(s) end,
};

v_dafadce4_fc15_44e9_a1ff_7c026447d446_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_dafadce4_fc15_44e9_a1ff_7c026447d446, v_aae627de_099e_4f0a_81a3_53aae7643ade, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 90
v_944ab039_a844_40ce_9b23_39a774aaef37 = vnr {
    nam = '...',
    notes = '90',
    bgimg = function(s)
        if (true) then
            return 'images/008.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    walk_to = "v_944ab039_a844_40ce_9b23_39a774aaef37_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        if (true) then         nlb:nlbwalk(v_944ab039_a844_40ce_9b23_39a774aaef37, v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437, true); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_944ab039_a844_40ce_9b23_39a774aaef37_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_library = true;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return 0, 0, vn.scr_w, vn.scr_h;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_20.ogg', 0);
    end,
    sndout = function(s) end,
};

-- 91.Book pick-up window
v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437 = vnr {
    nam = '...',
    notes = '91.Book pick-up window',
    bgimg = function(s)
        if (true) then
            return 'images/025.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You approach the counter. A tall, skinny librarian looks inquiringly at you. What would you like to know about Wild Island?");
pn();
    end,
    walk_to = "v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_steps.ogg', 0);
    end,
    sndout = function(s) end,
};

v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_67816c35_862c_468b_ad73_aa92097aca0c);
        put(v_b141e72e_7e16_4e94_8356_682a364d5e0f);
        put(v_c84ff0f0_597b_4707_a74f_5a4cbb5e4a62);
        put(v_b87d2655_e6ab_4323_90c3_b4f7508dd384);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_67816c35_862c_468b_ad73_aa92097aca0c = menu {
    nam = "v_67816c35_862c_468b_ad73_aa92097aca0c",
    dsc = function(s) return "{Read about the island\'s fauna}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437, v_956bdc9f_8f58_4a45_a714_e47b4d947d6c, false); 
    end
}

v_b141e72e_7e16_4e94_8356_682a364d5e0f = menu {
    nam = "v_b141e72e_7e16_4e94_8356_682a364d5e0f",
    dsc = function(s) return "{Read about the island\'s flora}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437, v_dece7f60_f5c7_4281_8f90_8bcf8441ac2e, false); 
    end
}

v_c84ff0f0_597b_4707_a74f_5a4cbb5e4a62 = menu {
    nam = "v_c84ff0f0_597b_4707_a74f_5a4cbb5e4a62",
    dsc = function(s) return "{Read about the inhabitants of the island}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437, v_9a9080f8_4675_45d6_8a30_e085793cceaa, false); 
    end
}

v_b87d2655_e6ab_4323_90c3_b4f7508dd384 = menu {
    nam = "v_b87d2655_e6ab_4323_90c3_b4f7508dd384",
    dsc = function(s) return "{Exit}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437, v_3713772f_4ae0_4041_bafb_098b91a490b9, false); 
    end
}

-- 92.Reed about island\'s flora
v_dece7f60_f5c7_4281_8f90_8bcf8441ac2e = vnr {
    nam = '...',
    notes = '92.Reed about island\'s flora',
    bgimg = function(s)
        if (true) then
            return 'images/023.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You quickly scan through a thick tome, filled with numerous articles and hard-to-pronounce names in an incomprehensible language.");
pn();
pn(" Two articles catch your attention. In the first article, a beautiful lilac flower is depicted in the picture. The text below the image reads:");
pn();
pn("");
pn();
pn("");
pn();
pn("\"Giant byblis (Byblis gigantea) - a group of insectivorous shrubs. Individual specimens can reach one meter in height.");
pn();
pn(" Their leaves are covered with sticky fuzz and glands that secrete digestive juice. It is known that even small animals may be entrapped by this plant.\"");
pn();
pn("");
pn();
pn("");
pn();
pn("Under the picture in the second article, you see a tall herbaceous plant, topped by a panicle of small, white flowers. The caption reads:");
pn();
pn("");
pn();
pn("\"Sedium - a group of plants that are widespread on Wild Island. It emits a strong smell when in bloom and can cause a sedative effect with prolonged contact. Travellers are not recommended to venture far into sedium fields due to potential danger.\"");
pn();
    end,
    walk_to = "v_dece7f60_f5c7_4281_8f90_8bcf8441ac2e_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_dece7f60_f5c7_4281_8f90_8bcf8441ac2e_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_library.ogg', 0);
    end,
    sndout = function(s) end,
};

v_dece7f60_f5c7_4281_8f90_8bcf8441ac2e_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_85dc0ae5_4a5e_460a_8d5a_90fcd39a9814);
        put(v_26aa8d2d_e555_4a42_b675_fb11d41b509d);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_85dc0ae5_4a5e_460a_8d5a_90fcd39a9814 = menu {
    nam = "v_85dc0ae5_4a5e_460a_8d5a_90fcd39a9814",
    dsc = function(s) return "{Return to  the counter}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dece7f60_f5c7_4281_8f90_8bcf8441ac2e, v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437, false); 
    end
}

v_26aa8d2d_e555_4a42_b675_fb11d41b509d = menu {
    nam = "v_26aa8d2d_e555_4a42_b675_fb11d41b509d",
    dsc = function(s) return "{Exit}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_dece7f60_f5c7_4281_8f90_8bcf8441ac2e, v_3713772f_4ae0_4041_bafb_098b91a490b9, false); 
    end
}

-- 93.Exit out of library
v_3713772f_4ae0_4041_bafb_098b91a490b9 = vnr {
    nam = '...',
    notes = '93.Exit out of library',
    bgimg = function(s)
        if (true) then
            return 'images/008.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("It seems you\'ve learned everything that can be useful. It\'s time to go.");
pn();
pn("");
pn();
pn("You open the door and leave the library. Reading books is very helpful, but maybe you\'ll have time to do something else.");
pn();
    end,
    walk_to = "v_3713772f_4ae0_4041_bafb_098b91a490b9_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_3713772f_4ae0_4041_bafb_098b91a490b9_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_steps.ogg', 0);
    end,
    sndout = function(s) end,
};

v_3713772f_4ae0_4041_bafb_098b91a490b9_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_3713772f_4ae0_4041_bafb_098b91a490b9_59045708_6d29_4c8f_a6df_cb607f257eb7__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_3713772f_4ae0_4041_bafb_098b91a490b9_59045708_6d29_4c8f_a6df_cb607f257eb7__Return = menu {
    nam = "v_3713772f_4ae0_4041_bafb_098b91a490b9_59045708_6d29_4c8f_a6df_cb607f257eb7__Return",
    dsc = function(s) return "{Go to the square}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_3713772f_4ae0_4041_bafb_098b91a490b9, v_59045708_6d29_4c8f_a6df_cb607f257eb7, false); 
    end
}

-- 94.About inhabitants of the island
v_9a9080f8_4675_45d6_8a30_e085793cceaa = vnr {
    nam = '...',
    notes = '94.About inhabitants of the island',
    bgimg = function(s)
        if (true) then
            return 'images/021.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("This book contains pictures of savagely looking people in loincloths. According to it, the inhabitants of this island are quite savage people.");
pn();
pn(" They live in small tribes and know what fire is, but they can\'t make it themselves. Each tribe carries fire in a wicker and worships it like an idol. The loss of fire is a great misfortune for these people. They communicate mainly through gestures.");
pn();
pn("");
pn();
pn("");
pn();
pn("You keep turning the pages, but soon it bores you. You may need to look for something else.");
pn();
    end,
    walk_to = "v_9a9080f8_4675_45d6_8a30_e085793cceaa_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_9a9080f8_4675_45d6_8a30_e085793cceaa_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_library.ogg', 0);
    end,
    sndout = function(s) end,
};

v_9a9080f8_4675_45d6_8a30_e085793cceaa_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_cc3d5663_027d_4333_8d1b_fbb8309720d3);
        put(v_46cebfda_4cf1_467e_bbec_8eac9a70917c);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_cc3d5663_027d_4333_8d1b_fbb8309720d3 = menu {
    nam = "v_cc3d5663_027d_4333_8d1b_fbb8309720d3",
    dsc = function(s) return "{Return to  the counter}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_9a9080f8_4675_45d6_8a30_e085793cceaa, v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437, false); 
    end
}

v_46cebfda_4cf1_467e_bbec_8eac9a70917c = menu {
    nam = "v_46cebfda_4cf1_467e_bbec_8eac9a70917c",
    dsc = function(s) return "{Exit}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_9a9080f8_4675_45d6_8a30_e085793cceaa, v_3713772f_4ae0_4041_bafb_098b91a490b9, false); 
    end
}

-- 95.About wild animals of the island
v_956bdc9f_8f58_4a45_a714_e47b4d947d6c = vnr {
    nam = '...',
    notes = '95.About wild animals of the island',
    bgimg = function(s)
        if (true) then
            return 'images/000.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You see a shaggy, scary beast with saber-sharp teeth on the cover of the book. You skim through the pages and find some information about it:");
pn();
pn("\"...this beast, which travelers called a saber-toothed wolf, is one of the largest predators of Wild Island.");
pn();
pn(" It is primarily a nocturnal animal. Tough fur and a thick layer of subcutaneous fat serve as fine armor, capable of stopping a rifle bullet.");
pn();
pn(" It is intolerant to loud and shrill sounds and unable to climb a tree, which can save an unlucky wayfarer who encounters this creature.\"");
pn();
pn("");
pn();
pn("");
pn();
pn("You close the book and shiver. It\'s better to steer clear of such a beast...");
pn();
    end,
    walk_to = "v_956bdc9f_8f58_4a45_a714_e47b4d947d6c_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_956bdc9f_8f58_4a45_a714_e47b4d947d6c_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_library.ogg', 0);
    end,
    sndout = function(s) end,
};

v_956bdc9f_8f58_4a45_a714_e47b4d947d6c_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_f0a35688_792a_444b_a18d_80faf92b9740);
        put(v_48bae80b_0f13_45f5_befa_f26469bb5af9);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_f0a35688_792a_444b_a18d_80faf92b9740 = menu {
    nam = "v_f0a35688_792a_444b_a18d_80faf92b9740",
    dsc = function(s) return "{Return to  the counter}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_956bdc9f_8f58_4a45_a714_e47b4d947d6c, v_9ca66b1d_7ee1_4f2c_aa02_f3836b7c1437, false); 
    end
}

v_48bae80b_0f13_45f5_befa_f26469bb5af9 = menu {
    nam = "v_48bae80b_0f13_45f5_befa_f26469bb5af9",
    dsc = function(s) return "{Exit}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_956bdc9f_8f58_4a45_a714_e47b4d947d6c, v_3713772f_4ae0_4041_bafb_098b91a490b9, false); 
    end
}

-- 96.The Road to the Wild Island
v_3e62618c_5603_44fe_8329_2e02aa03919d = vnr {
    nam = '...',
    notes = '96.The Road to the Wild Island',
    bgimg = function(s)
        if (true) then
            return 'images/009.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Expecting the wonder that many people witness just once in a lifetime, you hurry to the edge of Mech-City island.");
pn();
pn(" Very soon, you will see Wild Island float near. Joyful Snoopy runs close to you, sniffing the nearest bushes. He seems to look forward to seeing new lands too.");
pn();
pn("");
pn();
    end,
    walk_to = "v_3e62618c_5603_44fe_8329_2e02aa03919d_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_3e62618c_5603_44fe_8329_2e02aa03919d_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_20.ogg', 0);
    end,
    sndout = function(s) end,
};

v_3e62618c_5603_44fe_8329_2e02aa03919d_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_3e62618c_5603_44fe_8329_2e02aa03919d, v_2c3a43b3_c5ef_4975_af23_7d168d0c431d, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 97.Huntsman house entrance
v_094c0e54_62d5_41c0_8292_89029ea22e39 = vnr {
    nam = '...',
    notes = '97.Huntsman house entrance',
    bgimg = function(s)
        if (true) then
            return 'images/010.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The huntsman\'s house is severe and serious, much like its owner. On the door, there is a large copper ring fixed in the grinning iron jaws of an animal.");
pn();
pn(" Those who are not acquainted with Beobras may be disinclined to come in, only by the sight of the house.");
pn();
pn(" Actually, appearances are deceptive. Beobras is a good-natured person; he is frightening only to enemies of Mech-City. You come up to the door and seize the ring.");
pn();
pn("");
pn();
    end,
    walk_to = "v_094c0e54_62d5_41c0_8292_89029ea22e39_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_094c0e54_62d5_41c0_8292_89029ea22e39_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_hunterHouse = true;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_20.ogg', 0);
    end,
    sndout = function(s) end,
};

v_094c0e54_62d5_41c0_8292_89029ea22e39_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_094c0e54_62d5_41c0_8292_89029ea22e39_b9368e0d_ba21_4ddd_b951_3048fb59a57a__Traverse);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_094c0e54_62d5_41c0_8292_89029ea22e39_b9368e0d_ba21_4ddd_b951_3048fb59a57a__Traverse = menu {
    nam = "v_094c0e54_62d5_41c0_8292_89029ea22e39_b9368e0d_ba21_4ddd_b951_3048fb59a57a__Traverse",
    dsc = function(s) return "{Go inside}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_094c0e54_62d5_41c0_8292_89029ea22e39, v_b9368e0d_ba21_4ddd_b951_3048fb59a57a, false); 
    end
}

-- 98.Conan\'s room
v_b9368e0d_ba21_4ddd_b951_3048fb59a57a = vnr {
    nam = '...',
    notes = '98.Conan\'s room',
    bgimg = function(s)
        if (true) then
            return 'images/012.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Your friend Conan opens the door. Conan is broad-shouldered, pugnacious, and brawny. Nevertheless, he stands by his friends through thick and thin.");
pn();
pn("");
pn();
pn("Conan\'s room resembles a military barracks, perhaps influenced by his father\'s upbringing. A handmade bow hangs on the wall—a gift from his father. A horizontal bar is screwed into the corner.");
pn();
pn("");
pn();
pn("\"So, Henry, are you ready?!\"");
pn();
pn("");
pn();
pn("\"Yeah, buddy, of course! Shall we go?\"");
pn();
pn("");
pn();
pn("\"You bet! By the way,\" he lowers his voice. \"What about taking my father\'s rifle? He\'s out and won\'t come home until evening.\"");
pn();
    end,
    walk_to = "v_b9368e0d_ba21_4ddd_b951_3048fb59a57a_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b9368e0d_ba21_4ddd_b951_3048fb59a57a_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_haveConan =  true ;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_b9368e0d_ba21_4ddd_b951_3048fb59a57a_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_18c9f3cc_f19b_4b8a_8699_1920e202b9ea);
        put(v_2d8fd3f6_3452_45da_85ea_bb3f7a1159c4);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_18c9f3cc_f19b_4b8a_8699_1920e202b9ea = menu {
    nam = "v_18c9f3cc_f19b_4b8a_8699_1920e202b9ea",
    dsc = function(s) return "{\"Yes, let\'s do it, rifle will be useful!\"}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_b9368e0d_ba21_4ddd_b951_3048fb59a57a, v_6a24758f_6881_4f05_8c91_fc8af49983e5, false); 
    end
}

v_2d8fd3f6_3452_45da_85ea_bb3f7a1159c4 = menu {
    nam = "v_2d8fd3f6_3452_45da_85ea_bb3f7a1159c4",
    dsc = function(s) return "{Nah, your dad will surely find out and get angry. We`d better hurry, if we don\'t want to be late.}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_b9368e0d_ba21_4ddd_b951_3048fb59a57a, v_83307c44_13f1_44e7_917e_a3b56d98448c, false); 
    end
}

-- 99.Hall
v_83307c44_13f1_44e7_917e_a3b56d98448c = vnr {
    nam = '...',
    notes = '99.Hall',
    bgimg = function(s)
        if (true) then
            return 'images/011.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You open the door and leave. Conan is now part of your team. Although you don\'t have a rifle, there\'s still enough time to return to the square and take a walk around the city.");
pn();
    end,
    walk_to = "v_83307c44_13f1_44e7_917e_a3b56d98448c_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_83307c44_13f1_44e7_917e_a3b56d98448c_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_83307c44_13f1_44e7_917e_a3b56d98448c_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_83307c44_13f1_44e7_917e_a3b56d98448c_59045708_6d29_4c8f_a6df_cb607f257eb7__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_83307c44_13f1_44e7_917e_a3b56d98448c_59045708_6d29_4c8f_a6df_cb607f257eb7__Return = menu {
    nam = "v_83307c44_13f1_44e7_917e_a3b56d98448c_59045708_6d29_4c8f_a6df_cb607f257eb7__Return",
    dsc = function(s) return "{Go to the square}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_83307c44_13f1_44e7_917e_a3b56d98448c, v_59045708_6d29_4c8f_a6df_cb607f257eb7, false); 
    end
}

-- 100.Before the hall
v_b42ff477_cd32_48c5_aa17_2e8474b019f8 = vnr {
    nam = '...',
    notes = '100.Before the hall',
    bgimg = function(s)
        if (true) then
            return 'images/015.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Conan is obviously disappointed, but he usually listens to your advice.");
pn();
pn("\"Whatever you say, Henry. Pity, it could be helpful.\"");
pn();
    end,
    walk_to = "v_b42ff477_cd32_48c5_aa17_2e8474b019f8_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b42ff477_cd32_48c5_aa17_2e8474b019f8_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_b42ff477_cd32_48c5_aa17_2e8474b019f8_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_b42ff477_cd32_48c5_aa17_2e8474b019f8, v_83307c44_13f1_44e7_917e_a3b56d98448c, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 101.Hall 2
v_ac6a61ad_0351_440a_93fa_69622aee0bfc = vnr {
    nam = '...',
    notes = '101.Hall 2',
    bgimg = function(s)
        if (true) then
            return 'images/016.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("So as to obtain the rifle, you\'ve lost much time. An armed Conan is now with you, but there is not much time for anything else to do before Wild Island arrives. You have to hurry in order not to be late.");
pn();
    end,
    walk_to = "v_ac6a61ad_0351_440a_93fa_69622aee0bfc_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_ac6a61ad_0351_440a_93fa_69622aee0bfc_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_ac6a61ad_0351_440a_93fa_69622aee0bfc_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_ac6a61ad_0351_440a_93fa_69622aee0bfc_3e62618c_5603_44fe_8329_2e02aa03919d__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_ac6a61ad_0351_440a_93fa_69622aee0bfc_3e62618c_5603_44fe_8329_2e02aa03919d__Return = menu {
    nam = "v_ac6a61ad_0351_440a_93fa_69622aee0bfc_3e62618c_5603_44fe_8329_2e02aa03919d__Return",
    dsc = function(s) return "{Wait for the island approaching}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_ac6a61ad_0351_440a_93fa_69622aee0bfc, v_3e62618c_5603_44fe_8329_2e02aa03919d, false); 
    end
}

-- 103.Beobras\' room
v_6a24758f_6881_4f05_8c91_fc8af49983e5 = vnr {
    nam = '...',
    notes = '103.Beobras\' room',
    bgimg = function(s)
        if (true) then
            return 'images/014.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You are going upstairs to Beobras\' room. It resembles Conan\'s room, save for the bow; instead, there is a double-barrel gun in a closed case with glass doors.");
pn();
pn("");
pn();
pn("\"How do we take it out?\" you ask. \"It is locked!\"");
pn();
pn("");
pn();
pn("\"This lock is simple!\" brushes aside Conan. \"Give me five minutes.\"");
pn();
    end,
    walk_to = "v_6a24758f_6881_4f05_8c91_fc8af49983e5_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_6a24758f_6881_4f05_8c91_fc8af49983e5_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_6a24758f_6881_4f05_8c91_fc8af49983e5_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_76093497_63be_4132_a164_4a908c56b603);
        put(v_de3fd34f_67be_4e48_bd71_dd0db73401fc);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_76093497_63be_4132_a164_4a908c56b603 = menu {
    nam = "v_76093497_63be_4132_a164_4a908c56b603",
    dsc = function(s) return "{\"Well, try it, if you\'re so sure...\"}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_6a24758f_6881_4f05_8c91_fc8af49983e5, v_f7a4de82_73eb_44c8_8a89_4b87434407ec, false); 
    end
}

v_de3fd34f_67be_4e48_bd71_dd0db73401fc = menu {
    nam = "v_de3fd34f_67be_4e48_bd71_dd0db73401fc",
    dsc = function(s) return "{\"Listen, Conan, let\'s better not take it. I thought it would be simpler...\"}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_6a24758f_6881_4f05_8c91_fc8af49983e5, v_b42ff477_cd32_48c5_aa17_2e8474b019f8, false); 
    end
}

-- 102.Beobras\' room 2
v_f7a4de82_73eb_44c8_8a89_4b87434407ec = vnr {
    nam = '...',
    notes = '102.Beobras\' room 2',
    bgimg = function(s)
        if (true) then
            return 'images/013.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Conan moves a chair up to the case and begins to pick the lock with a steel nail. He obviously overestimated his skills because much time passed before he finally opens the case, takes the rifle, and hangs it behind his back. The rifle buttstock almost touches the ground, but now Conan has a rather bellicose air.");
pn();
    end,
    walk_to = "v_f7a4de82_73eb_44c8_8a89_4b87434407ec_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_f7a4de82_73eb_44c8_8a89_4b87434407ec_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
            nlb:addf(nil, v_47d7b7dd_a20f_438f_80f8_b87807f952d1, false);
_haveRifle =  true ;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_f7a4de82_73eb_44c8_8a89_4b87434407ec_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_88677a92_0035_46af_a70c_08c92437ff9b);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_88677a92_0035_46af_a70c_08c92437ff9b = menu {
    nam = "v_88677a92_0035_46af_a70c_08c92437ff9b",
    dsc = function(s) return "{It`s time to leave}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_f7a4de82_73eb_44c8_8a89_4b87434407ec, v_ac6a61ad_0351_440a_93fa_69622aee0bfc, false); 
    end
}

-- 104.Inventor\'s house entrance 
v_559abe26_1c41_49eb_8d45_914e314dab36 = vnr {
    nam = '...',
    notes = '104.Inventor\'s house entrance ',
    bgimg = function(s)
        if (true) then
            return 'images/007.1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("This small building, a house and a laboratory at the same time, is adorned with antennas from all sides.");
pn();
pn(" It belongs to Nikolas Swift, a very respectable citizen of Mech-City. Though he is strange like all other scholars, he knows a lot.");
pn();
pn(" There are also many interesting technical things in his laboratory, which are fascinating to boys. When you come to the door, it opens by itself, inviting you to enter. You wonder how Nikolas\' devices know that you are here?");
pn();
pn("");
pn();
    end,
    walk_to = "v_559abe26_1c41_49eb_8d45_914e314dab36_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_559abe26_1c41_49eb_8d45_914e314dab36_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_inventorHouse = true;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_20.ogg', 0);
    end,
    sndout = function(s) end,
};

v_559abe26_1c41_49eb_8d45_914e314dab36_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_559abe26_1c41_49eb_8d45_914e314dab36_2de1158f_816e_4452_b517_6a4ebf7f6da5__Traverse);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_559abe26_1c41_49eb_8d45_914e314dab36_2de1158f_816e_4452_b517_6a4ebf7f6da5__Traverse = menu {
    nam = "v_559abe26_1c41_49eb_8d45_914e314dab36_2de1158f_816e_4452_b517_6a4ebf7f6da5__Traverse",
    dsc = function(s) return "{Go inside}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_559abe26_1c41_49eb_8d45_914e314dab36, v_2de1158f_816e_4452_b517_6a4ebf7f6da5, false); 
    end
}

-- 105.Doyle\'s room
v_2de1158f_816e_4452_b517_6a4ebf7f6da5 = vnr {
    nam = '...',
    notes = '105.Doyle\'s room',
    bgimg = function(s)
        if (true) then
            return 'images/017.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Passing the laboratory, where Nikolas is fiddling around with his great invention, you enter Doyle\'s room. Doyle is reading something, sitting on the bed.");
pn();
pn("Doyle is quite tall for his age, a skinny fellow with long hair. Things are not always what they seem; he\'s not exactly a grunt—on the contrary, he likes playing basketball. However, nobody expects great results from him because it is science that he likes more.");
pn();
pn("\"Hello, Henry!\" Doyle puts the book aside. \"Is it time?\"");
pn();
pn("\"Yeah, pack up your things!\"");
pn();
pn("\"Let\'s just drop by father\'s for a minute. You\'ll see, he\'s completing such an interesting thing...\"");
pn();
pn("You think about his proposal. Swift\'s workshop is a very interesting place, but the host is quite talkative, and most likely won\'t let you leave so easily.");
pn();
    end,
    walk_to = "v_2de1158f_816e_4452_b517_6a4ebf7f6da5_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_2de1158f_816e_4452_b517_6a4ebf7f6da5_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_haveDoyle =  true ;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_2de1158f_816e_4452_b517_6a4ebf7f6da5_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_2effd9d2_dda7_49a2_bd70_477bee037424);
        put(v_cc600ae9_480e_422f_9bdb_67ce7f024427);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_2effd9d2_dda7_49a2_bd70_477bee037424 = menu {
    nam = "v_2effd9d2_dda7_49a2_bd70_477bee037424",
    dsc = function(s) return "{\"Of course, let\'s go!\"}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_2de1158f_816e_4452_b517_6a4ebf7f6da5, v_be52adeb_f343_46a1_9790_d6a8589f52f8, false); 
    end
}

v_cc600ae9_480e_422f_9bdb_67ce7f024427 = menu {
    nam = "v_cc600ae9_480e_422f_9bdb_67ce7f024427",
    dsc = function(s) return "{\"We\'d better hurry, not to be late\".}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_2de1158f_816e_4452_b517_6a4ebf7f6da5, v_0c3c204f_f86e_427d_92ba_38cf8e0cf768, false); 
    end
}

-- 106.Workshop
v_be52adeb_f343_46a1_9790_d6a8589f52f8 = vnr {
    nam = '...',
    notes = '106.Workshop',
    bgimg = function(s)
        if (true) then
            return 'images/018.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The workshop is a large and luminous room. There are lots of incomprehensible devices and tools. Nikolas, dressed in black overalls, is standing by the workbench, grinding some part with a file.");
pn();
pn(" You can see something, a cross between a dummy and a knight\'s armor standing near the workbench. There are gears in the figure\'s chest.");
pn();
pn("");
pn();
pn("\"Father calls it a golem,\" whispers Doyle. \"He\'s joking, of course; golems exist only in tales. This is a robot.\"");
pn();
pn("\"A robot?\" you ask. \"Can it think?\"");
pn();
pn("\"No, not yet. It\'s difficult to make a machine that is able to think by itself. Father will operate it from the control panel.\"");
pn();
pn("\"And what is that?\" you ask, pointing at a flat metal box with a round metal wheel on one side.");
pn();
pn("\"We have called it a lighter,\" says Doyle. \"There is benzene inside. When you turn the wheel, sparks are produced, and benzene catches fire. It\'s more convenient than matches.\"");
pn();
pn("\"Shall we take it, just in case?\"");
pn();
pn("\"Okay.\"");
pn();
pn("Doyle puts the lighter in his pocket. At the same time, Nikolas notices you.");
pn();
pn("\"Hello, boys!\" he smiles. \"Would you like me to tell you about my golem?\"");
pn();
pn("You unnoticeably pull Doyle\'s sleeve, but it\'s too late. You don\'t want to offend Nikolas, so you patiently listen to him.");
pn();
pn(" Time flies, and you constantly look at the clock. And finally, when the moment is right, you make an excuse and say that you have to go.");
pn();
pn("");
pn();
    end,
    walk_to = "v_be52adeb_f343_46a1_9790_d6a8589f52f8_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_be52adeb_f343_46a1_9790_d6a8589f52f8_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
            nlb:addf(nil, v_fd8560c2_3ab4_433d_9fd3_78e916aedb43, false);
_haveLighter =  true ;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_be52adeb_f343_46a1_9790_d6a8589f52f8_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_83e915c3_850a_41cc_a231_34e1ef3a1f3a);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_83e915c3_850a_41cc_a231_34e1ef3a1f3a = menu {
    nam = "v_83e915c3_850a_41cc_a231_34e1ef3a1f3a",
    dsc = function(s) return "{Go out}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_be52adeb_f343_46a1_9790_d6a8589f52f8, v_c8944019_5e31_4b64_8f12_06c5442d178d, false); 
    end
}

-- 107.Hall
v_0c3c204f_f86e_427d_92ba_38cf8e0cf768 = vnr {
    nam = '...',
    notes = '107.Hall',
    bgimg = function(s)
        if (true) then
            return 'images/007.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Doyle is now with you, and as everybody knows, knowledge is power. You pass through the automatically opening gates of Nikolas\' workshop and head out.");
pn();
    end,
    walk_to = "v_0c3c204f_f86e_427d_92ba_38cf8e0cf768_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_0c3c204f_f86e_427d_92ba_38cf8e0cf768_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_0c3c204f_f86e_427d_92ba_38cf8e0cf768_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_0c3c204f_f86e_427d_92ba_38cf8e0cf768_59045708_6d29_4c8f_a6df_cb607f257eb7__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_0c3c204f_f86e_427d_92ba_38cf8e0cf768_59045708_6d29_4c8f_a6df_cb607f257eb7__Return = menu {
    nam = "v_0c3c204f_f86e_427d_92ba_38cf8e0cf768_59045708_6d29_4c8f_a6df_cb607f257eb7__Return",
    dsc = function(s) return "{Go to the square}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_0c3c204f_f86e_427d_92ba_38cf8e0cf768, v_59045708_6d29_4c8f_a6df_cb607f257eb7, false); 
    end
}

-- 108.Hall 2
v_c8944019_5e31_4b64_8f12_06c5442d178d = vnr {
    nam = '...',
    notes = '108.Hall 2',
    bgimg = function(s)
        if (true) then
            return 'images/007.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Doyle is now with you, and as everybody knows, knowledge is power. Besides, now you have a lighter that will surely serve you well.");
pn();
pn(" Unfortunately, Nikolas\' story took too much time, and now you have to hurry so as not to be late for Wild Island\'s arrival.");
pn();
pn("");
pn();
    end,
    walk_to = "v_c8944019_5e31_4b64_8f12_06c5442d178d_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_c8944019_5e31_4b64_8f12_06c5442d178d_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_c8944019_5e31_4b64_8f12_06c5442d178d_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_c8944019_5e31_4b64_8f12_06c5442d178d_3e62618c_5603_44fe_8329_2e02aa03919d__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_c8944019_5e31_4b64_8f12_06c5442d178d_3e62618c_5603_44fe_8329_2e02aa03919d__Return = menu {
    nam = "v_c8944019_5e31_4b64_8f12_06c5442d178d_3e62618c_5603_44fe_8329_2e02aa03919d__Return",
    dsc = function(s) return "{Wait for the island approaching}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_c8944019_5e31_4b64_8f12_06c5442d178d, v_3e62618c_5603_44fe_8329_2e02aa03919d, false); 
    end
}

-- 109.Honour roll
v_b4e2d7e0_cd88_4d53_8616_96744fbe613b = vnr {
    nam = '...',
    notes = '109.Honour roll',
    bgimg = function(s)
        if (s.tag == 'English') then
            return 'images/bp_eng.jpg';
        elseif (s.tag == 'Russian') then
            return 'images/bp_rus.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Coming closer to the square, you notice an honour roll with photos of the prominent residents of Mech-City.");
pn();
pn(" For a second, you stop in front of it. You feel pride because such remarkable people live in your city. But it\'s time to go!");
pn();
pn("");
pn();
    end,
    walk_to = "v_b4e2d7e0_cd88_4d53_8616_96744fbe613b_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b4e2d7e0_cd88_4d53_8616_96744fbe613b_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        if not _langArg then
            stead.add_var { _langArg = nlb:clonelst(listobj, "_langArg"); }
        end;
        nlb:push(_langArg.listnam, s);
nlb:acta(v_a5d4643d_8956_4d4d_abe9_4e4fa6129c69);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

v_b4e2d7e0_cd88_4d53_8616_96744fbe613b_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_b4e2d7e0_cd88_4d53_8616_96744fbe613b, v_944ab039_a844_40ce_9b23_39a774aaef37, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 110.Traveler\'s house entrance 
v_fb9e3ef2_71da_4aa7_a148_39a5554666a5 = vnr {
    nam = '...',
    notes = '110.Traveler\'s house entrance ',
    bgimg = function(s)
        if (true) then
            return 'images/006.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("The house of the traveler Cyrus Paganel is the favorite place of the local kids because they love his stories about remote lands.");
pn();
pn(" And half of Mech-City\'s boys are in love with his daughter, Irene. She, however, just chuckles; now she is more interested in journeys to distant islands. You come up to the door and knock on it. You hear steps inside, and the host opens the door.");
pn();
pn("");
pn();
pn("\"Hello, Henry!\" he says. \"Come on in!\"");
pn();
    end,
    walk_to = "v_fb9e3ef2_71da_4aa7_a148_39a5554666a5_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_fb9e3ef2_71da_4aa7_a148_39a5554666a5_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_travellerHouse = true;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_20.ogg', 0);
    end,
    sndout = function(s) end,
};

v_fb9e3ef2_71da_4aa7_a148_39a5554666a5_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_fb9e3ef2_71da_4aa7_a148_39a5554666a5_59bf71a8_b668_4398_bb6c_f884b1b17522__Traverse);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_fb9e3ef2_71da_4aa7_a148_39a5554666a5_59bf71a8_b668_4398_bb6c_f884b1b17522__Traverse = menu {
    nam = "v_fb9e3ef2_71da_4aa7_a148_39a5554666a5_59bf71a8_b668_4398_bb6c_f884b1b17522__Traverse",
    dsc = function(s) return "{Go inside}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_fb9e3ef2_71da_4aa7_a148_39a5554666a5, v_59bf71a8_b668_4398_bb6c_f884b1b17522, false); 
    end
}

-- 111.Irene\'s room
v_59bf71a8_b668_4398_bb6c_f884b1b17522 = vnr {
    nam = '...',
    notes = '111.Irene\'s room',
    bgimg = function(s)
        if (true) then
            return 'images/019.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Cyrus closes the door and goes to his study. You head to Irene\'s room and knock on the door.");
pn();
pn("Irene greets you with an impatient exclamation. She is petite and flexible like a tiny snake. A green-grey cloak covers her shoulders, almost reaching the ground. Irene is fond of playing hide-and-seek and always wins.");
pn();
pn("\"Henry, quickly, let\'s go, or we\'ll be late! Go-go-go!\"");
pn();
pn("\"Wait,\" you say, \"Maybe we can ask your dad if he can tell us something about the island...\"");
pn();
pn("\"Don\'t! You know him, he will deliver a one-hour lecture, and we\'ll definitely be late!\"");
pn();
pn("Cyrus is not as verbose as Nikolas Swift; maybe Irene\'s worries are groundless. After all, she is a fidget; it\'s amazing how she manages to sit still when hiding.");
pn();
    end,
    walk_to = "v_59bf71a8_b668_4398_bb6c_f884b1b17522_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_59bf71a8_b668_4398_bb6c_f884b1b17522_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_haveIren =  true ;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_59bf71a8_b668_4398_bb6c_f884b1b17522_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_b0e4125c_b5de_4f89_ad2b_2397d40e356a);
        put(v_7205fbf7_88de_4977_b902_960d75f20261);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_b0e4125c_b5de_4f89_ad2b_2397d40e356a = menu {
    nam = "v_b0e4125c_b5de_4f89_ad2b_2397d40e356a",
    dsc = function(s) return "{Talk to Cyrus}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_59bf71a8_b668_4398_bb6c_f884b1b17522, v_d39312fb_0fea_4106_91a9_a0d96b4baae0, false); 
    end
}

v_7205fbf7_88de_4977_b902_960d75f20261 = menu {
    nam = "v_7205fbf7_88de_4977_b902_960d75f20261",
    dsc = function(s) return "{Go out}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_59bf71a8_b668_4398_bb6c_f884b1b17522, v_a20dc031_e527_43d4_bbea_a19700ae0eb5, false); 
    end
}

-- 112.Cyrus\' room
v_d39312fb_0fea_4106_91a9_a0d96b4baae0 = vnr {
    nam = '...',
    notes = '112.Cyrus\' room',
    bgimg = function(s)
        if (true) then
            return 'images/020.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Cyrus is sitting at his writing desk, looking at maps of some lands. Having noticed you coming through the door, he puts them aside.");
pn();
pn("\"Mr. Cyrus, do you happen to have the map of Wild Island?\" you ask.");
pn();
pn("\"I had it somewhere,\" he answers, \"let\'s look for it.\"");
pn();
pn("You keep searching for quite a long time, in spite of the fact that everyone is trying to help. Alas, the sheet of parchment that is found disappoints you. The map is incomplete and not of much benefit to you.");
pn();
pn("\"Chin up, Henry!\" Cyrus consoles you. \"Look what I found!\"");
pn();
pn("He holds a massive spyglass in his hands. It consists of two black cylinders, belted by copper rings. The lenses gleam dimly.");
pn();
pn("\"I thought I had lost it long ago!\" he smiles. \"Well, since we found it thanks to you, take it. It\'s yours!\"");
pn();
pn("Such a present improves your mood, and now you say goodbye to Cyrus and head to the exit.");
pn();
    end,
    walk_to = "v_d39312fb_0fea_4106_91a9_a0d96b4baae0_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_d39312fb_0fea_4106_91a9_a0d96b4baae0_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
            nlb:addf(nil, v_aa30603b_c44f_4577_b460_b621b8bc1faa, false);
_haveLGlass =  true ;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_d39312fb_0fea_4106_91a9_a0d96b4baae0_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_0552d60e_bb42_4a97_97ce_d3a45058a95b);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_0552d60e_bb42_4a97_97ce_d3a45058a95b = menu {
    nam = "v_0552d60e_bb42_4a97_97ce_d3a45058a95b",
    dsc = function(s) return "{Go out}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_d39312fb_0fea_4106_91a9_a0d96b4baae0, v_5c27b028_180f_452b_a4f8_655004b6c6ba, false); 
    end
}

-- 113.Hall 2
v_5c27b028_180f_452b_a4f8_655004b6c6ba = vnr {
    nam = '...',
    notes = '113.Hall 2',
    bgimg = function(s)
        if (true) then
            return 'images/006.1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Irene is now with you; she can act secretly and stealthily if necessary. Additionally, you have a spyglass, which will surely be of use to you.");
pn();
pn(" However, you spent too much time looking for it. Now you have to hurry if you don\'t want to be late to see Wild Island.");
pn();
pn("");
pn();
    end,
    walk_to = "v_5c27b028_180f_452b_a4f8_655004b6c6ba_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_5c27b028_180f_452b_a4f8_655004b6c6ba_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_5c27b028_180f_452b_a4f8_655004b6c6ba_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_5c27b028_180f_452b_a4f8_655004b6c6ba_3e62618c_5603_44fe_8329_2e02aa03919d__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_5c27b028_180f_452b_a4f8_655004b6c6ba_3e62618c_5603_44fe_8329_2e02aa03919d__Return = menu {
    nam = "v_5c27b028_180f_452b_a4f8_655004b6c6ba_3e62618c_5603_44fe_8329_2e02aa03919d__Return",
    dsc = function(s) return "{Wait for the island approaching}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_5c27b028_180f_452b_a4f8_655004b6c6ba, v_3e62618c_5603_44fe_8329_2e02aa03919d, false); 
    end
}

-- 114.Hall
v_a20dc031_e527_43d4_bbea_a19700ae0eb5 = vnr {
    nam = '...',
    notes = '114.Hall',
    bgimg = function(s)
        if (true) then
            return 'images/006.1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Irene is now with you. If you need to do something secretly and stealthily, she is the best choice. Moreover, you\'ve got plenty of time, and you can return to the square to do something else.");
pn();
    end,
    walk_to = "v_a20dc031_e527_43d4_bbea_a19700ae0eb5_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_a20dc031_e527_43d4_bbea_a19700ae0eb5_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_a20dc031_e527_43d4_bbea_a19700ae0eb5_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_a20dc031_e527_43d4_bbea_a19700ae0eb5_59045708_6d29_4c8f_a6df_cb607f257eb7__Return);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_a20dc031_e527_43d4_bbea_a19700ae0eb5_59045708_6d29_4c8f_a6df_cb607f257eb7__Return = menu {
    nam = "v_a20dc031_e527_43d4_bbea_a19700ae0eb5_59045708_6d29_4c8f_a6df_cb607f257eb7__Return",
    dsc = function(s) return "{Go to the square}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_a20dc031_e527_43d4_bbea_a19700ae0eb5, v_59045708_6d29_4c8f_a6df_cb607f257eb7, false); 
    end
}

-- 115.At home
v_ffe1ed80_5652_4e2f_86da_cb4aed21410f = vnr {
    nam = '...',
    notes = '115.At home',
    bgimg = function(s)
        if (true) then
            return 'images/002.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You jump up and realize that you are in bed. The room is filled with morning light. Your parents are very close, discussing something.");
pn();
pn(" Snoopy is sniffing something in the corner of the room. Having noticed that you are awake, he lively runs up to you and tries to lick your face, jumping near the bed.");
pn();
pn(" You laugh and give him a hug. For almost a year, you had been asking your parents to buy a dog, and finally, you got this devoted friend on your birthday.");
pn();
pn(" Snoopy is a very young dog, better to say a puppy. He is curious about everything and follows you everywhere.");
pn();
pn("");
pn();
pn("");
pn();
pn("Without a doubt, this day will be interesting. And the most amazing thing is that Wild Island really approaches Mech-City!");
pn();
pn(" Wild Island is just a plot of land that floats constantly close to your island, which is called Mech-City, the same as the main city.");
pn();
pn(" Usually, it is quite far, but nevertheless, there were foolhardy travelers who were able to get there on balloons filled with hot air.");
pn();
pn(" However, something has happened, and Wild Island is getting closer to Mech-City with every passing day.");
pn();
pn(" This hot issue is being discussed by all scientists and travelers. According to the latest research, today Wild Island will float to the edge of Mech-City and will stay close for almost a day.");
pn();
pn(" Where it is going to fly after - nobody knows. The laws of islands\' floating are poorly studied so far, even by the most prominent scientists.");
pn();
pn("");
pn();
pn("");
pn();
pn("Well, it\'s time to get ready; otherwise, you can be late! And you can\'t miss such a rare event.");
pn();
    end,
    walk_to = "v_ffe1ed80_5652_4e2f_86da_cb4aed21410f_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_ffe1ed80_5652_4e2f_86da_cb4aed21410f_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_2.ogg', 0);
    end,
    sndout = function(s) end,
};

v_ffe1ed80_5652_4e2f_86da_cb4aed21410f_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_61944c0e_2dc4_4922_9475_e9f3b6d89466);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_61944c0e_2dc4_4922_9475_e9f3b6d89466 = menu {
    nam = "v_61944c0e_2dc4_4922_9475_e9f3b6d89466",
    dsc = function(s) return "{Go out}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_ffe1ed80_5652_4e2f_86da_cb4aed21410f, v_aae627de_099e_4f0a_81a3_53aae7643ade, false); 
    end
}

-- 116
v_2c3a43b3_c5ef_4975_af23_7d168d0c431d = vnr {
    nam = '...',
    notes = '116',
    bgimg = function(s)
        if (true) then
            return 'images/009.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You are in a hurry, almost as if in a dream, pushing branches of the coastal trees apart, afraid of being late.");
pn();
pn(" Here is the edge of the island. A huge crowd has already gathered; people have come to watch this unprecedented event.");
pn();
pn(" Mech-City folk usually call the edge of the island the strand, and it truly resembles one. Grass does not grow here, and everything is covered with sand.");
pn();
pn(" When a strong wind blows, grains of sand rise into the air and fall into the fathomless depths under the island.");
pn();
pn(" Normally, only clouds and the foggy outlines of distant islands can be seen from the strand, but today everything is different. You stand still, and a sigh of excitement escapes your chest.");
pn();
pn("");
pn();
    end,
    walk_to = "v_2c3a43b3_c5ef_4975_af23_7d168d0c431d_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_2c3a43b3_c5ef_4975_af23_7d168d0c431d_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/another_world_day_3.ogg', 0);
    end,
    sndout = function(s) end,
};

v_2c3a43b3_c5ef_4975_af23_7d168d0c431d_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if true then
        nlb:nlbwalk(v_2c3a43b3_c5ef_4975_af23_7d168d0c431d, v_be7d0e00_c9c8_4481_a6af_a9da5f172408, false); 
    return;
end;
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 117.Shed
v_599e5e30_e43e_4fb2_b0a7_b21cc30f0fb8 = vnr {
    nam = '...',
    notes = '117.Shed',
    bgimg = function(s)
        if (true) then
            return 'images/004.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("You are approaching the old shed. Here you know every trail, every crack. How many times you\'ve played here, imagining yourself in caves of another island, or inside an airship!");
pn();
pn("");
pn();
pn("You step inside. There is a workbench surrounded by piles of long, waved wood shavings. Various gardening tools are in the corner near the workbench. On the other side, your father has fixed a few shelves full of all sorts of things.");
pn();
pn("");
pn();
pn("There is a small metal canister with a long spout on one of the shelves. Father uses it to deal with weeds in the garden.");
pn();
pn(" This liquid astonishes and frightens you at the same time: the stuff kills weeds at once, and nothing can grow there for a long time.");
pn();
pn("");
pn();
pn("");
pn();
pn("You\'ve heard frightening rumors that cannibal plants grow on Wild Island. Looking around, you take the canister and put it in your backpack. Now you feel safer.");
pn();
    end,
    walk_to = "v_599e5e30_e43e_4fb2_b0a7_b21cc30f0fb8_choices",
    autos = function(s)
        update_action_count();
        nlb:revive();
        nlb:ways_chk(s);
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_599e5e30_e43e_4fb2_b0a7_b21cc30f0fb8_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
            nlb:addf(nil, v_d0896d82_0284_43f2_85ad_3ecd3925457c, false);
_haveHerbicide =  true ;
_shed = true;
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/main_theme_2.ogg', 0);
    end,
    sndout = function(s) end,
};

v_599e5e30_e43e_4fb2_b0a7_b21cc30f0fb8_choices = vn_choices {
    nam = "...",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        vn:unlock_direct();
        put(v_b70fe175_2b49_42fd_ae1e_f28b16944d50);
        s:initf();
    end,
    theme_file = function(s) return "theme_vn.lua"; end,
    initf = function(s) 
        return vn:auto_geom_choices('dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_b70fe175_2b49_42fd_ae1e_f28b16944d50 = menu {
    nam = "v_b70fe175_2b49_42fd_ae1e_f28b16944d50",
    dsc = function(s) return "{Go back}^^" end, 
    act = function(s) 
        nlb:nlbwalk(v_599e5e30_e43e_4fb2_b0a7_b21cc30f0fb8, v_aae627de_099e_4f0a_81a3_53aae7643ade, false); 
    end
}

