### مقدمه
در گردش کار های ویتایگر در بخش عملیات های ایجاد رکورد و بروزرسانی فیلد می توانید از توابع پیش فرض و توابع اضافی که توسط این بخش معرفی می شوند استفاده نمایید. توابع محاسباتی مانند الحاق متون، جمع ، تفریق روزها و غیره را انجام می دهند.
  
 <br>
 <br>
### توابع
لیست زیر تمام توابع ارائه شده توسط Vtiger در نسخه اپن سورس میباشد.
 
 <br>
 <br>
#### 💡 concat (a, b)
این تابع دو یا چند فیلد را ترکیب می کند. شما می توانید از این، به خصوص برای ترکیب فیلدهای متنی استفاده کنید.

 برای مثال، اگر فیلدی به نام نام کامل دارید، می‌توانید نام و نام خانوادگی را با استفاده از concat(firstname,’ ‘, lastname) ترکیب کنید.
 
تابع concat() می تواند هر تعداد رشته ای را که با کاما از هم جدا شده اند ترکیب کند. برای مثال، برای تشکیل فیلد آدرس صورت‌حساب، قالب به صورت  concat(City,’ ‘,Street,’ ‘,Postalcode)است.
 
توجه : برای اضافه کردن فاصله بین دو رشته، از نقل قول های تک با فاصله سفید بین آنها استفاده کنید. به عنوان مثال concat(firstname,’ ‘,lastname)
 
 <br>
 <br>
#### 💡time_diffdays(a,b)
این تابع فیلدهای تاریخ را به عنوان ورودی می گیرد. تفاوت زمان را بر حسب روز بین دو فیلد محاسبه می کند.
 
به عنوان مثال، می خواهید از دوره پشتیبانی یک مخاطب مطلع شوید. تفاوت را می توان با استفاده از  time_diffdays (support_end_date, support_start_date) محاسبه کرد.
 
نتیجه، تاریخ پایان پشتیبانی از تاریخ شروع پشتیبانی  کسر و نتیجه را به صورت تعداد روز بازیابی میکند.
 
 <br>
 <br>
#### 💡time_diffdays (a)
این تابع تفاوت بین تاریخ جاری و فیلد تاریخ را ارائه می دهد.
 
به عنوان مثال
* می خواهید بدانید چند روز از تشکیل یک تیکت گذشته است. برای این کار باید از تابع time_diffdays(createdtime). استفاده کنید. در پس زمینه، تابع به این صورت عمل می کند - time_diffdays(current date - created time)
* برای به روز رسانی فیلد سن در سرنخ ها یا مخاطبین بسته به تاریخ تولد، تابع (time_diffdays(birthday)/365) است.
 
 <br>
 <br>
#### 💡time_diff(a,b)
این تابع فیلدهای تاریخ را به عنوان ورودی می گیرد و اختلاف زمان بین فیلدها را بر حسب ثانیه محاسبه می کند. 
 
 به عنوان مثال، برای به روز رسانی فیلد زمان سپری شده بسته به زمان ایجاد و زمان اصلاح شده یک رکورد، باید از time_diff(modifiedtime,createdtime)  استفاده کنید.

 تابع تفریق را به صورت زیر انجام می دهد  -  time_diff(modifiedtime - createdtime)
 
 <br>
 <br>
#### 💡 time_diff (a)
این تابع تفاوت زمانی (بر حسب ثانیه) بین تاریخ جاری و فیلد تاریخ را نشان می دهد.
 
 به عنوان مثال، می خواهید بدانید که چند ثانیه از ایجاد یک تیکت گذشته است. برای این کار باید از تابع time_diff(createdtime)  استفاده کنید.

 در پس زمینه، تابع به این صورت عمل می کند - time_diff(current date - created time)
  
 <br>
 <br>
 #### 💡add_days(datefield, noofdays)
این تابع به کاربران اجازه می دهد تاریخ جدیدی را محاسبه کنند. دو ورودی این تابع یک تاریخ و یک عدد که با کاما از هم جدا شده اند می باشد. این عدد را به تاریخ اضافه شده و یک تاریخ جدید ایجاد می کند.
 
 به عنوان مثال، شما می خواهید یک دوره پشتیبانی 60 روزه را به مشتری ارائه دهید و تاریخ پایان را در قسمت تاریخ پایان پشتیبانی به روز کنید.

 تابع add_days (start_date,60) خواهد بود، که در آن پارامتر اول یک فیلد Date و پارامتر دوم تعداد روزها است.
 
 بنابراینadd_days (2020-08-16,60)  به تاریخ 2020-10-15 منجر می شود.
 
 <br>
 <br>
