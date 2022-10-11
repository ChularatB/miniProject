<?php
$pdo = new PDO("mysql:host=localhost; dbname=funtasy; charset=utf8", "root", "");
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
<html>

<head>
    <meta charset="utf-8">
</head>

<body>
    <form>
        <input type="text" name="keyword">
        <input type="submit" value="ค้นหา">
    </form>
    <div style="display:flex">
        <?php
        $stmt = $pdo->prepare("SELECT
        `คนไข้`.`username`,
        `คนไข้`.`ชื่อ-สกุลคนไข้`,
        `คนไข้`.`วันเดือนปีเกิด`,
        `คนไข้`.`เบอร์โทรคนไข้`,
        `ใบนัด`.`วันที่นัด`
    FROM
        `ใบนัด`
    JOIN `คนไข้` ON `คนไข้`.`username`=`ใบนัด`.`username`
    WHERE `ใบนัด`.`username`
    LIKE ?");
        if (!empty($_GET))
            $value = '%' . $_GET["keyword"] . '%';
        $stmt->bindParam(1, $value);
        $stmt->execute();
        while ($row = $stmt->fetch()) : ?>
            <div style="padding: 15px;">
                <b>username: </b><?= $row["username"] ?><br><br>
                <b>ชื่อ-สกุลคนไข้: </b><?= $row["ชื่อ-สกุลคนไข้"] ?><br><br>
                <b>วันเดือนปีเกิด: </b><?= $row["วันเดือนปีเกิด"] ?><br><br>
                <b>เบอร์โทรคนไข้: </b><?= $row["เบอร์โทรคนไข้"] ?><br><br>
                <b>วันที่นัด: </b><?= $row["วันที่นัด"] ?><br><br>
            </div>
        <?php endwhile; ?>
    </div>
</body>

</html>