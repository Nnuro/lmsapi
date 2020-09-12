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
        fields = (
                'id', 'title', 'description', 'lesson_number',
                'duration', 'date', 'course_module', 'content_one',
                'content_two', 'content_three',
                'resource_url', 'video_one', 'video_two'
                )


# @api_view(["GET", "POST", "PUT"])
# @csrf_exempt
class LessonViewSet(viewsets.ModelViewSet):
    permission_classes = (IsAuthenticated,)
    queryset = Lesson.objects.all()
    serializer_class = LessonContentSerializer
