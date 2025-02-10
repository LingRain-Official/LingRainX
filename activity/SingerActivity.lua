require "MainConfig"
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "data.Singer"
import "layout.SingerActivity"
this.setContentView(loadlayout("layout.SingerActivity"))
--传入的参数
SingerNum=...
SingerImg.setImageBitmap(loadbitmap(Singer_img[SingerNum]))
--print(Singer_img[SingerNum])
singer.setText(Singer[SingerNum])
singer2.setText(Singer_2[SingerNum])
about_1.setText(About[SingerNum])
about_2.setText(About2[SingerNum])
RO.setText(RepresentationalObject[SingerNum])
SingerColor.setText(MainColor[SingerNum])
import "android.graphics.Color"
import "android.os.Bundle"
import "android.graphics.drawable.ColorDrawable"
ColorView.setCardBackgroundColor(Color.parseColor(MainColor[SingerNum]))