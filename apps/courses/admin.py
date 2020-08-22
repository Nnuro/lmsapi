from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Course


class CourseAdmin(admin.ModelAdmin):
    list_display = ('title', 'title', 'date')
    search_fields = ('title', 'title')


admin.site.register(Course, CourseAdmin)
