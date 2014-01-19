<%inherit file="skeleton.mako" />
<ol start="${start}">
% for link in links:
  <li><a href="${link['href']}">${link['title']}</a></li>
% endfor
</ol>

|
% for page in pages:
  % if page['href'] == current_url:
    ${page['title']}
  % else:
    <a href="${page['href']}">${page['title']}</a>
  % endif
  |
% endfor