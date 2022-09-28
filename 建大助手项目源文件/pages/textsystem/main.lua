

-- ****默认导入包****
require "import"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
-- ****不需要请删除****
import "android.net.Uri"
import "android.content.Intent"

-- @param title 点击的菜单标题
-- @description 顶栏菜单项目点击回调事件
function onMenuItemClick(title)
  local event=functions[title]
  if(event~=nil)then
    event()
  end
end

functions={}

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


