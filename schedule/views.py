from django.shortcuts import render
from .models import Schedule
from .serializers import ScheduleSerializer
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response

class ScheduleView(generics.ListAPIView):
# class ScheduleView(APIView):
    """スケジュール管理API"""
    queryset = Schedule.objects.all()
    serializer_class = ScheduleSerializer


class ScheduleDetailView(generics.RetrieveUpdateDestroyAPIView):
    """スケジュール管理API"""
    queryset = Schedule.objects.all()
    serializer_class = ScheduleSerializer
