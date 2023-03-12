from django.db import models

# Create your models here.

class Site(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=254, blank=True, null=True)
    national_site_code = models.IntegerField(unique=True, blank=True, null=True)
    country_iso = models.CharField(max_length=2, blank=True, null=True)
    parish = models.CharField(max_length=254, blank=True, null=True)
    status_site = models.CharField(max_length=1, blank=True, null=True)

    def __str__(self):
        return self.name
    
