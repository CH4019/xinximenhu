require "import"
import "android.graphics.Color"
import "androidx.cardview.widget.CardView"
import "android.view.View"
import "android.view.WindowManager"
import "android.widget.TextView"
import "java.io.File"
import "android.widget.ImageView"
import "android.widget.RelativeLayout"
import "android.graphics.Color"
import "android.widget.LinearLayout"
import "android.widget.ImageView"
import "android.view.View"
import "java.io.File"
import "android.view.WindowManager"
import "android.widget.TextView"
import "android.widget.RelativeLayout"
import "com.google.android.material.card.MaterialCardView"
--程序启动时会执行的事件
import "java.io.*"



import "android.content.*"
File("/storage/emulated/0/Android/data/"..this.packageName.."/start").mkdir()--不存在 则创建

local window=this.getWindow()
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
window.setStatusBarColor(Color.TRANSPARENT)
--先导入io包
file,err=io.open("/storage/emulated/0/Android/data/"..this.packageName.."/start/index.txt") --检查是否存在
if err==nil then
  -- 存在执行的事件
  activity.newActivity("start",{value})--载入启动页
  activity.finish()
 else-- 不存在执行事件
  layout=--布局命名
  {
    RelativeLayout,--相对布局
    layout_width="fill",--布局宽度
    layout_height="fill",--布局高度
    background="#A593E0",--布局背景
    {
      LinearLayout,--线性布局
      orientation="vertical",--垂直方向
      layout_width="fill",--布局宽度
      layout_height="fill",--布局高度
      gravity="top|center",--重力居顶｜置中
      {
        MaterialCardView,--卡片框控件
        layout_width="35%h",--布局宽度
        layout_height="35%h",--布局高度
        radius="5%h",--圆角半径
        layout_marginTop="10%h",--布局顶距
        --layout_marginLeft="8%w",--布局左距
        cardElevation="8%h",--卡片提升
        --  cardBackgroundColor="#ffffff",--卡片背景色
        radius="5%h",--圆角半径
        layout_margin="24dp",
        --strokeWidth="2dp", --边框宽度
        --strokeColor="#03DAC5", --边框颜色
        {

          ImageView,--图片框控件
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          --this.loader.loadImage(imageView,"start.png")
          src="../images/start.png",
        },
      },--卡片框控件结束
      {
        MaterialCardView,--卡片框控件
        layout_marginTop="15%h",--布局顶距
        -- layout_marginLeft="30%w",--布局左距
        layout_width="50%w",--布局宽度
        layout_height="12%h",--布局高度
        layout_margin="35%w",--布局边距
        cardElevation="4%w",--卡片提升
        cardBackgroundColor="#ffffff",--卡片背景色
        radius="4%h",--圆角半径
        id="授权",
        {
          LinearLayout,--线性布局
          orientation="vertical",--布局方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          gravity="center",--重力属性--顶:top--中:center--左:left--右:right--底:bottom
          {
            TextView,--文本框控件
            padding="2dp",--布局填充
            --paddingLeft="3%h",--布局内左距
            -- paddingTop="4%h",--布局内顶距
            text="开始使用",--文本内容
            textSize="25dp",--文本大小
            textColor="#000000",--文本颜色
          },
        },--线性布局结束
      },--卡片框控件 结束
    },--线性布局结束

  }
  activity.setContentView(loadlayout(layout))--全屏框架
  --进入子页面("首次启动")

  function 授权.onClick()
    activity.newActivity("first",{value})--载入启动页
    activity.finish()
  end
end







