# وب سرویس Rest پارس ویتایگر نسخه 1

به شما امکان می دهد با CRM خود با استفاده از Rest API ارتباط برقرار کنید.

## ویژگی ها

- ایجاد ، دریافت ، به روزرسانی و حذف رکوردها (CRUD)
- دریافت لیستی از رکوردها با استفاده از صفحه بندی
- امکان تعریف مقادیر جهت دریافت لیستی از رکوردها
- دریافت مقادیر فهرست های انتخابی
- آپلود سند
- کارکرد صحیح با ماژول های مرتبط با انبار (فاکتور، پیش فاکتور، سفارش خرید/فروش)


## نحوه استفاده

شما به راحتی می توانید با CRM خود را با استفاده از پروتکل REST و متدهای زیر ارتباط برقرار کند.

**GET:** احراز هویت کاربر / دریافت اطلاعات یک رکورد یا لیستی از رکوردها / دریافت مقادیر فهرست انتخابی

**POST:** افزودن یک رکورد

**PUT:** بروزرسانی یک رکورد

**DELETE:** حذف یک رکورد


## دانلود نمونه کد فراخوانی وب سرویس به زبان PHP

برای استفاده از نمونه کد در زبان PHP کافیست فایل فشرده که حاوی کتابخانه client وب سرویس و نمونه کد جهت اتصال می‌باشد را [__دانلود__](index.php?module=ParsVT&view=Misc&downloadWebService=true) و از حالت فشرده خارج نموده و در کنار کدهای خود قرار دهید.

[![Downloads](layouts/v7/modules/ParsVT/images/download.png)](index.php?module=ParsVT&view=Misc&downloadWebService=true)

### احراز هویت

جهت ارتباط با CRM شما باید ابتدا احراز هویت شوید.

2 روش برای ورود یک کاربر وجود دارد:

1. __ورود با نام کاربری و کلمه ورود__

```
http://yourcrm.com/modules/ParsVT/ws/auth/LOGIN/PASSWORD

یا

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Auth&login=LOGIN&password=PASSWORD
```

*LOGIN و PASSWORD را با اطلاعات ورود کاربر مورد نظر خود جایگزین کنید.*


2. __با استفاده از کلید دسترسی__

```
http://yourcrm.com/modules/ParsVT/ws/auth/USER_ACCESS_KEY

یا

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Auth&key=USER_ACCESS_KEY
```

*مقدار USER_ACCESS_KEY را با کلید دسترسی ایجاد شده در پروفایل کاربر جایگزین نمایید.*

