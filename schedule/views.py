from django.shortcuts import render
from .models import Schedule
from .serializers import ScheduleSerializer
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
import datetime
from dateutil.relativedelta import relativedelta

class ScheduleView(generics.ListCreateAPIView):
# class ScheduleView(APIView):
    """スケジュール管理API"""
    queryset = Schedule.objects.all()
    serializer_class = ScheduleSerializer

    def get_queryset(self):
        queryset = Schedule.objects.all()

        limit = int(self.request.GET.get('limit'))
        year = self.request.GET.get('year')
        month = self.request.GET.get('month')
        day = self.request.GET.get('day')

        today = datetime.date.today()

        # if year is not None:
        #     queryset = queryset.filter(event_date__year=year)
        # else:
        #     queryset = queryset.filter(event_date__year=today.year, event_date__month=today.month)

        # if month is not None:
        #     queryset = queryset.filter(event_date__month=month)

        # if day is not None:
        #     queryset = queryset.filter(event_date__day=day)

        if limit is not None:
            if year is not None:
                start_date = datetime.datetime(int(year), 1, 1)
                end_date = start_date + relativedelta(years=limit+1, days=-1)
                queryset = queryset.filter(event_date__range=(start_date, end_date))
            elif month is not None:
                start_date = datetime.datetime(today.year, int(month), 1)
                end_date = start_date + relativedelta(months=limit+1, days=-1)
                queryset = queryset.filter(event_date__range=(start_date, end_date))
            elif day is not None:
                start_date = datetime.datetime(today.year, today.month, int(day))
                end_date = start_date + relativedelta(days=limit)
                queryset = queryset.filter(event_date__range=(start_date, end_date))

        return queryset.order_by('event_date')


class ScheduleDetailView(generics.RetrieveUpdateDestroyAPIView):
    """スケジュール管理API"""
    queryset = Schedule.objects.all()
    serializer_class = ScheduleSerializer
