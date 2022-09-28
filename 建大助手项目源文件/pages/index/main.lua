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
import "androidx.cardview.widget.CardView"
import "android.widget.LinearLayout"
import "android.widget.TextView"
import "android.content.Intent"
import "android.app.Dialog"
import "android.view.Gravity"
import "androidx.appcompat.app.AlertDialog"
import "android.app.AlertDialog"
import "android.widget.Toast"
import "android.net.Uri"
-- @param data 侧滑栏列表的全部数据
-- @param recyclerView 侧滑栏列表控件
-- @param listIndex 点击的列表索引（点击的是第几个列表）
-- @param clickIndex 点击的项目索引（点击的第几个项目）
function onDrawerListItemClick(data, recyclerView, listIndex, itemIndex)
  --侧滑栏列表的数据是二维结构，所以需要先获取到点击项目所在列表的数据
  local listData = data.get(listIndex);
  --获取到所在列表的数据后获取点击项目的数据
  local itemData = listData.get(itemIndex);
  --最后获取到点击的项目的标题
  local title = itemData.getTitle();
  local event=functions[title]
  if(event~=nil)then
    event()
  end
end
functions={}

functions["设置"]=function()
  activity.newActivity("setting",{value})--载入启动页
end

functions["文件共享平台"]=function()
  newpage="shareweb"
  activity.newActivity(newpage,{value})--载入启动页
end

functions["实验系统"]=function()
  newpage="textsystem"
  text="请连接VPN或校园内网使用"
  EMUI对话框()

end
functions["教务系统备用入口"]=function()
  text="请连接VPN或校园内网使用"
  --列表对话框（列表项目名称自定义）
  items={"教务系统（管理系统入口）","教务系统备用网址1","教务系统备用网址2"}--创建有数据的列表，添加即在后面加上   ,"项目名称"
  AlertDialog.Builder(this)
  .setTitle("教务系统备用入口")--设置标题
  --给列表对话框设置点击事件
  .setItems(items,{onClick=function(l,v)
      --注：与创建有数据的列表项目名称必须一样
      if items[v+1]=="教务系统（管理系统入口）" then
        newpage="edusys"
        EMUI对话框()
       elseif items[v+1]=="教务系统备用网址1" then
        newpage="edusys1"
        EMUI对话框()
       elseif items[v+1]=="教务系统备用网址2" then
        newpage="edusys2"
        EMUI对话框()
      end
    end})
  .show()--显示弹窗

end

functions["一卡通官网"]=function()
  newpage="passcard"
  activity.newActivity(newpage,{value})--载入启动页
end

functions["刷新"]=function()
  刷新网页()
end

functions["分享"]=function()
  local uiManager=activity.getUiManager()
  --获取当前页面的WebView
  local webView=uiManager.getCurrentFragment().getWebView()
  local url=webView.getUrl()
  text=url
  intent=Intent(Intent.ACTION_SEND);
  intent.setType("text/plain");
  intent.putExtra(Intent.EXTRA_SUBJECT, "分享");
  intent.putExtra(Intent.EXTRA_TEXT, text);
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
  activity.startActivity(Intent.createChooser(intent,"分享到:"));
end

functions["跳转"]=function()
  local uiManager=activity.getUiManager()
  --获取当前页面的WebView
  local webView=uiManager.getCurrentFragment().getWebView()
  local url=webView.getUrl()
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
  activity.startActivity(viewIntent)
end


-- @param title 点击的菜单标题
-- @description 顶栏菜单项目点击回调事件
function onMenuItemClick(title)
  local event=functions[title]
  if(event~=nil)then
    event()
  end
end


--退出应用（俩次返回）
i=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if i+2 > tonumber(os.time()) then
      activity.finish()
     else
      Toast.makeText(activity,"再按一次返回键退出" , Toast.LENGTH_SHORT )
      .show()
      i=tonumber(os.time())
    end
    return true
  end
end



require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.content.*"
import "java.io.*"
import "java.util.*"
function EMUI对话框()
  EMUI={
    LinearLayout;
    layout_width="fill";
    orientation="vertical";
    layout_height="fill";
    {
      CardView;
      layout_width="85%w";
      radius="21dp";
      layout_gravity="center";
      layout_height="17%h";
      layout_margin='25dp';--卡片边距
      {
        LinearLayout;
        layout_width="fill";
        gravity="center";
        layout_height="fill";
        orientation="vertical";
        layout_gravity="center";

        {
          TextView;
          textSize="16sp";
          text=""..text;
          layout_gravity="center";
          layout_marginTop="30dp";
          textColor="0xff000000";
        };
        {
          LinearLayout;
          layout_width="fill";
          gravity="center";
          layout_height="fill";
          {
            TextView;
            textSize="16sp";
            text="取消";
            id="取消"; style="?android:attr/buttonBarButtonStyle";
            layout_gravity="center";
            textColor="0xFF1BABEA";
            onClick=function()
              task(100,function()
                关闭EMUI对话框()

              end)
            end
          };
          {
            LinearLayout;
            layout_width="1dp";
            backgroundColor="0xFFDFDFDF";
            layout_marginLeft="12%w";
            layout_height="26dp";
          };
          {
            TextView;
            textSize="16sp";
            text="确认";
            id="确认";
            style="?android:attr/buttonBarButtonStyle";
            layout_marginLeft="12%w";
            textColor="0xFFE73333";
            onClick=function()
              task(100,function()
                关闭EMUI对话框()
                activity.newActivity(newpage,{value})--载入启动页
              end)
            end
          };
        };
      };
    };
  };


  import "android.graphics.*"
  对话框=Dialog(activity)--,R.Theme_AppLua_Dialog)--,R.style.BottomDialog)
  --设置弹窗布局
  对话框.setContentView(loadlayout(EMUI))
  对话框.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
  --设置弹窗位置
  对话框.getWindow().setGravity(Gravity.BOTTOM)--默认底部 CENTER中 TOP顶
  --设置触摸弹窗外部隐藏弹窗
  对话框.setCanceledOnTouchOutside(true);
  对话框.show()
  function 关闭EMUI对话框()
    对话框.hide()
  end
end