![User's Access Key](layouts/v7/modules/ParsVT/images/accesskeyfa.png "کلید دسترسی کاربر")


**نتیجه:**

```
{"success":true,"result":"f7171f3d8e13326762a45641c2dd1e39"}

//Token: f7171f3d8e13326762a45641c2dd1e39
```

شما باید از کلید توکن (token) ایجاد شده در فراخوانی متدهای بعدی استفاده کنید

*نکته: با استفاده از ایم روش ACL ویتایگر رعایت می شود *

### دریافت اطلاعات (GET)

شما باید از توکن ایجاد شده در مرحله احرازهویت برای تمام فراخوانی ها استفاده نمایید
در مثال های پایین مااز ماژول سازمان ها استفاده کردیم اما شما می توانید از این متدها در تمامی ماژول ها استفاده نمایید

#### دریافت لیست رکوردها

```
http://yourcrm.com/modules/ParsVT/ws/Accounts/f7171f3d8e13326762a45641c2dd1e39

یا

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Accounts&token=f7171f3d8e13326762a45641c2dd1e39
```

نتیجه:

```
{"success":true,"result":[{"accountname":"MEDIA 3+","account_no":"ACC1","phone":"","website":"","fax":"","tickersymbol":"","otherphone":"","account_id":"0","email1":"","employees":"0","email2":"","ownership":"","rating":"","industry":"","siccode":"","accounttype":"","annual_revenue":"0.00000000","emailoptout":"0","notify_owner":"0","assigned_user_id":"1","createdtime":"2016-10-28 14:40:37","modifiedtime":"2017-09-04 09:29:15","modifiedby":"1","bill_street":"34 all\u00e9e des Fr\u00eanes","ship_street":"34 all\u00e9e des Fr\u00eanes","bill_city":"Champs sur Marne","ship_city":"Champs sur Marne","bill_state":"","ship_state":"","bill_code":"77420","ship_code":"77420","bill_country":"France","ship_country":"France","bill_pobox":"","ship_pobox":"","description":"","campaignrelstatus":"","isconvertedfromlead":"0","record_id":"3","record_module":"Accounts","api_date_now":"2017-09-04 09:29:22"},{"accountname":"ParsVT","account_no":"ACC2","phone":"","website":"www.parsvt.com","fax":"","tickersymbol":"","otherphone":"","account_id":"0","email1":"","employees":"0","email2":"","ownership":"","rating":"","industry":"","siccode":"","accounttype":"","annual_revenue":"0.00000000","emailoptout":"0","notify_owner":"0","assigned_user_id":"1","createdtime":"2017-09-04 09:28:27","modifiedtime":"2017-09-04 09:28:27","modifiedby":"1","bill_street":"","ship_street":"","bill_city":"","ship_city":"","bill_state":"","ship_state":"","bill_code":"","ship_code":"","bill_country":"","ship_country":"","bill_pobox":"","ship_pobox":"","description":"","campaignrelstatus":"","isconvertedfromlead":"0","record_id":"24","record_module":"Accounts","api_date_now":"2017-09-04 09:29:22"}]}
```

#### دریافت لیست رکوردها با استفاده از صفحه بندی

شما می توانید جهت دریافت رکورد ها از صفحه بندی در API استفاده نمایید. به صورت پیش فرض تنها 100 رکورد اول نمایش داده می شوند.

شما می توانید از پارامترهای ```start```، ```length``` و ```order```جهت مدیریت صفحه بندی استفاده نمایید.

```
http://yourcrm.com/modules/ParsVT/ws/Accounts/start/0/length/2/order/vtiger_account.accountname%20DESC/f7171f3d8e13326762a45641c2dd1e39

یا

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Accounts&start=0&length=2&order=vtiger_account.accountname%20DESC&token=f7171f3d8e13326762a45641c2dd1e39
```

نتیجه:

```
{"success":true,"result":[{"accountname":"ParsVT","account_no":"ACC2","phone":"","website":"www.parsvt.com","fax":"","tickersymbol":"","otherphone":"","account_id":"0","email1":"","employees":"0","email2":"","ownership":"","rating":"","industry":"","siccode":"","accounttype":"","annual_revenue":"0.00000000","emailoptout":"0","notify_owner":"0","assigned_user_id":"1","createdtime":"2017-09-04 09:28:27","modifiedtime":"2017-09-04 09:28:27","modifiedby":"1","bill_street":"","ship_street":"","bill_city":"","ship_city":"","bill_state":"","ship_state":"","bill_code":"","ship_code":"","bill_country":"","ship_country":"","bill_pobox":"","ship_pobox":"","description":"","campaignrelstatus":"","isconvertedfromlead":"0","record_id":"24","record_module":"Accounts","api_date_now":"2017-09-04 10:14:38"},{"accountname":"MEDIA 3+","account_no":"ACC1","phone":"","website":"","fax":"","tickersymbol":"","otherphone":"","account_id":"0","email1":"","employees":"0","email2":"","ownership":"","rating":"","industry":"","siccode":"","accounttype":"","annual_revenue":"0.00000000","emailoptout":"0","notify_owner":"0","assigned_user_id":"1","createdtime":"2016-10-28 14:40:37","modifiedtime":"2017-09-04 09:29:15","modifiedby":"1","bill_street":"34 all\u00e9e des Fr\u00eanes","ship_street":"34 all\u00e9e des Fr\u00eanes","bill_city":"Champs sur Marne","ship_city":"Champs sur Marne","bill_state":"","ship_state":"","bill_code":"77420","ship_code":"77420","bill_country":"France","ship_country":"France","bill_pobox":"","ship_pobox":"","description":"","campaignrelstatus":"","isconvertedfromlead":"0","record_id":"3","record_module":"Accounts","api_date_now":"2017-09-04 10:14:38"}]}
```

#### جستجو در لیست رکوردها

افزودن پارامتر و معیارهای دلخواه به دستور SQL، با جداکردن آنها توسط نقطه ویرگول(;) جهت دستیابی به رکوردهای مورد نظر.

استفاده از یک معیار : ```table.column:value```

استفاده از چند معیار : ```table.column1:value1;table.column2:value2;...;table.columnN:valueN```

```
http://yourcrm.com/modules/ParsVT/ws/Accounts/criteria/vtiger_account.accountname:ParsVT;vtiger_account.website:www.parsvt.com/f7171f3d8e13326762a45641c2dd1e39

یا

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Accounts&criteria=vtiger_account.accountname:ParsVT;vtiger_account.website:www.parsvt.com&token=f7171f3d8e13326762a45641c2dd1e39
```

نتیجه:

```
{"success":true,"result":[{"accountname":"ParsVT","account_no":"ACC2","phone":"","website":"www.parsvt.com","fax":"","tickersymbol":"","otherphone":"","account_id":"0","email1":"","employees":"0","email2":"","ownership":"","rating":"","industry":"","siccode":"","accounttype":"","annual_revenue":"0.00000000","emailoptout":"0","notify_owner":"0","assigned_user_id":"1","createdtime":"2017-09-04 09:28:27","modifiedtime":"2017-09-04 09:28:27","modifiedby":"1","bill_street":"","ship_street":"","bill_city":"","ship_city":"","bill_state":"","ship_state":"","bill_code":"","ship_code":"","bill_country":"","ship_country":"","bill_pobox":"","ship_pobox":"","description":"","campaignrelstatus":"","isconvertedfromlead":"0","record_id":"24","record_module":"Accounts","api_date_now":"2017-09-04 09:47:16"}]}
```

#### دریافت یک رکورد با استفاده از شناسه رکورد (CRMID)

 در مثال زیر اطلاعات یک سازمان با شناسه رکورد 3 انتخاب می گردد

```
http://yourcrm.com/modules/ParsVT/ws/Accounts/3/f7171f3d8e13326762a45641c2dd1e39

یا

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Accounts&id=3&token=f7171f3d8e13326762a45641c2dd1e39
```

نتیجه:

```
{"success":true,"result":{"accountname":"MEDIA 3+","account_no":"ACC1","phone":"","website":"","fax":"","tickersymbol":"","otherphone":"","account_id":"0","email1":"","employees":"0","email2":"","ownership":"","rating":"","industry":"","siccode":"","accounttype":"","annual_revenue":"0.00000000","emailoptout":"0","notify_owner":"0","assigned_user_id":"1","createdtime":"2016-10-28 14:40:37","modifiedtime":"2017-09-04 09:29:15","modifiedby":"1","bill_street":"34 all\u00e9e des Fr\u00eanes","ship_street":"34 all\u00e9e des Fr\u00eanes","bill_city":"Champs sur Marne","ship_city":"Champs sur Marne","bill_state":"","ship_state":"","bill_code":"77420","ship_code":"77420","bill_country":"France","ship_country":"France","bill_pobox":"","ship_pobox":"","description":"","campaignrelstatus":"","isconvertedfromlead":"0","record_id":"3","record_module":"Accounts","api_date_now":"2017-09-04 09:53:04"}}
```

#### دریافت مقادیر فهرست انتخابی

شما می توانید مقادیر فهرست انتخابی یک فیلد در یک ماژول را دریافت نمایید
برای این منظور به سادگی نام ماژول و نام فیلد فهرست انتخابی را وارد نمایید


```
http://yourcrm.com/modules/ParsVT/ws/Accounts/picklist/rating/f7171f3d8e13326762a45641c2dd1e39

یا

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Accounts&picklist=rating&token=f7171f3d8e13326762a45641c2dd1e39
```

نتیجه:

```
{"success":true,"result":{"values":{"Acquired":"Acquired","Active":"Actif","Market Failed":"Market Failed","Project Cancelled":"Project Cancelled","Shutdown":"Shutdown"}}}
```

همچنین شما میتوانید به سادگی روابط بین فهرست های انتخابی را در صورت وجود دریافت کنید برای این منظور تنها کافیست پارامتر ```&picklistdep=1``` را اضافه نمایید

```
http://yourcrm.com/modules/ParsVT/ws/Accounts/picklist/rating/picklistdep/1/f7171f3d8e13326762a45641c2dd1e39

یا

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Accounts&picklist=rating&picklistdep=1&token=f7171f3d8e13326762a45641c2dd1e39
```

نتیجه:

```
{"success":true,"result":{"values":{"Acquired":"Acquired","Active":"Actif","Market Failed":"Market Failed","Project Cancelled":"Project Cancelled","Shutdown":"Shutdown"},"dependencies":{"Acquired":{"accounttype":["Customer","Integrator","Investor","Partner","Press","Prospect","Reseller","Other"]},"__DEFAULT__":{"accounttype":["Analyst","Competitor","Customer","Integrator","Investor","Partner","Press","Prospect","Reseller","Other"]},"Active":{"accounttype":["Analyst","Competitor","Investor","Partner","Press","Prospect","Reseller","Other"]},"Market Failed":{"accounttype":["Analyst","Competitor","Customer","Integrator","Press","Prospect","Reseller","Other"]},"Project Cancelled":{"accounttype":["Analyst","Competitor","Customer","Integrator","Investor","Partner","Reseller","Other"]},"Shutdown":{"accounttype":["Analyst","Competitor","Customer","Integrator","Investor","Partner","Press","Prospect"]}}}}
```

### افزودن رکورد (POST)

شما باید از توکن ایجاد شده در مرحله احرازهویت برای تمام فراخوانی ها استفاده نمایید
در مثال های پایین مااز ماژول سازمان ها استفاده کردیم اما شما می توانید از این متد در تمامی ماژول ها استفاده نمایید

برای ایجاد یک رکورد جدید شما باید همه فیلدهای ستاره دار و الزامی را تکمیل نمایید، وارد کرد سایر فیلد های عادی الزامی نمی باشد
برای استفاده از یک فیلد شما باید از نام فیلد fieldname استفاده نمایید (این نام در جدول vtiger_field قابل مشاهده می باشد).

```
آدرس:

http://localhost/vtiger6.5/modules/ParsVT/ws/Accounts/f7171f3d8e13326762a45641c2dd1e39

یا 

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Accounts&token=f7171f3d8e13326762a45641c2dd1e39

اطلاعات جهت ارسال:

accountname=ParsVT&email1=parsvtiger@gmail.com&phone=+989138086200&bill_street=100 street beta test\r\nBat. B&bill_code=34000&bill_city=Montpellier&bill_country=France
```

نتیجه:
```
{"success": true,"result": 25}

//25 is the ID of the new created entity
```

### بروزرسانی یک رکورد (PUT یا POST)

شما باید از توکن ایجاد شده در مرحله احرازهویت برای تمام فراخوانی ها استفاده نمایید
در مثال های پایین مااز ماژول سازمان ها استفاده کردیم اما شما می توانید از این متد در تمامی ماژول ها استفاده نمایید

برای بروزرسانی یک رکورد ، باید شناسه آن (crmid) و مقادیر فیلدهای مورد نظر برای بروزرسانی را مشخص کنید.

برای استفاده از یک فیلد شما باید از نام فیلد fieldname استفاده نمایید (این نام در جدول vtiger_field قابل مشاهده می باشد).

```
آدرس:

http://localhost/vtiger6.5/modules/ParsVT/ws/Accounts/25/f7171f3d8e13326762a45641c2dd1e39

یا 

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Accounts&id=25&token=f7171f3d8e13326762a45641c2dd1e39

اطلاعات جهت ارسال:

accountname=ParsVT&email1=parsvtiger@gmail.com
```

نتیجه:
```
{"success": true,"result": 25}

//25 is the ID of the updated entity
```

### حذف یک رکورد (DELETE)

شما باید از توکن ایجاد شده در مرحله احرازهویت برای تمام فراخوانی ها استفاده نمایید
در مثال های پایین مااز ماژول سازمان ها استفاده کردیم اما شما می توانید از این متد در تمامی ماژول ها استفاده نمایید

برای حذف یک رکورد شما باید آی دی رکورد را مشخص نمایید

```
http://yourcrm.com/modules/ParsVT/ws/Accounts/25/f7171f3d8e13326762a45641c2dd1e39

یا

http://yourcrm.com/modules/ParsVT/ws/index.php?module=Accounts&id=25&token=f7171f3d8e13326762a45641c2dd1e39
```

نتیجه:

```
{"success": true,"result": true}
```
