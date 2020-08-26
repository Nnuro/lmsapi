from django.shortcuts import render

# Create your views here.
from rest_framework import serializers, viewsets

from .models import Course


class CourseLectureSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = ('id', 'title', 'description', 'date', 'duration',
                    'resource1_url', 'resource2_url', 'resource3_url',
                    'is_required', 'video1_url', 'video2_url' , 'video3_url',
                    'course_content_one', 'course_content_two',
                    'course_content_three', 'course_content_four',)


class CourseViewSet(viewsets.ModelViewSet):
    queryset = Course.objects.all()
    serializer_class = CourseLectureSerializer
