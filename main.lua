--在有限的时间内，创造无限的价值
require "MainConfig"
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "util.okhttp"
import "java.io.File"
import "cjson"
this.setContentView(loadlayout("layout.LoginActivity"))
import "com.narcissus.tool.*"
--[==[url=NarcissusTool.getUrl()
--print(url)
--后台配置
admin="1422561304"
--Key配置，未开启可不填
key=""
local file=File(activity.getLuaDir().."/login").exists()
--如果存在，读取文件内容
if file then
  local file=io.input(activity.getLuaDir().."/login")
  local str=io.read("*a")
  io.close()
  --查找分隔符位置
  local pos=string.find(str, "|")
  --截取账号
  user=string.sub(str,1,pos-1)
  --截取密码
  password=string.sub(str,pos+1)
  --自动登录
  local api=url.."main/api/user/login.php"
  --请求体
  local post="admin="..admin..
  "&user="..user..
  "&password="..password
  --(post)
  --post请求
  okHttp(api,post,header,function(code,body1,heafer)
    --(body1)
    if code==200 then
      --解析JSON
      local data=cjson.decode(body1)
      if data.code==1 then
        --状态码为1则登录成功
        activity.newActivity("activity/MainActivity",{url,admin,user,password,key})
        activity.finish()
       else
        --登录失败，跳转至登录界面
        
      end
     else
      --请求失败
      print("无法登录","因为http error code{"..code.."}")
    end
  end)
 else
 login.onClick=function ()
  --获取编辑框账号密码
  local user=user.Text
  local password=password.Text
  --判断是否为空
  if user=="" or password=="" then
    print("不能为空")
    else
    --调用水仙登录接口
    local api=url.."main/api/user/login.php"
    --请求体
    local post="admin="..admin..
  "&user="..user..
  "&password="..password
  --(body)
    okHttp(api,post,header,function(code,body,heafer)
      if code == 200 then
        --请求成功，解析JSON
        local data=cjson.decode(body)
        --(data.msg)
        --读取code判断是否为1
        if data.code == 1 then
          local loginFile=user.."|"..password
          --存入文件
          io.open(activity.getLuaDir().."/login","w"):write(loginFile):close()
          --跳转主页面
          activity.newActivity("activity/MainActivity",{url,admin,user,password,key})
          activity.finish()
        end
       else
        -- 请求失败
        print("HTTP error code:"..code)
    end
    end)
  end
end
end

register.onClick=function ()
  activity.newActivity("activity/RegisterActivity",{url,admin,key})
end
]==]
activity.newActivity("activity/MainActivity",{url,admin,user,password,key})
activity.finish()