## 本项目实现的最终作用是基于JSP高校新生报到迎新管理系统
## 分为4个角色
### 第1个角色为管理员角色，实现了如下功能：
 - 专业信息查询
 - 入校须知管理
 - 友情链接管理
 - 大学公告管理
 - 学校简介管理
 - 宿舍分配管理
 - 宿舍楼管理
 - 新生报到模板管理
 - 新生报到管理
 - 校园新闻管理
 - 校园风光管理
 - 班级信息管理
 - 留言管理
 - 管理人员管理
 - 管理员登录
 - 系统公告管理
### 第2个角色为辅导员角色，实现了如下功能：
 - 学生留言管理
 - 宿舍分配管理
 - 新生报到管理
 - 辅导员登录
### 第3个角色为财务管理角色，实现了如下功能：
 - 个人密码管理
 - 管理学生缴费
 - 财务管理员登录
### 第4个角色为学生角色，实现了如下功能：
 - 入校须知查看
 - 在线留言
 - 大学公告查看
 - 学校简介查看
 - 学生信息后台
 - 学生首页
 - 宿舍分配查看
 - 报道流程管理
 - 校园新闻管理
 - 校园风光查看
 - 缴费记录查看
## 数据库设计如下：
# 数据库设计文档

**数据库名：** gxyx_sys

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [allusers](#allusers) |  |
| [banjixinxi](#banjixinxi) |  |
| [dx](#dx) |  |
| [jiaofeijilu](#jiaofeijilu) |  |
| [liuyanban](#liuyanban) |  |
| [sushelouxinxi](#sushelouxinxi) |  |
| [xiaoyuanfengguang](#xiaoyuanfengguang) |  |
| [xinshengbaodao](#xinshengbaodao) |  |
| [xinwentongzhi](#xinwentongzhi) |  |
| [yonghuzhuce](#yonghuzhuce) |  |
| [youqinglianjie](#youqinglianjie) |  |
| [zhuanyexinxi](#zhuanyexinxi) |  |

**表名：** <a id="allusers">allusers</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | username |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户名  |
|  3   | pwd |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 密码  |
|  4   | cx |   varchar   | 255 |   0    |    Y     |  N   |   '财务处'    |   |
|  5   | addtime |   timestamp   | 19 |   0    |    N     |  N   |   current_timestamp()    | 插入时间  |

**表名：** <a id="banjixinxi">banjixinxi</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | banji |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | banzhuren |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | renshu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | beizhu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |
|  6   | addtime |   timestamp   | 19 |   0    |    N     |  N   |   current_timestamp()    | 插入时间  |

**表名：** <a id="dx">dx</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | leibie |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | content |   text   | 65535 |   0    |    Y     |  N   |   NULL    | 内容  |

**表名：** <a id="jiaofeijilu">jiaofeijilu</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | xuehao |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 学号  |
|  3   | xingming |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 姓名  |
|  4   | banji |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | zhuanye |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | xuenian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | xueqi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  8   | feiyongleixing |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  9   | feiyongjine |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  10   | beizhu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |
|  11   | addtime |   timestamp   | 19 |   0    |    N     |  N   |   current_timestamp()    | 插入时间  |
|  12   | issh |   varchar   | 255 |   0    |    Y     |  N   |   '否'    |   |

**表名：** <a id="liuyanban">liuyanban</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | cheng |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | xingbie |   varchar   | 4 |   0    |    Y     |  N   |   NULL    | 性别  |
|  4   | QQ |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | QQ号码  |
|  5   | youxiang |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 邮箱  |
|  6   | dianhua |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  7   | neirong |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 内容  |
|  8   | addtime |   timestamp   | 19 |   0    |    Y     |  N   |   current_timestamp()    |   |
|  9   | huifuneirong |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="sushelouxinxi">sushelouxinxi</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | louhao |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | cengshu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | louguanyuan |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | dianhua |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  6   | beizhu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |
|  7   | addtime |   timestamp   | 19 |   0    |    N     |  N   |   current_timestamp()    | 插入时间  |

**表名：** <a id="xiaoyuanfengguang">xiaoyuanfengguang</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | tupian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | mingcheng |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名称  |
|  4   | addtime |   timestamp   | 19 |   0    |    N     |  N   |   current_timestamp()    | 插入时间  |

**表名：** <a id="xinshengbaodao">xinshengbaodao</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | xuehao |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 学号  |
|  3   | xingming |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 姓名  |
|  4   | mima |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 密码  |
|  5   | xingbie |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 性别  |
|  6   | banji |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | zhuanye |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  8   | jiguan |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  9   | dizhi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 地址  |
|  10   | zhaopian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 照片  |
|  11   | sushelou |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  12   | fangjianhao |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  13   | chuangweihao |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  14   | addtime |   timestamp   | 19 |   0    |    N     |  N   |   current_timestamp()    | 插入时间  |
|  15   | issh |   varchar   | 255 |   0    |    Y     |  N   |   '否'    |   |

**表名：** <a id="xinwentongzhi">xinwentongzhi</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | biaoti |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 标题  |
|  3   | leibie |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 类别  |
|  4   | neirong |   text   | 65535 |   0    |    Y     |  N   |   NULL    | 内容  |
|  5   | tianjiaren |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 添加人  |
|  6   | shouyetupian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 首页图片  |
|  7   | dianjilv |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 点击数  |
|  8   | addtime |   timestamp   | 19 |   0    |    Y     |  N   |   current_timestamp()    |   |

**表名：** <a id="yonghuzhuce">yonghuzhuce</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | yonghuming |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户名  |
|  3   | mima |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 密码  |
|  4   | xingming |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 姓名  |
|  5   | xingbie |   varchar   | 4 |   0    |    Y     |  N   |   NULL    | 性别  |
|  6   | chushengnianyue |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | QQ |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | QQ号码  |
|  8   | youxiang |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 邮箱  |
|  9   | dianhua |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  10   | shenfenzheng |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  11   | touxiang |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 头像  |
|  12   | dizhi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  13   | beizhu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |
|  14   | addtime |   timestamp   | 19 |   0    |    Y     |  N   |   current_timestamp()    |   |
|  15   | issh |   varchar   | 2 |   0    |    Y     |  N   |   '否'    |   |

**表名：** <a id="youqinglianjie">youqinglianjie</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | wangzhanmingcheng |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | wangzhi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | addtime |   timestamp   | 19 |   0    |    Y     |  N   |   current_timestamp()    |   |

**表名：** <a id="zhuanyexinxi">zhuanyexinxi</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | zhuanye |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | suozaiyuanxi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | addtime |   timestamp   | 19 |   0    |    N     |  N   |   current_timestamp()    | 插入时间  |

**运行不出来可以微信 javape 我的公众号：源码码头**
