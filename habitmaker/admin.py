from django.contrib import admin
from django.apps import apps
from django.conf import settings
for app in settings.APPS:

    app_models = apps.get_app_config(app).get_models()
    for model in app_models:
        admin.site.register(model)