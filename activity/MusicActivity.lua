require "MainConfig"
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "util.okhttp"
import "java.io.File"
import "cjson"
import "android.media.MediaPlayer"
import "java.io.File"
import "android.content.Intent"
import "android.view.animation.AlphaAnimation"
import "com.androlua.Ticker"
import "android.animation.ObjectAnimator"
this.setContentView(loadlayout("layout.MusicActivity"))
链接,artist1,music1=...
local ObjectAnimator = luajava.bindClass "android.animation.ObjectAnimator"
  local function dp2px(dpValue)
    local scale = activity.getResources().getDisplayMetrics().scaledDensity
    return dpValue * scale + 0.5
  end
  function 透明动画(id,时间,开始透明度,结束透明度)
    if 开始透明度==1 then
      id.setVisibility(0)
    end
    id.startAnimation(AlphaAnimation(开始透明度,结束透明度).setDuration(时间))
    --  task(时间, function ()
    if 结束透明度==0 then
      id.setVisibility(8)
    end
    if 结束透明度==1 then
      id.setVisibility(0)
    end
    -- end)
  end

  function 单动画(view,xsize,size,time)
    ObjectAnimator().ofFloat(view,"scaleX",{xsize,size}).setDuration(time).start()
    ObjectAnimator().ofFloat(view,"scaleY",{xsize,size}).setDuration(time).start()
  end


  playbtn.onClick=function()
    focusdelay=3
    if mediaPlayer.isPlaying() then
      Pause()
     else
      Play()
    end
  end
  --毫秒转分:秒格式
  function ms2minsec(t)
    local s=t/1000
    local sec=tointeger(s%60)
    if sec<10 then
      sec="0"..sec
    end
    local min=tointeger(s//60)
    if min<10 then
      min="0"..min
    end
    return min..":"..sec
  end

  --小数转百分数
  function dec2per(n)
    return tointeger(100*n).."%"
  end

  function convertMilliseconds(milliseconds)
    local totalSeconds = milliseconds / 1000
    local seconds = math.floor(totalSeconds % 60) -- 秒数
    local minutes = math.floor(totalSeconds / 60) -- 分钟数

    -- 计算剩余的毫秒数，并转换为两位数
    local millisecondsPart = string.format("%02d", math.floor((milliseconds % 1000) / 10))

    -- 格式化时间字符串，包含分钟、秒和毫秒
    local formattedTime = string.format("%02d:%02d.%s", minutes, seconds, millisecondsPart)
    return formattedTime
  end


  function Play()
    if Prepared then
      mediaPlayer.start()
      --    local imgurl="https://s21.ax1x.com/2024/07/26/pkbR75T.png"
      playbtn.setImageBitmap(loadbitmap("res/stop.png"))

    end
  end

  function Pause()
    mediaPlayer.pause()
    --  local imgurl="https://s21.ax1x.com/2024/07/26/pkbRbPU.png"
    playbtn.setImageBitmap(loadbitmap("res/bofang.png"))

  end

  function PreparePlay(内容str)
    playbtn.setEnabled(false)
    seekBar.setEnabled(false)
    isNetFile=内容str:find("http")
    if isNetFile then

     else

    end
    Prepared=false
    --设置播放资源
    mediaPlayer.setDataSource(内容str)
    --title.setText(标题str)
    videoduration=0
    --开始缓冲资源
    mediaPlayer.prepareAsync()
  end

  local MediaPlayer = luajava.bindClass "android.media.MediaPlayer"
  mediaPlayer=MediaPlayer()
  mediaPlayer.reset()
  mediaPlayer.setScreenOnWhilePlaying(true)

  --mediaPlayer.setVolume(mVolume)

  --缓冲完成的监听
  mediaPlayer.setOnPreparedListener(MediaPlayer.OnPreparedListener{
    onPrepared=function(mediaPlayer)
      --开始播放
      Prepared=true
      playbtn.setEnabled(true)
      seekBar.setEnabled(true)

      VideoWidth=mediaPlayer.getVideoWidth()
      VideoHeight=mediaPlayer.getVideoHeight()
      videoduration=mediaPlayer.Duration
      seekBar.setMax(videoduration)
      endtime.Text=ms2minsec(videoduration)
      Play()



    end
  })

  --进度跳转完成监听
  mediaPlayer.setOnSeekCompleteListener(MediaPlayer.OnSeekCompleteListener{
    onSeekComplete=function(mediaPlayer)

    end
  })


  --播放完成回调
  mediaPlayer.setOnCompletionListener(MediaPlayer.OnCompletionListener{
    onCompletion=function(mediaPlayer)
      if Prepared then
        currenttime.Text=ms2minsec(videoduration)
        Play()
      end
    end
  })


  if not(pcall(PreparePlay,链接)) then
    提示("播放失败")
   else
    if string.sub(链接, 1, 7) == "/storag" or string.sub(链接, 1, 7)=="/sdcard" then
      print("开始执行操作")

      local audioFile = AudioFileIO.read(File(链接))
      local tag = audioFile.getTag()
      title=tag.getFirst(FieldKey.TITLE)
      artist=tag.getFirst(FieldKey.ARTIST)
      album=tag.getFirst(FieldKey.ALBUM)
      if not title then
        print("没有找到title")
        -- music.setText(名称)
       else
        print("已找到title")
        print(title)
        --music.setText(title)

      end
      if not artist then
        --artist1.setText("Unknown")
        print("没有找到artist")
       else
        print("已找到artist")
        print(artist)
        --artist1.setText(artist)
      end
     else
    end
  end



  ti2=Ticker()
  ti2.Period=500
  ti2.onTick=function()
    if focusdelay==0 then
      if not(isSeekbarTracking) and focus then
        setunfocus()
      end
    end
    if mediaPlayer and mediaPlayer.isPlaying() then
      currentposition=mediaPlayer.getCurrentPosition()
      currenttime.Text=ms2minsec(currentposition)

      if not(isSeekbarTracking) then
        seekBar.setProgress(currentposition)
        seekBar.setSecondaryProgress(currentposition)
      end
    end
  end

  ti2.start()

  w=activity.getWidth()
  seekBar.setOnSeekBarChangeListener{
    onStartTrackingTouch=function(seekBar)
      单动画(seekBar,1,1.04,250)
      isSeekbarTracking=true
      focusdelay=3
      透明动画(拖动,100,0,1)

    end,
    onProgressChanged=function(seekBar)
      progress=seekBar.getProgress()
      拖动进度.Text=ms2minsec(progress)
      拖动.setTranslationX(progress/videoduration*(w/100*90-dp2px(70)))
    end,
    onStopTrackingTouch=function(seekBar)

      mediaPlayer.seekTo(progress)
      currenttime.Text=ms2minsec(progress)
      isSeekbarTracking=false
      透明动画(拖动,100,1,0)

      focusdelay=3
    end,
  }

  function onDestroy()
    mediaPlayer.stop()
    mediaPlayer=nil
    ti2.stop()
    ti2=nil
  end

   import "android.content.*"

fenxiang.onClick=function()
  function 分享文本(内容)
  import "android.content.*"
  local 分享内容=内容
  local intent=Intent(Intent.ACTION_SEND)
  intent.setType("text/plain")
  intent.putExtra(Intent.EXTRA_SUBJECT,"分享")
  intent.putExtra(Intent.EXTRA_TEXT,分享内容)
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
  activity.startActivity(Intent.createChooser(intent,"分享到:"))
end
分享文本("分享"..artist1.."的"..music1)
  end
musiclist.onClick=function()
  activity.finish()
end
shoucang.onClick=function()
  
    end