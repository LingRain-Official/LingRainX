import "okhttp3.*"
import "java.io.File"
import "java.util.concurrent.TimeUnit"

-- 初始化OkHttpClient
if not okHttp.client then
  okHttp.client = OkHttpClient.Builder()
    .connectTimeout(10, TimeUnit.SECONDS)  -- 设置连接超时10秒
    .readTimeout(30, TimeUnit.SECONDS)  -- 设置读取超时30秒
    .writeTimeout(30, TimeUnit.SECONDS)  -- 设置写入超时30秒
    .dispatcher(Dispatcher().setMaxRequests(5))  -- 设置最大并发请求数
    .dispatcher(Dispatcher().setMaxRequestsPerHost(2))  -- 设置每个主机的最大并发请求数
    .build()
end

-- 定义GET请求方法，支持同步和异步调用
function okHttp.get(url, header, followRedirects, callback)
  header = header or {}
  followRedirects = followRedirects == nil and true or followRedirects
  callback = callback or nil

  local clientBuilder = okHttp.client.newBuilder()
  clientBuilder.followRedirects(followRedirects)
  local client = clientBuilder.build()
  local requestBuilder = Request.Builder().url(url).get()

  if not header["User-Agent"] then
    header["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
  end

  for key, value in pairs(header) do
    requestBuilder.header(key, value)
  end

  local request = requestBuilder.build()
  local call = client.newCall(request)

  if callback then
    call.enqueue(Callback{
      onFailure = function(call, e)
        activity.runOnUiThread(Runnable{
          run = function() callback(-1, e.toString(), nil) end
        })
      end,
      onResponse = function(call, response)
        local code = response.code()
        local content = response.body().string()
        local headers = luajava.astable(response.headers())
        activity.runOnUiThread(Runnable{
          run = function() callback(code, content, headers) end
        })
      end
    })
  else
    local response = nil
    local success, err = pcall(function()
      response = call.execute()
    end)

    if success and response then
      local code = response.code()
      local content = response.body().string()
      local headers = luajava.astable(response.headers())
      return code, content, headers
    else
      return -1, err and tostring(err) or "Unknown error", {}
    end
  end
end

-- 定义POST请求方法，支持同步和异步调用
function okHttp.post(url, postParams, header, callback)
  postParams = postParams or {}
  header = header or {}
  callback = callback or nil

  local formBodyBuilder = FormBody.Builder()
  for key, value in pairs(postParams) do
    formBodyBuilder.add(key, value)
  end
  local formBody = formBodyBuilder.build()
  local requestBuilder = Request.Builder().url(url).post(formBody)

  for key, value in pairs(header) do
    requestBuilder.header(key, value)
  end

  local request = requestBuilder.build()
  local call = okHttp.client.newCall(request)

  if callback then
    call.enqueue(Callback{
      onFailure = function(call, e)
        activity.runOnUiThread(Runnable{
          run = function() callback(-1, e.toString(), nil) end
        })
      end,
      onResponse = function(call, response)
        local code = response.code()
        local content = response.body().string()
        local headers = luajava.astable(response.headers())
        activity.runOnUiThread(Runnable{
          run = function() callback(code, content, headers) end
        })
      end
    })
  else
    local response = nil
    local success, err = pcall(function()
      response = call.execute()
    end)

    if success and response then
      local code = response.code()
      local content = response.body().string()
      local headers = luajava.astable(response.headers())
      return code, content, headers
    else
      return -1, err and tostring(err) or "Unknown error", {}
    end
  end
end

-- 定义文件上传请求方法，支持同步和异步调用
function okHttp.upload(url, postParams, files, header, callback)
  postParams = postParams or {}
  files = files or {}
  header = header or {}
  callback = callback or nil

  local multipartBodyBuilder = MultipartBody.Builder().setType(MultipartBody.FORM)

  for key, value in pairs(postParams) do
    multipartBodyBuilder.addFormDataPart(key, value)
  end

  for _, file in ipairs(files) do
    local fileBody = RequestBody.create(MediaType.parse(file.type), File(file.path))
    multipartBodyBuilder.addFormDataPart(file.name, file.filename, fileBody)
  end

  local requestBody = multipartBodyBuilder.build()
  local requestBuilder = Request.Builder().url(url).post(requestBody)

  for key, value in pairs(header) do
    requestBuilder.header(key, value)
  end

  local request = requestBuilder.build()
  local call = okHttp.client.newCall(request)

  if callback then
    call.enqueue(Callback{
      onFailure = function(call, e)
        activity.runOnUiThread(Runnable{
          run = function() callback(-1, e.toString(), nil) end
        })
      end,
      onResponse = function(call, response)
        local code = response.code()
        local content = response.body().string()
        local headers = luajava.astable(response.headers())
        activity.runOnUiThread(Runnable{
          run = function() callback(code, content, headers) end
        })
      end
    })
  else
    local response = nil
    local success, err = pcall(function()
      response = call.execute()
    end)

    if success and response then
      local code = response.code()
      local content = response.body().string()
      local headers = luajava.astable(response.headers())
      return code, content, headers
    else
      return -1, err and tostring(err) or "Unknown error", {}
    end
  end
end