#### 💡sub_days(datefield, noofdays)
این تابع به کاربران اجازه می دهد تا با گرفتن دو ورودی شامل یک تاریخ و یک عدد جدا شده با کاما، یک تاریخ جدید را محاسبه کنند. این عدد را از تعداد روز تاریخ کسر می کند. 
 
به عنوان مثال، برای ارسال ایمیل به مشتری 'n' روز قبل از تاریخ پایان پشتیبانی، می توانید یک فیلد سفارشی به نام تاریخ اعلان ایجاد و به روز کنید. تابع sub_days (support_end_date,n) خواهد بود.
 
توجه : 
* اگر فقط تعداد روزها به عنوان input=t داده شود و فیلد Date ارائه نشود، تاریخ فعلی برای محاسبه در نظر گرفته می شود. به عنوان مثال، sub_days(3)  مشابه  sub_days(current date, 3)کار می کند.
* توابعadd_time()  و sub_time()  نیز مشابه add_days()  و sub_days()  کار می کنند.
  
 <br>
 <br>
 #### 💡add_time(timefield,minutes)
 این تابع با افزودن زمان و دقیقه مشخص شده زمان جدیدی را محاسبه می کند.

 به عنوان مثال، در نظر بگیرید که یک موسسه آموزشی در حال برگزاری آزمون آنلاین است. برای به روز رسانی زمان پایان امتحان، تابع را می توان به صورت زیر استفاده کرد 

 add_time(exam_start_time, 180)
   
 <br>
 <br>
 #### 💡sub_time(timefield,minutes)
این تابع با کم کردن دقیقه های مشخص شده از زمان ورودی زمان جدیدی را محاسبه می کند.
 
 به عنوان مثال، اگر در شرکت خود یک استخدام انجام می دهید، می توانید زمان ورود مصاحبه شونده ها را با استفاده از تابع sub_time (interview_start_time, 90) تنظیم کنید.
   
 <br>
 <br>
 #### 💡today
این تابع تاریخ جاری را واکشی می کند. وقتی این تابع را از بخش عبارت گردش کار انتخاب می کنید، به صورت get_date ('today') ظاهر می شود.
 
به عنوان مثال، زمانی که وضعیت فاکتور را به پرداخت شده تغییر می کند و میخواهید تاریخ دریافت پرداخت را به روز کنید، از get_date ('today') استفاده کنید. 
   
 <br>
 <br>
 #### 💡tomorrow
این تابع تاریخ روز بعد را واکشی می کند. وقتی این تابع را از بخش عبارت گردش کار انتخاب می کنید ، به صورت get_date ('tomorrow') ظاهر می شود.
 
به عنوان مثال، اگر وضعیت یک پروژه در روز جاری به آغاز شده تغییر کند، تاریخ شروع پروژه با تاریخ فردا به روز می شود. بنابراین، عبارت مورد استفاده به صورت get_date ('tomorrow') خواهد بود. 
   
 <br>
 <br>
 #### 💡yesterday
این تابع تاریخ روز قبل را واکشی می کند. وقتی این تابع را از بخش عبارت گردش کار انتخاب می کنید ، به صورت get_date ('دیروز') ظاهر می شود.
 
 <br>
 <br>
#### 💡 power(base,exponential)
 این تابع برای محاسبه توان یک عدد صحیح مانند مربع یا مکعب یک عدد صحیح استفاده می شود.
 
 به عنوان مثال، 2^3=8 را می توان با استفاده از تابع power (2،3) شبیه سازی کرد.
 
 <br>
 <br>
### توابع پارس ویتایگر
لیست زیر تمام توابع ارائه شده توسط پارس ویتایگر میباشد.
 
 <br>
 <br>
#### 💡 translate(string,module)
 این تابع برای ترجمه مقدار یک رشته در گردش کار استفاده می شود.
 پارامتر های string با مقدار رشته مورد نظر و تابع module با نام ماژولی که ترجمه از آن خوانده می شود مقدار دهی می شود.
 در صورت خالی بودن module بسته زبان عمومی ویتایگر انتخاب میگردد. 
 به عنوان مثال، میخواهید پیامکی ارسال کنید و در آن وضعیت مرحله فروش را اطلاع رسانی کنید با توجه به این که sales_stage در بانک اطلاعاتی ویتایگر به صورت انگلیسی دخیره می شود باید از تابع به فرمت زیر استفاده نمایید:

 translate(sales_stage,'Potentials')
 
 <br>
 <br>
