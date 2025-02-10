require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "util.okhttp"
import "java.io.File"
import "cjson"
import "android.graphics.BitmapFactory"
import "android.content.Intent"
import "http"
import "util.color"
import "layout.item"
import "layout.item2"
import "com.bumptech.glide.request.target.CustomTarget"
import "com.bumptech.glide.*"
import "com.bumptech.glide.load.engine.DiskCacheStrategy"
import "com.google.android.material.dialog.MaterialAlertDialogBuilder"
import "android.content.res.ColorStateList"
import "data.config"
import "data.Singer"
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
activity.setContentView(loadlayout("layout.MainActivity"))
import "MainConfig"
appBar.paddingTop=状态栏高度()
local FileDrawable = require "util.FileDrawable"
local bottombarData = {
  [0] = {
    title = "Home",
    icon = FileDrawable("res/home.png"),
    checkedIcon = FileDrawable("res/home.png"),
  },
  [1] = {
    title = "Music",
    icon = FileDrawable("res/music.png"),
    checkedIcon = FileDrawable("res/music.png"),
  },
  [2] = {
    title = "More",
    icon = FileDrawable("res/gongneng.png"),
    checkedIcon = FileDrawable("res/gongneng.png"),
  },
}
底栏.setLabelVisibilityMode(0)

local bottombarChecked = 0
底栏.menu.add(0, 0, 0, "Home").setIcon(bottombarData[0].checkedIcon)
底栏.menu.add(0, 1, 1, "Music").setIcon(bottombarData[1].icon)
底栏.menu.add(0, 2, 2, "More").setIcon(bottombarData[2].icon)
底栏.setOnNavigationItemSelectedListener(BottomNavigationView.OnNavigationItemSelectedListener{
  onNavigationItemSelected=function(item)
    pager.setCurrentItem(item.getItemId())
    return true
  end
})
function checked(vv,num)--底栏项目选中事件
  vv.getMenu().getItem(num).setChecked(true)
end
pager.setOnPageChangeListener(ViewPager.OnPageChangeListener{
  onPageSelected=function(num)
    checked(底栏,num)--选中底栏项
  end
})
date=os.date("%a")
month=os.date("%b")
date2=os.date("%d")
time.setText(date..", "..month.." "..date2)
local LinearLayoutManager = luajava.bindClass "androidx.recyclerview.widget.LinearLayoutManager"
--local LuaCustRecyclerAdapter = luajava.bindClass "com.lua.custrecycleradapter.LuaCustRecyclerAdapter"
--local AdapterCreator = luajava.bindClass "com.lua.custrecycleradapter.AdapterCreator"
--local LuaCustRecyclerHolder = luajava.bindClass "com.lua.custrecycleradapter.LuaCustRecyclerHolder"
itemdata={
}
import "data.more"
adp = LuaCustRecyclerAdapter(AdapterCreator({
  getItemCount=function()
    return #moretext --item数量
  end,
  onCreateViewHolder=function(parent,viewType) local views = {} --控件存在这里面
    local holder = LuaCustRecyclerHolder(loadlayout(item, views))
    holder.view.setTag(views)
    views.morecard.onClick=function()
      --获取被点击的item的位置
      local position = holder.getAdapterPosition()
      --一般通过索引找到数据
      local _itemdata = itemdata[position]
      local id= position + 1
      if id==1 then
        activity.newActivity("activity/AboutAppActivity",{})
       elseif id==2 then
        activity.newActivity("activity/SettingActivity")
        end
    end
    return holder
  end,
  onBindViewHolder=function(holder,position) --position:item的位置
    local view = holder.view.getTag() --控件存在这里面
    local index = position + 1
    local text3 = moretext[index]
    local text3_1 = moretext2[index]
    local icon1 = moreicon[index]

    --在这里设置item的数据
    view.image.setImageBitmap(loadbitmap(icon1))
    view.text1.setText(text3)
    view.text2.setText(text3_1)
  end,
}))
rec.setAdapter(adp)
.setLayoutManager(LinearLayoutManager(activity))
itemdata2={
}
import "data.music"
adp2 = LuaCustRecyclerAdapter(AdapterCreator({
  getItemCount=function()
    return #music_table --item数量
  end,
  onCreateViewHolder=function(parent,viewType) local views = {} --控件存在这里面
    local holder = LuaCustRecyclerHolder(loadlayout(item2, views))
    holder.view.setTag(views)
    views.musiccard.onClick=function()
      --获取被点击的item的位置
      local position = holder.getAdapterPosition()
      --一般通过索引找到数据
      local _itemdata = itemdata[position]
      local id= position + 1
      activity.newActivity("Activity/MusicActivity",{"https://music.163.com/song/media/outer/url?id="..url_table[id]..".mp3",artist_table[id],music_table[id],url_table[id]})
    end
    return holder
  end,
  onBindViewHolder=function(holder,position) --position:item的位置
    local view = holder.view.getTag() --控件存在这里面
    local index = position + 1
    local text5 = artist_table[index]
    local text4 = music_table[index]
    view.music.setText(text4)
    view.artist.setText(text5)
  end,
}))

rec2.setAdapter(adp2)
.setLayoutManager(LinearLayoutManager(activity))
import "androidx.recyclerview.widget.StaggeredGridLayoutManager"
rec2.layoutManager=StaggeredGridLayoutManager(2,StaggeredGridLayoutManager.VERTICAL)--3为网格行数,可换HORIZONTAL

local post=nil
okHttp("https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN",post,header,function(code,content,heafer)
  local wallpaper=cjson.decode(content)
  BingTitle.setText(wallpaper.images[1].title)
  BingCopyright.setText(wallpaper.images[1].copyright)
  Glide.with(activity).load("https://cn.bing.com"..wallpaper.images[1].url).into(BingWallpaper)
end)
local hour = tonumber(os.date("%H"))
if hour >= 0 and hour <= 5 then
  message = "晚上好，该休息了"
 elseif hour >= 6 and hour <= 11 then
  message = "早上好"
 elseif hour >= 12 and hour <= 17 then
  message = "下午好"
 elseif hour >= 18 and hour <= 23 then
  message = "晚上好"
 else
  message = "当前时间不在定义的时间段内。"
end
h_time.setText(message)
--userdata点击事件
userdata.onClick=function()
  MaterialAlertDialogBuilder(this)
  .setTitle("登录信息")
  .setMessage("游客登录状态下无法显示登录信息")
  .setPositiveButton("确认",{onClick=function(v)end})

  .show()
  end
--fab点击事件
fab.onClick=function()
  MaterialAlertDialogBuilder(this)
  .setTitle("要抽取你的歌姬吗")
  .setMessage("会随机抽取一位虚拟歌姬")
  .setPositiveButton("确认",{onClick=function(v)
      local SingerNum=math.random(#Singer)
      --MaterialToast(tostring(SingerNum))
      activity.newActivity("activity/SingerActivity",{SingerNum})
  end})
  .setNegativeButton("取消",nil)
  .show()
end