# ميزة الكتابة التدريجية (Typewriter Effect)

## نظرة عامة
تم إضافة ميزة الكتابة التدريجية للرسائل القادمة من AI في تطبيق الـ chatbot. هذه الميزة تعرض النص حرفاً حرفاً أمام المستخدم، مما يخلق تجربة تفاعلية أكثر جاذبية.

## الميزات المضافة

### 1. الكتابة التدريجية الأساسية
- عرض النص حرفاً حرفاً
- مؤشر يومض أثناء الكتابة
- إمكانية التحكم في السرعة

### 2. التحكم في السرعة
5 مستويات سرعة متاحة:
- **سريع جداً**: 15 مللي ثانية
- **سريع**: 30 مللي ثانية (افتراضي)
- **متوسط**: 50 مللي ثانية
- **بطيء**: 80 مللي ثانية
- **بطيء جداً**: 120 مللي ثانية

### 3. أزرار التحكم
- **زر الكتابة**: تشغيل/إيقاف الميزة
- **زر السرعة**: اختيار سرعة الكتابة
- **زر الصوت**: تشغيل/إيقاف صوت الكتابة (مستقبلاً)

### 4. التأثيرات البصرية
- مؤشر يومض أثناء الكتابة
- تأثير تلاشي للرسائل الجديدة
- إيقاف المؤشر عند انتهاء الكتابة

## كيفية الاستخدام

### للمطورين

#### 1. إضافة TypewriterText widget
```dart
TypewriterText(
  text: "النص المراد عرضه",
  duration: Duration(milliseconds: 30),
  showCursor: true,
  playSound: false,
  onComplete: () {
    // يتم استدعاؤها عند انتهاء الكتابة
  },
)
```

#### 2. التحكم من خلال ViewModel
```dart
// تشغيل/إيقاف الميزة
viewModel.useTypewriterEffect = true;

// تغيير السرعة
viewModel.changeTypewriterSpeed(Duration(milliseconds: 50));

// تشغيل/إيقاف الصوت
viewModel.toggleTypewriterSound();
```

#### 3. استخدام في MessageBubble
```dart
MessageBubble(
  text: "النص",
  isUser: false,
  useTypewriter: true,
  typewriterSpeed: Duration(milliseconds: 30),
  playTypewriterSound: false,
)
```

### للمستخدمين

1. **تشغيل الميزة**: اضغط على زر الكتابة (أيقونة لوحة المفاتيح)
2. **تغيير السرعة**: اضغط على زر السرعة واختر السرعة المطلوبة
3. **تشغيل الصوت**: اضغط على زر الصوت (سيتم إضافته مستقبلاً)

## الملفات المضافة/المعدلة

### ملفات جديدة:
- `lib/features/chatbot/presentation/view/widget/typewriter_text.dart`

### ملفات معدلة:
- `lib/features/chatbot/presentation/view/widget/message_bubble.dart`
- `lib/features/chatbot/presentation/view/chatbot_tab.dart`
- `lib/features/chatbot/presentation/manager/chatbot_view_model.dart`

## التخصيص

### تغيير السرعة الافتراضية
```dart
// في chatbot_view_model.dart
Duration typewriterSpeed = const Duration(milliseconds: 50); // تغيير من 30 إلى 50
```

### إضافة سرعات جديدة
```dart
// في chatbot_view_model.dart
static const List<Duration> availableSpeeds = [
  Duration(milliseconds: 10), // إضافة سرعة جديدة
  Duration(milliseconds: 15),
  Duration(milliseconds: 30),
  Duration(milliseconds: 50),
  Duration(milliseconds: 80),
  Duration(milliseconds: 120),
];
```

### تخصيص المؤشر
```dart
// في typewriter_text.dart
WidgetSpan(
  child: Container(
    width: 3, // تغيير العرض
    height: (widget.style?.fontSize ?? 16) + 4,
    margin: const EdgeInsets.only(left: 2),
    decoration: BoxDecoration(
      color: Colors.blue, // تغيير اللون
      borderRadius: BorderRadius.circular(2), // تغيير الشكل
    ),
  ),
),
```

## ملاحظات تقنية

1. **الأداء**: الميزة تستخدم Timer للتحكم في السرعة
2. **الذاكرة**: يتم تنظيف الـ Timer عند dispose
3. **التوافق**: تعمل مع جميع أحجام النصوص
4. **التخصيص**: سهلة التخصيص والتوسيع

## التطويرات المستقبلية

1. **إضافة أصوات الكتابة**: استخدام SystemSound أو ملفات صوت مخصصة
2. **تأثيرات إضافية**: تأثيرات بصرية أكثر تعقيداً
3. **تخصيص أكثر**: إمكانية تخصيص المؤشر والألوان
4. **حفظ الإعدادات**: حفظ تفضيلات المستخدم 