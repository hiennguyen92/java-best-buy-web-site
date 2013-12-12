<div class="content">
    <div class="col span_1_of_3">
        <div class="contact-form">
            <h2>Order</h2>
            <form action="Order" method="post">
                <div>
                    <span><label>Name</label></span>
                    <span><input type="text" value="${User.realName}" name="tb_RealName"></span>
                </div>
                <div>
                    <span><label>Phone</label></span>
                    <span><input type="text" value="${User.phone}" name="tb_Phone"></span>
                </div>
                <div>
                    <span><label>Address</label></span>
                    <span><textarea  name="tb_Address">${User.address}</textarea></span>
                </div>
                <div>
                    <span><label>Total price: $${Cart.totalPrice} (${Cart.products.size()} items)</label></span>
                </div>
                <div>
                    <span>
                        <input type="submit" name="purchase" value="Purchase">
                        <input type="button" onclick="location.href='Cart'" value="Edit Cart">
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>