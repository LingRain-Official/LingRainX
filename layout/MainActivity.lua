require "import"
import "util.m3-import"
import "android.os.Build"
function 状态栏高度()
  if Build.VERSION.SDK_INT >= 19 then
    local resourceId = activity.getResources().getIdentifier("status_bar_height", "dimen", "android")
    return activity.getResources().getDimensionPixelSize(resourceId)
   else
    return 0
  end
end
return{
  LinearLayoutCompat;
  layout_height=-1,
  id = "appBar",
  layout_width=-1,
  orientation=1,
  {
    ViewPager;
    layout_weight=1,
    layout_height=-1,
    id="pager";
    pages={
      loadlayout("layout.MainView1"),
      loadlayout("layout.MainView2"),
      loadlayout("layout.MainView3"),
    };
  };

  {
    BottomNavigationView;
    id="底栏";
    layout_width="match_parent";
  };
};