from django.db import models

# Create your models here.

from apps.utils.models import Timestamps


class Course( models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    # lecturer_name = models.CharField(max_length=100, default='',blank=True)

    course_content_one = models.CharField(max_length=300)
    course_content_two = models.CharField(max_length=300)
    course_content_three = models.CharField(max_length=300)
    date = models.DateField()
    duration = models.IntegerField(help_text='Enter number of hours')
    video_url = models.CharField(max_length=255)
    resource_url = models.CharField(max_length=255)
    is_required = models.BooleanField(default=True)
