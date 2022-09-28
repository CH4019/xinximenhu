--
-- @author 寒歌
-- @description Main是应用的主模块，其中注册了应用运行中UI事件的回调、Activity生命周期的回调等
-- 你也可以在此编写启动事件代码，或控制应用运行逻辑、自定义应用UI等等。
-- @other 本模版已为你编写好基础事件，建议在阅读注释并理解相关参数意义后再进行扩展编写
--

-- ****默认导入包****
require "import"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
-- ****不需要请删除****

import "android.widget.ScrollView"
import "androidx.cardview.widget.CardView"
import "android.widget.TextView"
import "android.animation.ObjectAnimator"
import "android.view.View"
import "android.widget.LinearLayout"

--程序启动时会执行的事件
状态栏高度=this.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height)

local window=this.getWindow()
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xfF383838);

layout=--布局命名
{
  LinearLayout,--线性布局
  orientation="vertical",--布局方向
  layout_width="fill",--布局宽度
  layout_height="fill",--布局高度
  {
    LinearLayout,--线性布局
    orientation="vertical",--布局方向
    layout_width="fill",--布局宽度
    layout_height="wrap",--布局高度
    background="#fF303030",--布局背景
    elevation="8dp",--阴影层次
    {
      LinearLayout,--线性布局
      layout_marginTop="0%h",--布局顶距
      orientation="horizontal",--布局方向
      layout_width="fill",--布局宽度
      layout_height="56dp",--布局高度
      layout_marginTop=状态栏高度,--布局顶距
      background="#fF383838",--布局背景
      gravity="left|center",--重力居左｜置中
      {
        ImageView,--图片框控件
        layout_width="56dp",--布局宽度
        layout_height="56dp",--布局高度
        padding="12dp",--布局填充
        src="../images/back.svg",--视图路径
        colorFilter="#ffffff",--图片颜色
        onClick=function()--单击事件
          activity.finish()
        end
      },
      {
        TextView,
        text="  更新日志",--文本内容
        textSize="20sp",--文本大小
        textColor="#ffffff",--文本颜色
        singleLine=true,--禁止文本换行
      },
    },--线性布局 结束
  },--线性布局 结束

  {
    ScrollView,--纵向滑动控件
    layout_width="fill",--布局宽度
    layout_height="fill",--布局高度
    overScrollMode=View.OVER_SCROLL_NEVER,--隐藏圆弧阴影
    verticalScrollBarEnabled=false,--隐藏纵向滑条
    {
      LinearLayout,--线性布局
      orientation="vertical",--布局方向
      layout_width="fill",--布局宽度
      layout_height="fill",--布局高度
      background="#fF303030",--布局背景
      --开始
      {
        --头行空行
        TextView,--文本框控件
        text="\n",--文本内容
        textSize="15sp",--文本大小
        textColor="#222222",--文本颜色
      },
        {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="match",--布局高度
        layout_margin="8dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF303030",--卡片背景色
        radius="15dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--垂直方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          {
            TextView,--文本框控件
            text="2.4.2版本",--文本内容
            textSize="30sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="8%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="发布时间：2022.9.28",--文本内容
            textSize="12sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="8%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="1.适配了安卓11及安卓12\n2.重写了软件相关页面\n3.使用新工具编译\n4.优化了相关问题\n ",--文本内容
            textSize="20sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
        },--线性布局结束
        id="g10"
      },--卡片框控件结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="match",--布局高度
        layout_margin="8dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF303030",--卡片背景色
        radius="15dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--垂直方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          {
            TextView,--文本框控件
            text="2.4.1版本",--文本内容
            textSize="30sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="8%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="发布时间：2022.8.17",--文本内容
            textSize="12sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="8%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="1.修复了清理数据无法清理的bug\n2.优化了更新日志页面的相关显示\n ",--文本内容
            textSize="20sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
        },--线性布局结束
        id="g9"
      },--卡片框控件结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="match",--布局高度
        layout_margin="8dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF303030",--卡片背景色
        radius="15dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--垂直方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          {
            TextView,--文本框控件
            text="2.4.0版本",--文本内容
            textSize="30sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="8%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="发布时间：2022.5.8",--文本内容
            textSize="12sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="8%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="1.更换检查更新接口，使用Github API\n2.调整检查更新功能与方式\n3.优化部分功能及显示效果\n4.新增随重力横竖屏功能\n ",--文本内容
            textSize="20sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
        },--线性布局结束
        id="g8"
      },--卡片框控件结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="match",--布局高度
        layout_margin="8dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF303030",--卡片背景色
        radius="15dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--垂直方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          {
            TextView,--文本框控件
            text="2.3.9版本",--文本内容
            textSize="30sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="8%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="发布时间：2022.4.7",--文本内容
            textSize="12sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="8%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="1.更新应用图标已经调整相关图标\n2.调整首次启动页面布局结构\n3.新增备用教务系统入口\n4.修改打赏页面，加入爱发电平台（🥰欢迎打赏赞助🥰）\n ",--文本内容
            textSize="20sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
        },--线性布局结束
        id="g7"
      },--卡片框控件结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="match",--布局高度
        layout_margin="8dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF303030",--卡片背景色
        radius="15dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--垂直方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          {
            TextView,--文本框控件
            text="2.3.7版本",--文本内容
            textSize="30sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="发布时间：2021.11.24",--文本内容
            textSize="12sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="1.更名为建大助手\n2.调整关于页面\n3.新增更新日志\n4.新增首次启动说明\n5.新增隐私协议\n6.侧滑栏新增进入软件官网，关于页面新增软件官网跳转\n7.重构本软件，降低代码臃肿\n8.本版本更新请先卸载旧版本或清理本软件数据以防软件崩溃\n",--文本内容
            textSize="20sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="15%w",--布局左距
          },
        },
        id="g6"
      },
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="match",--布局高度
        layout_margin="8dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF303030",--卡片背景色
        radius="15dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--垂直方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          {
            TextView,--文本框控件
            text="2.3.6版本",--文本内容
            textSize="30sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="发布时间：2021.10.5",--文本内容
            textSize="12sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="1.解决长按闪退等问题\n2.新增横竖屏手动切换功能，适配平板横屏\n3.新增一键加入内测群功能\n",--文本内容
            textSize="20sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="15%w",--布局左距
          },
        },
        id="g5"
      },
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="match",--布局高度
        layout_margin="8dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF303030",--卡片背景色
        radius="15dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--垂直方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          {
            TextView,--文本框控件
            text="2.3.5版本",--文本内容
            textSize="30sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="发布时间：2021.9.12",--文本内容
            textSize="12sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="1.新增启动动画\n2.对关于页面进行重新设计\n3.取消了不同页面的滑动功能，解决了网页无法滑动的问题\n4.新增历史版本查看\n5.添加一处彩蛋\n",--文本内容
            textSize="20sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="15%w",--布局左距
          },
        },
        id="g4"
      },
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="match",--布局高度
        layout_margin="8dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF303030",--卡片背景色
        radius="15dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--垂直方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          {
            TextView,--文本框控件
            text="2.3.4版本",--文本内容
            textSize="30sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="发布时间：2021.9.5",--文本内容
            textSize="12sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="1.使用fa重制版，增加X5内核\n2.优化了部分bug\n3.顶栏新增跳转浏览器打开网页的功能\n4.侧滑栏新增清理缓存功能\n",--文本内容
            textSize="20sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="15%w",--布局左距
          },
        },
        id="g3"
      },
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="match",--布局高度
        layout_margin="8dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF303030",--卡片背景色
        radius="15dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--垂直方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          {
            TextView,--文本框控件
            text="2.3.3版本",--文本内容
            textSize="30sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="发布时间：2021.8.26",--文本内容
            textSize="12sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="1.调整软件启动自动检查更新为侧边栏手动检查更新\n2.完善了检查更新但提示无可用更新的漏洞\n3.优化了用户体验\n",--文本内容
            textSize="20sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="15%w",--布局左距
          },
        },
        id="g2"
      },
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="match",--布局高度
        layout_margin="8dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF303030",--卡片背景色
        radius="15dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--垂直方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          {
            TextView,--文本框控件
            text="2.3.2版本",--文本内容
            textSize="30sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="发布时间：2021.8.24",--文本内容
            textSize="12sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="10%w",--布局左距
          },
          {
            TextView,--文本框控件
            text="1.页面链接分享功能\n2.页面加载提示功能\n3.软件启动自检查更新功能\n",--文本内容
            textSize="20sp",--文本大小
            textColor="#FFFFFFFF",--文本颜色
            layout_marginLeft="15%w",--布局左距
          },
        },
        id="g1"
      },
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="20dp",--布局高度
        cardBackgroundColor="#fF303030",--卡片背景色
      },--卡片框控件结束
    },--线性布局 结束
  },--纵向滑动控件 结束

}--线性布局 结束
activity.setContentView(loadlayout(layout))--全屏框架




function 水珠动画(view,time)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(view,"scaleX",{1.2,.8,1.1,.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(view,"scaleY",{1.2,.8,1.1,.9,1}).setDuration(time).start()
end

--调用方法
g1.onClick=function()
  水珠动画(g1,300)
end

g2.onClick=function()
  水珠动画(g2,300)
end

g3.onClick=function()
  水珠动画(g3,300)
end

g4.onClick=function()
  水珠动画(g4,300)
end

g5.onClick=function()
  水珠动画(g5,300)
end

g6.onClick=function()
  水珠动画(g6,300)
end

g7.onClick=function()
  水珠动画(g7,300)
end

g8.onClick=function()
  水珠动画(g8,300)
end

g9.onClick=function()
  水珠动画(g9,300)
end

g10.onClick=function()
  水珠动画(g10,300)
end
