# Build a Space X clone

第一部分：本地构建一个新的专案
```
rails new RocketzCorp
cd RocketzCorp
git init
git add .
git commit -m "first commit"
```
---

第二部分：本地查看新的专案
```
atom .
rails server
http://localhost:3000/
```
---

第三部分：云端构建一个新的专案
```
git remote add origin https://github.com/shenzhoudance/RocketzCorp.git
git push -u origin master
```
---

第四部分：构建一个新的分支
```
git checkout -b xw-0827
rails g scaffold Mission title:string subtitle:string boxtitle:string boxinfo:text
rake db:migrate
rake routes
http://localhost:3000/missions
```

第五部分：修改 root 路由器
config/routes.rb
```
Rails.application.routes.draw do
  root "missions#index"
  resources :missions
end
```
http://localhost:3000/

第六部分：添加 Gemfile 路由器
```
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'

gem 'paperclip', '~> 6.0'
gem 'paperclip-av-transcoder'
gem 'aws-sdk-s3', '~> 1.9'
```

app/assets/stylesheets/application.scss
```
@import "bootstrap";
```

app/assets/javascripts/application.js
```
//= require jquery3
//= require popper
//= require bootstrap-sprockets
```
```
bundle install
rails g paperclip missions banner picone pictwo video audio
rake db:migrate
```

app/controllers/missions_controller.rb
```
def mission_params
  params.require(:mission).permit(:title, :subtitle, :boxtitle, :boxinfo
                                  :banner, :picone, :pictwo, :video, :audio)
end
```

app/models/mission.rb
```
class Mission < ApplicationRecord
# picone validation
has_attached_file :picone, styles: {large: "1500x500>", medium: "500x400>", thumb: "200x150#"}
validates_attachment_content_type :picone, content_type: /\Aimage\/.*\z/
end
```

第七部分：修改 view mission 样式
app/views/missions/-form.html.erb
```
<%= form_with(model: mission, local: true, html: {multipart: true}) do |form| %>
  <% if mission.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(mission.errors.count, "error") %> prohibited this mission from being saved:</h2>

      <ul>
      <% mission.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= form.label :title %>
    <%= form.text_field :title, id: :mission_title %>
  </div>

  <div class="field">
    <%= form.label :subtitle %>
    <%= form.text_field :subtitle, id: :mission_subtitle %>
  </div>

  <div class="field">
    <%= form.label :boxtitle %>
    <%= form.text_field :boxtitle, id: :mission_boxtitle %>
  </div>

  <div class="field">
    <%= form.label :picone %>
    <%= form.text_field :picone %>
  </div>


  <div class="field">
    <%= form.label :boxinfo %>
    <%= form.text_area :boxinfo, id: :mission_boxinfo %>
  </div>

  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>

```

app/views/missions/index.html.erb
```
<p id="notice"><%= notice %></p>

<h1>Missions</h1>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Subtitle</th>
      <th>Boxtitle</th>
      <th></th>
      <th>Boxinfo</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @missions.each do |mission| %>
      <tr>
        <td><%= mission.title %></td>
        <td>
          <% if mission.picone.present? %>
          <% image_tag mission.picone.url(:thumb) %>
          <% else %>
          No Image
          <% end %>
        </td>
        <td><%= mission.subtitle %></td>
        <td><%= mission.boxtitle %></td>
        <td><%= mission.boxinfo %></td>
        <td><%= link_to 'Show', mission %></td>
        <td><%= link_to 'Edit', edit_mission_path(mission) %></td>
        <td><%= link_to 'Destroy', mission, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Mission', new_mission_path %>
```
app/views/missions/show.html.erb
```
<p id="notice"><%= notice %></p>

<p>
  <strong>Title:</strong>
  <%= @mission.title %>
</p>

<p>
  <strong>Subtitle:</strong>
  <%= @mission.subtitle %>
</p>

<p>
  <strong>Boxtitle:</strong>
  <% if @mission.picone.present? %>
  <%= image_tag（@mission.picone.(:medium)) %>
  <% else %>
  No Image
  <% end %>
</p>

<p>
  <strong>Boxinfo:</strong>
  <%= @mission.boxinfo %>
</p>

<%= link_to 'Edit', edit_mission_path(@mission) %> |
<%= link_to 'Back', missions_path %>
```

#在第一单元的训练当中，我们主要完成了两个核心功能的制作：
>1、基本博客的功能体系
2、图片每户的功能体系

以上的两个功能是最基础的功能体系，后续的所有的功能体系，都是在这个功能体系的维度上不断的叠加的结果。
