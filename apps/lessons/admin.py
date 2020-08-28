from django.contrib import admin

# Register your models here.
from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Lesson


class LessonAdmin(admin.ModelAdmin):
    list_display = ('title', 'order_number', 'date')
    search_fields = ('title', 'order_number')


admin.site.register(Lesson, LessonAdmin)