#### 💡convert_date_to_user_format(date)
این تابع برای تبدیل یک فیلد تاریخ یا تاریخ و زمان به فرمت پیش فرض کاربر جاری استفاده می شود.
 پارامتر date  با مقدار رشته مورد نظر یا فیلد تاریخ مقدار دهی می شود 
 
 به عنوان مثال
 
 convert_date_to_user_format (modifiedtime)
 
 <br>
 <br>
#### 💡jalali_dateformat(date,format)
این تابع برای تبدیل یک فیلد تاریخ یا تاریخ و زمان به فرمت دلخواه به صورت شمسی استفاده می شود.
 پارامتر date  با مقدار رشته مورد نظر یا فیلد تاریخ و فیلد format با فرمت دلخواه کاربر مقدار دهی می شود 
 
 در صورت خالی بودن مقدار format به صورت پیش فرض فرمت Y-m-d استفاده خواهد شد.
 
 به عنوان مثال

jalali_dateformat(createtime,’Y/m/d H:i:s’)
 
 <br>
 <br>
#### 💡gregorian_dateformat(date,format)
این تابع برای تبدیل یک فیلد تاریخ یا تاریخ و زمان به فرمت دلخواه به صورت میلادی استفاده می شود.

 پارامتر date  با مقدار رشته مورد نظر یا فیلد تاریخ و فیلد format با فرمت دلخواه کاربر مقدار دهی می شود 
 
 در صورت خالی بودن مقدار format به صورت پیش فرض فرمت Y-m-d استفاده خواهد شد.
 
 به عنوان مثال
 
 gregorian_dateformat (createtime,’Y/m/d H:i:s’)
 
 <br>
 <br>
#### 💡str_replace(find,replace,string)
این تابع برای جایگزین کردن یک عبارت با عیارتی دیگر در یک فیلد یا رشته می باشد.

در خروجی رشته که مقادیر آن با مقادیر دیگری جایگزین شده اند را برمی گرداند. 

 find: رشته ای که قرار است در رشته ی دیگری (پارامتر سوم) جستجو شده و پیدا شود.
 
 replace: مقداری که قرار است در رشته ی مورد نظر جایگزین مقدار دیگری شود.
 
 string: رشته میزبان که قرار است در آن جستجو صورت گیرد.
 
 به عنوان مثال
 
 str_replace(‘reza’,’ali’, description)
 
 <br>
 <br>
#### 💡number_to_words(number)
این تابع برای تبدیل کردن یک عدد یا فیلد عددی به حروف به صورت انگلیسی می باشد.
 
 به عنوان مثال
 
 number_to_words(subtotal)
 
 <br>
 <br>
#### 💡persian_number_to_words(number)
این تابع برای تبدیل کردن یک عدد یا فیلد عددی به حروف به صورت فارسی بدون تبدیل ارقام اعشار می باشد.
 
 به عنوان مثال
 
 persian_number_to_words(subtotal)
 
 <br>
 <br>
#### 💡persian_number_to_words_full(number)
این تابع برای تبدیل کردن یک عدد یا فیلد عددی به حروف به صورت فارسی به همراه تبدیل اعداد اعشار می باشد.
 
 به عنوان مثال
 
 persian_number_to_words_full(subtotal)
 
 <br>
 <br>
#### 💡getgroupname(id)
این تابع برای واکشی نام یک گروه کاربری در ویتایگر از یک عدد یا فیلد ارجاع به می باشد.
 
 به عنوان مثال
 
 getgroupname(3)
 
 <br>
 <br>
#### 💡getusername(id)
این تابع برای واکشی نام کاربری یک کاربر در ویتایگر از یک عدد یا فیلد ارجاع به می باشد.
 
 به عنوان مثال
 
 getusername(assigned_user_id)
 
 <br>
 <br>
#### 💡get_owner(id)
این تابع برای واکشی نام یک کاربر در ویتایگر از یک عدد یا فیلد ارجاع به می باشد.
 
 به عنوان مثال
 
 get_owner (assigned_user_id)
 
 <br>
 <br>
