require "MainConfig"
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "util.okhttp"
import "java.io.File"
import "cjson"
this.setContentView(loadlayout("layout.RegisterActivity"))
url,admin,key=...
sendMail.onClick=function ()
  --获取账号
  local user=user.Text
  --获取邮箱
  local mail=mail.Text
  if user=="" or mail=="" then
    print("账号和邮箱不能为空")
   else
    --声明接口
    local api=url.."main/api/user/code.php"
    --请求体
    local body={
      ["admin"]=admin,
      ["user"]=user,
      ["mail"]=mail,
      ["key"]=key
    }
    Http.post(api,body,nil,nil,function (code,body)
      if code==200 then
        --请求成功，解析JSON
        local data=cjson.decode(body)
        print(data.msg)
       else
        --请求失败
        print("Http error code:"..code)
      end
    end)
  end
end

--注册按钮事件
register.onClick=function ()
  --获取账号
  local user=user.Text
  --获取密码
  local password=password.Text
  --获取昵称
  local name=name.Text
  --获取验证码
  local mailCode=code.Text
  if user=="" or password=="" or name=="" then
    print("不能为空")
   else
    --声明接口
    local api=url.."main/api/user/register.php"
    --请求体
    local body={
      ["admin"]=admin,
      ["user"]=user,
      ["password"]=password,
      ["name"]=name,
      ["code"]=mailCode,
      ["key"]=key
    }
    Http.post(api,body,nil,nil,function (code,body)
      if code==200 then
        --请求成功，解析JSON
        local data=cjson.decode(body)
        print(data.msg)
       else
        --请求失败
        print("Http error code:"..code)
      end
    end)
  end
end
toolbar.navigationIcon = MDC_R.drawable.abc_ic_ab_back_material
toolbar.navigationOnClickListener = function()
  this.finish()
end