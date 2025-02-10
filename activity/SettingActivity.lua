require "import"
import "MainConfig"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "cjson"
import "util.color"
import "layout.item3"
if activity.getPackageName() =="com.load.LuaAppX" then
  local LinearLayoutManager = luajava.bindClass "androidx.recyclerview.widget.LinearLayoutManager"
  local LuaCustRecyclerAdapter = luajava.bindClass "com.lua.custrecycleradapter.LuaCustRecyclerAdapter"
  local AdapterCreator = luajava.bindClass "com.lua.custrecycleradapter.AdapterCreator"
  local LuaCustRecyclerHolder = luajava.bindClass "com.lua.custrecycleradapter.LuaCustRecyclerHolder"
 else
  import "github.daisukiKaffuChino.LuaCustRecyclerAdapter"
  import "androidx.recyclerview.widget.LinearLayoutManager"
  import "github.daisukiKaffuChino.LuaCustRecyclerHolder"
  import "github.daisukiKaffuChino.AdapterCreator"
end
activity.setContentView(loadlayout("layout.SettingActivity"))
toolbar.navigationIcon = MDC_R.drawable.abc_ic_ab_back_material
toolbar.navigationOnClickListener = function()
  this.finish()
end
SettingTitle1={
  "音乐卡片排列";

}
SettingText1={
  "竖向与瀑布流";
}
SettingImage1={
  "res/card.png";
}
adp = LuaCustRecyclerAdapter(AdapterCreator({
  getItemCount=function()
    return #SettingTitle1 --item数量
  end,
  onCreateViewHolder=function(parent,viewType) local views = {} --控件存在这里面
    local holder = LuaCustRecyclerHolder(loadlayout(item3, views))
    holder.view.setTag(views)
    views.SettingCard.onClick=function()
    end
    return holder
  end,
  onBindViewHolder=function(holder,position) --position:item的位置
    local view = holder.view.getTag() --控件存在这里面
    local index = position + 1
    local SettingT = SettingTitle1[index]
    local SettingTe = SettingText1[index]
    local SettingI = SettingImage1[index]
    --在这里设置item的数据
    view.image.setImageBitmap(loadbitmap(SettingI))
    view.text1.setText(SettingT)
    view.text2.setText(SettingTe)
  end,
}))
rec1.setAdapter(adp)
.setLayoutManager(LinearLayoutManager(activity))
