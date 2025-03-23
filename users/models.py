from habitmaker.models import CoreModel
from django.contrib.auth.models import AbstractUser
# Create your models here.
class User(AbstractUser,CoreModel):
    pass
