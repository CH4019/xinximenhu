
-- ****默认导入包****
require "import"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "androidx.recyclerview.widget.RecyclerView$Orientation"
import "androidx.viewpager2.widget.ViewPager2$Orientation"
import "android.graphics.drawable.GradientDrawable$Orientation"
import "androidx.cardview.widget.CardView"
import "android.view.Gravity"
import "android.widget.RelativeLayout"
import "java.io.File"
import "android.widget.TextView"
import "android.widget.LinearLayout"
import "android.graphics.Color"
import "android.widget.Toast"
--取状态栏高度
H=this.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height)
local window=this.getWindow()
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
window.setStatusBarColor(Color.TRANSPARENT)

name=this.getPackageManager().getApplicationLabel(this.getPackageManager().getApplicationInfo(this.getPackageName(),0))
ver=tostring(this.getPackageManager().getPackageInfo(this.getPackageName(),((782268899/2/2-8183)/10000-6-231)/9).versionName)


SorrowClover=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  --第四页
  {
    RelativeLayout,--相对布局
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    background='#A593E0';--布局背景颜色(或图片路径)
    Gravity="center",--设置居中
    {
      LinearLayout,--线性布局
      orientation="vertical",--垂直方向
      -- orientation="horizontal",--水平方向
      layout_width="fill",--布局宽度
      layout_height="fill",--布局高度
      gravity="top|center",--重力居顶｜置中
      {
        TextView;--文本控件
        paddingTop="20%h",--布局内顶距
        --paddingLeft="20%w",--布局内左距
        -- paddingTop="15%h",--布局内顶距
        --Gravity='center';--对齐方式
        textColor='#ffffff';--文本颜色
        text='欢迎使用本软件';--显示的文本
        textSize='30sp';--文本大小
        gravity="center",--重力居中
      },
      {
        TextView,--文本框控件
        text="首次使用，请阅读以下内容：",--文本内容
        textSize="15sp",--文本大小
        gravity="center",--重力居中
        textColor="#ffffff",--文本颜色
        layout_marginTop="40dp",--布局顶距
        --paddingLeft="20%w",--布局内左距
        --paddingTop="30%h",--布局内顶距
      },
      {
        TextView,--文本框控件
        text="《隐私政策与用户协议》",--文本内容
        textStyle="bold",
        layout_marginTop="30dp",--布局顶距
        -- layout_marginTop="35%h",--布局顶距
        gravity="center",--重力居中
        layout_gravity="top|center",--重力居顶｜置中
        textSize="16sp",--文本大小
        textColor="#FF00FF00",--文本颜色
        --singleLine=true,--禁止换行输入
        onClick=function()--单击事件
          activity.newActivity("Login",{value})--载入启动页
          end
      },
      {
        LinearLayout,--线性布局
        orientation="horizontal",--水平方向
        gravity="top|center",--重力居顶｜置中
        layout_width="fill",--布局宽度
        layout_height="45%h",--布局高度
        {
          CardView,--卡片框控件
          layout_marginTop="15%h",--布局顶距
          -- layout_marginLeft="20%w",--布局左距
          layout_height="40dp",--布局高度
          layout_width="20%w",--布局宽度
          cardElevation="2dp",--卡片提升
          cardBackgroundColor="#ffffff",--卡片背景色
          radius="10dp",--圆角半径
          {
            TextView,--文本框控件
            text="拒绝",--文本内容
            paddingLeft="12dp",--布局内左距
            paddingTop="7dp",--布局内顶距
            textSize="20sp",--文本大小
            textColor="#FFFF0000",--文本颜色
            onClick=function()--单击事件
                  activity.finishAffinity()
            end
          },
        },--卡片框控件 结束
        {
          CardView,--卡片框控件
          layout_marginLeft="20%w",--布局左距
          layout_marginTop="15%h",--布局顶距
          --  layout_marginLeft="60%w",--布局左距
          layout_height="40dp",--布局高度
          layout_width="20%w",--布局宽度
          cardElevation="2dp",--卡片提升
          cardBackgroundColor="#ffffff",--卡片背景色
          radius="10dp",--圆角半径
          {
            TextView,--文本框控件
            text="同意",--文本内容
            paddingLeft="12dp",--布局内左距
            paddingTop="7dp",--布局内顶距
            textSize="20sp",--文本大小
            textColor="#FF00FF00",--文本颜色
          },
          onClick=function()--单击事件
            import "android.content.*"
          File("/storage/emulated/0/Android/data/"..this.packageName.."/start").mkdir()--不存在 则创建
      
            --使用File类
            import "java.io.File"--导入File类
            --使用io库
          --  os.remove("/sdcard/Xinximenhu")
            io.open("/storage/emulated/0/Android/data/"..this.packageName.."/start/2.4.2@index.txt", 'w')
            io.open("/storage/emulated/0/Android/data/"..this.packageName.."/start/ver.txt",'w')
            io.open("/storage/emulated/0/Android/data/"..this.packageName.."/start/index.txt",'w')
            local file=io.output("/storage/emulated/0/Android/data/"..this.packageName.."/start/2.4.2@index.txt")
            io.write("用户已同意隐私协议\n\n软件注册成功！\n\n 此用户已请认真阅读本《隐私政策与用户协议》（以下简称“协议”），充分理解本协议中各条款。并同意接受本协议各项条款的约束；\n\n一、用户个人隐私保护\n\n1、本软件无需注册或登录即可使用，所有数据存储在用户本地设备，不会上传数据至云端；\n2、用户使用本软件浏览网页下载内容时，请自行甄别优劣，保护个人隐私。\n\n二、免责声明\n\n1、因用户在浏览网页下载内容时的个人疏忽，造成其损失的，应由用户自行承担；\n2、软件本身并无内置广告，网页中存在的广告和开发者无任何关系。\n\n三、版权声明\n\n1、本软件引用的代码版权归原作者所有，绝大部分引用公开平台上已公开代码，在此特别致谢公开代码原作者，如公开代码未经原作者授权公开而导致侵犯原代码作者的权利，请联系开发者；\n2、用户禁止逆向、破解、贩卖等，违者必追究法律责任。\n\n四、使用规则\n\n用户使用本软件时应遵守法律法规、社会公德，不得违反互联网法律法规。\n\n五、政策修改\n\nCH4019保留对本政策作出修改的权利。\n本《协议》版权由CH4019所有，CH4019保留一切对本《协议》解释的权利。")
            io.flush()
            io.close()
            io.open("/storage/emulated/0/Android/data/"..this.packageName.."/start/ver.txt","w+"):write(ver):close()
           弹出消息("已同意隐私协议",0xff4385f5,0xffffffff,"15dp","25dp","13dp",Toast.LENGTH_SHORT,Gravity.BOTTOM,0,325)   
            activity.newActivity("start",{value})--载入启动页
            activity.finish()
          end,--单击事件 结束
        },--卡片框控件 结束

      },--线性布局结束
      --[[{
        CardView,--卡片框控件
        layout_width="wrap_content",--布局宽度
        layout_height="wrap_content",--布局高度
        cardElevation="2dp",--卡片提升
        layout_margin="10dp",--布局边距
        cardBackgroundColor="#FF8574FF",--卡片背景色
        radius="10dp",--圆角半径
        layout_marginBottom="10dp",--布局底距
        onClick=function()--单击事件
          加QQ群(752205370)
        end,--单击事件结束
        {
          TextView,--文本框控件
          text="暂不能完全兼容安卓10以上，安卓10以上请加入内测群查看解决方案",--文本内容
          textSize="18sp",--文本大小
          textColor="#222222",--文本颜色
          singleLine=true,--禁止文本换行
          ellipsize="marquee",--显示方式：前面显示 start｜中间显示 middle｜尾部显示 end｜跑马灯 marquee
          selected=true,--选中文本
        },
      },--卡片框控件结束
    ]]
    },--线性布局结束
  };
};

activity.setContentView(loadlayout(SorrowClover))--显示布局--程序启动时会执行的事件

