from django.urls import path, include
from rest_framework import routers
from .views import BadgeViewSet

router = routers.DefaultRouter()
router.register(r'', BadgeViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
