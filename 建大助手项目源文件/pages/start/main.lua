
require "import"
import "androidx.appcompat.app.*"
import "androidx.appcompat.view.*"
import "androidx.appcompat.widget.*"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"


require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.widget.LinearLayout"
import "android.widget.ImageView"
import "android.widget.EditText"
import "com.google.android.material.card.MaterialCardView"
import "android.R$layout"


import "android.widget.ImageView"
import "androidx.cardview.widget.CardView"

import "android.widget.FrameLayout"
import'com.yuxuan.widget.*'
import "android.widget.FrameLayout"

状态栏高度=this.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height)
--沉浸状态栏
if Build.VERSION.SDK_INT >= 21 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);
end
if Build.VERSION.SDK_INT >= 19 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
end
import 'android.os.Build'
if Build.VERSION.SDK_INT >= 19 then
  import 'android.view.Window'
  import 'android.view.WindowManager'
  import 'android.view.WindowManager$LayoutParams'
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
end


layout={
  FrameLayout,
  layout_height="fill";
  background='#00000000',--背景颜色或图片路径
  layout_width="fill";
  {
    LinearLayout,--线性布局
    orientation="vertical",--垂直方向
    layout_width="fill",--布局宽度
    layout_height="90%h",--布局高度
    gravity="center|center",--重力置中
    {
      CardView,--卡片框控件
      layout_width="100dp",--布局宽度
      layout_height="100dp",--布局高度
      cardElevation="2dp",--卡片提升
      --  layout_gravity="center";
      -- cardBackgroundColor="#ffffff",--卡片背景色
      radius="8dp",--圆角半径
      {
        ImageView,--图片框控件
        layout_width="fill",--布局宽度
        layout_height="fill",--布局高度
        src="../icon.png"
       -- src="https://s3.bmp.ovh/imgs/2022/03/6c4b5f7caf73d55a.png",--视图路径
      },
    },--卡片框控件结束
    {
      TextView,--文本框控件
      text="建大助手",--文本内容
      textSize="25sp",--文本大小
      textColor="#000000",--文本颜色
      layout_marginTop="5%h",--布局顶距
      --layout_marginLeft="13%w",--布局左距
      --layout_gravity="center";
    },
  },
  {
    WaveView,
    id="wave",
    layout_width="fill",
    layout_height="10%h",
    rotation=180;
    layout_gravity="bottom";
  };

};
activity.setContentView(loadlayout(layout))


wave.setStartColor(0xFF66a6ff);
--设置结束颜色
wave.setCloseColor(0xFF89f7fe);
--设置颜色透明度
wave.setColorAlpha(0.3);
--设置波浪高度
wave.setWaveHeight(40);
wave.setGradientAngle(40);
--设置波浪进度,百分之八十
wave.setProgress(0.8);
--设置波浪震动幅度
wave.setVelocity(10);
--开始动画
wave.start();
--停止动画
--mMultiWaveHeader.stop();
--判断动画是否在运行
wave.isRunning();
local value=...
if (value==nill)
  value=2500
end
task(value, function()
import "android.content.Context"
  local wl=activity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE).getActiveNetworkInfo();
  if wl== nil then
    print("请检查网络！")
   else
    activity.newActivity("index",{value})--载入主页
    activity.finish()
  end
end)

--退出应用（俩次返回）
backnums=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if backnums+2 > tonumber(os.time()) then
      activity.finish()
     else
      Toast.makeText(activity,"再按一次返回键退出" , Toast.LENGTH_SHORT )
      .show()
      backnums=tonumber(os.time())
    end
    return true
  end
end




