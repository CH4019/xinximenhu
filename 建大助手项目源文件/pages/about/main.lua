
-- ****默认导入包****
require "import"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
-- ****不需要请删除****
import "java.io.File"--导入File类
import "android.widget.TextView"
import "android.media.audiofx.BassBoost$Settings"
import "android.media.audiofx.EnvironmentalReverb$Settings"
import "android.media.audiofx.Equalizer$Settings"
import "android.media.audiofx.PresetReverb$Settings"
import "android.media.audiofx.Virtualizer$Settings"
import "android.provider.Contacts$Settings"
import "android.provider.ContactsContract$Settings"
import "android.provider.Settings"
import "android.app.DownloadManager"
import "android.animation.ObjectAnimator"
import "android.net.Uri"
import "android.widget.LinearLayout"
import "android.widget.Toast"
import "android.app.ProgressDialog"
import "com.androlua.Http"
import "android.content.Intent"
import "androidx.cardview.widget.CardView"
import "android.widget.ImageView"
import "androidx.appcompat.app.AlertDialog"
import "android.app.AlertDialog"
import "android.widget.ScrollView"
import "android.content.Context"
import "java.io.File"
import "android.view.View"
import "android.view.WindowManager"
--程序启动时会执行的事件
import "android.graphics.Color"
local window=this.getWindow()
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
window.setStatusBarColor(0xfF383838)
--取状态栏高度
状态栏高度=this.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height)
ver=tostring(this.getPackageManager().getPackageInfo(this.getPackageName(),((782268899/2/2-8183)/10000-6-231)/9).versionName)

--ver=io.open("/storage/emulated/0/Android/data/"..this.packageName.."/start/ver.txt"):read("*a")
--程序启动时会执行的事件
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
    elevation="5dp",--阴影层次
    {
      LinearLayout,--线性布局
      layout_marginTop="0%h",--布局顶距
      orientation="horizontal",--布局方向
      layout_width="fill",--布局宽度
      layout_height="40dp",--布局高度
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
        text="  关于",--文本内容
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
    background="#fF303030",--布局背景
    overScrollMode=View.OVER_SCROLL_NEVER,--隐藏圆弧阴影
    verticalScrollBarEnabled=false,--隐藏纵向滑条
    {
      LinearLayout,--线性布局
      orientation="vertical",--布局方向
      layout_width="fill",--布局宽度
      layout_height="fill",--布局高度
      --开始
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="200dp",--布局高度
        layout_margin="10dp",--布局边距
        cardElevation="2dp",--卡片提升
        cardBackgroundColor="#fF383838",--卡片背景色
        radius="10dp",--圆角半径
        {
          TextView,--文本框控件
          text="建大助手",--文本内容
          textSize="30sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_margin="80dp",--布局边距
        },
        id="gg"
      },--卡片框控件 结束
      {
        CardView,--卡片框控件
        layout_width="fill",--布局宽度
        layout_height="490dp",--布局高度
        layout_margin="10dp",--布局边距
        cardElevation="6dp",--卡片提升
        cardBackgroundColor="#ff383838",--卡片背景色
        radius="10dp",--圆角半径
        elevation="4dp",--阴影层次
        {
          TextView,--文本框控件
          text="作者:   CH4019",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_marginTop="70dp",--布局顶距
          layout_marginLeft="25%w",--布局左距
          id="cc"
        },
        {
          TextView,--文本框控件
          text="版本状态:   "..ver,--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_marginTop="140dp",--布局顶距
          layout_marginLeft="25%w",--布局左距
          id="aa"
        },
        {
          TextView,--文本框控件
          text="更新日志",--文本内容
          textSize="20sp",--文本大小
          textColor="#FFFFFFFF",--文本颜色
          layout_marginTop="200dp",--布局顶距
          layout_marginLeft="25%w",--布局左距
          id="rz",
        },
        {
          TextView,--文本框控件
          text="加入内测",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_marginTop="250dp",--布局顶距
          layout_marginLeft="25%w",--布局左距
          id="nc",
        },
        {
          TextView,--文本框控件
          text="官网地址：ch4019studio.mysxl.cn",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_marginTop="300dp",--布局顶距
          layout_marginLeft="24%w",--布局左距
          id="gwdz",
        },
        {
          TextView,--文本框控件
          text="隐私协议",--文本内容
          textSize="20sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_marginTop="350dp",--布局顶距
          layout_marginLeft="25%w",--布局左距
          onClick=function()--单击事件
            activity.newActivity("Login",{value})--载入启动页
          end
        },
        {
          TextView,--文本框控件
          text="此软件为对学校相关常用网页的打包,\n此软件依托学校网页,如有缺陷请多包容",--文本内容
          textSize="10sp",--文本大小
          textColor="#ffffff",--文本颜色
          layout_marginTop="418dp",--布局顶距
          layout_marginLeft="25%w",--布局左距
        },
      },--卡片框控件 结束


    },--线性布局 结束
  },--纵向滑动控件 结束

}--线性布局 结束
activity.setContentView(loadlayout(layout))--全屏框架



--调用方法
gg.onClick=function()
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(gg,"scaleX",{1.2,.8,1.1,.9,1}).setDuration(300).start()
  ObjectAnimator().ofFloat(gg,"scaleY",{1.2,.8,1.1,.9,1}).setDuration(300).start()
end

require "import"
import "android.widget.*"
import "android.view.*"
aa.onTouch=function()
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




--调用方法
cc.onTouch=function()
  import "android.content.Intent"
  import "android.net.Uri"
  this.startActivity(Intent(Intent.ACTION_VIEW,Uri.parse("mqqapi://card/show_pslcard?uin=3283902773")))
end

--调用方法
nc.onTouch=function()
  import "android.content.Intent"
  import "android.net.Uri"
  activity.startActivity(Intent(Intent.ACTION_VIEW,Uri.parse("mqqapi://card/show_pslcard?src_type=internal&version=1&uin=752205370&card_type=group&source=qrcode")))
end


gwdz.onTouch=function()
  activity.newActivity("offweb",{value})
end


rz.onTouch=function()
  activity.newActivity("updatelog",{value})
end
