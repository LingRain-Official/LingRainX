require "MainConfig"
require "import"
import "android.widget.*"
import "android.view.*"
import "util.okhttp"
import "java.io.File"
import "cjson"
import "android.graphics.Typeface"
import "android.graphics.Paint"
import "util.m3-import"
import "com.google.android.material.dialog.MaterialAlertDialogBuilder"
--import "layout.item3"
import "android.content.res.ColorStateList"
activity.setContentView(loadlayout("layout.AboutApp"))
toolbar.navigationIcon = MDC_R.drawable.abc_ic_ab_back_material
toolbar.navigationOnClickListener = function()
  this.finish()
end
local Environment = luajava.bindClass("android.os.Environment")
local Typeface = luajava.bindClass("android.graphics.Typeface")

function 字体(路径)
  return Typeface.createFromFile(File(activity.getLuaDir().. "/ttf/"..路径..".ttf"))
end
function 设置字体(id)
  id.setTypeface(字体("Comfortaa-Bold-2"))
end
设置字体(maintitle)
function itemtext(text1,text2)
  return {
    LinearLayout;
    orientation="vertical";
    layout_width="fill";
    {
      TextView;
      text=text1;
      textSize="20sp";
      layout_marginTop="5dp";
    };
    {
      TextView;
      text=text2;
      textColor="#444444";
    };
  };
end
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
local item3={
  MaterialCardView;
  w=-1;
  id="SettingCard";
  StrokeColor=0,
  radius=0,
{
  LinearLayoutCompat;
  layout_width="match_parent";
  orientation="horizontal";
  padding="15dp";
  layout_height="wrap_content";
  
  {
    ImageView;
    id="image";
    layout_gravity="center";
    layout_width="25dp";
    layout_height="25dp";
    layout_marginRight="30dp";
    layout_marginLeft="10dp";
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
      layout_height="wrap_content",
      textSize="16sp";
      text="Text1";
    };
    {
      TextView;
      gravity="center";
      id="text2";
      layout_height="wrap_content";
      textSize="15sp";
      text="text2";
    };
  };
};
};
local item4={
  MaterialCardView;
  w=-1;
  id="SettingCard";
  StrokeColor=0,
  radius=0,
{
  LinearLayoutCompat;
  layout_width="match_parent";
  orientation="horizontal";
  padding="15dp";
  layout_height="wrap_content";
  {
    MaterialCardView;
    layout_marginRight="20dp";
    layout_marginLeft="10dp";
    layout_width="35dp";
    radius="80";
    layout_gravity="center";
    layout_height="35dp";
  {
    ImageView;
    id="image";
    
    layout_width=-1;
    layout_height=-1;

    --ColorFilter=colorOnBackground;
  };
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
      layout_height="wrap_content",
      textSize="16sp";
      text="Text1";
    };
    {
      TextView;
      gravity="center";
      id="text2";
      layout_height="wrap_content";
      textSize="15sp";
      text="text2";
    };
  };
};
};
SettingTitle1={
  "应用版本";
  "用户协议";
  "运行环境";
}
SettingText1={
  activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName;
  "点击查看",
  "未知";
}
SettingImage1={
  "res/about.png";
  "res/user.png",
  "res/terminal.png";
}
Author={
  "cmouren191";
  "RS-爱玩游戏的薯条";
  "Xiayu";
  "大妮可";
}
Detailed={
  "程序编写";
  "RSCM作者",
  "非常强的一位大牛";
  "歌姬图片";
}
Head={
  "res/head/contributor1.jpg";
  "res/head/contributor2.jpg",
  "res/head/contributor3.jpg";
  "res/head/contributor4.jpg";
}
if activity.getPackageName() =="com.load.LuaAppX" or activity.getPackageName() =="github.znzsofficial.openlua" then
  SettingText1[3]="IDE"
 else
  SettingText1[3]="打包运行"
