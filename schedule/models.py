from django.db import models
from django.utils import timezone
from django.core.validators import FileExtensionValidator, MaxValueValidator, MinValueValidator


class Schedule(models.Model):
    CATEGORY_MASTER = [
        ('U-12', 'U-12'),
        ('U-11', 'U-11'),
        ('U-10', 'U-10'),
        ('U-9', 'U-9'),
        ('U-8', 'U-8'),
        ('U-7', 'U-7'),
        ('ALL', 'ALL'),
    ]

    class Meta:
        verbose_name_plural = 'スケジュール'
    event_date = models.DateTimeField('開催日', default=timezone.now)
    category = models.CharField('対象学年', max_length=10, choices=CATEGORY_MASTER)
    title = models.CharField('タイトル', max_length=250)
    place = models.CharField('開催地', max_length=250)
    content = models.TextField('内容', max_length=800, null=True, blank=True)
    url = models.URLField('参考URL', null=True, blank=True)
    attach = models.ImageField(
        verbose_name='添付ファイル',
        upload_to='uploads/%Y/%m/',
        null=True,
        blank=True,
        validators=[FileExtensionValidator(['jpg', 'png', 'pdf'])],
    )
    sort_number = models.IntegerField(
        verbose_name='表示順序',
        default=0,
        null=True,
        blank=True,
        validators=[MinValueValidator(0),
                    MaxValueValidator(10)],
        help_text = '同日付内での表示順。数値の低い順から表示される。'
    )
    created_date = models.DateTimeField('作成日', default=timezone.now)
    updated_date = models.DateTimeField('更新日', default=timezone.now)

    def __str__(self):
        return self.event_date.strftime('%Y年%m月%d日') + ' ' + self.category + ' ' + self.title
