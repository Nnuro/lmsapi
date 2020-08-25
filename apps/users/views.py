from django.shortcuts import render
from rest_framework import serializers, viewsets
from django.contrib.auth import get_user_model

from .models import User, UserProfile
# # Create your views here.
from rest_framework.views import APIView
from rest_framework.decorators import permission_classes
from rest_framework.permissions import IsAuthenticated, DjangoModelPermissions
from rest_framework.response import Response

from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt


@api_view(["GET"])
@csrf_exempt
@permission_classes([IsAuthenticated])
def welcome(request):
    content = {"message": "Welcome to the To the LMS API!"}
    return JsonResponse(content)

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ('id', 'email', 'password', 'student_type')
        extra_kwargs = {'password': {'write_only': True, 'min_length': 8}}

    def create(self, validated_data):
        is_student = validated_data.pop('student_type')
        user = get_user_model().objects.create_user(**validated_data)
        user.is_student = is_student
        user.save()
        return user
        # return get_user_model().objects.create_user(**validated_data)


class UserProfileSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(
        queryset=get_user_model().objects.all())

    class Meta:
        model = UserProfile
        fields = ('__all__')

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer


@permission_classes([IsAuthenticated])
class UserProfileView(APIView):
    def get(self, request, pk):
        profile = UserProfile.objects.get(user=request.user)
        serializer = UserProfileSerializer(profile)
        return Response(serializer.data)

# class BadgeSerializer(serializers.ModelSerializer):
#     project = serializers.PrimaryKeyRelatedField(
#         queryset=Project.objects.all())
#     student = serializers.PrimaryKeyRelatedField(
#         queryset=get_user_model().objects.all())

#     class Meta:
#         model = StudentSubmission
#         fields = ('id', 'project', 'student',
#                   'url', 'feedback', 'approved')
#         read_only_fields = ['feedback', 'approved']
