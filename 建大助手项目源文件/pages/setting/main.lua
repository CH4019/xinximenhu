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
import "android.widget.CircleImageView"
import "androidx.swiperefreshlayout.widget.CircleImageView"
import "androidx.cardview.widget.CardView"
import "android.widget.LinearLayout"
import "android.view.View"
import "android.widget.TextView"

import "android.view.View"
import "androidx.cardview.widget.CardView"
import "androidx.swiperefreshlayout.widget.CircleImageView"
import "android.widget.CircleImageView"
import "android.widget.ScrollView"
import "android.widget.LinearLayout"
import "android.widget.TextView"

import "android.animation.ObjectAnimator"
-- @param data 侧滑栏列表的全部数据
-- @param recyclerView 侧滑栏列表控件
-- @param listIndex 点击的列表索引（点击的是第几个列表）
--沉浸状态栏

--取状态栏高度
状态栏高度=this.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height)

local window=this.getWindow()
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xfF383838);


标题栏布局={
  LinearLayout,--线性布局
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
    text="  设置",--文本内容
    textSize="20sp",--文本大小
    textColor="#ffffff",--文本颜色
    singleLine=true,--禁止文本换行
  },
}--线性布局结束

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
    background="#ff88ada6",--布局背景
    elevation="4dp",--阴影层次
    标题栏布局,
  },--线性布局结束


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
      gravity="top|center",--重力居顶｜置中
      background="#ff909090",--布局背景
      --开始
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="200dp",--布局高度
        cardElevation="2dp",--卡片提升
        layout_margin="5dp",--布局边距
        cardBackgroundColor="#fF383838",--卡片背景色
        radius="10dp",--圆角半径
        {
          LinearLayout,--线性布局
          orientation="vertical",--布局方向
          layout_width="fill",--布局宽度
          layout_height="fill",--布局高度
          gravity="center",--重力属性--顶:top--中:center--左:left--右:right--底:bottom
          {
            LinearLayout,--线性布局
            orientation="horizontal",--布局方向
            layout_width="fill",--布局宽度
            layout_height="fill",--布局高度
            gravity="center",--重力属性--顶:top--中:center--左:left--右:right--底:bottom
            {
              ImageView,--圆形图片控件
              layout_width="120dp",--布局宽度
              layout_height="120dp",--布局高度
              src="icon.png",--视图路径
            },
          },--线性布局结束
        },--线性布局结束
      },--卡片框控件 结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="80dp",--布局高度
        layout_margin="5dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF383838",--卡片背景色
        radius="10dp",--圆角半径
        {
          TextView,--文本框控件
          text="清理缓存",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_margin="25dp",--布局边距
        },
        id="g1",
      },--卡片框控件 结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="80dp",--布局高度
        layout_margin="5dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF383838",--卡片背景色
        radius="10dp",--圆角半径
        {
          TextView,--文本框控件
          text="软件官网",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_margin="25dp",--布局边距
        },
        id="g2",
      },--卡片框控件 结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="80dp",--布局高度
        layout_margin="5dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF383838",--卡片背景色
        radius="10dp",--圆角半径
        {
          TextView,--文本框控件
          text="历史版本",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_margin="25dp",--布局边距
        },
        id="g3",
      },--卡片框控件 结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="80dp",--布局高度
        layout_margin="5dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF383838",--卡片背景色
        radius="10dp",--圆角半径
        {
          TextView,--文本框控件
          text="检查更新",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_margin="25dp",--布局边距
        },
        id="g4",
      },--卡片框控件 结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="80dp",--布局高度
        layout_margin="5dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF383838",--卡片背景色
        radius="10dp",--圆角半径
        {
          TextView,--文本框控件
          text="更新日志",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_margin="25dp",--布局边距
        },
        id="g5",
      },--卡片框控件 结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="80dp",--布局高度
        layout_margin="5dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF383838",--卡片背景色
        radius="10dp",--圆角半径
        {
          TextView,--文本框控件
          text="赞助",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_margin="25dp",--布局边距
        },
        id="g6",
      },--卡片框控件 结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="80dp",--布局高度
        layout_margin="5dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF383838",--卡片背景色
        radius="10dp",--圆角半径
        {
          TextView,--文本框控件
          text="关于",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_margin="25dp",--布局边距
        },
        id="g7",
      },--卡片框控件 结束
      padding="10dp",--布局填充


    },--线性布局结束
  },--纵向滑动控件结束

}--线性布局结束
activity.setContentView(loadlayout(layout))--全屏框架




