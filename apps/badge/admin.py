from django.contrib import admin

# Register your models here.
from .models import  Badge


class BadgeAdmin(admin.ModelAdmin):
    list_display = ('name', 'created_at', 'updated_at')
    search_fields = ('name',)


admin.site.register( Badge, BadgeAdmin)