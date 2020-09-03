from django.db import models

# Create your models here.

from apps.utils.models import Timestamps
from apps.courses.models import Course


class Lesson(models.Model):
    title = models.CharField(max_length=100, unique=True)
    description = models.TextField()
    order_number = models.IntegerField(unique=True, null=False)
    # lecturer_name = models.CharField(max_length=100, default='',blank=True)

    lesson_content_one = models.TextField()
    lesson_content_two = models.TextField(null=True, blank=True)
    lesson_content_three = models.TextField(null=True, blank=True)

    date = models.DateField(null=True, blank=True)

    duration = models.IntegerField(
        help_text='Enter number of hours', null=True, blank=True)

    video1_url = models.CharField(max_length=255, null=True, blank=True)
    video2_url = models.CharField(max_length=255, null=True, blank=True)

    resource1_url = models.CharField(max_length=255, null=True, blank=True)
    resource2_url = models.CharField(max_length=255, null=True, blank=True)


    course = models.ForeignKey(Course, on_delete=models.CASCADE)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['order_number']

