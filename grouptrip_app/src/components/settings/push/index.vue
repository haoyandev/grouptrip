<template>
  <div>
    <div class="c1">
      <mt-header id="header" title="推送设置">
        <router-link to="/settings" slot="left">
          <mt-button icon="back"></mt-button>
        </router-link>
      </mt-header>
    </div>
    <mt-cell title="推送开关"><mt-switch ></mt-switch></mt-cell>
    <h4 style="padding:0 10px">互动提醒</h4>
    <mt-cell  title="私信"><mt-switch ></mt-switch></mt-cell>
    <mt-cell  title="新私信"><mt-switch ></mt-switch></mt-cell>
    <mt-cell  title="新粉丝"><mt-switch ></mt-switch></mt-cell>
    <mt-cell  title="恢复和回答"><mt-switch ></mt-switch></mt-cell>
    <mt-cell  title="赞和收藏"><mt-switch ></mt-switch></mt-cell>
  </div>
</template>
