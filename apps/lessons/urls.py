from django.urls import path, include
from rest_framework import routers
from .views import LessonViewSet

router = routers.DefaultRouter()
router.register(r'', LessonViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
