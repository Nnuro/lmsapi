from django.db import models

# Create your models here.

from apps.utils.models import Timestamps


class Course( models.Model):
    title = models.CharField(max_length=100, unique=True)
    description = models.TextField()
    # lecturer_name = models.CharField(max_length=100, default='',blank=True)

    course_content_one = models.TextField()
    course_content_two = models.TextField(null=True)
    course_content_three = models.TextField(null=True)
    course_content_four = models.TextField(null=True)
    course_content_five = models.TextField(null=True)
    date = models.DateField()
    duration = models.IntegerField(help_text='Enter number of hours', null=True)
    video_url = models.CharField(max_length=255, null=True)
    resource_url = models.CharField(max_length=255, null=True)
    is_required = models.BooleanField(default=True, null=True)
