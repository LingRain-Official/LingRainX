import "okhttp3.*"
function okHttp(url,post,header,callback)
  import "okhttp3.*"--需要引入dex文件,手册已经内置了
  if not mOkHttpClient then --判断是否已经创建
    mOkHttpClient = OkHttpClient()
    mOkHttpClient.dispatcher().setMaxRequests(10)--最大并发数
    mOkHttpClient.dispatcher().setMaxRequestsPerHost(5)--同主机最大并发数
  end
  local req = Request.Builder()
  req.url(url)--设置请求url
  if post then--不为空则设置post表单
    local arr=FormBody.Builder()
    for str in (post.."&"):gmatch("(.-)&") do
      local key,value=str:match("(.-)=(.+)")
      arr.add(key,value)
    end
    local requestBody=arr.build()
    req.post(requestBody)
  end
  if header then--不为空则设置请求头
    for key,value in pairs(header) do
      req.header(key,value)
    end
  end
  local request=req.build()
  local callz = mOkHttpClient.newCall(request)
  --异步请求
  callz.enqueue(Callback{
    onFailure=function(call,e)
      import "java.lang.Runnable"
    end,
    onResponse=function(call,response)
      local code=response.code()
      local content=response.body().string()
      local heafer=luajava.astable(response.headers())
      import "java.lang.Runnable"
      activity.runOnUiThread(Runnable{
        run = function()
          callback(code,content,heafer)--请求成功回调
        end
      })
    end
  })
end