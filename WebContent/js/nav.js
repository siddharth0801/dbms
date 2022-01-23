const createNav = () => {
    let nav = document.querySelector('.navbar');

    nav.innerHTML = `
        <div class="nav">
            <img src="img/siri.jpg" class="brand-logo" alt="">
            <div class="nav-items">
                <div class="search">
                    <input type="text" class="search-box" placeholder="search brand, product">
                    <button class="search-btn">search</button>
                </div>
                <a href="#"><img src="img/user.png" alt=""></a>
                <a href="cart.jsp">Cart</a>
            </div>
        </div>
        <ul class="links-container">
            <li class="link-item"><a href="home.jsp" class="link">home</a></li>
            <li class="link-item"><a href="category.jsp" class="link">categories</a></li>
            <li class="link-item"><a href="brand.jsp" class="link">brands</a></li>
            <li class="link-item"><a href="about.jsp" class="link">About Us</a></li>
        </ul>
    `;

}

createNav();