end
adp = LuaCustRecyclerAdapter(AdapterCreator({
  getItemCount=function()
    return #SettingTitle1 --item数量
  end,
  onCreateViewHolder=function(parent,viewType) local views = {} --控件存在这里面
    local holder = LuaCustRecyclerHolder(loadlayout(item3, views))
    holder.view.setTag(views)
    views.SettingCard.onClick=function()
      local position = holder.getAdapterPosition()
      --一般通过索引找到数据
      local _itemdata = SettingTitle1[position]
      local id= position + 1
      if id==2 then
        MaterialAlertDialogBuilder(this)
    .setTitle("LingRain用户协议")
    .setMessage([==[感谢您使用由 LingRainStudio 开发的软件和服务。为了确保您在使用我们的软件和服务时获得最佳体验，并保护您的合法权益，请仔细阅读以下用户协议（以下简称“协议”）。本协议适用于 LingRainStudio 开发的所有软件，包括但不限于提供网易云音乐在线听、VOCALOID歌姬预览、必应每日壁纸查看等功能的软件。

1. 接受协议
1.1 您下载、安装、使用或以其他方式访问 LingRain Studio 开发的任何软件，即表示您已阅读、理解并同意接受本协议的所有条款和条件。

1.2 如果您不同意本协议的任何条款，请立即停止使用我们的软件和服务。

2. 软件使用许可
2.1 LingRain Studio 授予您一项非独占、不可转让的个人许可，允许您根据本协议的条款使用我们的软件。

2.2 除通过官方公开链接获取源代码外，您不得对软件进行反向工程、反编译、拆解、尝试导出源代码或以其他方式尝试获取软件的源代码。

3. 用户行为
3.1 您同意在使用我们的软件和服务时遵守所有适用的法律法规。

3.2 您不得使用我们的软件和服务进行任何非法活动，包括但不限于侵犯他人知识产权、传播恶意软件或进行网络攻击。

3.3 您不得通过我们的软件和服务传播任何违法、淫秽、诽谤、侮辱、威胁、骚扰或令人反感的内容。

3.4 您不得尝试干扰或破坏我们软件和服务的正常运行，包括但不限于使用恶意软件、病毒或进行拒绝服务攻击。

4. 知识产权
4.1 LingRain Studio 保留对软件及其所有相关内容的全部权利，包括但不限于文本、图形、用户界面、视觉界面、商标、标志、声音、音乐、算法和代码。

4.2 您承认并同意，所有与软件相关的知识产权均归 LingRain Studio 或其许可人所有。

4.3 本协议不授予您任何有关软件知识产权的权利，除非本协议中明确规定的除外。

5. 隐私政策
5.1 LingRainStudio 尊重您的隐私，并承诺保护您的个人信息。请参阅我们的隐私政策，了解我们如何收集、使用、披露和保护您的个人信息。

5.2 您同意我们根据隐私政策的规定收集、使用和披露您的个人信息。

6. 免责声明
6.1 LingRainStudio 提供的软件和服务按“原样”和“可用性”提供，不附带任何形式的明示或暗示的保证，包括但不限于对适销性、特定用途适用性和非侵权的保证。

6.2 LingRainStudio 不保证软件和服务将始终不中断、安全、无错误或无病毒
]==])
        .show()
  
        else
        end
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


adp2= LuaCustRecyclerAdapter(AdapterCreator({
  getItemCount=function()
    return #Author --item数量
  end,
  onCreateViewHolder=function(parent,viewType) local views = {} --控件存在这里面
    local holder = LuaCustRecyclerHolder(loadlayout(item4, views))
    holder.view.setTag(views)
    views.SettingCard.onClick=function()
    end
    return holder
  end,
  onBindViewHolder=function(holder,position) --position:item的位置
    local view = holder.view.getTag() --控件存在这里面
    local index = position + 1
    local SettingT = Author[index]
    local SettingTe = Detailed[index]
    local SettingI = Head[index]
    --在这里设置item的数据
    view.image.setImageBitmap(loadbitmap(SettingI))
    view.text1.setText(SettingT)
    view.text2.setText(SettingTe)
  end,
}))
rec2.setAdapter(adp2)
.setLayoutManager(LinearLayoutManager(activity))
