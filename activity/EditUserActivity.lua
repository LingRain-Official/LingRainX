require "MainConfig"
require "import"
import "android.widget.*"
import "android.view.*"
import "util.okhttp"
import "java.io.File"
import "cjson"
activity.setContentView(loadlayout("layout.EditUserActivity"))
this.getSupportActionBar().hide()
local Glide = luajava.bindClass "com.bumptech.glide.Glide"

url,admin,user,password=...
toolbar.navigationIcon = MDC_R.drawable.abc_ic_ab_back_material
toolbar.navigationOnClickListener = function()
  this.finish()
end
local api=url.."main/api/user/user_data.php"
--请求体
local post="admin="..admin..
"&user="..user..
"&password="..password
okHttp(api,post,header,function(code,body,heafer)
  if code==200 then
    local data=cjson.decode(body)
    if data.code==1 then
      local data=data.data
      Glide.with(activity).load(data.head).into(head)
      
     else
      print(data.msg)
    end
   else
    print("Http error code:"..code)
  end
end)