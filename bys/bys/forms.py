from django import forms

class PredictionForm(forms.Form):
    input_text = forms.CharField(label='Enter your text', max_length=1000)
