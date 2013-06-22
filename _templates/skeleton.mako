## -*- coding: utf-8 -*-
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html dir="ltr" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
  <title>${title} - ${website_title}</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="description" content="${title} ${website_title}" />
  % if tags is UNDEFINED:
    <meta name="keywords" content="${default_tags}, ${title}" />
  % else:
    <meta name="keywords" content="${default_tags}, ${tags}" />
  %endif
  <meta name="verify-reformal" content="47570c0e20eec98528284fe7" />
  <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
  <script type="text/javascript" src="http://yandex.st/jquery/1.7.2/jquery.min.js"></script>
  <script type="text/javascript" src="scripts.js"></script>

</head>
<body>

  <div id="container">
    <div id="wrapper">

      <div id="buttons">
        <a rel="nofollow" href="/">article</a>
        <a rel="nofollow" href="/">edit</a>
        <a rel="nofollow" href="/">comment</a>
      </div>

      <div id="content" class="bordered">
        <h1>${title}</h1>

        ${next.body()}


      </div>

      <div id="cloud" class="bordered">

        <div class="yashare-auto-init" 
          data-yashareL10n="ru"
          data-yashareType="none"
          data-yashareLink="${current_url}"
          data-yashareTitle="title"
          data-yashareQuickServices="gplus,twitter,facebook,vkontakte"></div>        

      </div>


    </div>
  
    <div id="navigation">
      <div id="logo"><img src="logo.png" alt="${default_tags}"></div>
      <h3 id="title">${website_title}</h3>

      <div class="otstup">navigation</div>
      
      <div id="menu" class="bordered">

        <%include file="menu.mako"/>
 
      </div>
  
      <div class="otstup">search</div>
        <div id="search" class="bordered box">

<div class="yandexform" onclick="return {'bg': '#ffffff', 'language': 'ru', 'encoding': '', 'suggest': false, 'tld': 'ru', 'site_suggest': false, 'webopt': false, 'fontsize': 13, 'arrow': false, 'fg': '#000000', 'logo': 'rb', 'websearch': false, 'type': 3}"><form action="${base_url}Y_Search.html" method="get"><input type="hidden" name="searchid" value="${yandex_search_id}"/><input name="text"/><input type="submit" value="Найти"/></form></div><script type="text/javascript" src="http://site.yandex.net/load/form/1/form.js" charset="utf-8"></script>

        </div>

    </div>

  <div id="footer">
    <a href="http://dmi3.net">&copy;</a> <a href=''>Димоныч-"Wiki" ${version}</a></p>
  </div>
</div>

  <%include file="counters.mako"/>

        <script>        
        $.getScript("http://yandex.st/share/share.js");
      </script>

</body>

</html>

