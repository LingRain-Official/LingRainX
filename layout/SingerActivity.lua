require "import"
import "util.m3-import"
import "android.os.Build"
local Typeface = luajava.bindClass "android.graphics.Typeface"

return{
  LinearLayoutCompat,
  layout_height="match_parent";
  orientation="vertical";
  id="appBar",
  layout_width="match_parent";
  {NestedScrollView,
    id="ns",
    layout_width="fill",
    layout_height="fill",
    --layout_behavior="@string/appbar_scrolling_view_behavior",
    fillViewport="true",
    {
      LinearLayoutCompat,
      layout_height="match_parent";
      orientation="vertical";
      layout_width="match_parent";
      padding="10dp";
      {
        MaterialCardView;
        layout_width="match_parent";
        layout_height="wrap_content";
        --layout_marginTop="10dp",

        StrokeColor=0,
        {
          LinearLayout;
          layout_width="match_parent";
          layout_height="wrap_content";
          orientation="vertical";
          padding="15dp";

          {
            TextView;
            textSize="25sp";
            --layout_marginTop="5dp";
            text="初音未来";
            id="singer",
            Typeface=Typeface.DEFAULT_BOLD;--字体
            TextColor=colorOnBackground;
          };
          {
            TextView;
            TextColor=colorOnBackground;
            layout_marginBottom="5dp";
            text="VOCALOID虚拟歌手";
            id="singer2",
          };
        },
      },
      {
        MaterialCardView;
        layout_width="match_parent";
        layout_height="180dp";
        radius="15dp";
        --StrokeColor=colorPrimary,
        cardElevation="0",
        StrokeColor=0,
        {
          ImageView;
          layout_width="fill";
          layout_height="fill";
          --src="res/img2.jpg";
          scaleType="centerCrop";
          id="SingerImg",
        };
      };
      {
        MaterialCardView;
        layout_width="match_parent";
        layout_height="wrap_content";
        layout_marginTop="10dp",

        --StrokeColor=colorPrimaryContainer,
        {
          LinearLayout;
          layout_width="match_parent";
          layout_height="wrap_content";
          orientation="vertical";
          padding="15dp";

          {
            TextView;
            textSize="20sp";
            layout_marginTop="5dp";
            text="关于TA:世界第一的公主殿下";
            id="about_1",
            TextColor=colorOnBackground;
          };
          {
            TextView;
            TextColor=colorOnBackground;
            id="about_2";
            text=[==[初音未来（日语：初音 ミク，Hatsune Miku），是由Crypton Future Media以雅马哈的Vocaloid系列语音合成程序为基础开发的音源库。可指代包装封面上葱色头发的少女形象，还可指活跃在动漫中的“人气歌手”。
搜狗百科]==];
          };
          {
            TextView;
            TextColor=colorOnBackground;
            layout_marginTop="5dp";
            text="代表物:大葱",
            id="RO";
          };
          {
            TextView;
            textSize="20sp";
            layout_marginTop="15dp";
            text="TA的对应颜色";
            TextColor=colorOnBackground;
          };
          {
            TextView;
            TextColor=colorOnBackground;
            text="#39C5BB";
            id="SingerColor";
          };
          {
            MaterialCardView;
            w=-1,
            h="30dp",
            StrokeColor=0,
            radius="10dp";
            id="ColorView";
            --strokeColor = Color.BLACK;
            CardBackgroundColor="#39C5BB";
          };
        };
      };
    };
  };
};