function 水珠动画(view,time)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(view,"scaleX",{1.2,.8,1.1,.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(view,"scaleY",{1.2,.8,1.1,.9,1}).setDuration(time).start()
end


import "android.animation.ObjectAnimator"

import "android.widget.TextView"
import "android.view.View"
import "android.widget.ImageView"
import "android.widget.ScrollView"
import "android.widget.LinearLayout"
import "androidx.cardview.widget.CardView"

--调用方法
g1.onClick=function()
  水珠动画(g1,300)


  --清理缓存
  import "java.io.*"
  import "android.content.*"
  import "java.io.File"
  os.execute("rm -rf /storage/emulated/0/Android/data/"..this.packageName.."/cache/")
  File("/storage/emulated/0/Android/data/"..this.packageName.."/cache").mkdir()--不存在 则创建
end

g2.onClick=function()
  水珠动画(g2,300)
  --软件官网
  task(160,function()
    --延迟之后执行的事件
    activity.newActivity("offweb",{value})
  end)

end

g3.onClick=function()
  水珠动画(g3,300)
  --历史版本
  task(160,function()
    --延迟之后执行的事件
    activity.newActivity("oldver",{value})
  end)
end

g4.onClick=function()
  水珠动画(g4,300)
  --检查更新
  检查更新(g4,300)
end

g5.onClick=function()
  水珠动画(g5,300)
  --更新日志
  task(160,function()
    --延迟之后执行的事件
    activity.newActivity("updatelog",{value})
  end)
end

g6.onClick=function()
  水珠动画(g6,300)
  --打赏
  task(160,function()
    --延迟之后执行的事件
    activity.newActivity("sponsor",{value})
  end)
end

g7.onClick=function()
  水珠动画(g7,300)
  --关于
  task(160,function()
    --延迟之后执行的事件
    activity.newActivity("about",{value})
  end)

end



function 检查更新(view,time)
  -- ****默认导入包****
  require "import"
  import "android.os.*"
  import "android.widget.*"
  import "android.view.*"
  import "android.widget.Toast"
  import "android.net.Uri"
  import "android.content.Intent"
  import "android.content.Context"
  import "java.io.File"--导入File类

  --检查更新
  import "android.content.Intent"
  import "android.net.Uri"
  import "android.provider.Settings"

  import "android.app.ProgressDialog"
  import "android.app.AlertDialog"
  import "android.app.DownloadManager"
  --导入包
  import "android.content.Context"
  import "android.net.Uri"
  local packinfo = this.getPackageManager().getPackageInfo(this.getPackageName(),((32552732/2/2-8183)/10000-6-231)/9)
  local appinfo = this.getPackageManager().getApplicationInfo(this.getPackageName(),0)
  local versionCode = tostring(packinfo.versionName)-- 版本号
  local versionName="建大助手"..versionCode.."版本"
  local check_update_url = "https://api.github.com/repos/CH4019/xinximenhu/releases/latest"

  if(activity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE).getActiveNetworkInfo() == nil) then
    AlertDialog.Builder(this)
    .setTitle("提示")
    .setMessage("你未连接至互联网 或 当前连接的网络不可用，请检查你的网络设置")
    .setNeutralButton("确定",nil)
    .setNegativeButton("打开 数据连接",{onClick=function()
        intent = Intent(Settings.ACTION_DATA_ROAMING_SETTINGS)
        this.startActivity(intent)
      end})
    .setPositiveButton("连接 Wi-Fi",{onClick=function()
        intent = Intent(Settings.ACTION_WIFI_SETTINGS)
        this.startActivity(intent)
      end})
    .show();
    return false
    -- 就此中断，不再继续执行下面代码
  end

  --圆形旋转样式
  check_update_dialog = ProgressDialog(this)
  check_update_dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER)
  check_update_dialog.setTitle("提示")
  --设置进度条的形式为圆形转动的进度条
  check_update_dialog.setMessage("正在检查更新中，请稍等片刻……\n\n小提示，如果检查更新长时间无反应，按手机「返回键」可以取消检查更新")
  check_update_dialog.setCancelable(true)--设置是否可以通过点击Back键取消
  check_update_dialog.setCanceledOnTouchOutside(false)--设置在点击Dialog外是否取消Dialog进度条
  check_update_dialog.setOnCancelListener{
    onCancel=function(l)
      print("您取消了「检查更新」操作")
      return false
    end}
  --取消对话框监听事件
  check_update_dialog.show()

  Http.get(check_update_url,nil,"UTF-8",nil,function(http_code,content,cookie,header)
    check_update_dialog.hide()

    if (http_code == -1) then
      AlertDialog.Builder(this)
      .setTitle("提示")
      .setMessage("检查更新时出现了些小问题。可能的原因有：\n1.API 服务器可能暂时出现故障，请稍后再试！\n2.请检查你的网络设置？")
      .setPositiveButton("确定",nil)
      .setNeutralButton("检查 Wi-Fi",{onClick=function()
          intent = Intent(Settings.ACTION_WIFI_SETTINGS)
          this.startActivity(intent)
        end})
      .setNegativeButton("检查 移动数据连接",{onClick=function()
          intent = Intent(Settings.ACTION_DATA_ROAMING_SETTINGS)
          this.startActivity(intent)
        end})
      .show()
     else

      if(http_code == 200) then
        new_versionCode = string.match(content,'"tag_name":"(.-)"')--版本号
        new_versionName = string.match(content,'"name":"(.-)"')--版本名
        apk_url = string.gsub(string.match(content,'"browser_download_url":"(.-)"'),'\\','')--下载地址
        update_log = string.gsub(string.match(content,'"body":"(.-)"'),'\\n',"\n")--更新日志
        update_date = string.match(content,'"updated_at":"(.-)"')--发布更新时间

        if (new_versionCode > versionCode) then
          AlertDialog.Builder(this)
          .setTitle("发现新版本")
          .setMessage("当前版本："..versionName.."("..versionCode..")\n最新版本："..new_versionName.."("..new_versionCode..")\n版本发布时间："..update_date.."\n\n更新日志：\n"..update_log)
          .setPositiveButton("立即更新",{onClick=function()
             -- os.execute("rm -r ".."/sdcard/Xinximenhu/apkdownload")
             -- File("Xinximenhu/apkdownload").mkdir()
              downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
              url=Uri.parse(apk_url);
              request=DownloadManager.Request(url);
              request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
              request.setDestinationInExternalPublicDir("/Download","建大助手"..new_versionCode..".apk");
              request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
              downloadManager.enqueue(request);
              Toast.makeText(activity,"请在通知栏查看下载情况",Toast.LENGTH_SHORT).show()
            end})
          .setNeutralButton("复制链接",{onClick=function()
              activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(apk_url)--将下载链接复制到剪切板
              print("新版 APP 下载链接，复制成功！请粘贴到浏览器下载。")
            end})
          .setNegativeButton("以后再说",nill)
          .show()
         else
          Toast.makeText(activity, "无可用更新，您使用的是最新版本！！！",Toast.LENGTH_SHORT).show()
        end
       else
        Toast.makeText(activity, "服务器繁忙，请稍后重试！",Toast.LENGTH_SHORT).show()
      end

    end

  end)

end