### ابزار کنسول 
این ابزار CLI (واسط خط فرمان - Command Line Interface) به شما کمک می کند تا پیاده سازی ساختار ماژول، قالب و بسته زبان برای ویتایگر را دریافت کنید.

 <br>
 <br>
 
 ### شروع به کار
برای شروع با کار و ورود به محیط CLI در سیستم عامل ویندوز وارد Command Prompt و در محیط Linux وارد Terminal شوید، وارد مسیر روت ویتایگر شوید و دستور زیر را اجرا کنید:
```
cd VTIGER_ROOT_DIRECTORY
php -f modules/ParsVT/console.php
```

پس از اجرا محیط زیر را مشاهده خواهید کرد:
```
  _____                __      __ _______
  |  __ \               \ \    / /|__   __|
  | |__) |__ _  _ __  ___\ \  / /    | |    ___  ___   _ __ ___
  |  ___// _` || '__|/ __|\ \/ /     | |   / __|/ _ \ | '_ ` _ \
  | |   | (_| || |   \__ \ \  /      | | _| (__| (_) || | | | | |
  |_|    \__,_||_|   |___/  \/       |_|(_)\___|\___/ |_| |_| |_|



  Welcome to ParsVT CRM Console.
  This tool will enable you to get started with developing extensions with ease.
  Have a good time. Press CTRL+C or type "exit" to quit.
  Choose the options below:
  1. Create New Module.
  2. Create New Layout.
  3. Create New Language Pack.
  4. Create Test Language Pack.
  5. Import Module.
  6. Update Module.
  7. Remove Module.
  Enter your choice:

```
 <br>
 <br>

###  گزینه های قابل انتخاب

* گزینه Create New Module به شما اجازه ساخت ماژول جدید در ویتایگر را میدهد
* گزینهCreate New Layout به شما اجازه ساخت ساختار یک قالب جدید در ویتایگر را میدهد
* گزینه Create New Language Pack به شما اجازه ساخت یک بسته زبان جدید در ویتایگر را میدهد
* گزینه Create Test Language Pack به شما اجازه ساخت یک بسته زبان تستی در ویتایگر را میدهد
* گزینه Import Module به شما اجازه نصب ماژول جدید از طریق آدرس فایل نصب در ویتایگر را میدهد
* گزینه Update Module به شما اجازه بروزرسانی ماژول موجود از طریق آدرس فایل نصب در ویتایگر را میدهد
* گزینه Remove Module به شما اجازه حذف ماژول های موجود در ویتایگر را میدهد

 
 <br>
 <br>

#### ساخت ماژول جدید

```
Enter your choice: 1
>>> MODULE <<<
Enter module name: MySandboxModule
Entity field (Name): name
Creating ...DONE.
```
 
برای این متد تنها کافی است نام ماژول و سپس نام فیلد اصلی را وارد نمایید.
همچنین ماژول ساخته شده برای زبان فارسی دارای بسته زبان ترجمه شده خواهد بود
 
 <br>
 <br>

#### ساخت قالب جدید
این متد فایل های پایه قالب را می سازد و شما باید به صورت تجربی کد های مورد نظر خود را در فایل ها جایگذاری نمایید. این روش تجربی است و باید توسط توسعه دهنده صورت پذیرد.
 
 
 <br>
 <br>

#### ساخت بسته زبان جدید و تستی
این متد به شما اجازه ساخت زبان جدید از طریق cli را میدهد

```
Enter your choice: 3
>>> LANGUAGE <<<
Enter (languagecode_countrycode): kn_in
Creating ...DONE.
```

 <br>
 <br>

#### نصب ماژول 
این متد به شما اجازه نصب ماژول جدید از طریق cli را میدهد

```
Enter package path: /Downloads/OthModule.zip
Importing ...DONE.
```

> ``📝`` نکته: 
> این متد با دستور زیر نیز به صورت خودکار انجام می گردد

```
 php -f modules/ParsVT/console.php – -–import=/Downloads/OthModule.zip
 ```


 <br>
 <br>

#### بروزرسانی ماژول
این متد به شما اجازه بروزرسانی ماژول موجود از طریق cli را میدهد

```
Enter package path: /Downloads/OthModule-v2.zip
Updating ...DONE.
```

> ``📝`` نکته:
> این متد با دستور زیر نیز به صورت خودکار انجام می گردد

```
php -f vtlib/tools/console.php – -–update=/Downloads/OthModule-v2.zip
 ```


 <br>
 <br>


#### حذف ماژول
این متد به شما اجازه حذف ماژول موجود از طریق cli را میدهد

```
  Removing ...  DONE.
```

> ``📝`` نکته:
> این متد با دستور زیر نیز به صورت خودکار انجام می گردد

```
php -f vtlib/tools/console.php – -–remove=OthModule
 ```


 <br>
 <br>