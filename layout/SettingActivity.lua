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
      --backgroundColor="#000000",
      layout_scrollFlags=3,
      contentScrim=ColorDrawable(0),
      title="Settings",

      {
        MaterialToolbar,
        layout_width=-1,
        id="toolbar",
        
        layout_height="60dp",
        layout_collapseMode="pin",
      },
    },
  };
  {
    NestedScrollView,
    layout_width="fill",
    layout_height="fill",
    layout_behavior="@string/appbar_scrolling_view_behavior",
    fillViewport="true",
    {
      LinearLayout;
      layout_width="fill";
      Orientation=1,
      layout_height="fill",
      {
        TextView;
        text="界面";
        layout_marginTop="20dp",
        layout_marginLeft="15dp",
      },
      {
        RecyclerView,
        layout_width="fill";
        layout_height="fill",
        id="rec1",
      },
    },
  },
}