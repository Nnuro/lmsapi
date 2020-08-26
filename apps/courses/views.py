from django.shortcuts import render

# Create your views here.
from rest_framework import serializers, viewsets

from .models import Course


class CourseLectureSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = ('id', 'title', 'description', 'date', 'duration',
                  'resource_url', 'is_required', 'video_url', 
                  'course_content_one', 'course_content_two',
                   'course_content_three', 'course_content_four',)


class CourseViewSet(viewsets.ModelViewSet):
    queryset = Course.objects.all()
    serializer_class = CourseLectureSerializer
