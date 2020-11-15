from rest_framework import serializers

from schedule.models import Schedule


class ScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Schedule
        fields = (
          'id',
          'event_date',
          'category',
          'title',
          'place',
          'content',
          'url',
          'attach',
          'sort_number',
        )
