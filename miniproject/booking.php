<html>

<head>
    
</head>

<body>
    <form action="booking2.php" method="POST">
        <fieldset>
            <legend>Booking</legend>
            <div>
                <b>ประเภททันตกรรม</b>
                <hr>
                <input type="radio" id="TE"  name="ถอนฟัน" checked>
                <label for="TE">ถอนฟัน</label><br>
                <input type="radio" id="TB"  name="จัดฟัน">
                <label for="TB">จัดฟัน</label><br>
                <input type="radio" id="TS"  name="ขูดหินปูน">
                <label for="TS">ขูดหินปูน</label><br>
                <input type="radio" id="TF"name="อุดฟัน">
                <label for="TF">อุดฟัน</label><br>
                <input type="radio" id="TI"  name="รากเทียม">
                <label for="TI">รากเทียม</label><br>
                <input type="submit" value="next">
            </div>
        </fieldset>
    </form>
</body>

</html>