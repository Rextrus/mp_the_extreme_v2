
/*

script by Sheep Wizard
taken from mp_race by Noob
Thanks for permission to use it!
*/

init()
{
    precacheMenu("cj_leaderboard");
    precacheMenu("cj_leaderboard_easy");

    thread easyStart();
    thread easyEnd();
    thread interStart();
    thread interEnd();
    thread interplusStart();
    thread interplusEnd();
    thread hardStart();
    thread hardEnd();
    thread elevateStart();
    thread elevateEnd();

    thread cj_menu1();
    thread cj_menu2();
    thread vars();
}   

cj_menu1()
{
    trig = getEnt("leaderboard_trig", "targetname");
    while(1)
    {
        trig waittill("trigger", player);
       
        player thread openleaderboardMenu();
        wait 0.05;
    }
}
cj_menu2()
{
    trig = getEnt("leaderboard_trig2", "targetname");
    while(1)
    {
        trig waittill("trigger", player);
       
        player thread openleaderboardMenu();
        wait 0.05;
    }
}
 
//set player dvars for leaderboard menu
openleaderboardMenu()
{
    //stop multiple loops for 1 player
    self notify("restart_menuthread");
    self endon("restart_menuthread");
    self endon("disconnect");
   
    //menus opsn on easy
    self openMenu("cj_leaderboard_easy");
    self setClientDvars( "cj_leaderboard_1_n", level.easy_lb[5]["player"],
                         "cj_leaderboard_1_t", realtime(level.easy_lb[5]["time"]),
                         "cj_leaderboard_2_n", level.easy_lb[4]["player"],
                         "cj_leaderboard_2_t", realtime(level.easy_lb[4]["time"]),
                         "cj_leaderboard_3_n", level.easy_lb[3]["player"],
                         "cj_leaderboard_3_t", realtime(level.easy_lb[3]["time"]),
                         "cj_leaderboard_4_n", level.easy_lb[2]["player"],
                         "cj_leaderboard_4_t", realtime(level.easy_lb[2]["time"]),
                         "cj_leaderboard_5_n", level.easy_lb[1]["player"],
                         "cj_leaderboard_5_t", realtime(level.easy_lb[1]["time"]),
                         "cj_leaderboard_6_n", level.easy_lb[0]["player"],
                         "cj_leaderboard_6_t", realtime(level.easy_lb[0]["time"]));
 
                         
    while(1)
    {
        self waittill("menuresponse", menu, response);
        if(response == "easy_scores" && menu == "cj_leaderboard_easy")
        {
             self setClientDvars( "cj_leaderboard_1_n", level.easy_lb[5]["player"],
                         "cj_leaderboard_1_t", realtime(level.easy_lb[5]["time"]),
                         "cj_leaderboard_2_n", level.easy_lb[4]["player"],
                         "cj_leaderboard_2_t", realtime(level.easy_lb[4]["time"]),
                         "cj_leaderboard_3_n", level.easy_lb[3]["player"],
                         "cj_leaderboard_3_t", realtime(level.easy_lb[3]["time"]),
                         "cj_leaderboard_4_n", level.easy_lb[2]["player"],
                         "cj_leaderboard_4_t", realtime(level.easy_lb[2]["time"]),
                         "cj_leaderboard_5_n", level.easy_lb[1]["player"],
                         "cj_leaderboard_5_t", realtime(level.easy_lb[1]["time"]),
                         "cj_leaderboard_6_n", level.easy_lb[0]["player"],
                         "cj_leaderboard_6_t", realtime(level.easy_lb[0]["time"]));
        }
        if(response == "inter_scores" && menu == "cj_leaderboard_easy")
        {
 
             self setClientDvars( "cj_leaderboard_1_n", level.inter_lb[5]["player"],
                         "cj_leaderboard_1_t", realtime(level.inter_lb[5]["time"]),
                         "cj_leaderboard_2_n", level.inter_lb[4]["player"],
                         "cj_leaderboard_2_t", realtime(level.inter_lb[4]["time"]),
                         "cj_leaderboard_3_n", level.inter_lb[3]["player"],
                         "cj_leaderboard_3_t", realtime(level.inter_lb[3]["time"]),
                         "cj_leaderboard_4_n", level.inter_lb[2]["player"],
                         "cj_leaderboard_4_t", realtime(level.inter_lb[2]["time"]),
                         "cj_leaderboard_5_n", level.inter_lb[1]["player"],
                         "cj_leaderboard_5_t", realtime(level.inter_lb[1]["time"]),
                         "cj_leaderboard_6_n", level.inter_lb[0]["player"],
                         "cj_leaderboard_6_t", realtime(level.inter_lb[0]["time"]));
        }  
        if(response == "interplus_scores" && menu == "cj_leaderboard_easy")
        {
 
            self setClientDvars( "cj_leaderboard_1_n", level.interplus_lb[5]["player"],
                         "cj_leaderboard_1_t", realtime(level.interplus_lb[5]["time"]),
                         "cj_leaderboard_2_n", level.interplus_lb[4]["player"],
                         "cj_leaderboard_2_t", realtime(level.interplus_lb[4]["time"]),
                         "cj_leaderboard_3_n", level.interplus_lb[3]["player"],
                         "cj_leaderboard_3_t", realtime(level.interplus_lb[3]["time"]),
                         "cj_leaderboard_4_n", level.interplus_lb[2]["player"],
                         "cj_leaderboard_4_t", realtime(level.interplus_lb[2]["time"]),
                         "cj_leaderboard_5_n", level.interplus_lb[1]["player"],
                         "cj_leaderboard_5_t", realtime(level.interplus_lb[1]["time"]),
                         "cj_leaderboard_6_n", level.interplus_lb[0]["player"],
                         "cj_leaderboard_6_t", realtime(level.interplus_lb[0]["time"]));
        }
        if(response == "hard_scores" && menu == "cj_leaderboard_easy")
        {
            self setClientDvars( "cj_leaderboard_1_n", level.hard_lb[5]["player"],
                         "cj_leaderboard_1_t", realtime(level.hard_lb[5]["time"]),
                         "cj_leaderboard_2_n", level.hard_lb[4]["player"],
                         "cj_leaderboard_2_t", realtime(level.hard_lb[4]["time"]),
                         "cj_leaderboard_3_n", level.hard_lb[3]["player"],
                         "cj_leaderboard_3_t", realtime(level.hard_lb[3]["time"]),
                         "cj_leaderboard_4_n", level.hard_lb[2]["player"],
                         "cj_leaderboard_4_t", realtime(level.hard_lb[2]["time"]),
                         "cj_leaderboard_5_n", level.hard_lb[1]["player"],
                         "cj_leaderboard_5_t", realtime(level.hard_lb[1]["time"]),
                         "cj_leaderboard_6_n", level.hard_lb[0]["player"],
                         "cj_leaderboard_6_t", realtime(level.hard_lb[0]["time"]));
        }
        if(response == "elevate_scores" && menu == "cj_leaderboard_easy")
        {
            self setClientDvars( "cj_leaderboard_1_n", level.elevate_lb[5]["player"],
                         "cj_leaderboard_1_t", realtime(level.elevate_lb[5]["time"]),
                         "cj_leaderboard_2_n", level.elevate_lb[4]["player"],
                         "cj_leaderboard_2_t", realtime(level.elevate_lb[4]["time"]),
                         "cj_leaderboard_3_n", level.elevate_lb[3]["player"],
                         "cj_leaderboard_3_t", realtime(level.elevate_lb[3]["time"]),
                         "cj_leaderboard_4_n", level.elevate_lb[2]["player"],
                         "cj_leaderboard_4_t", realtime(level.elevate_lb[2]["time"]),
                         "cj_leaderboard_5_n", level.elevate_lb[1]["player"],
                         "cj_leaderboard_5_t", realtime(level.elevate_lb[1]["time"]),
                         "cj_leaderboard_6_n", level.elevate_lb[0]["player"],
                         "cj_leaderboard_6_t", realtime(level.elevate_lb[0]["time"]));
        }
        wait 0.05;
    }
}
checkpointreset()
{
    self.easychk1 = undefined;
    self.easychk2 = undefined;
    self.easychk3 = undefined;
    self.interchk1 = undefined;
    self.interchk2 = undefined;
    self.interchk3 = undefined;
    self.interpluschk1 = undefined;
    self.interpluschk2 = undefined;
    self.interpluschk3 = undefined;
    self.hardchk1 = undefined;
    self.hardchk2 = undefined;
    self.hardchk3 = undefined;
    self.elevatechk1 = undefined;
    self.elevatechk2 = undefined;
    self.elevatechk3 = undefined;
 
    self.easyEnd = undefined;
    self.startTimeEasy = undefined;
    self.interEnd = undefined;
    self.startTimeInter = undefined;
    self.interplusEnd = undefined;
    self.startTimeInterplus = undefined;
    self.hardEnd = undefined;
    self.startTimeHard = undefined;
    self.elevateEnd = undefined;
    self.startTimeelevate = undefined;
}  
//EASY TIMER
easyStart()
{
    level endon("game_ended");
   
    trigger = getent("easybegin", "targetname");
 
    while(1)
    {
        trigger waittill("trigger", player);
       
        if(player.sessionstate == "playing")
        {
            player checkpointreset();
            player.startTimeEasy = getTime();
            player.easyend = undefined;
            player thread easychk();
        }                      
    }
}
easyEnd()
{
    level endon("game_ended");
   
    trigger = getent("easyend", "targetname");
    while(1)
    {
        trigger waittill("trigger", player);
       
        if(player.sessionstate != "playing" || isDefined(player.easyend) || !isDefined(player.startTimeEasy))
            continue;
   
        else
        {
            if(isDefined(player.easychk1) && isDefined(player.easychk2) && isDefined(player.easychk3))
            {
                number = getTime() - player.startTimeEasy;
                guid = getSubStr(player getGuid(), 24, 32);
                leaderboard(number, player.name, "easy", guid, player);
                iPrintLnBold(player.name + " ^5finished Easy in ^3" + realtime(number));
                player.easyEnd = true;
                player.startTimeEasy = undefined;
                player notify("easy_stop");
                player thread checkpointreset();
            }    
        }
       
    }
}
easychk()
{
    self notify("easy_stop");
    self endon("easy_stop");
    self endon("disconnect");
    trig1 = getEnt("easy_chk_1", "targetname");
    trig2 = getEnt("easy_chk_2", "targetname");
    trig3 = getEnt("easy_chk_3", "targetname");
 
    while(1)
    {
        if(!isDefined(self.easychk1) && self isTouching(trig1))
            self.easychk1 = true;
        if(!isDefined(self.easychk2) && self isTouching(trig2))
           self.easychk2 = true;
        if(!isDefined(self.easychk3) && self isTouching(trig3))
            self.easychk3 = true;
        wait 0.05;
    }
 
}
//INTER TIMER
interStart()
{
    level endon("game_ended");
   
    trigger = getent("interbegin", "targetname");
 
    while(1)
    {
        trigger waittill("trigger", player);
       
        if(player.sessionstate == "playing")
        {
            player checkpointreset();
            player.startTimeInter = getTime();
            player.interend = undefined;
            player thread interchk();
        }
                           
    }
}
interEnd()
{
    level endon("game_ended");
   
    trigger = getent("interend", "targetname");
    while(1)
    {
        trigger waittill("trigger", player);
       
        if(player.sessionstate != "playing" || isDefined(player.interend) || !isDefined(player.startTimeInter))
            continue;
   
        else
        {
            if(isDefined(player.interchk1) && isDefined(player.interchk2) && isDefined(player.interchk3))
            {
                number = getTime() - player.startTimeInter;
                guid = getSubStr(player getGuid(), 24, 32);
                leaderboard(number, player.name, "inter", guid, player);
                iPrintLnBold(player.name + " ^5finished Inter in ^3" + realtime(number));
                player.interEnd = true;
                player.startTimeInter = undefined;
                player notify("inter_stop");
                player thread checkpointreset();
            }    
        }
       
    }
}
interchk()
{
    self notify("inter_stop");
    self endon("inter_stop");
    self endon("disconnect");
    trig1 = getEnt("inter_chk_1", "targetname");
    trig2 = getEnt("inter_chk_2", "targetname");
    trig3 = getEnt("inter_chk_3", "targetname");
 
    while(1)
    {
        if(!isDefined(self.interchk1) && self isTouching(trig1))
            self.interchk1 = true;
        if(!isDefined(self.interchk2) && self isTouching(trig2))
           self.interchk2 = true;
        if(!isDefined(self.interchk3) && self isTouching(trig3))
            self.interchk3 = true;
        wait 0.05;
    }
}
//INTERPLUS TIMER
interplusStart()
{
    level endon("game_ended");
   
    trigger = getent("interplusbegin", "targetname");
 
    while(1)
    {
        trigger waittill("trigger", player);
       
        if(player.sessionstate == "playing")
        {
            player checkpointreset();
            player.startTimeInterplus = getTime();
            player.interplusend = undefined;
            player thread interpluschk();
        }
                               
    }
}
interplusEnd()
{
    level endon("game_ended");
   
    trigger = getent("interplusend", "targetname");
    while(1)
    {
        trigger waittill("trigger", player);
       
        if(player.sessionstate != "playing" || isDefined(player.interplusend) || !isDefined(player.startTimeInterplus))
            continue;
   
        else
        {
            if(isDefined(player.interpluschk1) && isDefined(player.interpluschk2) && isDefined(player.interpluschk3))
            {
                number = getTime() - player.startTimeInterplus;
                guid = getSubStr(player getGuid(), 24, 32);
                leaderboard(number, player.name, "interplus", guid, player);
                iPrintLnBold(player.name + " ^5finished Inter+ in ^3" + realtime(number));
                player.interplusEnd = true;
                player.startTimeInterplus = undefined;
                player notify("interplus_stop");
                player thread checkpointreset();
            }    
        }
       
    }
}
interpluschk()
{
    self notify("interplus_stop");
    self endon("interplus_stop");
    self endon("disconnect");
    trig1 = getEnt("interplus_chk_1", "targetname");
    trig2 = getEnt("interplus_chk_2", "targetname");
    trig3 = getEnt("interplus_chk_3", "targetname");
 
    while(1)
    {
        if(!isDefined(self.interpluschk1) && self isTouching(trig1))
            self.interpluschk1 = true;
        if(!isDefined(self.interpluschk2) && self isTouching(trig2))
           self.interpluschk2 = true;
        if(!isDefined(self.interpluschk3) && self isTouching(trig3))
            self.interpluschk3 = true;
        wait 0.05;
    }
}
//HARD TIMER
hardStart()
{
    level endon("game_ended");
   
    trigger = getent("hardbegin", "targetname");
 
    while(1)
    {
        trigger waittill("trigger", player);
       
        if(player.sessionstate == "playing")
        {
            player checkpointreset();
            player.startTimeHard = getTime();
            player.hardend = undefined;
            player thread hardchk();
        }
                       
    }
}
hardEnd()
{
    level endon("game_ended");
   
    trigger = getent("hardend", "targetname");
    while(1)
    {
        trigger waittill("trigger", player);
       
        if(player.sessionstate != "playing" || isDefined(player.hardend) || !isDefined(player.startTimehard))
            continue;
   
        else
        {
            if(isDefined(player.hardchk1) && isDefined(player.hardchk2) && isDefined(player.hardchk3))
            {
                number = getTime() - player.startTimeHard;
                guid = getSubStr(player getGuid(), 24, 32);
                leaderboard(number, player.name, "hard", guid, player);
                iPrintLnBold(player.name + " ^5finished Hard in ^3" + realtime(number));
                player.hardEnd = true;
                player.startTimeHard = undefined;
                player notify("hard_stop");
                player thread checkpointreset();
            }    
        }
       
    }
}
hardchk()
{
    self notify("hard_stop");
    self endon("hard_stop");
    self endon("disconnect");
    trig1 = getEnt("hard_chk_1", "targetname");
    trig2 = getEnt("hard_chk_2", "targetname");
    trig3 = getEnt("hard_chk_3", "targetname");
 
    while(1)
    {
        if(!isDefined(self.hardchk1) && self isTouching(trig1))
            self.hardchk1 = true;
        if(!isDefined(self.hardchk2) && self isTouching(trig2))
           self.hardchk2 = true;
        if(!isDefined(self.hardchk3) && self isTouching(trig3))
            self.hardchk3 = true;
        wait 0.05;
    }
}
//elevate TIMER
elevateStart()
{
    level endon("game_ended");
   
    trigger = getent("elevatebegin", "targetname");
 
    while(1)
    {
        trigger waittill("trigger", player);
       
        if(player.sessionstate == "playing")
        {
            player checkpointreset();
            player.startTimeelevate = getTime();
            player.elevateend = undefined;
            player thread elevatechk();
        }
                       
    }
}
elevateEnd()
{
    level endon("game_ended");
   
    trigger = getent("elevateend", "targetname");
    while(1)
    {
        trigger waittill("trigger", player);
        if(player.sessionstate != "playing" || isDefined(player.elevateend) || !isDefined(player.startTimeelevate))
            continue;
        else
        {
            if(isDefined(player.elevatechk1) && isDefined(player.elevatechk2) && isDefined(player.elevatechk3))
            {
                number = getTime() - player.startTimeelevate;
                guid = getSubStr(player getGuid(), 24, 32);
                leaderboard(number, player.name, "elevate", guid, player);
                iPrintLnBold(player.name + " ^5finished elevate in ^3" + realtime(number));
                player.elevateEnd = true;
                player.startTimeelevate = undefined;
                player notify("elevate_stop");
                player thread checkpointreset();
            }    
        }
       
    }
}
elevatechk()
{
    self notify("elevate_stop");
    self endon("elevate_stop");
    self endon("disconnect");
    trig1 = getEnt("elevate_chk_1", "targetname");
    trig2 = getEnt("elevate_chk_2", "targetname");
    trig3 = getEnt("elevate_chk_3", "targetname");
 
    while(1)
    {
        if(!isDefined(self.elevatechk1) && self isTouching(trig1))
            self.elevatechk1 = true;
        if(!isDefined(self.elevatechk2) && self isTouching(trig2))
           self.elevatechk2 = true;
        if(!isDefined(self.elevatechk3) && self isTouching(trig3))
            self.elevatechk3 = true;
        wait 0.05;
    }
}
vars()
{
    level.easy_lb = [];
    level.inter_lb = [];
    level.interplus_lb = [];
    level.hard_lb = [];
    level.elevate_lb = [];
    //set variables for leaderboard
    for(i=0; i<6; i++)
    {
        level.easy_lb[i]["time"] = 999999999;
        level.easy_lb[i]["player"] = "^1No time set";
        level.easy_lb[i]["guid"] = "z";
        level.inter_lb[i]["time"] = 999999999;
        level.inter_lb[i]["player"] = "^1No time set";
        level.inter_lb[i]["guid"] = "z";
        level.interplus_lb[i]["time"] = 999999999;
        level.interplus_lb[i]["player"] = "^1No time set";
        level.interplus_lb[i]["guid"] = "z";
        level.hard_lb[i]["time"] = 999999999;
        level.hard_lb[i]["player"] = "^1No time set";
        level.hard_lb[i]["guid"] = "z";
        level.elevate_lb[i]["time"] = 999999999;
        level.elevate_lb[i]["player"] = "^1No time set";
        level.elevate_lb[i]["guid"] = "z";
    }
    wait 1;
    mapname = getDvar("mapname");
    //if dvar is set load old scores
    if(getDvar("scores_" + mapname) != "")
    {
        iPrintLnBold("Loading leaderboard times");
        Print(getDvar("scores_" + mapname));
        oldscores = getDvar("scores_" + mapname);
        token = strTok(oldscores, "\n");
        tokencount = 0;
        //places scores from dvar into variables
        for(x=0; x<6;x++)
        {
            placement = strTok(token[tokencount], "\\");
            if(placement[0] != "9999999999" && isDefined(placement[0]))
                level.easy_lb[x]["time"] = int(placement[0]);
            if(placement[1] != "^1No time set" && isDefined(placement[1]))
                level.easy_lb[x]["player"] = placement[1];
            if(placement[2] != "z" && isDefined(placement[2]))
                level.easy_lb[x]["guid"] = placement[2];
            tokencount++;
            placement = strTok(token[tokencount], "\\");
            if(placement[0] != "9999999999" && isDefined(placement[0]))
                level.inter_lb[x]["time"] = int(placement[0]);
            if(placement[1] != "^1No time set" && isDefined(placement[1]))
                level.inter_lb[x]["player"] = placement[1];
            if(placement[2] != "z" && isDefined(placement[2]))
                level.inter_lb[x]["guid"] = placement[2];
            tokencount++;
            placement = strTok(token[tokencount], "\\");
            if(placement[0] != "9999999999" && isDefined(placement[0]))
                level.interplus_lb[x]["time"] = int(placement[0]);
            if(placement[1] != "^1No time set" && isDefined(placement[1]))
                level.interplus_lb[x]["player"] = placement[1];
            if(placement[2] != "z" && isDefined(placement[2]))
                level.interplus_lb[x]["guid"] = placement[2];
            tokencount++;
            placement = strTok(token[tokencount], "\\");
            if(placement[0] != "9999999999" && isDefined(placement[0]))
                level.hard_lb[x]["time"] = int(placement[0]);
            if(placement[1] != "^1No time set" && isDefined(placement[1]))
                level.hard_lb[x]["player"] = placement[1];
            if(placement[2] != "z" && isDefined(placement[2]))
                level.hard_lb[x]["guid"] = placement[2];
            tokencount++;
            placement = strTok(token[tokencount], "\\");
            if(placement[0] != "9999999999" && isDefined(placement[0]))
                level.elevate_lb[x]["time"] = int(placement[0]);
            if(placement[1] != "^1No time set" && isDefined(placement[1]))
                level.elevate_lb[x]["player"] = placement[1];
            if(placement[2] != "z" && isDefined(placement[2]))
                level.elevate_lb[x]["guid"] = placement[2];
            tokencount++;
        }
    }
    else
    {
        Print("no scores dvar");
    }
}
leaderboard(number, playername, way, guid, jumper)
{
    if(number == 999999999)//shouldnt take 277 hour to complete map but whatever
        number--;
    if((way == "easy" && number <= 220000) || (way == "inter" && number <= 210000) ||  (way == "interplus" && number <= 220000) || (way == "hard" && number <= 300000) || (way == "elevate" && number <= 200000))
        return;
    if(way == "easy")
    {  
             //if new top record is set
        if(number < level.easy_lb[5]["time"])
        {
            iPrintLn(playername + " has the record for easy");
            jumper iPrintLnBold("^3You got a new record!");
        }   
        for(i=5; i>-1; i--)
        {
            //If players new time is slower then their old time
            if(level.easy_lb[i]["guid"] == guid && level.easy_lb[i]["time"] < number )
                return;
            //If a quicker time is set
            if(level.easy_lb[i]["time"] > number)
            {
                //Move all old times down
                for(x=0; x<i; x++)
                {
                    level.easy_lb[x]["time"] = level.easy_lb[x+1]["time"];
                    level.easy_lb[x]["player"] = level.easy_lb[x+1]["player"];
                    level.easy_lb[x]["guid"] = level.easy_lb[x+1]["guid"];
                }
                //insert new time
                level.easy_lb[i]["time"] = number;
                level.easy_lb[i]["player"] = playername;
                level.easy_lb[i]["guid"] = guid;
 
                for(z=0; z<i; z++)
                {
                    //Check that player doesnt have an old time in leaderboard
                    if(level.easy_lb[z]["guid"] == guid && level.easy_lb[z]["time"] != number)
                    {
                        //If they do move all times below up to remove it
                        for(p=z; p>0; p--)
                        {
                            level.easy_lb[p]["time"] = level.easy_lb[p-1]["time"];
                            level.easy_lb[p]["player"] = level.easy_lb[p-1]["player"];
                            level.easy_lb[p]["guid"] = level.easy_lb[p-1]["guid"];
                        }
                        saveScores();
                        return;
                    }
                }
                //save scores to dvar
                saveScores();
                return;
            }
        }
    }
    //else if
    if(way == "inter")
    {
          //if new top record is set
        if(number < level.inter_lb[5]["time"])
            iPrintLn(playername + " ^3has the record for Inter!");
            jumper iPrintLnBold("^3You got a new record!");
        for(i=5; i>-1; i--)
        {
            if(level.inter_lb[i]["guid"] == guid && level.inter_lb[i]["time"] < number )
                return;
            if(level.inter_lb[i]["time"] > number)
            {
                for(x=0; x<i; x++)
                {
                    level.inter_lb[x]["time"] = level.inter_lb[x+1]["time"];
                    level.inter_lb[x]["player"] = level.inter_lb[x+1]["player"];
                    level.inter_lb[x]["guid"] = level.inter_lb[x+1]["guid"];
                }
                level.inter_lb[i]["time"] = number;
                level.inter_lb[i]["player"] = playername;
                level.inter_lb[i]["guid"] = guid;
 
                for(z=0; z<i; z++)
                {
                    if(level.inter_lb[z]["guid"] == guid && level.inter_lb[z]["time"] != number)
                    {
 
                        for(p=z; p>0; p--)
                        {
                            level.inter_lb[p]["time"] = level.inter_lb[p-1]["time"];
                            level.inter_lb[p]["player"] = level.inter_lb[p-1]["player"];
                            level.inter_lb[p]["guid"] = level.inter_lb[p-1]["guid"];
                        }
                        saveScores();
                        return;
 
                    }
                }
                saveScores();
                return;
            }
        }
    }
    if(way == "interplus")
    {
          //if new top record is set
        if(number < level.interplus_lb[5]["time"])
            iPrintLn(playername + " ^3has the record for Inter+!");
            jumper iPrintLnBold("^3You got a new record!");
            
       for(i=5; i>-1; i--)
        {
            if(level.interplus_lb[i]["guid"] == guid && level.interplus_lb[i]["time"] < number )
                return;
 
            if(level.interplus_lb[i]["time"] > number)
            {
               
                for(x=0; x<i; x++)
                {
                    level.interplus_lb[x]["time"] = level.interplus_lb[x+1]["time"];
                    level.interplus_lb[x]["player"] = level.interplus_lb[x+1]["player"];
                    level.interplus_lb[x]["guid"] = level.interplus_lb[x+1]["guid"];
                }
                level.interplus_lb[i]["time"] = number;
                level.interplus_lb[i]["player"] = playername;
                level.interplus_lb[i]["guid"] = guid;
 
                for(z=0; z<i; z++)
                {
                    if(level.interplus_lb[z]["guid"] == guid && level.interplus_lb[z]["time"] != number)
                    {
 
                        for(p=z; p>0; p--)
                        {
                            level.interplus_lb[p]["time"] = level.interplus_lb[p-1]["time"];
                            level.interplus_lb[p]["player"] = level.interplus_lb[p-1]["player"];
                            level.interplus_lb[p]["guid"] = level.interplus_lb[p-1]["guid"];
                        }
                        saveScores();
                        return;
 
                    }
                }
 
                saveScores();
                return;
            }
        }
    }
    if(way == "hard")
    {
          //if new top record is set
        if(number < level.hard_lb[5]["time"])
            iPrintLn(playername + " ^3has the record for Hard!");
            jumper iPrintLnBold("^3You got a new record!");
        for(i=5; i>-1; i--)
        {
            if(level.hard_lb[i]["guid"] == guid && level.hard_lb[i]["time"] < number )
                return;
 
            if(level.hard_lb[i]["time"] > number)
            {
               
                for(x=0; x<i; x++)
                {
                    level.hard_lb[x]["time"] = level.hard_lb[x+1]["time"];
                    level.hard_lb[x]["player"] = level.hard_lb[x+1]["player"];
                    level.hard_lb[x]["guid"] = level.hard_lb[x+1]["guid"];
                }
                level.hard_lb[i]["time"] = number;
                level.hard_lb[i]["player"] = playername;
                level.hard_lb[i]["guid"] = guid;
 
                for(z=0; z<i; z++)
                {
                    if(level.hard_lb[z]["guid"] == guid && level.hard_lb[z]["time"] != number)
                    {
 
                        for(p=z; p>0; p--)
                        {
                            level.hard_lb[p]["time"] = level.hard_lb[p-1]["time"];
                            level.hard_lb[p]["player"] = level.hard_lb[p-1]["player"];
                            level.hard_lb[p]["guid"] = level.hard_lb[p-1]["guid"];
                        }
                        saveScores();
                        return;
 
                    }
                }
 
                saveScores();
                return;
            }
        }
    }
    if(way == "elevate")
    {
          //if new top record is set
        if(number < level.elevate_lb[5]["time"])
            iPrintLn(playername + " ^3has the record for elevate!");
            jumper iPrintLnBold("^3You got a new record!");
        for(i=5; i>-1; i--)
        {
            if(level.elevate_lb[i]["guid"] == guid && level.elevate_lb[i]["time"] < number )
                return;
 
            if(level.elevate_lb[i]["time"] > number)
            {
               
                for(x=0; x<i; x++)
                {
                    level.elevate_lb[x]["time"] = level.elevate_lb[x+1]["time"];
                    level.elevate_lb[x]["player"] = level.elevate_lb[x+1]["player"];
                    level.elevate_lb[x]["guid"] = level.elevate_lb[x+1]["guid"];
                }
                level.elevate_lb[i]["time"] = number;
                level.elevate_lb[i]["player"] = playername;
                level.elevate_lb[i]["guid"] = guid;
 
                for(z=0; z<i; z++)
                {
                    if(level.elevate_lb[z]["guid"] == guid && level.elevate_lb[z]["time"] != number)
                    {
 
                        for(p=z; p>0; p--)
                        {
                            level.elevate_lb[p]["time"] = level.elevate_lb[p-1]["time"];
                            level.elevate_lb[p]["player"] = level.elevate_lb[p-1]["player"];
                            level.elevate_lb[p]["guid"] = level.elevate_lb[p-1]["guid"];
                        }
                        saveScores();
                        return;
 
                    }
                }
 
                saveScores();
                return;
            }
        }
    }
}
 