#### 💡getuserfullname(id)
این تابع برای واکشی نام و نام حانوادگی یک کاربر در ویتایگر از یک عدد یا فیلد ارجاع به می باشد.
 
 به عنوان مثال
 
 getuserfullname(1)
 
 <br>
 <br>
#### 💡getuserfullnamebyids(id)
این تابع برای واکشی نام و نام خانوادگی در ویتایگر از یک عدد یا فیلد ارجاع به یا لیست کاربران می باشد.
 
 به عنوان مثال
 
 getuserfullnamebyids(1,5)
 
 <br>
 <br>
#### 💡getrecordlabel(id)
 این تابع برای واکشی لیبل یک رکورد در ویتایگر از یک عدد یا فیلد شماره رکورد می باشد.
 
 به عنوان مثال
 
 getrecordlabel(1900)
  
 <br>
 <br>
#### 💡makerandompassword()
 این تابع برای ایجاد یک رشته تصادفی در ویتایگر جهت استفاده در سیستم می باشد.
 
 به عنوان مثال
 
 makerandompassword()
 
 <br>
 <br>
#### 💡cityname(id)
 این تابع برای واکشی نام یک شهر در ویتایگر از یک عدد یا فیلد لیست شهرهای ایران می باشد.
 
  به عنوان مثال

cityname(104)
 
 <br>
 <br>
#### 💡striphtmltags(contents)
 این تابع برای حذف تگ های PHP و HTML از رشته ورودی می باشد.

 به عنوان مثال

striphtmltags(description)
 
 <br>
 <br>
#### 💡url_shortener(url,onetime,full,rewrite)
این تابع برای کوتاه کردن آدرس یک url  ورودی از یک آدرس وب سایت یا فیلد url می باشد.

 پارامتر onetime در صورتی که برابر 1 باشد پس از بازدید اول از آدرس کوتاه شده لینک منقضی می شود و در صورت نیاز به دائمی بودن باید مقدار آن برابر 0 قرار داده شود.
 
به عنوان مثال

