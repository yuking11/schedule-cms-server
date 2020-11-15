from django.shortcuts import render
from .models import Schedule
from .serializers import ScheduleSerializer
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
from datetime import datetime, date, timedelta
from dateutil.relativedelta import relativedelta

from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi

class ScheduleView(generics.ListCreateAPIView):
# class ScheduleView(APIView):
    """スケジュール管理API"""
    queryset = Schedule.objects.all()
    serializer_class = ScheduleSerializer

    def get_queryset(self):
        queryset = Schedule.objects.all()

        limit = self.request.GET.get('limit')
        limit = int(limit) if limit is not None else limit
        year = self.request.GET.get('year')
        year = int(year) if year is not None else year
        month = self.request.GET.get('month')
        month = int(month) if month is not None else month
        day = self.request.GET.get('day')
        day = int(day) if day is not None else day

        today = date.today()

        if limit is not None:
            if year is not None and month is not None and day is not None:
                start_date = datetime(year, month, day)
                end_date = start_date + timedelta(days=limit-1)
                queryset = queryset.filter(event_date__date__range=(start_date, end_date))
            elif year is not None and month is not None:
                start_date = datetime(year, month, 1)
                end_date = start_date + relativedelta(months=limit, days=-1)
                queryset = queryset.filter(event_date__date__range=(start_date, end_date))
            elif day is not None:
                start_date = datetime(today.year, today.month, day)
                end_date = start_date + timedelta(days=limit-1)
                queryset = queryset.filter(event_date__date__range=(start_date, end_date))
            elif month is not None:
                start_date = datetime(today.year, month, 1)
                end_date = start_date + relativedelta(months=limit, days=-1)
                queryset = queryset.filter(event_date__date__range=(start_date, end_date))
            elif year is not None:
                start_date = datetime(year, 1, 1)
                end_date = start_date + relativedelta(years=limit, days=-1)
                queryset = queryset.filter(event_date__date__range=(start_date, end_date))
        else:
            if year is not None:
                queryset = queryset.filter(event_date__year=year)
            else:
                queryset = queryset.filter(event_date__year=today.year)

            if month is not None:
                queryset = queryset.filter(event_date__month=month)

            if day is not None:
                queryset = queryset.filter(event_date__day=day)

        return queryset.order_by('event_date')

    limit_param = openapi.Parameter(
        'limit', openapi.IN_QUERY, description='取得件数', type=openapi.TYPE_NUMBER
    )
    year_param = openapi.Parameter(
        'year', openapi.IN_QUERY, description='開催年', type=openapi.TYPE_NUMBER
    )
    month_param = openapi.Parameter(
        'month', openapi.IN_QUERY, description='開催月', type=openapi.TYPE_NUMBER
    )
    day_param = openapi.Parameter(
        'day', openapi.IN_QUERY, description='開催日付', type=openapi.TYPE_NUMBER
    )

    @swagger_auto_schema(manual_parameters=[limit_param, year_param, month_param, day_param])
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

class ScheduleDetailView(generics.RetrieveUpdateDestroyAPIView):
    """スケジュール管理API"""
    queryset = Schedule.objects.all()
    serializer_class = ScheduleSerializer