//update map dvar
addToDvar(dvar, var)
{
    setDvar(dvar, getDvar(dvar) + var);
}
 
//saves scores to dvar
//to reset scores set dvar 'scores_'mapname to " "
//rcon set scores_mp_race " "
saveScores()
{
    score = "";
    mapname = getDvar("mapname");
    setDvar("scores_" + mapname, "" );
 
    for(i=0; i<6; i++)
    {
        score = level.easy_lb[i]["time"] + "\\";
        score = score + level.easy_lb[i]["player"] + "\\";
        score = score + level.easy_lb[i]["guid"] + "\n";
        score = score + level.inter_lb[i]["time"] + "\\";
        score = score + level.inter_lb[i]["player"] + "\\";
        score = score + level.inter_lb[i]["guid"] + "\n";
        score = score + level.interplus_lb[i]["time"] + "\\";
        score = score + level.interplus_lb[i]["player"] + "\\";
        score = score + level.interplus_lb[i]["guid"] + "\n";
        score = score + level.hard_lb[i]["time"] + "\\";
        score = score + level.hard_lb[i]["player"] + "\\";
        score = score + level.hard_lb[i]["guid"] + "\n";
        score = score + level.elevate_lb[i]["time"] + "\\";
        score = score + level.elevate_lb[i]["player"] + "\\";
        score = score + level.elevate_lb[i]["guid"] + "\n";
        addToDvar("scores_" + mapname, score);  
    }
    wait 0.1;
 
}
//convert time to readable time
realtime(number)
{
    if(number == 999999999)
    {
        playertime = "???";
        return playertime;
    }
 
    seconds = int(number / 1000);
    hours = int(seconds/3600);
    seconds = seconds % 3600;
    minutes = int(seconds/60);
    seconds = seconds % 60;
 
    if(seconds <= 9)
        seconds = "0" + seconds;
    if(minutes <= 9)
        minutes = "0" + minutes;
    if(hours <= 9)
        hours = "0" + hours;
 
     playertime =  "" + hours + ":" + minutes + ":" + seconds;
 
    return playertime;
}