url_shortener(‘http://parsvt.com’,0)

پارامتر full در صورتی که برابر 0 باشد آدرس کوتاه کننده را فقط به صورت مسیر و کوئری نمایش میدهد و در عیر این صورت به صورت کامل به همراه آدرس سی آر ام بر میگرداند. از این موضوع میتوانید برای وقتی که سی آر ام را با چند آدرس مختلف باز میکنید استفاده نمایید.

به عنوان مثال

url_shortener(‘http://parsvt.com’,0 , 0)

  پارامتر rewrite در صورتی که تنظیمات htaccess را از بخش تنظیمات پارس ویتایگر - تنظیمات متفرقه انجام داده باشید و مد rewrite در سرور فعال باشد در آدرس خروجی به جای آدرس shorturl.php فقط از پارامتر آدرس استفاده میکند. بدیهی است که در صورتی که تنظیمات htaccess انجام نشده باشد خطای 404 دربافت خواهید کرد.

 به عنوان مثال
 
 url_shortener(‘http://parsvt.com’, 0 , 1 , 1)


 <br>
 <br>
#### 💡pdfmaker_link(id,templateid,language)
این تابع برای نمایش لینک خروجی یه قالب PDFMaker بدوم نیاز به ورود مشترک استفاده می شود.  ورودی آن به صورت آی دی رکورد مبدا به صورت الزامی و آی دی قالب PDFMakerX و زبان خروجی به صورت اختیاری می باشد.

 پارامتر language باید به فرمت کد زبان مثلا fa_ir وارد شود و در صورت خالی بودن زبان پیشفرض انتخاب می گردد.

پارامتر templateid در صورت خالی بودن اولین قالب در دسترس را انتخاب میکند
 
 به عنوان مثال
 
pdfmaker_link(2281,4,‘fa_ir’)
 
 <br>
 <br>
### استفاده از if-esle
برای جلوگیری از ایجاد چندین گردش کار برای به روز رسانی یک فیلد واحد در یک رکورد، می توانید از عبارت if-else استفاده کنید.
 
 به عنوان مثال، برای به روز رسانی فیلد  احتمال موفقیت فرصت فروش با تغییر مرحله فروش یک فرصت، عبارت به صورت زیر است:
 
 if sales_stage=='Closed Lost' then 0 else if sales_stage=='Prospecting' then 10 else if sales_stage=='Perception Analysis' then 50 else if sales_stage=='Proposal or Price Quote' then 60 else if sales_stage=='Agreement' then 80 else 100 end

 ##### قوانین ایجاد عبارات
* مقادیر فیلد متنی را در داخل تک کوتیشن (' ') تعریف کنید. برای مثال  first_name=='Reza'
* عبارات را با حروف کوچک بنویسید.
* از عملگرهای حسابی برای انجام جمع (+)، تفریق (-)، ضرب (*) و تقسیم (/) استفاده کنید. 
    + 	می توانید این عملیات را بین دو یا چند فیلد، مقدار یا ترکیبی از فیلدها و مقادیر انجام دهید.
* فقط از عملگرهای رابطه ای زیر در عبارات استفاده کنید.
    + 	توجه : استفاده از عملگر انتساب (=) شرط if را بررسی نمی کند و مستقیماً آخرین شرط else  را اجرا می کند. شما باید فقط از عملگر رابطه ای (==) استفاده کنید.
 

         <table style="    width: 100%; border:0.75pt solid #000000; border-collapse:collapse">
            <tr>
               <td style="vertical-align:top; background-color:#cfe2f3">
                  <p style="text-align:center; "><span style="font-weight:bold; color:#434343">اپراتور</span></p>
               </td>
               <td style="vertical-align:top; background-color:#cfe2f3">
                  <p style="text-align:center; "><span style="font-weight:bold; color:#434343">شرح</span></p>
               </td>
            </tr>
            <tr>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343" dir="ltr">==</span></p>
               </td>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343">مساوی با</span></p>
               </td>
            </tr>
            <tr>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343" dir="ltr">!=</span></p>
               </td>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343">برابر نیست با</span></p>
               </td>
            </tr>
            <tr>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343" dir="ltr">&gt;</span></p>
               </td>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343">بزرگتر از</span></p>
               </td>
            </tr>
            <tr>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343" dir="ltr">&lt;</span></p>
               </td>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343">کوچکتر از</span></p>
               </td>
            </tr>
            <tr>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343" dir="ltr">&gt;=</span></p>
               </td>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343">بزرگتر یا مساوی با</span></p>
               </td>
            </tr>
            <tr>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343" dir="ltr">&lt;=</span></p>
               </td>
               <td style="vertical-align:top">
                  <p style="text-align:center; "><span style="color:#434343">کوچکتر یا مساوی با</span></p>
               </td>
            </tr>
         </table>
  
   
* از مقادیر باینری برای فیلدهای چک باکس استفاده کنید.
 
    +  0 برای غلط یا خیر.

    + 1 برای درست یا بله.

* پشتیبانی از AND و OR:

    + AND: همه شرایط باید مطابقت داشته باشند. 
      * به عنوان مثال، اگر مرحله فروش یک فرصت واجد شرایط است و نوع کسب و کار موجود است، سپس احتمال را روی 70 تنظیم کنید.
 
 if sales_stage==‘Qualification’ AND type==‘Existing Business’ then 70 end

   + OR: حداقل یکی از شرایط مشخص شده باید مطابقت داشته باشد. 
 
      * به عنوان مثال، اگر مرحله فروش یک معامله از دست رفته است یا آماده فروش نیست، اولویت معامله را روی کم قرار دهید. 
 
 if sales_stage==‘Closed Lost’ OR sales_stage==‘Prospecting’ then ‘Low’ end
 
* بررسی فیلدهای خالی
   + برای بررسی فیلدهای خالی عدد صحیح یا ارز، با 0 مقایسه کنید. برای مثال، اگر Field==0 باشد.
   + برای سایر فیلدها، با 0 یا NULL مقایسه کنید. به عنوان مثال، اگر Field==NULL.
   + توجه : شرط Field==' ' کار نمی کند. 
 
* قوانین دیگر
   + برای فعال کردن یک چک باکس (یا تنظیم آن روی بله)، از 1 استفاده کنید. برای غیرفعال کردن یک چک باکس (یا تنظیم آن بر روی خیر)، از 0 استفاده کنید.
   + مقادیر فیلد در عبارات گردش کار به حروف بزرگ و کوچک حساس هستند. 
    برای مثال، اگر فیلد City دارای مقدار Tehran باشد، نمی‌توانید از city=='tehran' در عبارت استفاده کنید.
      باید از city=='Tehran'  استفاده کنید.
 
   + برای خالی کردن مقدار یک فیلد، از " " یا NULL استفاده کنید.
    
     برای مثال، if contact_name=='Ali' description==NULL.  

### خلاصه

<div dir="rtl" style="text-align:left">
<table style="width:100%; margin-bottom:0pt; border:0.75pt solid #000000; border-collapse:collapse">
   <tr>
      <td style="width:32pt; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle; background-color:#cfe2f3">
         <p dir="rtl" style="text-align:center"><span style="font-family:IRANSansWeb; color:#000000">ردیف</span></p>
      </td>
      <td style="width:214.45pt; border-right:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle; background-color:#cfe2f3">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; font-weight:bold; color:#434343">نام تابع</span></p>
      </td>
      <td style="width:190.05pt; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle; background-color:#cfe2f3">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; font-weight:bold; color:#434343">شرح</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:32.07pt; text-align:center; padding-right:3.93pt; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">concat (a, b)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">دو یا چند رشته</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> "a" </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>و</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> "b" </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>را با هم ترکیب می کند</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="2" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:32.07pt; text-align:center; padding-right:3.93pt; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">time_diffdays(a,b)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">تفاوت بین فیلد تاریخ</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> 'a' </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>و فیلد تاریخ</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> 'b' </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>(</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>a</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> </span><span style="font-family:IRANSansWeb; color:#434343">منهای </span><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343; -aw-import:spaces"><span dir="ltr"></span>&#xa0;</span><span style="font-family:IRANSansWeb; color:#434343">b</span></span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>)</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>را بر حسب روز نشان می دهد</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="3" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:32.07pt; text-align:center; padding-right:3.93pt; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">time_diffdays (a)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">تفاوت بین تاریخ فعلی و فیلد تاریخ</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> 'a' </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>را بر حسب روز نشان می دهد</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="4" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:32.07pt; text-align:center; padding-right:3.93pt; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">time_diff(a,b)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">تفاوت بین فیلد تاریخ</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> 'a' </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>و فیلد تاریخ</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> 'b' </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>را </span><span style="font-family:IRANSansWeb; color:#434343">به ثانیه نشان می دهد</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="5" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:32.07pt; text-align:center; padding-right:3.93pt; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">time_diff (a)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">تفاوت بین تاریخ و زمان فعلی و فیلد تاریخ</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> "a" </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>را </span><span style="font-family:IRANSansWeb; color:#434343"> به ثانیه نشان می دهد</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="6" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:32.07pt; text-align:center; padding-right:3.93pt; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">add_days(a, b)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">تعداد روزهای</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> «b» </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>را به فیلد «تاریخ» در</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> «a» </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>اضافه می‌کند و در نتیجه یک تاریخ ایجاد می‌شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="7" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:32.07pt; text-align:center; padding-right:3.93pt; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <h2 dir="rtl" style="margin-top:18pt; margin-bottom:6pt; text-align:center; font-size:10.5pt"><a name="_Toc114239137" dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">sub_days(a, b)</span></a></h2>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">تعداد روزهای</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> «b» </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>را از فیلد «تاریخ» در</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> «a» </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>کم می کند و در نتیجه یک تاریخ ایجاد می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="8" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:32.07pt; text-align:center; padding-right:3.93pt; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <h2 dir="rtl" style="margin-top:18pt; margin-bottom:6pt; text-align:center; font-size:10.5pt"><a name="_Toc114239138" dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">add_time(timefield,minutes)</span></a></h2>
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343; -aw-import:ignore" dir="ltr">&#xa0;</span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">“minutes”</span></span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> را به </span><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343"><span dir="ltr"></span>“</span><span style="font-family:IRANSansWeb; color:#434343">timefield”</span></span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> </span><span style="font-family:IRANSansWeb; color:#434343">اضافه می کند و در نتیجه زمان جدیدی ایجاد می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="9" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:32.07pt; text-align:center; padding-right:3.93pt; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">sub_time(timefield,minutes)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">“minutes”</span></span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> </span><span style="font-family:IRANSansWeb; color:#434343">را از </span><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343"><span dir="ltr"></span>“</span><span style="font-family:IRANSansWeb; color:#434343">timefield”</span></span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> </span><span style="font-family:IRANSansWeb; color:#434343">کم می کند و در نتیجه زمان جدیدی ایجاد می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="10" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:36pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343" dir="ltr">today</span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">تاریخ فعلی را می دهد</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="11" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:36pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343" dir="ltr">tomorrow</span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">تاریخ روز بعد را می دهد</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="12" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:36pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343" dir="ltr">yesterday</span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">تاریخ روز قبل را می دهد</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="13" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:36pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <h2 dir="rtl" style="margin-top:18pt; margin-bottom:6pt; text-align:center; font-size:10.5pt"><a name="_Toc114239139" dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">power(base,exponential)</span></a></h2>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">توان "</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> base</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>" را با توجه به "</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>exponential</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span>" محاسبه می کند</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="14" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" style="margin-right:36pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">translate(a,b)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای ترجمه متن </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>a</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> از ماژول </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>b</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="15" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">convert_date_to_user_format(date)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای تبدیل تاریخ </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>date</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> به فرمت کاربر استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="16" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">jalali_dateformat(date,format)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای تبدیل تاریخ </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>date</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> به فرمت </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>format</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> به شمسی</span><span style="font-family:IRANSansWeb; color:#434343"> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="17" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">gregorian_dateformat(date,format)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای تبدیل تاریخ </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>date</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> به فرمت </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>format</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> به میلادی</span><span style="font-family:IRANSansWeb; color:#434343"> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="18" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">str_replace(a,b,c)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای تبدیل متن</span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span> a </span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> با متن </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>b</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> در رشته </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>c</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="19" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">number_to_words(number)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای تبدیل </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>number</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> به حروف انگلیسی می باشد</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="20" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">persian_number_to_word(number)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای تبدیل </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>number</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> به حروف فارسی بدون ارقام اعشار می باشد</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="21" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">persian_number_to_word_full(number)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای تبدیل </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>number</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> به حروف فارسی با ارقام اعشار می باشد</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="22" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">getgroupname(id)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای دریافت نام یک گروه کاربری توسط </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>id</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="23" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">getusername(id)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای دریافت نام کاربری توسط </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>id</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="24" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">get_owner(id)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای دریافت نام</span><span style="font-family:IRANSansWeb; color:#434343; -aw-import:spaces">&#xa0; </span><span style="font-family:IRANSansWeb; color:#434343">مالک رکورد توسط </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>id</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="25" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">getuserfullname(id)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای دریافت نام و نام خانوادگی توسط </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>id</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="26" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">getrecordlabel(id)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای دریافت لیبل یک رکورد توسط </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>id</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="27" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">getuserfullnamebyids(ids)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای دریافت نام</span><span style="font-family:IRANSansWeb; color:#434343; -aw-import:spaces">&#xa0; </span><span style="font-family:IRANSansWeb; color:#434343">مالکین رکورد از فیلد لیست کاربران توسط </span><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343"><span dir="ltr"></span>id</span><span style="font-family:IRANSansWeb; color:#434343">s</span></span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="28" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">striphtmltags(content)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای حذف تگ های </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>html</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> و </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>php</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="29" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">cityname(id)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای دریافت نام فیلد شهرهای ایران استفاده میشود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="30" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">makerandompassword()</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-bottom:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای ایجاد یک رشته تصادفی استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="31" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-left:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">url_shortener(url,onetime,full,rewrite)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای کوتاه کردن آدرس </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>url</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
   <tr>
      <td style="width:32pt; border-top:0.75pt solid #000000; border-left:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <ol start="32" type="1" style="margin:0pt; padding-right:0pt">
            <li dir="rtl" class="ListParagraph" style="margin-right:36pt; margin-left:0pt; text-align:center; font-family:IRANSansWeb"><span style="-aw-import:ignore" dir="ltr">&#xa0;</span></li>
         </ol>
      </td>
      <td style="width:214.45pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; border-left:0.75pt solid #000000; padding:4.88pt; vertical-align:top">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span dir="ltr"><span style="font-family:IRANSansWeb; color:#434343">pdfmaker_link(id,templateid,language)</span></span></p>
      </td>
      <td style="width:190.05pt; border-top:0.75pt solid #000000; border-right:0.75pt solid #000000; padding:4.88pt; vertical-align:middle">
         <p dir="rtl" style="text-align:center; line-height:110%; font-size:10.5pt"><span style="font-family:IRANSansWeb; color:#434343">برای 'گرفتن لینک خروجی' </span><span style="font-family:IRANSansWeb; color:#434343" dir="ltr"><span dir="ltr"></span>PDFMaker</span><span style="font-family:IRANSansWeb; color:#434343"><span dir="rtl"></span> استفاده می شود</span></p>
      </td>
   </tr>
</table>
</div>
