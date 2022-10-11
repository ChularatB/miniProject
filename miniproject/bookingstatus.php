<?php
$pdo = new PDO("mysql:host=localhost; dbname=funtasy; charset=utf8", "root", "");
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
<html>

<head>
    <style>
        body {
            background-color: #F9f2e7;
        }
    </style>
</head>

<body>
    <form>
        <input type="text" name="keyword" autofocus>
        <input type="submit" value="ค้นหา">
    </form>
    <div style="display:flex">
        <?php
        $stmt = $pdo->prepare("SELECT
        `คนไข้`.`Username`,
        `ทันตแพทย์`.`ชื่อ_สกุลทันตแพทย์`,
        `การตรวจสอบ`.`รหัสคนไข้`,
        `คนไข้`.`ชื่อ-สกุลคนไข้`,
        `ใบนัด`.`วันที่นัด`,
        `การบันทึกข้อมูล`.`วันที่ออกใบนัด`
    FROM
        `การบันทึกข้อมูล`
    JOIN `การตรวจสอบ` ON `การบันทึกข้อมูล`.`รหัสคนไข้` = `การตรวจสอบ`.`รหัสคนไข้`
    JOIN `ทันตแพทย์` ON `การตรวจสอบ`.`รหัสทันตแพทย์` = `ทันตแพทย์`.`รหัสทันตแพทย์`
    JOIN `ใบนัด` ON `การบันทึกข้อมูล`.`รหัสใบนัด` = `ใบนัด`.`รหัสใบนัด`
    JOIN `คนไข้` ON `ใบนัด`.`Username` = `คนไข้`.`Username`
    WHERE
    `คนไข้`.`Username` LIKE ?");
        if (!empty($_GET))
            $value = '%' . $_GET["keyword"] . '%';
        $stmt->bindParam(1, $value);
        $stmt->execute();
        while ($row = $stmt->fetch()) : ?>
            <div style="padding: 15px;">
                <form>
                    <fieldset>
                        <legend>ใบนัด</legend>
                        <b>Username: </b><?= $row["Username"] ?><br><br>
                        <b>รหัสคนไข้: </b><?= $row["รหัสคนไข้"] ?><br><br>
                        <b>ชื่อ-สกุลคนไข้: </b><?= $row["ชื่อ-สกุลคนไข้"] ?><br><br>
                        <b>ชื่อ-สกุลทันตแพทย์: </b><?= $row["ชื่อ_สกุลทันตแพทย์"] ?><br><br>
                        <b>วันที่นัด: </b><?= $row["วันที่นัด"] ?><br><br>
                        <b>วันที่ออกใบนัด: </b><?= $row["วันที่ออกใบนัด"] ?><br><br>
                    </fieldset>
                </form>

            </div>
        <?php endwhile; ?>
    </div>
</body>

</html>