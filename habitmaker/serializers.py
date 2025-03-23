from rest_framework import serializers
from . import models
class CoreSerializer(serializers.ModelSerializer):

    class Meta:
        model = None
        fields = '__all__'

class CoreLookupSerializer(serializers.ModelSerializer):

    class Meta:
        model = None
        fields = '__all__'

class CategorySerializer(CoreLookupSerializer):

    class Meta(CoreLookupSerializer.Meta):
        model = models.Category
        fields = '__all__'