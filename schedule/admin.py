from django.contrib import admin
from .models import Schedule

class ScheduleAdmin(admin.ModelAdmin):
    """
    docstring
    """
    list_display = ('event_date', 'category', 'title')
    ordering = ('event_date',)
    list_filter = ('event_date', 'category',)

admin.site.register(Schedule, ScheduleAdmin)
