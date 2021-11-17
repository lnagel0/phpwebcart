<?php
global $subtotal;
$con=mysqli_connect('localhost','root','','shoppingcart') ;

if(isset($_GET['checkout_id'])){
    $checkout_id=$_GET['checkout_id'];
    $stmt = $pdo->prepare('SELECT * FROM cart WHERE checkout_id=? ');
    $stmt->execute([$checkout_id]);
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

}else{
    header("location:index.php");
}
?>

<?=template_header('Checkout')?>
<form action="#" method="post">
<div class="content-wrapper">
    <h1>Checkout</h1>
    <div class="container">
       
        <div class="row">
            <div class="col-sm-5">
                <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="Nombre" required>
                </div>
                <div class="form-group">
                    <input type="text" name="email" class="form-control" placeholder="Email" required>
                </div>
                <div class="form-group">
                    <input type="text" name="address" class="form-control" placeholder="Direccion" required>
                </div>
                <div class="form-group">
                    <input type="text" name="city" class="form-control" placeholder="Localidad" required>
                </div>
                <div class="form-group">
                    <input type="text" name="postcode" class="form-control" placeholder="Codigo Postal" required>
                </div>
            </div>
            <div class="col-sm-5">
                <table class="table">
                    <thead>
                        <tr>
                            <td colspan="2">Producto</td>
                            <td>Precio</td>
                            <td>Cantidad</td>
                            <td>Total</td>
                        </tr>
                    </thead>
                    <tbody>
                       
                      
                      
                        <?php foreach ($products as $product_): 
                        $id=$product_['product_id'];
                        $quantity=$product_['quantity'];
                         $subtotal=$product_['subtotal'];
                      
                              $queyr = mysqli_query($con,"SELECT * FROM products WHERE id=$id ") or die(mysqli_error($con));
                            
                             $product =mysqli_fetch_array($queyr);
                           
                            ?>
                        <tr>
                            <td class="img">
                                <a href="index.php?page=product&id=<?=$product['id']?>">
                                    <img src="imgs/<?=$product['img']?>" width="50" height="50"
                                        alt="<?=$product['name']?>">
                                </a><br>
                                <?=$product['name']?>

                            </td>
                           
                            <td class="price">&dollar;<?=$product['price']?></td>
                            <td class="quantity">
                            <?= $quantity?>
                                
                            </td>
                            <td class="price">&dollar;<?=$product['price']*$quantity ?></td>
                        </tr>
                       
                        <?php endforeach; ?>
                       
                    </tbody>
                </table>
                <div class="subtotal">
                    <span class="text">Subtotal</span>
                    <span class="price">&dollar;<?=$subtotal?></span>
                </div>
                <div class="buttons">
                    
                    <input type="submit" class="btn btn-info" value="Confirmar Pedido" name="confirm_order">
                </div>
            </div>
        </div>
    </div>
</div>
</form>
<?php 
if(isset($_POST['confirm_order'])){
$name=$_POST['name'];
$email=$_POST['email'];
$address=$_POST['address'];
$city=$_POST['city'];
$postcode=$_POST['postcode'];

$confirm_order_query=mysqli_query($con,"INSERT INTO orders (name,email,address,city,postcode,amount,checkout_id) VALUES ('$name','$email','$address','$city','$postcode','$subtotal','$checkout_id' )");
    if($confirm_order_query){
      
        foreach ($products as $product_){

             $id=$product_['product_id'];
           


             $take_auntity_query = mysqli_query($con,"SELECT * FROM products WHERE id=$id ") or die(mysqli_error($con));               
             $take_qauntity =mysqli_fetch_array($take_auntity_query);
             $quantity=intval($take_qauntity['quantity'])-intval($product_['quantity']);


            $place_order_query = mysqli_query($con,"UPDATE  products SET quantity= '$quantity' WHERE id=$id ") or die(mysqli_error($con));
                if($place_order_query){
                    header("location:index.php");
                }
               
            }
               
    }
}


?>


<?=template_footer()?>