import "util.m3-import"
import "util.color"
import "MainConfig"
return{
  LinearLayout;
  orientation="vertical";
  gravity="center";
  layout_height="fill";
  layout_width="fill";
 -- backgroundColor="#FFFFFF",
  {
    LinearLayout;
    orientation="vertical";
    layout_width="match_parent";
    layout_weight="1";
    gravity="center";
    layout_height="match_parent";
    {
      LinearLayout;
      layout_height="30%h";
      layout_width="30%h";
      {
        ImageView;
        id="img1";
        layout_width="match_parent";
        layout_height="match_parent";
        src="res/miku5.png";
      };
    };
    {
      LinearLayout;
      layout_height="wrap_content";
      layout_width="match_parent";
      layout_gravity="center";
      layout_marginTop="2%h";
      gravity="center";
      {
        ImageView;
        id="musiclist";
        layout_width="4%h";
        layout_height="4%h";
        src="res/musiclist.png";
        ColorFilter=colorPrimaryContainer;
      };
      {
        ImageView;
        layout_marginRight="9%h";
        layout_width="4%h";
        layout_marginLeft="9%h";
        src="res/shoucang.png";
        id="shoucang";
        layout_height="4%h";
        ColorFilter=colorPrimaryContainer;
      };
      {
        ImageView;
        id="fenxiang";
        layout_width="4%h";
        layout_height="4%h";
        src="res/fenxiang.png";
        ColorFilter=colorPrimaryContainer;
      };
    };
    {
      LinearLayout;
      orientation="vertical";
      layout_width="wrap";
      layout_marginBottom="10dp";
      layout_gravity="center";
      id="Bottombar";
      layout_height="wrap";
      {
        MaterialCardView;
        layout_height="20dp";
        BackgroundColor="#00000000";
        radius="8dp";
        StrokeColor=0,
        layout_gravity="center";
        layout_width="90%w";
        cardElevation="0dp";
        {
          MaterialCardView;
          layout_height="20dp";
          visibility=8;
          StrokeColor=0,
          layout_gravity="left|center";
          layout_width="50sp";
          radius="8dp";
          id="拖动";
          BackgroundColor="#ffffffff";
          alpha=0.6;
          layout_marginLeft="10dp";
          cardElevation="0dp";
          {
            TextView;
            layout_height="fill";
            textSize="11dp";
            id="拖动进度";
            text="11：52";
            layout_width="fill";
            textColor="#444444";
            gravity="center";
            layout_gravity="center";
          };
        };
      };
    };
    {
      SeekBar;
      layout_marginTop="1%h";
      layout_width="35%h";
      id="seekBar";
    };
    {
      LinearLayout;
      layout_height="wrap_content";
      gravity="center";
      layout_width="30%h";
      {
        LinearLayout;
        layout_weight="1";
        layout_width="wrap_content";
        {
          TextView;
          id="currenttime";
          text="Start_time";
        };
      };
      {
        LinearLayout;
        layout_weight="1";
      };
      {
        TextView;
        id="endtime";
        layout_gravity="right";
        text="End_time";
      };
    };
    {
      ImageView;
      id="playbtn";
      src="res/bofang.png";
      ColorFilter=colorPrimaryContainer;
      layout_height="40dp";
      layout_width="40dp";
    };
  };
};
