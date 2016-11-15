???prompt PL/SQL Developer import file
prompt Created on 2016年11月11日 星期五 by Administrator
set feedback off
set define off
prompt Creating CINEMA...
create table CINEMA
(
  cinema_id       VARCHAR2(6) not null,
  cinema_name     VARCHAR2(50),
  cinema_location VARCHAR2(100),
  cinema_tel      VARCHAR2(50),
  img_src         VARCHAR2(99)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CINEMA
  add primary key (CINEMA_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CUSTOMER...
create table CUSTOMER
(
  customer_id VARCHAR2(6) not null,
  phone       VARCHAR2(36),
  pwd         VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER
  add primary key (CUSTOMER_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating FILMSTORYSORT...
create table FILMSTORYSORT
(
  s_id  VARCHAR2(6) not null,
  sorts VARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FILMSTORYSORT
  add primary key (S_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating FILM...
create table FILM
(
  film_id      VARCHAR2(20) not null,
  film_name    VARCHAR2(30),
  total_time   VARCHAR2(15),
  s_id         VARCHAR2(6),
  filmsort     VARCHAR2(16),
  release_time DATE,
  director     VARCHAR2(26),
  scriptwriter VARCHAR2(60),
  actor        VARCHAR2(60),
  country      VARCHAR2(20),
  filmcompany  VARCHAR2(60),
  story        VARCHAR2(600),
  img_src      VARCHAR2(99),
  film_score   NUMBER(3,1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FILM
  add primary key (FILM_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FILM
  add foreign key (S_ID)
  references FILMSTORYSORT (S_ID);

prompt Creating FILMCOMMENT...
create table FILMCOMMENT
(
  c_id           VARCHAR2(6) not null,
  film_id        VARCHAR2(6),
  customer_id    VARCHAR2(6),
  customer_score NUMBER(3,1),
  c_details      VARCHAR2(300),
  c_date         DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table FILMCOMMENT
  add primary key (C_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table FILMCOMMENT
  add foreign key (FILM_ID)
  references FILM (FILM_ID);
alter table FILMCOMMENT
  add foreign key (CUSTOMER_ID)
  references CUSTOMER (CUSTOMER_ID);

prompt Creating FILMHALL...
create table FILMHALL
(
  filmhall_id   VARCHAR2(6) not null,
  filmhall_name VARCHAR2(20),
  cinema_id     VARCHAR2(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FILMHALL
  add primary key (FILMHALL_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FILMHALL
  add foreign key (CINEMA_ID)
  references CINEMA (CINEMA_ID);

prompt Creating JOB...
create table JOB
(
  job_id   VARCHAR2(6) not null,
  job_name VARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table JOB
  add primary key (JOB_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating REAL_SEAT...
create table REAL_SEAT
(
  rl_id       VARCHAR2(20) not null,
  filmhall_id VARCHAR2(6),
  row_        VARCHAR2(20),
  col_        VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REAL_SEAT
  add primary key (RL_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REAL_SEAT
  add foreign key (FILMHALL_ID)
  references FILMHALL (FILMHALL_ID);

prompt Creating SCHEDULE...
create table SCHEDULE
(
  schedule_id   VARCHAR2(10) not null,
  film_id       VARCHAR2(6),
  schedule_time DATE,
  cinema_id     VARCHAR2(6),
  ticket_price  NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SCHEDULE.cinema_id
  is ' ';
alter table SCHEDULE
  add primary key (SCHEDULE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCHEDULE
  add foreign key (FILM_ID)
  references FILM (FILM_ID);
alter table SCHEDULE
  add foreign key (CINEMA_ID)
  references CINEMA (CINEMA_ID);

prompt Creating SEAT_STATE...
create table SEAT_STATE
(
  seat_id     VARCHAR2(20) not null,
  schedule_id VARCHAR2(10),
  rl_id       VARCHAR2(20),
  seat_state  VARCHAR2(2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table SEAT_STATE
  add primary key (SEAT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table SEAT_STATE
  add foreign key (SCHEDULE_ID)
  references SCHEDULE (SCHEDULE_ID);
alter table SEAT_STATE
  add foreign key (RL_ID)
  references REAL_SEAT (RL_ID);

prompt Creating STAFF...
create table STAFF
(
  staff_id VARCHAR2(6) not null,
  username VARCHAR2(30),
  pwd      VARCHAR2(50),
  phone    VARCHAR2(36),
  job_id   VARCHAR2(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STAFF
  add primary key (STAFF_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STAFF
  add foreign key (JOB_ID)
  references JOB (JOB_ID);

prompt Creating TICKETORDER...
create table TICKETORDER
(
  ticketorder_id VARCHAR2(10) not null,
  customer_id    VARCHAR2(6),
  order_date     DATE,
  order_pwd      VARCHAR2(16),
  order_state    VARCHAR2(2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table TICKETORDER
  add primary key (TICKETORDER_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table TICKETORDER
  add foreign key (CUSTOMER_ID)
  references CUSTOMER (CUSTOMER_ID);

prompt Creating TICKETDETAIL...
create table TICKETDETAIL
(
  ticket_id      VARCHAR2(10) not null,
  seat_id        VARCHAR2(10),
  ticketorder_id VARCHAR2(10),
  ticket_price   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table TICKETDETAIL
  add primary key (TICKET_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table TICKETDETAIL
  add foreign key (TICKETORDER_ID)
  references TICKETORDER (TICKETORDER_ID);
alter table TICKETDETAIL
  add foreign key (SEAT_ID)
  references SEAT_STATE (SEAT_ID);

prompt Loading CINEMA...
insert into CINEMA (cinema_id, cinema_name, cinema_location, cinema_tel, img_src)
values ('5', 'CGV星聚汇影城（长沙岳麓店)', '长沙市岳麓区岳麓大道57号奥克斯广场娱乐楼5楼', '0731-89728628', 'cinema/xingju.jpg');
insert into CINEMA (cinema_id, cinema_name, cinema_location, cinema_tel, img_src)
values ('6', '长沙沃美影城', '长沙市开福区金泰路199号世纪金源购物中心一层', '0731-85867878', 'cinema/womei.jpg');
insert into CINEMA (cinema_id, cinema_name, cinema_location, cinema_tel, img_src)
values ('7', '长沙万达影城开福店', '长沙市开福区万达广场5楼', '0731-88599588', 'cinema/wanda.jpg');
insert into CINEMA (cinema_id, cinema_name, cinema_location, cinema_tel, img_src)
values ('8', '横店电影城（长沙王府井店）', '长沙市黄兴中路王府井百货10楼', '0731-82249400 ', 'cinema/wangfujin.jpg');
insert into CINEMA (cinema_id, cinema_name, cinema_location, cinema_tel, img_src)
values ('9', '潇湘国际影城长沙天马店', '麓山南路299号渔湾码头时尚广场4楼', '0731-82857555', 'cinema/xiaoxiang.jpg');
commit;
prompt 5 records loaded
prompt Loading CUSTOMER...
insert into CUSTOMER (customer_id, phone, pwd)
values ('2', '15576074148', '123');
commit;
prompt 1 records loaded
prompt Loading FILMSTORYSORT...
insert into FILMSTORYSORT (s_id, sorts)
values ('3', '动作');
insert into FILMSTORYSORT (s_id, sorts)
values ('5', '喜剧');
insert into FILMSTORYSORT (s_id, sorts)
values ('7', '冒险');
insert into FILMSTORYSORT (s_id, sorts)
values ('9', '悬疑');
insert into FILMSTORYSORT (s_id, sorts)
values ('11', '惊悚');
commit;
prompt 5 records loaded
prompt Loading FILM...
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('1', '奇异博士 (2016)', '115', '3', '3DIMAX', to_date('01-11-2016', 'dd-mm-yyyy'), '斯科特·德瑞克森', '史蒂夫·迪特寇 乔·斯派茨', '本尼迪克特·康伯巴奇,瑞秋·麦克亚当斯', '美国', '华特·迪士尼电影工作室', '“奇异博士”斯特兰奇是漫威第三阶段的重要角色，曾经是一位外科医生的他在车祸之后失去了赖以为生的本领，为了治疗双手，斯特兰奇踏上前往异国他乡的旅程，旅途中的奇遇让他成为了拥有超凡魔力的至尊法师，并运用自己的本领对抗黑暗力', 'film/qiyiboshi.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('2', '邻家大贱谍(2016)', '101', '5', '2D', to_date('03-11-2016', 'dd-mm-yyyy'), ' 格雷格·莫托拉', ' Michael LeSieur', '扎克·加利费安纳基斯,艾拉·菲舍尔', ' 美国', ' 二十世纪福斯电影公司', '一对住在城郊的夫妇(扎克·加利费安纳基斯、 艾拉·菲舍尔)发现要跟上琼斯一家(乔·哈姆、盖尔·加朵)可不容易。他们的这家新邻居可谓是过得光彩夺目，精致无比。而当他们发现琼斯夫妇其实是秘密特工后事情就变得更加复杂了。', 'film/linjiadajiandie.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('3', '湄公河行动(2016)', '124', '3', '2D', to_date('30-09-2016', 'dd-mm-yyyy'), ' 林超贤', ' 林超贤, 朱镜祺', '张涵予,彭于晏', '中国 ', '天津博纳文化传媒有限公司', '2011年10月5日，两艘中国商船在湄公河金三角水域遭遇袭击，13名中国船员全部遇难，泰国警方从船上搜出90万颗冰毒。消息传回国内，举国震惊。为了查明真相，云南缉毒总队长高刚（张涵予饰）接受了特殊任务，率领一支骁勇善战的战斗小组..', 'film/meigonghe.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('4', '航海王之黄金城(2016)', '120', '3', '2D', to_date('11-11-2016', 'dd-mm-yyyy'), '宮元宏彰', ' 黑岩勉, 尾田荣一郎', '田中真弓,山口胜平', '日本', ' 东映株式会社 ', '故事讲述路飞一行人航海来到世界最大的娱乐城市，这里堪称就连世界政府也无法干预的“绝对圣域”，而其支配者——拥有无上支配力的“黄金帝”吉尔德·泰佐洛将动用其金之力，使世界的格局发生改变……', 'film/hanghaiwang.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('5', '机械师2：复活(2016)', '97', '3', '3D', to_date('21-10-2016', 'dd-mm-yyyy'), '丹尼斯·甘塞尔', ' Philip Shelby, Tony Mosher', '杰森·斯坦森,杰西卡·阿尔芭', '法国', '顶峰娱乐 ', '故事时间则设定为前作的五年之后，亚瑟已然选择金盆洗手，与挚爱吉娜（杰西卡·阿尔芭 饰）隐姓埋名地共度美好人生。然而像亚瑟这种高手想要全身而退谈何容易，反派最终绑架了吉娜来要挟亚瑟，让他去杀三个人。所谓敌人的敌人就是朋友..', 'film/jixieshi2.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('6', '勇士之门(2016)', '108', '7', '3D', to_date('18-11-2016', 'dd-mm-yyyy'), '马蒂亚斯·霍恩', '吕克·贝松, 罗伯特·马克·卡门', '倪妮,赵又廷', '中国', '上海基美影业股份有限公司', '废柴男孩机缘巧合地开启了异世界的大门，卷入了一场惊心动魄的种族斗争：赵又廷饰演的武士和倪妮饰演的公主与戴夫•巴蒂斯坦带领的蛮人军队斗智斗勇，不仅如此，两位身负国家和种族命运的勇士还要面对凶悍的蛮人和伺机夺命的巨人、树妖..', 'film/yongshizhimen.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('7', '恐怖笔记(2016)', '90', '11', '2D', to_date('04-11-2016', 'dd-mm-yyyy'), ' 闵晋涛', ' 李淡淡', '赵泳鑫,檀健次', '中国', '北京泰初文化传媒有限公司 ', '电影《恐怖笔记》讲述了小报记者兼业余网络悬疑故事作家追查十年前发生在“谜镇”的几件知名鬼事的真相，根据匿名电话来到了所有传闻最早开始的地方，而10年过去后，这个地方因为闹鬼已经成了没人居住的烂尾楼。随着真相的慢慢揭开，他..', 'film/kongbubiji.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('8', '但丁密码(2016)', '121', '9', '2DIMAX', to_date('28-10-2016', 'dd-mm-yyyy'), ' 朗·霍华德', '丹·布朗 ,大卫·凯普', '汤姆·汉克斯,菲丽希缇·琼斯', '美国', '哥伦比亚电影公司', '兰登在意大利的一家医院里醒来，却发现自己失忆了，随后他很快察觉自己正被人追杀，医生西恩娜·布鲁克斯帮助他侥幸逃脱，同时西恩娜竭尽所能帮助兰登找回失去的记忆。而追杀兰登的人正试图通过在全球传播瘟疫来使自己连接到诗人但丁所..', 'film/dandingmima.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('9', '捉迷藏(2016)', '105', '9', '2D', to_date('04-11-2016', 'dd-mm-yyyy'), ' 刘杰', ' 顾小白, 任鹏', '霍建华,秦海璐', '中国', '霍尔果斯青春光线影业有限公司', '由霍建华扮演男主角的一家住在一栋高级公寓中，事业有成的他，生活幸福安逸。一天，他听闻自己的哥哥失踪数月，下落不明。心怀隐秘的他来到哥哥所在的公寓，发现那里随处都被标记了意义不明的符号，之后在自己家门口也发现了相同的符号..', 'film/zhoumicang.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('10', '魔发精灵(2016)', '92', '5', '3D', to_date('28-10-2016', 'dd-mm-yyyy'), ' 迈克·米歇尔', '乔纳森·阿贝尔, 格伦·伯杰', '安娜·肯德里克,贾斯汀·汀布莱克', ' 美国', ' 二十世纪福斯电影公司', '影片讲述的是“魔发精灵”这群可爱的精灵们与他们的天敌－－“博啃族”进行对抗的冒险旅程，最终Poppy公主带领同伴们找到了能够拯救整个精灵族群的终极秘密武器。', 'film/mofajingling.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('11', '钢铁骑士(2016)', '92', '3', '2D', to_date('01-11-2016', 'dd-mm-yyyy'), ' 斯特瓦特·亨德尔', '克里斯托弗·约斯特', '本·温切尔,乔什·布雷纳', '英国', ' Open Road Films (II) ', '“钢铁骑士”曾是风行全球的男孩人偶玩具，本片根据电视系列动画片改编而成。少年Max偶遇外星伙伴Steel，二者只有通力合作才可以变身成为一名拥有巨大力量的钢铁骑士（Max Steel）。', 'film/gangtieqishi.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('12', '我是处女座(2016)', '90', '5', '2D', to_date('18-11-2016', 'dd-mm-yyyy'), '陈兵', '陈兵', '安以轩,安宰贤', '中国', ' 寰宇纵横世纪电影发行（北京）有限公司', '这是一个女孩寻求真爱的故事，这是一个在生活观念改变了的环境里，一个女孩找寻自我的故事。这是一个处女通过寻求人生出口的奇遇故事。幸运的是在经历一番人生救赎中她最终找到了自己', 'film/woshichunvzuo.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('13', '冲天火(2016)', '120', '3', '2D', to_date('25-11-2016', 'dd-mm-yyyy'), '林岭东', '林岭东', '吴彦祖,张若昀', '中国香港', ' First Business Travel ', '宗天保任职护卫员的科学园大火，他舍身救了女研究员高玉。但研究所潘教授在大火中不幸辞世，潘教授的手写笔记在大火中消失。大火引发了灰尘风暴，令整个香港被雾霾卷盖。财阀王耀才投资的“天空一号”，让富人得以远离污染，而己故潘教..', 'film/chongtianhuo.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('14', '西游伏妖篇(2017)', '112', '5', '2D', to_date('28-01-2017', 'dd-mm-yyyy'), ' 徐克', ' 徐克', '吴亦凡,林更新', '中国', '天津博纳文化传媒有限公司', '电影《西游伏妖篇》作为2013年周星驰导演电影《西游·降魔篇》的后继故事，讲述了唐三藏在上集感化了杀死段小姐的齐天大圣，并收其为徒后，与孙悟空、猪八戒及沙僧，师徒一行四人踏上西天取经之旅。路途凶险，除魔伏妖，师徒四人也在取..', 'film/xiyou2.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('15', '驴得水(2016)', '111', '5', '2D', to_date('28-10-2016', 'dd-mm-yyyy'), '周申 ,刘露', '周申, 刘露', '任素汐,大力,刘帅良', '中国', '天津猫眼文化传媒有限公司 ', '民国时期的一个乡村学校，由于严重缺水，校长将一头驴虚报成英语老师，来为学校挑水。面临教育部特派员的检查，大家决定让一个铜匠来冒充这个叫“吕得水”的英语老师。没想到特派员对这位“吕得水老师”相当欣赏，决定将他捧成教育家，..', 'film/lvdeshui.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('16', '育婴室(2016)', '90', '11', '2D', to_date('28-10-2016', 'dd-mm-yyyy'), '皮查农·塔玛杰拉', ' 周浩晖', '皮查雅·瓦塔那蒙迪里,朱一龙', '中国', '北京聚合影联文化传媒有限公司', '电影《育婴室3D》故事取材自有“中国东野圭吾”之称的周浩晖里程碑式作品《鬼望坡》，剧本由其本人与导演耗时两年精心打磨，力图树立亚洲恐怖影片新标杆。故事讲述元末军阀混战时军粮匮乏，“淮右之军”嗜食小儿之肉。战乱平息后，痛失..', 'film/qiyingshi.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('17', '从你的全世界路过(2016)', '113', '5', '2D', to_date('29-09-2016', 'dd-mm-yyyy'), ' 张一白', ' 张嘉佳', '邓超,白百何', ' 中国', ' 北京光线影业有限公司', '陈末（邓超饰）被称为全城最贱，每天和王牌DJ小容（杜鹃饰）针锋相对，谁也不知道他们的仇恨从何而来。陈末的两个兄弟，分别是全城最傻的猪头（岳云鹏饰），全城最纯的茅十八（杨洋饰），三人每天横冲直撞，以为可以自在生活，结果都面..', 'film/quanshijieluguo.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('18', '非常父子档(2016)', '100', '5', '2D', to_date('04-11-2016', 'dd-mm-yyyy'), ' 曹溱模', ' 曹溱模', '李治廷,金荷娜', '中国', '河南电影电视制作集团有限公司', '影片讲述了一个因捐精生子引发的喜剧爱情故事。单亲家庭的天才少年顾泰丰（文梅森饰演）从小天赋异禀，他通过电脑侵入医院的资料库破解了自己身世之谜，飘洋过海来到中国找寻亲生爸爸。岂料完全没有做好当爸爸准备的大男孩周力岩(李治..', 'film/fuzidang.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('19', '惊天破(2016)', '108', '9', '3D', to_date('20-10-2016', 'dd-mm-yyyy'), ' 吴品儒', '顾舒怡', '谢霆锋,刘青云', ' 中国 ', ' 福建恒业影业有限公司', '在一次追捕行动中，警察马进（谢霆锋 饰）击毙连环杀手“将军”，却被对方射穿心脏，命悬一线，意外之下接受了心脏移植手术。时隔一年半，国际上惊现数宗与“将军”作案手法完全一致的惊天大案，康复后的马进主动请缨，与犯罪心理学教..', 'film/jingpotian.jpg', 0);
insert into FILM (film_id, film_name, total_time, s_id, filmsort, release_time, director, scriptwriter, actor, country, filmcompany, story, img_src, film_score)
values ('20', '枕边有张脸2(2016)', '90', '11', '2D', to_date('28-10-2016', 'dd-mm-yyyy'), ' 赵小溪', ' 赵小溪', '赵慧仙,田家大', '中国', ' 浙江东阳四月天影视文化有限公司', '溪田（赵慧仙饰）十几年来被一个噩梦所困扰，偶然中从著名画家陈风的画中看到了在梦里想杀自己的女孩。为了解梦，溪田一行五人决定去存放着这幅画真迹的深山别墅去寻找答案。没等解开答案，五人却遭遇了一系列离奇古怪的恐怖事件：离奇.', 'film/zhenbian.jpg', 0);
commit;
prompt 20 records loaded
prompt Loading FILMCOMMENT...
prompt Table is empty
prompt Loading FILMHALL...
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('31', '1放映厅', '5');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('32', '2放映厅', '5');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('33', '3放映厅', '5');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('34', '4放映厅', '5');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('35', '5放映厅', '5');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('36', '6放映厅', '5');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('37', '1放映厅', '6');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('38', '2放映厅', '6');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('39', '3放映厅', '6');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('40', '4放映厅', '6');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('41', '5放映厅', '6');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('42', '6放映厅', '6');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('43', '1放映厅', '7');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('44', '2放映厅', '7');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('45', '3放映厅', '7');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('46', '4放映厅', '7');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('47', '5放映厅', '7');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('48', '6放映厅', '7');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('49', '1放映厅', '8');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('50', '2放映厅', '8');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('51', '3放映厅', '8');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('52', '4放映厅', '8');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('53', '5放映厅', '8');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('54', '6放映厅', '8');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('55', '1放映厅', '9');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('56', '2放映厅', '9');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('57', '3放映厅', '9');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('58', '4放映厅', '9');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('59', '5放映厅', '9');
insert into FILMHALL (filmhall_id, filmhall_name, cinema_id)
values ('60', '6放映厅', '9');
commit;
prompt 30 records loaded
prompt Loading JOB...
insert into JOB (job_id, job_name)
values ('1', 'dba');
insert into JOB (job_id, job_name)
values ('2', 'manager');
insert into JOB (job_id, job_name)
values ('3', 'clerk');
commit;
prompt 3 records loaded
prompt Loading REAL_SEAT...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2525', '52', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2526', '52', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2527', '52', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2528', '52', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2529', '52', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2530', '52', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2531', '52', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2532', '52', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2533', '52', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2534', '52', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2535', '52', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2536', '52', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2537', '52', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2538', '52', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2539', '52', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2540', '52', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2541', '52', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2542', '52', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2543', '52', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2544', '52', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2545', '52', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2546', '52', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2547', '52', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2548', '52', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2549', '52', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2550', '52', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2551', '52', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2552', '52', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2553', '52', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2554', '52', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2555', '52', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2556', '52', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2557', '52', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2558', '52', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2559', '52', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2560', '52', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2561', '52', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2562', '52', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2563', '52', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2564', '52', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2565', '52', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2566', '52', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2567', '52', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2568', '52', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2569', '52', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2570', '52', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2571', '52', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2572', '52', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2573', '52', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2574', '52', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2575', '52', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2576', '52', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2577', '52', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2578', '52', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2579', '52', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2580', '52', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2581', '52', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2582', '52', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2583', '52', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2584', '52', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2585', '52', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2586', '52', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2587', '52', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2588', '52', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2589', '52', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2590', '52', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2591', '52', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2592', '52', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2593', '53', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2594', '53', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2595', '53', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2596', '53', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2597', '53', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2598', '53', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2599', '53', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2600', '53', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2601', '53', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2602', '53', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2603', '53', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2604', '53', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2605', '53', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2606', '53', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2607', '53', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2608', '53', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2609', '53', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2610', '53', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2611', '53', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2612', '53', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2613', '53', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2614', '53', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2615', '53', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2616', '53', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2617', '53', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2618', '53', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2619', '53', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2620', '53', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2621', '53', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2622', '53', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2623', '53', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2624', '53', '4', '5');
commit;
prompt 100 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2625', '53', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2626', '53', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2627', '53', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2628', '53', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2629', '53', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2630', '53', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2631', '53', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2632', '53', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2633', '53', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2634', '53', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2635', '53', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2636', '53', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2637', '53', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2638', '53', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2639', '53', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2640', '53', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2641', '53', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2642', '53', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2643', '53', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2644', '53', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2645', '53', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2646', '53', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2647', '53', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2648', '53', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2649', '53', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2650', '53', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2651', '53', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2652', '53', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2653', '53', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2654', '53', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2655', '53', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2656', '53', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2657', '53', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2658', '53', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2659', '53', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2660', '53', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2661', '53', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2662', '53', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2663', '53', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2664', '53', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2665', '53', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2666', '53', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2667', '53', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2668', '53', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2669', '53', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2670', '53', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2671', '53', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2672', '53', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2673', '53', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2674', '54', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2675', '54', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2676', '54', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2677', '54', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2678', '54', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2679', '54', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2680', '54', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2681', '54', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2682', '54', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2683', '54', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2684', '54', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2685', '54', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2686', '54', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2687', '54', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2688', '54', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2689', '54', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2690', '54', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2691', '54', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2692', '54', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2693', '54', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2694', '54', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2695', '54', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2696', '54', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2697', '54', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2698', '54', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2699', '54', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2700', '54', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2701', '54', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2702', '54', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2703', '54', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2704', '54', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2705', '54', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2706', '54', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2707', '54', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2708', '54', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2709', '54', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2710', '54', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2711', '54', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2712', '54', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2713', '54', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2714', '54', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2715', '54', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2716', '54', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2717', '54', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2718', '54', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2719', '54', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2720', '54', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2721', '54', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2722', '54', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2723', '54', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2724', '54', '6', '6');
commit;
prompt 200 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2725', '54', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2726', '54', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2727', '54', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2728', '54', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2729', '54', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2730', '54', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2731', '54', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2732', '54', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2733', '54', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2734', '54', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2735', '54', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2736', '54', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2737', '54', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2738', '54', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2739', '54', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2740', '54', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2741', '54', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2742', '54', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2743', '54', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2744', '54', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2745', '54', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2746', '54', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2747', '54', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2748', '54', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2749', '54', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2750', '54', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2751', '54', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2752', '54', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2753', '54', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2754', '54', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2755', '55', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2756', '55', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2757', '55', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2758', '55', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2759', '55', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2760', '55', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2761', '55', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2762', '55', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2763', '55', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2764', '55', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2765', '55', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2766', '55', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2767', '55', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2768', '55', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2769', '55', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2770', '55', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2771', '55', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2772', '55', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2773', '55', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2774', '55', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2775', '55', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2776', '55', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2777', '55', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2778', '55', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2779', '55', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2780', '55', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2781', '55', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2782', '55', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2783', '55', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2784', '55', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2785', '55', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2786', '55', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2787', '55', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2788', '55', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2789', '55', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2790', '55', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2791', '55', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2792', '55', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2793', '55', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2794', '55', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2795', '55', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2796', '55', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2797', '55', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2798', '55', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2799', '55', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2800', '55', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2801', '55', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2802', '55', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2803', '55', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2804', '55', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2805', '55', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2806', '55', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2807', '55', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2808', '55', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2809', '55', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2810', '55', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2811', '55', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2812', '55', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2813', '55', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2814', '55', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2815', '55', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2816', '55', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2817', '55', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2818', '55', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2819', '55', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2820', '55', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2821', '55', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2822', '55', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2823', '55', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2824', '55', '8', '7');
commit;
prompt 300 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2825', '55', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2826', '55', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2827', '55', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2828', '55', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2829', '55', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2830', '55', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2831', '55', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2832', '55', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2833', '55', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2834', '55', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2835', '55', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2836', '56', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2837', '56', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2838', '56', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2839', '56', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2840', '56', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2841', '56', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2842', '56', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2843', '56', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2844', '56', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2845', '56', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2846', '56', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2847', '56', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2848', '56', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2849', '56', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2850', '56', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2851', '56', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2852', '56', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2853', '56', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2854', '56', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2855', '56', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2856', '56', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2857', '56', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2858', '56', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2859', '56', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2860', '56', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2861', '56', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2862', '56', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2863', '56', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2864', '56', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2865', '56', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2866', '56', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2867', '56', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2868', '56', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2869', '56', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2870', '56', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2871', '56', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2872', '56', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2873', '56', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2874', '56', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2875', '56', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2876', '56', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2877', '56', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2878', '56', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2879', '56', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2880', '56', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2881', '56', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2882', '56', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2883', '56', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2884', '56', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2885', '56', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2886', '56', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2887', '56', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2888', '56', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2889', '56', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2890', '56', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2891', '56', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2892', '56', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2893', '56', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2894', '56', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2895', '56', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2896', '56', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2897', '56', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2898', '56', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2899', '56', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2900', '56', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2901', '56', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2902', '56', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2903', '56', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2904', '56', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2905', '56', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2906', '56', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2907', '56', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2908', '56', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2909', '56', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2910', '56', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2911', '56', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2912', '56', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2913', '56', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2914', '56', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2915', '56', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2916', '56', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2917', '57', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2918', '57', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2919', '57', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2920', '57', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2921', '57', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2922', '57', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2923', '57', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2924', '57', '1', '8');
commit;
prompt 400 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2925', '57', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2926', '57', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2927', '57', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2928', '57', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2929', '57', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2930', '57', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2931', '57', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2932', '57', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2933', '57', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2934', '57', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2935', '57', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2936', '57', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2937', '57', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2938', '57', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2939', '57', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2940', '57', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2941', '57', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2942', '57', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2943', '57', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2944', '57', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2945', '57', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2946', '57', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2947', '57', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2948', '57', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2949', '57', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2950', '57', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2951', '57', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('811', '31', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('812', '31', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('813', '31', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('814', '31', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('815', '31', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('816', '31', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('817', '31', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('818', '31', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('819', '31', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('820', '31', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('821', '31', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('822', '31', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('823', '31', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('824', '31', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('825', '31', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('826', '31', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('827', '31', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('828', '31', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('829', '31', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('830', '31', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('831', '31', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('832', '31', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('833', '31', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('834', '31', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('835', '31', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('836', '31', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('837', '31', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('838', '31', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('839', '31', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('840', '31', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('841', '31', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('842', '31', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('843', '31', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('844', '31', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('845', '31', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('846', '31', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('847', '31', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('848', '31', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('849', '31', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('850', '31', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('851', '31', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('852', '31', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('853', '31', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('854', '31', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('855', '31', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('856', '31', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('857', '31', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('858', '31', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('859', '31', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('860', '31', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('861', '31', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('862', '31', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('863', '31', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('864', '31', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('865', '31', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('866', '31', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('867', '31', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('868', '31', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('869', '31', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('870', '31', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('871', '31', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('872', '31', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('873', '31', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('874', '31', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('875', '31', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('876', '31', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('877', '31', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('878', '31', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('879', '31', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('880', '31', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('881', '31', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('882', '31', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('883', '31', '9', '1');
commit;
prompt 500 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('884', '31', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('885', '31', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('886', '31', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('887', '31', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('888', '31', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('889', '31', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('890', '31', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('891', '31', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('892', '32', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('893', '32', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('894', '32', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('895', '32', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('896', '32', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('897', '32', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('898', '32', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('899', '32', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('900', '32', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('901', '32', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('902', '32', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('903', '32', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('904', '32', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('905', '32', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('906', '32', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('907', '32', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('908', '32', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('909', '32', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('910', '32', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('911', '32', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('912', '32', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('913', '32', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('914', '32', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('915', '32', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('916', '32', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('917', '32', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('918', '32', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('919', '32', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('920', '32', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('921', '32', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('922', '32', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('923', '32', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('924', '32', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('925', '32', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('926', '32', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('927', '32', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('928', '32', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('929', '32', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('930', '32', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('931', '32', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('932', '32', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('933', '32', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('934', '32', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('935', '32', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('936', '32', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('937', '32', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('938', '32', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('939', '32', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('940', '32', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('941', '32', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('942', '32', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('943', '32', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('944', '32', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('945', '32', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('946', '32', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('947', '32', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('948', '32', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('949', '32', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('950', '32', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('951', '32', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('952', '32', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('953', '32', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('954', '32', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('955', '32', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('956', '32', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('957', '32', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('958', '32', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('959', '32', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('960', '32', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('961', '32', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('962', '32', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('963', '32', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('964', '32', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('965', '32', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('966', '32', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('967', '32', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('968', '32', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('969', '32', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('970', '32', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('971', '32', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('972', '32', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('973', '33', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('974', '33', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('975', '33', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('976', '33', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('977', '33', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('978', '33', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('979', '33', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('980', '33', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('981', '33', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('982', '33', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('983', '33', '2', '2');
commit;
prompt 600 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('984', '33', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('985', '33', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('986', '33', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('987', '33', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('988', '33', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('989', '33', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('990', '33', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('991', '33', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('992', '33', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('993', '33', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('994', '33', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('995', '33', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('996', '33', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('997', '33', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('998', '33', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('999', '33', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1000', '33', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1001', '33', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1002', '33', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1003', '33', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1004', '33', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1005', '33', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1006', '33', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1007', '33', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1008', '33', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1009', '33', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1010', '33', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1011', '33', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1012', '33', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1013', '33', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1014', '33', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1015', '33', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1016', '33', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1017', '33', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1018', '33', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1019', '33', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1020', '33', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1021', '33', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1022', '33', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1023', '33', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1024', '33', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1025', '33', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1026', '33', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1027', '33', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1028', '33', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1029', '33', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1030', '33', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1031', '33', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1032', '33', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1033', '33', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1034', '33', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1035', '33', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1036', '33', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1037', '33', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1038', '33', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1039', '33', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1040', '33', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1041', '33', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1042', '33', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1043', '33', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1044', '33', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1045', '33', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1046', '33', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1047', '33', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1048', '33', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1049', '33', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1050', '33', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1051', '33', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1052', '33', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1053', '33', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1054', '34', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1055', '34', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1056', '34', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1057', '34', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1058', '34', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1059', '34', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1060', '34', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1061', '34', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1062', '34', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1063', '34', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1064', '34', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1065', '34', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1066', '34', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1067', '34', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1068', '34', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1069', '34', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1070', '34', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1071', '34', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1072', '34', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1073', '34', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1074', '34', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1075', '34', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1076', '34', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1077', '34', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1078', '34', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1079', '34', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1080', '34', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1081', '34', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1082', '34', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1083', '34', '4', '3');
commit;
prompt 700 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1084', '34', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1085', '34', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1086', '34', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1087', '34', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1088', '34', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1089', '34', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1090', '34', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1091', '34', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1092', '34', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1093', '34', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1094', '34', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1095', '34', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1096', '34', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1097', '34', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1098', '34', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1099', '34', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1100', '34', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1101', '34', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1102', '34', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1103', '34', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1104', '34', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1105', '34', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1106', '34', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1107', '34', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1108', '34', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1109', '34', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1110', '34', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1111', '34', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1112', '34', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1113', '34', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1114', '34', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1115', '34', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1116', '34', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1117', '34', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1118', '34', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1119', '34', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1120', '34', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1121', '34', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1122', '34', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1123', '34', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1124', '34', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1125', '34', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1126', '34', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1127', '34', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1128', '34', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1129', '34', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1130', '34', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1131', '34', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1132', '34', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1133', '34', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1134', '34', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1135', '35', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1136', '35', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1137', '35', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1138', '35', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1139', '35', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1140', '35', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1141', '35', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1142', '35', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1143', '35', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1144', '35', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1145', '35', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1146', '35', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1147', '35', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1148', '35', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1149', '35', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1150', '35', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1151', '35', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1152', '35', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1153', '35', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1154', '35', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1155', '35', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1156', '35', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1157', '35', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1158', '35', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1159', '35', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1160', '35', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1161', '35', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1162', '35', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1163', '35', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1164', '35', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1165', '35', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1166', '35', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1167', '35', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1168', '35', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1169', '35', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1170', '35', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1171', '35', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1172', '35', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1173', '35', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1174', '35', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1175', '35', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1176', '35', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1177', '35', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1178', '35', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1179', '35', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1180', '35', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1181', '35', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1182', '35', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1183', '35', '6', '4');
commit;
prompt 800 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1184', '35', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1185', '35', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1186', '35', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1187', '35', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1188', '35', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1189', '35', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1190', '35', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1191', '35', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1192', '35', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1193', '35', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1194', '35', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1195', '35', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1196', '35', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1197', '35', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1198', '35', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1199', '35', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1200', '35', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1201', '35', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1202', '35', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1203', '35', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1204', '35', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1205', '35', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1206', '35', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1207', '35', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1208', '35', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1209', '35', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1210', '35', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1211', '35', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1212', '35', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1213', '35', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1214', '35', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1215', '35', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1216', '36', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1217', '36', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1218', '36', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1219', '36', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1220', '36', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1221', '36', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1222', '36', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1223', '36', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1224', '36', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1225', '36', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1226', '36', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1227', '36', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1228', '36', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1229', '36', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1230', '36', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1231', '36', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1232', '36', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1233', '36', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1234', '36', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1235', '36', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1236', '36', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1237', '36', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1238', '36', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1239', '36', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1240', '36', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1241', '36', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1242', '36', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1243', '36', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1244', '36', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1245', '36', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1246', '36', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1247', '36', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1248', '36', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1390', '38', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1391', '38', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1392', '38', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1393', '38', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1394', '38', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1395', '38', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1396', '38', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1397', '38', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1398', '38', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1399', '38', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1400', '38', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1401', '38', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1402', '38', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1403', '38', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1404', '38', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1405', '38', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1406', '38', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1407', '38', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1408', '38', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1409', '38', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1410', '38', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1411', '38', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1412', '38', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1413', '38', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1414', '38', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1415', '38', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1416', '38', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1417', '38', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1418', '38', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1419', '38', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1420', '38', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1421', '38', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1422', '38', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1423', '38', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1424', '38', '6', '2');
commit;
prompt 900 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1425', '38', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1426', '38', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1427', '38', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1428', '38', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1429', '38', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1430', '38', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1431', '38', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1432', '38', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1433', '38', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1434', '38', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1435', '38', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1436', '38', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1437', '38', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1438', '38', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1439', '38', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1440', '38', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1441', '38', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1442', '38', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1443', '38', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1444', '38', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1445', '38', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1446', '38', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1447', '38', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1448', '38', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1449', '38', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1450', '38', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1451', '38', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1452', '38', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1453', '38', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1454', '38', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1455', '38', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1456', '38', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1457', '38', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1458', '38', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1459', '39', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1460', '39', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1461', '39', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1462', '39', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1463', '39', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1464', '39', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1465', '39', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1466', '39', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1467', '39', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1468', '39', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1469', '39', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1470', '39', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1471', '39', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1472', '39', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1473', '39', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1474', '39', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1475', '39', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1476', '39', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1477', '39', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1478', '39', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1479', '39', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1480', '39', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1481', '39', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1482', '39', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1483', '39', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1484', '39', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1485', '39', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1486', '39', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1487', '39', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1488', '39', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1489', '39', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1490', '39', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1491', '39', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1492', '39', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1493', '39', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1494', '39', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1495', '39', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1496', '39', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1497', '39', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1498', '39', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1499', '39', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1500', '39', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1501', '39', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1502', '39', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1503', '39', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1504', '39', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1505', '39', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1506', '39', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1507', '39', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1508', '39', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1509', '39', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1510', '39', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1511', '39', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1512', '39', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1513', '39', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1514', '39', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1515', '39', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1516', '39', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1517', '39', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1518', '39', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1519', '39', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1520', '39', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1521', '39', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1522', '39', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1523', '39', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1524', '39', '8', '3');
commit;
prompt 1000 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1525', '39', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1526', '39', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1527', '39', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1528', '39', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1529', '39', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1530', '39', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1531', '39', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1532', '39', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1533', '39', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1534', '39', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1535', '39', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1536', '39', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1537', '39', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1538', '39', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1539', '39', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1540', '40', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1541', '40', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1542', '40', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1543', '40', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1544', '40', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1545', '40', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1546', '40', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1547', '40', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1548', '40', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1549', '40', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1550', '40', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1551', '40', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1552', '40', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1553', '40', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1554', '40', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1555', '40', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1556', '40', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1557', '40', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1558', '40', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1559', '40', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1560', '40', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1561', '40', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1562', '40', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1563', '40', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1564', '40', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1565', '40', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1566', '40', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1567', '40', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1568', '40', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1569', '40', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1570', '40', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1571', '40', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1572', '40', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1573', '40', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1574', '40', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1575', '40', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1576', '40', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1577', '40', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1578', '40', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1579', '40', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1580', '40', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1581', '40', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1582', '40', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1583', '40', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1584', '40', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1585', '40', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1586', '40', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1587', '40', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1588', '40', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1589', '40', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1590', '40', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1591', '40', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1592', '40', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1593', '40', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1594', '40', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1595', '40', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1596', '40', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1597', '40', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1598', '40', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1599', '40', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1600', '40', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1601', '40', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1602', '40', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1603', '40', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1604', '40', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1605', '40', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1606', '40', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1607', '40', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1608', '40', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1609', '40', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1610', '40', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1611', '40', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1612', '40', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1613', '40', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1614', '40', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1615', '40', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1616', '40', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1617', '40', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1618', '40', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1619', '40', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1620', '40', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1621', '41', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1622', '41', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1623', '41', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1624', '41', '1', '4');
commit;
prompt 1100 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1625', '41', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1626', '41', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1627', '41', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1628', '41', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1629', '41', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1630', '41', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1631', '41', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1632', '41', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1633', '41', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1634', '41', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1635', '41', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1636', '41', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1637', '41', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1638', '41', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1639', '41', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1640', '41', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1641', '41', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1642', '41', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1643', '41', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1644', '41', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1645', '41', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1646', '41', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1647', '41', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1648', '41', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1649', '41', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1650', '41', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1651', '41', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1652', '41', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1653', '41', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1654', '41', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1655', '41', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1656', '41', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1657', '41', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1658', '41', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1659', '41', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1660', '41', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1661', '41', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1662', '41', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1663', '41', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1664', '41', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1665', '41', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1666', '41', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1667', '41', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1668', '41', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1669', '41', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1670', '41', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1249', '36', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1250', '36', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1251', '36', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1252', '36', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1253', '36', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1254', '36', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1255', '36', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1256', '36', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1257', '36', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1258', '36', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1259', '36', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1260', '36', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1261', '36', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1262', '36', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1263', '36', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1264', '36', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1265', '36', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1266', '36', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1267', '36', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1268', '36', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1269', '36', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1270', '36', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1271', '36', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1272', '36', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1273', '36', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1274', '36', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1275', '36', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1276', '36', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1277', '36', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1278', '36', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1279', '36', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1280', '36', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1281', '36', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1282', '36', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1283', '36', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1284', '36', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1285', '36', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1286', '36', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1287', '36', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1288', '36', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1289', '36', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1290', '36', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1291', '36', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1292', '36', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1293', '36', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1294', '36', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1295', '36', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1296', '36', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1297', '37', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1298', '37', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1299', '37', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1300', '37', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1301', '37', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1302', '37', '1', '6');
commit;
prompt 1200 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1303', '37', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1304', '37', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1305', '37', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1306', '37', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1307', '37', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1308', '37', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1309', '37', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1310', '37', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1311', '37', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1312', '37', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1313', '37', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1314', '37', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1315', '37', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1316', '37', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1317', '37', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1318', '37', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1319', '37', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1320', '37', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1321', '37', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1322', '37', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1323', '37', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1324', '37', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1325', '37', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1326', '37', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1327', '37', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1328', '37', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1329', '37', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1330', '37', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1331', '37', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1332', '37', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1333', '37', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1334', '37', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1335', '37', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1336', '37', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1337', '37', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1338', '37', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1339', '37', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1340', '37', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1341', '37', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1342', '37', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1343', '37', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1344', '37', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1345', '37', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1346', '37', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1347', '37', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1348', '37', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1349', '37', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1350', '37', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1351', '37', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1352', '37', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1353', '37', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1354', '37', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1355', '37', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1356', '37', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1357', '37', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1358', '37', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1359', '37', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1360', '37', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1361', '37', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1362', '37', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1363', '37', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1364', '37', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1365', '37', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1366', '37', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1367', '37', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1368', '37', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1369', '37', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1370', '37', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1371', '37', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1372', '37', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1373', '37', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1374', '37', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1375', '37', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1376', '37', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1377', '37', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1378', '38', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1379', '38', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1380', '38', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1381', '38', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1382', '38', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1383', '38', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1384', '38', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1385', '38', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1386', '38', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1387', '38', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1388', '38', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1389', '38', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1671', '41', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1672', '41', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1673', '41', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1674', '41', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1675', '41', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1676', '41', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1677', '41', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1678', '41', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1679', '41', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1680', '41', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1681', '41', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1682', '41', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1683', '41', '7', '9');
commit;
prompt 1300 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1684', '41', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1685', '41', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1686', '41', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1687', '41', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1688', '41', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1689', '41', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1690', '41', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1691', '41', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1692', '41', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1693', '41', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1694', '41', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1695', '41', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1696', '41', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1697', '41', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1698', '41', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1699', '41', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1700', '41', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1701', '41', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1702', '42', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1703', '42', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1704', '42', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1705', '42', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1706', '42', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1707', '42', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1708', '42', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1709', '42', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1710', '42', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1711', '42', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1712', '42', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1713', '42', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1714', '42', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1715', '42', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1716', '42', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1717', '42', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1718', '42', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1719', '42', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1720', '42', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1721', '42', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1722', '42', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1723', '42', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1724', '42', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1725', '42', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1726', '42', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1727', '42', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1728', '42', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1729', '42', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1730', '42', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1731', '42', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1732', '42', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1733', '42', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1734', '42', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1735', '42', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1736', '42', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1737', '42', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1738', '42', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1739', '42', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1740', '42', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1741', '42', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1742', '42', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1743', '42', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1744', '42', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1745', '42', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1746', '42', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1747', '42', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1748', '42', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1749', '42', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1750', '42', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1751', '42', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1752', '42', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1753', '42', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1754', '42', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1755', '42', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1756', '42', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1757', '42', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1758', '42', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1759', '42', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1760', '42', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1761', '42', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1762', '42', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1763', '42', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1764', '42', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1765', '42', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1766', '42', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1767', '42', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1768', '42', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1769', '42', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1770', '42', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1771', '42', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1772', '42', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1773', '42', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1774', '42', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1775', '42', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1776', '42', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1777', '42', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1778', '42', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1779', '42', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1780', '42', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1781', '42', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1782', '42', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1783', '43', '1', '1');
commit;
prompt 1400 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1784', '43', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1785', '43', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1786', '43', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1787', '43', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1788', '43', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1789', '43', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1790', '43', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1791', '43', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1792', '43', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1793', '43', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1794', '43', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1795', '43', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1796', '43', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1797', '43', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1798', '43', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1799', '43', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1800', '43', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1801', '43', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1802', '43', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1803', '43', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1804', '43', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1805', '43', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1806', '43', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1807', '43', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1808', '43', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1809', '43', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1810', '43', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1811', '43', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1812', '43', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1813', '43', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1814', '43', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1815', '43', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1816', '43', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1817', '43', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1818', '43', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1819', '43', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1820', '43', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1821', '43', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1822', '43', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1823', '43', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1824', '43', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1825', '43', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1826', '43', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1827', '43', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1828', '43', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1829', '43', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1830', '43', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1831', '43', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1832', '43', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1833', '43', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1834', '43', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1835', '43', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1836', '43', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1837', '43', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1838', '43', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1839', '43', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1840', '43', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1841', '43', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1842', '43', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1843', '43', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1844', '43', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1845', '43', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1846', '43', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1847', '43', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1848', '43', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1849', '43', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1850', '43', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1851', '43', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1852', '43', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1853', '43', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1854', '43', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1855', '43', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1856', '43', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1857', '43', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1858', '43', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1859', '43', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1860', '43', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1861', '43', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1862', '43', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1863', '43', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1864', '44', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1865', '44', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1866', '44', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1867', '44', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1868', '44', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1869', '44', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1870', '44', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1871', '44', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1872', '44', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1873', '44', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1874', '44', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1875', '44', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1876', '44', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1877', '44', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1878', '44', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1879', '44', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1880', '44', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1881', '44', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1882', '44', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1883', '44', '3', '2');
commit;
prompt 1500 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1884', '44', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1885', '44', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1886', '44', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1887', '44', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1888', '44', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1889', '44', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1890', '44', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1891', '44', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1892', '44', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1893', '44', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1894', '44', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1895', '44', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1896', '44', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1897', '44', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1898', '44', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1899', '44', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1900', '44', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1901', '44', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1902', '44', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1903', '44', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1904', '44', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1905', '44', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1906', '44', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1907', '44', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1908', '44', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1909', '44', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1910', '44', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1911', '44', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1912', '44', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1913', '44', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1914', '44', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1915', '44', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1916', '44', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1917', '44', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1918', '44', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1919', '44', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1920', '44', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1921', '44', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1922', '44', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1923', '44', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1924', '44', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1925', '44', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1926', '44', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1927', '44', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1928', '44', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1929', '44', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1930', '44', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1931', '44', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1932', '44', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1933', '44', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1934', '44', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1935', '44', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1936', '44', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1937', '44', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1938', '44', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1939', '44', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1940', '44', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1941', '44', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1942', '44', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1943', '44', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1944', '44', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1945', '45', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1946', '45', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1947', '45', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1948', '45', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1949', '45', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1950', '45', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1951', '45', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1952', '45', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1953', '45', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1954', '45', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1955', '45', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1956', '45', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1957', '45', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1958', '45', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1959', '45', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1960', '45', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1961', '45', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1962', '45', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1963', '45', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1964', '45', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1965', '45', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1966', '45', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1967', '45', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1968', '45', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1969', '45', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1970', '45', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1971', '45', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1972', '45', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1973', '45', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1974', '45', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1975', '45', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1976', '45', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1977', '45', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1978', '45', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1979', '45', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1980', '45', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1981', '45', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1982', '45', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1983', '45', '5', '3');
commit;
prompt 1600 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1984', '45', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1985', '45', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1986', '45', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1987', '45', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1988', '45', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1989', '45', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1990', '45', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1991', '45', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1992', '45', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1993', '45', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1994', '45', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1995', '45', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1996', '45', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1997', '45', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1998', '45', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('1999', '45', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2000', '45', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2001', '45', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2002', '45', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2003', '45', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2004', '45', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2005', '45', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2006', '45', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2007', '45', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2008', '45', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2009', '45', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2010', '45', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2011', '45', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2012', '45', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2013', '45', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2014', '45', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2015', '45', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2016', '45', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2017', '45', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2018', '45', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2019', '45', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2020', '45', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2021', '45', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2022', '45', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2023', '45', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2024', '45', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2025', '45', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2026', '46', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2027', '46', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2028', '46', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2029', '46', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2030', '46', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2031', '46', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2032', '46', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2033', '46', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2034', '46', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2035', '46', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2036', '46', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2037', '46', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2038', '46', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2039', '46', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2040', '46', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2041', '46', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2042', '46', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2043', '46', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2044', '46', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2045', '46', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2046', '46', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2047', '46', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2048', '46', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2049', '46', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2050', '46', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2051', '46', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2052', '46', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2053', '46', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2054', '46', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2055', '46', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2056', '46', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2057', '46', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2058', '46', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2059', '46', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2060', '46', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2061', '46', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2062', '46', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2063', '46', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2064', '46', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2065', '46', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2066', '46', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2067', '46', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2068', '46', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2069', '46', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2070', '46', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2071', '46', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2072', '46', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2073', '46', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2074', '46', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2075', '46', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2076', '46', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2077', '46', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2078', '46', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2079', '46', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2080', '46', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2081', '46', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2082', '46', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2083', '46', '7', '4');
commit;
prompt 1700 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2084', '46', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2085', '46', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2086', '46', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2087', '46', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2088', '46', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2089', '46', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2090', '46', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2091', '46', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2092', '46', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2093', '46', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2094', '46', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2095', '46', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2096', '46', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2097', '46', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2098', '46', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2099', '46', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2100', '46', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2101', '46', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2102', '46', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2103', '46', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2104', '46', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2105', '46', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2106', '46', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2107', '47', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2108', '47', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2109', '47', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2110', '47', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2111', '47', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2112', '47', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2113', '47', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2114', '47', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2115', '47', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2116', '47', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2117', '47', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2118', '47', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2119', '47', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2120', '47', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2121', '47', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2122', '47', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2123', '47', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2124', '47', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2125', '47', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2126', '47', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2127', '47', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2128', '47', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2129', '47', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2130', '47', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2131', '47', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2132', '47', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2133', '47', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2134', '47', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2135', '47', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2136', '47', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2137', '47', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2138', '47', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2139', '47', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2140', '47', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2141', '47', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2142', '47', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2143', '47', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2144', '47', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2145', '47', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2146', '47', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2147', '47', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2148', '47', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2149', '47', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2150', '47', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2151', '47', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2152', '47', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2153', '47', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2154', '47', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2155', '47', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2156', '47', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2157', '47', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2158', '47', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2159', '47', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2160', '47', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2161', '47', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2162', '47', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2163', '47', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2164', '47', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2165', '47', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2166', '47', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2167', '47', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2168', '47', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2169', '47', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2170', '47', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2171', '47', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2172', '47', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2173', '47', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2174', '47', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2175', '47', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2176', '47', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2177', '47', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2178', '47', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2179', '47', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2180', '47', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2181', '47', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2182', '47', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2183', '47', '9', '5');
commit;
prompt 1800 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2184', '47', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2185', '47', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2186', '47', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2187', '47', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2188', '48', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2189', '48', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2190', '48', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2191', '48', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2192', '48', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2193', '48', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2194', '48', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2195', '48', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2196', '48', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2197', '48', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2198', '48', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2199', '48', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2200', '48', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2201', '48', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2202', '48', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2203', '48', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2204', '48', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2205', '48', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2206', '48', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2207', '48', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2208', '48', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2209', '48', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2210', '48', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2211', '48', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2212', '48', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2213', '48', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2214', '48', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2215', '48', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2216', '48', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2217', '48', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2218', '48', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2219', '48', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2220', '48', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2221', '48', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2222', '48', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2223', '48', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2224', '48', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2225', '48', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2226', '48', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2227', '48', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2228', '48', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2229', '48', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2230', '48', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2231', '48', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2232', '48', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2233', '48', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2234', '48', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2235', '48', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2236', '48', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2237', '48', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2238', '48', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2239', '48', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2240', '48', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2241', '48', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2242', '48', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2243', '48', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2244', '48', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2245', '48', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2246', '48', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2247', '48', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2248', '48', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2249', '48', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2250', '48', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2251', '48', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2252', '48', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2253', '48', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2254', '48', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2255', '48', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2256', '48', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2257', '48', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2258', '48', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2259', '48', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2260', '48', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2261', '48', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2262', '48', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2263', '48', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2264', '48', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2265', '48', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2266', '48', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2267', '48', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2268', '48', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2269', '49', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2270', '49', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2271', '49', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2272', '49', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2273', '49', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2274', '49', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2275', '49', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2276', '49', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2277', '49', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2278', '49', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2279', '49', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2280', '49', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2281', '49', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2282', '49', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2283', '49', '2', '6');
commit;
prompt 1900 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2284', '49', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2285', '49', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2286', '49', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2287', '49', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2288', '49', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2289', '49', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2290', '49', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2291', '49', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2292', '49', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2293', '49', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2294', '49', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2295', '49', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2296', '49', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2297', '49', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2298', '49', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2299', '49', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2300', '49', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2301', '49', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2302', '49', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2303', '49', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2304', '49', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2305', '49', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2306', '49', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2307', '49', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2308', '49', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2309', '49', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2310', '49', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2311', '49', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2312', '49', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2313', '49', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2314', '49', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2315', '49', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2316', '49', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2317', '49', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2318', '49', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2319', '49', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2320', '49', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2321', '49', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2322', '49', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2323', '49', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2324', '49', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2325', '49', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2326', '49', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2327', '49', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2328', '49', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2329', '49', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2330', '49', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2331', '49', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2332', '49', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2333', '49', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2334', '49', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2335', '49', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2336', '49', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2337', '49', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2338', '49', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2339', '49', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2340', '49', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2341', '49', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2342', '49', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2343', '49', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2344', '49', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2345', '49', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2346', '49', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2347', '49', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2348', '49', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2349', '49', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2350', '50', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2351', '50', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2352', '50', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2353', '50', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2354', '50', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2355', '50', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2356', '50', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2357', '50', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2358', '50', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2359', '50', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2360', '50', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2361', '50', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2362', '50', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2363', '50', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2364', '50', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2365', '50', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2366', '50', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2367', '50', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2368', '50', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2369', '50', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2370', '50', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2371', '50', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2372', '50', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2373', '50', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2374', '50', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2375', '50', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2376', '50', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2377', '50', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2378', '50', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2379', '50', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2380', '50', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2381', '50', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2382', '50', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2383', '50', '4', '7');
commit;
prompt 2000 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2384', '50', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2385', '50', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2386', '50', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2387', '50', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2388', '50', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2389', '50', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2390', '50', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2391', '50', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2392', '50', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2393', '50', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2394', '50', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2395', '50', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2396', '50', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2397', '50', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2398', '50', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2399', '50', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2400', '50', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2401', '50', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2402', '50', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2403', '50', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2404', '50', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2405', '50', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2406', '50', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2407', '50', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2408', '50', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2409', '50', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2410', '50', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2411', '50', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2412', '50', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2413', '50', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2414', '50', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2415', '50', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2416', '50', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2417', '50', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2418', '50', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2419', '50', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2420', '50', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2421', '50', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2422', '50', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2423', '50', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2424', '50', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2425', '50', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2426', '50', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2427', '50', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2428', '50', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2429', '50', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2430', '50', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2431', '51', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2432', '51', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2433', '51', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2434', '51', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2435', '51', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2436', '51', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2437', '51', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2438', '51', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2439', '51', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2440', '51', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2441', '51', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2442', '51', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2443', '51', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2444', '51', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2445', '51', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2446', '51', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2447', '51', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2448', '51', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2449', '51', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2450', '51', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2451', '51', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2452', '51', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2453', '51', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2454', '51', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2455', '51', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2456', '51', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2457', '51', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2458', '51', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2459', '51', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2460', '51', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2461', '51', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2462', '51', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2463', '51', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2464', '51', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2465', '51', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2466', '51', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2467', '51', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2468', '51', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2469', '51', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2470', '51', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2471', '51', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2472', '51', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2473', '51', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2474', '51', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2475', '51', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2476', '51', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2477', '51', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2478', '51', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2479', '51', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2480', '51', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2481', '51', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2482', '51', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2483', '51', '6', '8');
commit;
prompt 2100 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2484', '51', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2485', '51', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2486', '51', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2487', '51', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2488', '51', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2489', '51', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2490', '51', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2491', '51', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2492', '51', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2493', '51', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2494', '51', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2495', '51', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2496', '51', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2497', '51', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2498', '51', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2499', '51', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2500', '51', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2501', '51', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2502', '51', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2503', '51', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2504', '51', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2505', '51', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2506', '51', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2507', '51', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2508', '51', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2509', '51', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2510', '51', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2511', '51', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2512', '52', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2513', '52', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2514', '52', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2515', '52', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2516', '52', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2517', '52', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2518', '52', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2519', '52', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2520', '52', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2521', '52', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2522', '52', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2523', '52', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2524', '52', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2952', '57', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2953', '57', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2954', '57', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2955', '57', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2956', '57', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2957', '57', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2958', '57', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2959', '57', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2960', '57', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2961', '57', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2962', '57', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2963', '57', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2964', '57', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2965', '57', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2966', '57', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2967', '57', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2968', '57', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2969', '57', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2970', '57', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2971', '57', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2972', '57', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2973', '57', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2974', '57', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2975', '57', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2976', '57', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2977', '57', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2978', '57', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2979', '57', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2980', '57', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2981', '57', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2982', '57', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2983', '57', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2984', '57', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2985', '57', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2986', '57', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2987', '57', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2988', '57', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2989', '57', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2990', '57', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2991', '57', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2992', '57', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2993', '57', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2994', '57', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2995', '57', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2996', '57', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2997', '57', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2998', '58', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('2999', '58', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3000', '58', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3001', '58', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3002', '58', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3003', '58', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3004', '58', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3005', '58', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3006', '58', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3007', '58', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3008', '58', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3009', '58', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3010', '58', '2', '4');
commit;
prompt 2200 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3011', '58', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3012', '58', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3013', '58', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3014', '58', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3015', '58', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3016', '58', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3017', '58', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3018', '58', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3019', '58', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3020', '58', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3021', '58', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3022', '58', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3023', '58', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3024', '58', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3025', '58', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3026', '58', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3027', '58', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3028', '58', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3029', '58', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3030', '58', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3031', '58', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3032', '58', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3033', '58', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3034', '58', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3035', '58', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3036', '58', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3037', '58', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3038', '58', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3039', '58', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3040', '58', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3041', '58', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3042', '58', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3043', '58', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3044', '58', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3045', '58', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3046', '58', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3047', '58', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3048', '58', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3049', '58', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3050', '58', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3051', '58', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3052', '58', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3053', '58', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3054', '58', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3055', '58', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3056', '58', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3057', '58', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3058', '58', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3059', '58', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3060', '58', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3061', '58', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3062', '58', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3063', '58', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3064', '58', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3065', '58', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3066', '58', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3067', '58', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3068', '58', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3069', '58', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3070', '58', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3071', '58', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3072', '58', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3073', '58', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3074', '58', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3075', '58', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3076', '58', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3077', '58', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3078', '58', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3079', '59', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3080', '59', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3081', '59', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3082', '59', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3083', '59', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3084', '59', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3085', '59', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3086', '59', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3087', '59', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3088', '59', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3089', '59', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3090', '59', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3091', '59', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3092', '59', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3093', '59', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3094', '59', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3095', '59', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3096', '59', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3097', '59', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3098', '59', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3099', '59', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3100', '59', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3101', '59', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3102', '59', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3103', '59', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3104', '59', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3105', '59', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3106', '59', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3107', '59', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3108', '59', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3109', '59', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3110', '59', '4', '5');
commit;
prompt 2300 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3111', '59', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3112', '59', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3113', '59', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3114', '59', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3115', '59', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3116', '59', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3117', '59', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3118', '59', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3119', '59', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3120', '59', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3121', '59', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3122', '59', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3123', '59', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3124', '59', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3125', '59', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3126', '59', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3127', '59', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3128', '59', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3129', '59', '6', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3130', '59', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3131', '59', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3132', '59', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3133', '59', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3134', '59', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3135', '59', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3136', '59', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3137', '59', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3138', '59', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3139', '59', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3140', '59', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3141', '59', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3142', '59', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3143', '59', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3144', '59', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3145', '59', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3146', '59', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3147', '59', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3148', '59', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3149', '59', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3150', '59', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3151', '59', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3152', '59', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3153', '59', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3154', '59', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3155', '59', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3156', '59', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3157', '59', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3158', '59', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3159', '59', '9', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3160', '60', '1', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3161', '60', '1', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3162', '60', '1', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3163', '60', '1', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3164', '60', '1', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3165', '60', '1', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3166', '60', '1', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3167', '60', '1', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3168', '60', '1', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3169', '60', '2', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3170', '60', '2', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3171', '60', '2', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3172', '60', '2', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3173', '60', '2', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3174', '60', '2', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3175', '60', '2', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3176', '60', '2', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3177', '60', '2', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3178', '60', '3', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3179', '60', '3', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3180', '60', '3', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3181', '60', '3', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3182', '60', '3', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3183', '60', '3', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3184', '60', '3', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3185', '60', '3', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3186', '60', '3', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3187', '60', '4', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3188', '60', '4', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3189', '60', '4', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3190', '60', '4', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3191', '60', '4', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3192', '60', '4', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3193', '60', '4', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3194', '60', '4', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3195', '60', '4', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3196', '60', '5', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3197', '60', '5', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3198', '60', '5', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3199', '60', '5', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3200', '60', '5', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3201', '60', '5', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3202', '60', '5', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3203', '60', '5', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3204', '60', '5', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3205', '60', '6', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3206', '60', '6', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3207', '60', '6', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3208', '60', '6', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3209', '60', '6', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3210', '60', '6', '6');
commit;
prompt 2400 records committed...
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3211', '60', '6', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3212', '60', '6', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3213', '60', '6', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3214', '60', '7', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3215', '60', '7', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3216', '60', '7', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3217', '60', '7', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3218', '60', '7', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3219', '60', '7', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3220', '60', '7', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3221', '60', '7', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3222', '60', '7', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3223', '60', '8', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3224', '60', '8', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3225', '60', '8', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3226', '60', '8', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3227', '60', '8', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3228', '60', '8', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3229', '60', '8', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3230', '60', '8', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3231', '60', '8', '9');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3232', '60', '9', '1');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3233', '60', '9', '2');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3234', '60', '9', '3');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3235', '60', '9', '4');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3236', '60', '9', '5');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3237', '60', '9', '6');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3238', '60', '9', '7');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3239', '60', '9', '8');
insert into REAL_SEAT (rl_id, filmhall_id, row_, col_)
values ('3240', '60', '9', '9');
commit;
prompt 2430 records loaded
prompt Loading SCHEDULE...
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('21', '1', to_date('10-11-2016 20:20:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('3', '1', to_date('09-11-2016 20:20:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('4', '1', to_date('09-11-2016 22:35:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('5', '2', to_date('09-11-2016 14:25:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('6', '2', to_date('09-11-2016 16:30:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('7', '2', to_date('09-11-2016 20:35:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('8', '2', to_date('09-11-2016 22:40:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('9', '9', to_date('09-11-2016 16:40:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('10', '9', to_date('09-11-2016 18:45:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('11', '9', to_date('09-11-2016 20:55:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('12', '9', to_date('09-11-2016 23:00:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('13', '8', to_date('09-11-2016 17:20:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('14', '8', to_date('09-11-2016 22:10:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 33);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('15', '5', to_date('09-11-2016 17:20:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 53);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('16', '5', to_date('09-11-2016 22:10:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 53);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('17', '15', to_date('09-11-2016 17:20:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 35);
insert into SCHEDULE (schedule_id, film_id, schedule_time, cinema_id, ticket_price)
values ('18', '15', to_date('09-11-2016 22:10:00', 'dd-mm-yyyy hh24:mi:ss'), '5', 35);
commit;
prompt 17 records loaded
prompt Loading SEAT_STATE...
prompt Table is empty
prompt Loading STAFF...
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('1', 'admin', '123', '18888888888', '1');
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('2', 'lisi', '123', '18812341234', '2');
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('3', 'xiaoming', '123', '18843214321', '3');
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('21', 'name', '123', '18843214321', '3');
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('22', 'name', '123', '18843214321', '3');
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('23', 'name', '123', '18843214321', '3');
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('24', 'name', '123', '18843214321', '3');
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('25', 'name', '123', '18843214321', '3');
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('26', 'name', '123', '18843214321', '3');
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('27', 'name ', '123', '18843214321', '3');
insert into STAFF (staff_id, username, pwd, phone, job_id)
values ('28', 'name', '123', '18843214321', '3');
commit;
prompt 11 records loaded
prompt Loading TICKETORDER...
prompt Table is empty
prompt Loading TICKETDETAIL...
prompt Table is empty
set feedback on
set define on
prompt Done.
