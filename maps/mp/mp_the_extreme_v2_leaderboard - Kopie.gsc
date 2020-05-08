
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
easyStart() {}
    level endon("game_ended");
   
    trigger = getent("easybegin", "targetname");
 
    while(1) {
        trigger waittill("trigger", player);
       
        if(player.sessionstate == "playing") {
            player checkpointreset();
            player.startTimeEasy = getTime();
            player.easyend = undefined;
            player thread easychk();
        }                      
    }
}
easyEnd() {
    level endon("game_ended");
   
    trigger = getent("easyend", "targetname");
    while(1) {
        trigger waittill("trigger", player);
       
        if(player.sessionstate != "playing" || isDefined(player.easyend) || !isDefined(player.startTimeEasy))
            continue;
   
        else {
            if(isDefined(player.easychk1) && isDefined(player.easychk2) && isDefined(player.easychk3)) {
                number = getTime() - player.startTimeEasy;
                guid = getSubStr(player getGuid(), 24, 32);
                setTimerDvar(realtime(number), "easy", guid);
                iPrintLnBold(player.name + " ^5finished Easy in ^3" + realtime(number));
                player.easyEnd = true;
                player.startTimeEasy = undefined;
                player notify("easy_stop");
                player thread checkpointreset();
            }    
        }
       
    }
}
easychk() {
    self notify("easy_stop");
    self endon("easy_stop");
    self endon("disconnect");
    trig1 = getEnt("easy_chk_1", "targetname");
    trig2 = getEnt("easy_chk_2", "targetname");
    trig3 = getEnt("easy_chk_3", "targetname");
 
    while(1) {
        if(!isDefined(self.easychk1) && self isTouching(trig1))
            self.easychk1 = true;
        if(!isDefined(self.easychk2) && self isTouching(trig2))
           self.easychk2 = true;
        if(!isDefined(self.easychk3) && self isTouching(trig3))
            self.easychk3 = true;
        wait 0.05;
    }
}
realtime(number) {
    if(number == 999999999) {
        playertime = "???";
        return playertime;
    }
 
    seconds = int(number/1000);
    hours = int(seconds/3600);
    seconds = seconds%3600;
    minutes = int(seconds/60);
    seconds = seconds%60;
 
    if(seconds <= 9)
        seconds = "0" + seconds;
    if(minutes <= 9)
        minutes = "0" + minutes;
    if(hours <= 9)
        hours = "0" + hours;
 
     playertime =  "" + hours + ":" + minutes + ":" + seconds;
 
    return playertime;
}

setTimerDvar(way, playertime, guid) {
    setDvar("glados_" + way + guid, playertime);
}












 
//update map dvar
addToDvar(dvar, var) {
    setDvar(dvar, getDvar(dvar) + var);
}
setTimerDvar(way, time) {
    setDvar("glados_" + way + self.name + time);
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
realtime(number) {
    if(number == 999999999) {
        playertime = "???";
        return playertime;
    }
 
    seconds = int(number/1000);
    hours = int(seconds/3600);
    seconds = seconds%3600;
    minutes = int(seconds/60);
    seconds = seconds%60;
 
    if(seconds <= 9)
        seconds = "0" + seconds;
    if(minutes <= 9)
        minutes = "0" + minutes;
    if(hours <= 9)
        hours = "0" + hours;
 
     playertime =  "" + hours + ":" + minutes + ":" + seconds;
 
    return playertime;
}

setTimerDvar(way, playertime) {
    setDvar("glados_" + way + self.name, playertime);
}