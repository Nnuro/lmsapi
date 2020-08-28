from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework import serializers, viewsets

from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated

from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required

from .models import Lesson


class LessonContentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lesson
        fields = ('id', 'title', 'description', 'order_number',
                  'duration','date', 'course', 'lesson_content_one', 
                  'lesson_content_two', 'lesson_content_three',
                  'resource1_url', 'resource2_url',
                  'video1_url', 'video2_url', 'course_content_one',
                 'course_content_two',)


# @api_view(["GET", "POST", "PUT"])
# @csrf_exempt
class LessonViewSet(viewsets.ModelViewSet):
    permission_classes = (IsAuthenticated,)
    queryset = Lesson.objects.all()
    serializer_class = LessonContentSerializer
