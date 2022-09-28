require "import"
import "android.graphics.Color"
import "android.view.WindowManager"
import "android.widget.TextView"
import "android.view.View"
import "android.widget.LinearLayout"
import "android.widget.ScrollView"
local window=this.getWindow()
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff000000);

--取状态栏高度
状态栏高度=this.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height)

标题栏布局={
  LinearLayout,--线性布局
  orientation="horizontal",--布局方向
  layout_width="fill",--布局宽度
  layout_height="40dp",--布局高度
  layout_marginTop=状态栏高度,--布局顶距
  gravity="left|center",--重力居左｜置中
  background="#000000",--布局背景
  {
    TextView,--文本框控件
    layout_marginLeft="4%w",--布局左距
    layout_weight="1",--权重分配
    text="隐私政策与用户协议",--文本内容
    textSize="18sp",--文本大小
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
    background="#00000000",--布局背景
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
      background="#f0f0f4",--布局背景
      --开始
      {
        TextView,--文本框控件
        layout_marginLeft="3%w",--布局左距
        layout_marginright="4%w",
        layout_marginTop="30dp",--布局顶距
        text="特别提醒您（用户）在使用本软件之前，请认真阅读本《隐私政策与用户协议》（以下简称“协议”），确保您充分理解本协议中各条款。请您审慎阅读并选择接受或不接受本协议。您启动并使用本软件的行为，将视为对本协议的接受，并同意接受本协议各项条款的约束；\n\n一、用户个人隐私保护\n\n1、本软件无需注册或登录即可使用，所有数据存储在用户本地设备，不会上传数据至云端，请您放心使用；\n2、用户使用本软件浏览网页下载内容时，请自行甄别优劣，保护个人隐私。\n\n二、免责声明\n\n1、因用户在浏览网页下载内容时的个人疏忽，造成其损失的，应由用户自行承担；\n2、软件本身并无内置广告，网页中存在的广告和开发者无任何关系，请勿轻信广告内容。\n\n三、版权声明\n\n1、本软件引用的代码版权归原作者所有，绝大部分引用公开平台上已公开代码，在此特别致谢公开代码原作者，如公开代码未经原作者授权公开而导致侵犯原代码作者的权利，请联系开发者；\n2、本软件免费使用，禁止逆向、破解、贩卖等，违者必追究法律责任。\n\n四、使用规则\n\n用户使用本软件时应遵守法律法规、社会公德，不得违反互联网法律法规。\n\n五、政策修改\n\nCH4019保留对本政策作出修改的权利。\n本《协议》版权由CH4019所有，CH4019保留一切对本《协议》解释的权利。\n",
        gravity="left",--重力居顶｜置中
        textSize="20sp",--文本大小
        textColor="#000000",--文本颜色
      },
    },--线性布局结束
  },--纵向滑动控件结束

}--线性布局结束
activity.setContentView(loadlayout(layout))--全屏框架
