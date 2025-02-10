
import "util.m3-import"
import "util.color"
return{
  CoordinatorLayout,
  layout_width="fill",
  layout_height="fill",

  {
    AppBarLayout,
    backgroundColor=0,
    layout_width=-1,
    id="appBar";
    transitionName="appBar",
    {
      CollapsingToolbarLayout,
      layout_width=-1,
      layout_height="120dp",
      layout_scrollFlags=3,
      contentScrim=ColorDrawable(0),
      title="More",
      {
        MaterialToolbar,
        -- id="toolbar",
        layout_width=-1,
        layout_height="60dp",
        --layout_collapseMode="pin",
      },
    }
  };
  {
    NestedScrollView,
    w=-1,
    h=-1,
    layout_behavior="@string/appbar_scrolling_view_behavior",
    fillViewport=true,
    {
      LinearLayoutCompat,
      w=-1,
      h=-1,
      padding="10dp",
      Orientation=1,

      {
        MaterialCardView;
        layout_width="match_parent";
        StrokeColor=0,
        {
          LinearLayout;
          orientation="vertical";
          layout_height="wrap_content";
          layout_width="match_parent";
          BackgroundColor=colorSurfaceVariant,

            {
              ImageView;
              w=-1;
              src="res/lingrain2.png";
              h="180dp";
              scaleType="centerCrop";
              id="BingWallpaper",
            };
          
          {
            LinearLayout;
            padding="10dp";
            orientation="vertical";
            layout_width="match_parent";
            {
              AppCompatTextView;
              text="Text";
              textSize="20sp";
              TextColor=colorOnSurfaceVariant;
              id="BingTitle";
            };
            {
              AppCompatTextView;
              text="Text";
TextColor=colorOnSurfaceVariant;
              id="BingCopyright";
            };
          };
        };
      };
      {
        MaterialCardView;
        w=-1,
        StrokeColor=0,
        
        radius="20dp";
        layout_marginTop="10dp",

        {LinearLayoutCompat;
          w=-1;
          
          orientation="vertical";
          {
            RecyclerView,
            w=-1,
            id="rec",
            --paddingBottom="6dp";
          },
        },
     },
   {
     Space;
     h="128dp",
     };
    },
  },
}