require "import"
import "util.m3-import"
import "android.widget.Toast"
import "android.view.Gravity"
import "androidx.appcompat.widget.AppCompatTextView"
-- 绑定必要的Java类
local MDC_R = luajava.bindClass "com.google.android.material.R"
local Build = luajava.bindClass "android.os.Build"

-- 获取共享数据（如果需要，可以保留以备将来使用）
local light = this.getSharedData("light")
local dark = this.getSharedData("dark")
local dynamicColor = true  -- 默认启用动态颜色

-- 设置主题为动态颜色主题
this.setTheme(MDC_R.style["Theme_Material3_DynamicColors_" .. (light and "Light" or (dark and "Dark" or "DayNight"))])

-- 隐藏ActionBar
this.getSupportActionBar().hide()
local EdgeToEdgeUtils = luajava.bindClass "com.google.android.material.internal.EdgeToEdgeUtils"
EdgeToEdgeUtils.applyEdgeToEdge(activity.getWindow(), true)
-- 处理状态栏高度
function 状态栏高度()
  if Build.VERSION.SDK_INT >= 19 then
    local resourceId = activity.getResources().getIdentifier("status_bar_height", "dimen", "android")
    return activity.getResources().getDimensionPixelSize(resourceId)
   else
    return 0
  end
end
function onCreate()
  if appBar then
    appBar.paddingTop = 状态栏高度()
  end
end
function MaterialToast(内容)
  local layoutT=  {
    MaterialCardView;
    id="tc";
    padding="10dp";
    --layout_gravity="center";
    layout_height="wrap_content";
    layout_width="wrap_content";
    {
      AppCompatTextView;
      id="text";
      text=内容;
      layout_margin="10dp";
    };
  };
  local tc1=Toast.makeText(activity,内容,Toast.LENGTH_SHORT).setView(loadlayout(layoutT))
  tc1.setGravity(Gravity.BOTTOM,0,60)
  tc1.show()
end