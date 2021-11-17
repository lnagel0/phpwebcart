<?=template_header('Contact')?>
<?php $con=mysqli_connect('localhost','root','','shoppingcart') ;?>
<div class="container-fluid d-flexbg-light pt-4">
    <form action="#" method="post" style="width:300px;background:white" class="m-auto shadow p-4">
       <h2>Contacto</h2>
       <div class="form-group">
           <input type="text" name="name" placeholder="Name" class="form-control">
       </div>
       <div class="form-group">
           <input type="email" name="email" placeholder="Email" class="form-control">
       </div>
      
       <div class="form-group">
          <textarea name="message" id="" cols="30" rows="5" class="form-control" placeholder="Message.."></textarea>
       </div> <div class="d-flex">
         <button class="btn btn-primary m-auto" name="send"> Send</button>
       </div>
   </form>

</div>
<?php if(isset($_POST['send'])){
$name=$_POST['name'];
$email=$_POST['email'];
$message=$_POST['message'];


$confirm_order_query=mysqli_query($con,"INSERT INTO contact (name,email,message) VALUES ('$name','$email','$message')");
    if($confirm_order_query){
 echo "<script> alert('Te contactaremos enseguida');location.replace('index.php?page=contact')</script>";
    }
  }  ?>
<?=template_footer()?>