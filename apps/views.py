from django.shortcuts import render
from .forms import EmailPostForm

def post_share(request, post_id):
     # Retrieve post by id   
     post = get_object_or_404(Post, id=post_id, status='published')
      if request.method == 'POST':       
         # Form was submitted        
          form = EmailPostForm(request.POST)       
           if form.is_valid():           
         # Form fields passed validation      
              cd = form.cleaned_data          
                # ... send email    
      else:        
            form = EmailPostForm()    
       if request.method == 'POST':        


# Create your views here.


# Add views here
