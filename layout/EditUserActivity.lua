require "import"
import "util.m3-import"
import "util.color"
function 状态栏高度()
  if Build.VERSION.SDK_INT >= 19 then
    local resourceId = activity.getResources().getIdentifier("status_bar_height", "dimen", "android")
    return activity.getResources().getDimensionPixelSize(resourceId)
   else
    return 0
  end
end
return{

  LinearLayout,
  layout_width="fill",
  layout_height="fill",
  orientation="vertical",
  {
    MaterialToolbar,
    

    layout_width="fill",
    id="toolbar";
    title="编辑资料";
  },
  {
    LinearLayout;
    padding="10dp";
    layout_width="match_parent";
    gravity="center";
    {
      MaterialCardView;
      layout_width="80dp";
      layout_height="80dp";
      radius=80;
      StrokeColor=0,
        {
          ImageView;
          layout_width="fill";
          layout_height="fill";
          
          id="head";

        };
    }
  };
  {
    ListView,
    layout_width="match",
    layout_height="wrap",

    DividerHeight='0';
    id="list",
  },
}