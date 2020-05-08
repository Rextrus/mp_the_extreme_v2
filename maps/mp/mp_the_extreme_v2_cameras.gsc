init()
{
	game["menu_camera"]="vc_camera";
	precachemenu(game["menu_camera"]);
    precacheshader("cam_overlay");

    level.camera=[];
    level.camera_amount=13;

    for(i=1;i<level.camera_amount;i++)
    {
        level.camera[i]=getent("camera_"+i,"targetname");
    }

	thread camera_definiton();
	thread camera_menu();
}
camera_destroy()
{
    destroyer = getent("camera_destroy","targetname");
    destroyer waittill("trigger");
    wait 0.05;

    if(isdefined(self.in_camera) && self.in_camera == true)
    {
        self.in_camera=false;

        self show();

        self freezecontrols(0);
        self setclientdvar("cg_drawgun", "1");
        self setclientdvar("hud_enable", "1");
        self setclientdvar("cg_drawfps", "1");
        self.camera_overlay destroy();
        wait 2;
    }  
    self.in_camera=false;
}
camera_definiton(){
    while (1) 
    {
        level waittill("connecting", player);
        wait 5;
        self.in_camera=false;
        player thread menu_response_listener();
    }
}

camera_menu()
{
	
    trig=getent("camera_open","targetname");
    trig sethintstring("Press &&1 to select a Camera");

    for(;;)
    {
        trig waittill("trigger",who);
        who openmenu("vc_camera");
    }
}

menu_response_listener()
{
    for(;;)
    {
        self waittill("menuresponse",menu,response);
        if(menu == "vc_camera")
            self thread camera_select(int(response)+1);
    }
}
camera_select(i)
{
    
    self iprintln("Press USE to return");
    self closemenu();
    self closeingamemenu();

    self.old_origin=self getorigin();
    self.old_angles=self getplayerangles();

    self.in_camera=true;

    self freezecontrols(1);
    self setclientdvar("cg_drawgun", "0");
    self setclientdvar("hud_enable", "0");
    self setclientdvar("cg_drawfps", "0");

    self camera_overlay();

    self setorigin(level.camera[i].origin);
    self setplayerangles(level.camera[i].angles);


    while(isdefined(self.in_camera) && self.in_camera == true)
    {
        while(!self usebuttonpressed())
        {
            wait .5;
            self hide();
        }
        if(self usebuttonpressed() && self.in_camera == true)
        {

            self.in_camera=false;

            self freezecontrols(0);
            self show();
            //self setclientdvar("ui_hud_hardcore", "1");
            self setclientdvar("cg_drawgun", "1");
            self setclientdvar("hud_enable", "1");
            self setclientdvar("cg_drawfps", "1");
            self.camera_overlay destroy();
            self setorigin(self.old_origin);
            self setplayerangles(self.old_angles);
        }
        wait 2.5;
    }
    self.in_camera=false;
}

camera_overlay()
{
    if(isDefined(self.camera_overlay))
        self.camera_overlay destroy();

    self.camera_overlay=newclienthudelem(self);
    self.camera_overlay.x=0;
    self.camera_overlay.y=0;
    self.camera_overlay.alignx="left";
    self.camera_overlay.aligny="top";
    self.camera_overlay.horzalign="fullscreen";
    self.camera_overlay.vertalign="fullscreen";
    self.camera_overlay.hidewheninmenu=true;
    self.camera_overlay.alpha=0.8;
    self.camera_overlay.sort=-2;
    self.camera_overlay setshader("cam_overlay",640,480);

}