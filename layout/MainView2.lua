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
      title="Music",

      {
        MaterialToolbar,
        -- id="toolbar",
        layout_width=-1,
        layout_height="60dp",
        --        layout_collapseMode="pin",
      },
    }
  };
  {
    NestedScrollView,
    layout_width="fill",
    layout_height="fill",
    layout_behavior="@string/appbar_scrolling_view_behavior",
    fillViewport="true",
    layout_bottom="500dp",
    {
      LinearLayout;
      layout_width="fill";
      Orientation=1,
      layout_height="fill",
      {
        RecyclerView,
        layout_width="fill";
        layout_height="fill",
        id="rec2",
      },
      {View,
        layout_height="128dp",
      }
    },
  }
}