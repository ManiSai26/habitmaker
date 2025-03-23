from django.db import models
import uuid
class CoreModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    class Meta:
        abstract = True

class CoreLookupModel(CoreModel):
    name = models.CharField(max_length=255)
    icon = models.CharField(null=True, blank=True)
    class Meta:
        abstract = True

class Category(CoreLookupModel):
    
    class Meta(CoreLookupModel.Meta):
        db_table = 'lkp_category'