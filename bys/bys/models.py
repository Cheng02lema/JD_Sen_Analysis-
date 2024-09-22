from django.db import models

class Review(models.Model):
    brand = models.CharField(max_length=100)
    word = models.CharField(max_length=100)
    count = models.IntegerField()

    def __str__(self):
        return f'{self.brand} - {self.word}'
