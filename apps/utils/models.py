from django.db import models

# Create your models here.

# ============================\
# Not need for now
# =============================\


class Timestamps(models.Model):
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateField(auto_now=True)

    class Meta:
        abstract = True