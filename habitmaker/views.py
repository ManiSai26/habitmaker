from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions
from . import serializers
from . import models
class CoreViewSet(ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        try:
            return super().perform_create(serializer)
        except Exception as e:
            print(e)
            raise e
        
    def perform_update(self, serializer):
        try:
            return super().perform_update(serializer)
        except Exception as e:
            print(e)
            raise e
        
class CategoryViewSet(CoreViewSet):
    serializer_class = serializers.CategorySerializer
    queryset = models.Category.objects.all()
