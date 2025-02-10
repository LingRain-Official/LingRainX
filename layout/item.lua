require "import"
import "util.m3-import"
import "util.color"
return
{
  LinearLayout;
  layout_width="match_parent";
  orientation="horizontal";
  --layout_marginBottom="3dp",
  layout_height="wrap_content";

  {
    MaterialCardView;
    padding="10dp",
    strokeWidth=0,
    --layout_marginBottom="3dp",
    BackgroundColor=colorSurfaceVariant,
    id="morecard",
    w=-1,
     radius=0,
    StrokeColor=0,
    
    {
      LinearLayoutCompat;
      w=-1,
      orientation=2;
      
      padding="10dp",
      
      {
        ImageView;
        id="image";
        layout_gravity="center";
        layout_width="30dp";
        layout_height="30dp";
        layout_marginLeft="15dp";
        layout_marginRight="20dp";
        ColorFilter=colorOnBackground;
      };
      {
        LinearLayout;
        orientation="vertical";
        layout_gravity="center";
        layout_width="match_parent";
        layout_height="wrap_content";
        {
          TextView;
          id="text1";
          textColor=colorOnBackground;
          layout_height="wrap_content",
          textSize="20sp";
          text="Text1";
        };
              {
          TextView;
          id="text2";
          textColor=colorOnBackground;
          layout_height="wrap_content",
          
          text="Text1";
        };
      };

    };
  };

};