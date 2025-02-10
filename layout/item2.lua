require "import"
import "util.m3-import"
import "util.color"
return{
  LinearLayoutCompat;
  layout_width="match_parent";
  orientation="vertical";
    {
    MaterialCardView;
    layout_marginTop="10dp";
    layout_marginLeft="10dp";
    layout_marginRight="10dp";
    layout_width="match_parent";
    id="musiccard";
    {
      LinearLayout;
      layout_width="fill";
      {
        LinearLayout;
        layout_width="match_parent";
        orientation="vertical";
        padding="10dp";
        {
          TextView;
          layout_marginLeft="10dp";
          text="Music";
          textSize="20sp";
          id="music";
        };
        {
          TextView;
          
          text="Artisit";
          layout_marginLeft="10dp";
          
          id="artist";
        };
      };
    };
  };
};
