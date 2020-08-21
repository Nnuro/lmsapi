from django.contrib import admin

# Register your models here.
from .models import Certificate


class CertificateAdmin(admin.ModelAdmin):
    list_display = ('name', 'created_at', 'updated_at')
    search_fields = ('name',)


admin.site.register(Certificate, CertificateAdmin)