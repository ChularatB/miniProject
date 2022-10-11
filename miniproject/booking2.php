<?php
$pdo = new PDO("mysql:host=localhost;dbname=funtasy;chaset=utf8", "root", "");
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
<html>

<head>
    <meta chaset="utf-8">
    <style>
        td,
        th {
            padding: 10px;
            text-align: center;
        }
    </style>
</head>

<body>
    <?php
    $stmt = $pdo->prepare("SELECT
             `ตารางนัดทันตแพทย์`.`วันที่ทันตแพทย์เข้าเวร`,
             `ตารางนัดทันตแพทย์`.`เวลาที่ทันตแพทย์เข้าเวร`,
             `การตรวจสอบ`.`รหัสทันตแพทย์`
         FROM
             `การบันทึกข้อมูล`
         JOIN `ใบนัด` ON `ใบนัด`.`รหัสใบนัด` = `การบันทึกข้อมูล`.`รหัสใบนัด`
         JOIN `ตารางนัดทันตแพทย์` ON `การบันทึกข้อมูล`.`รหัสคนไข้` = `ตารางนัดทันตแพทย์`.`รหัสคนไข้`
         JOIN `การตรวจสอบ` ON `ตารางนัดทันตแพทย์`.`รหัสคนไข้` = `การตรวจสอบ`.`รหัสคนไข้`
         WHERE `การบันทึกข้อมูล`.`รหัสประเภททันตกรรม`
         LIKE ?;");
    $stmt->execute();
    ?>
    <table border="1">
        <tr>
            <th>วัน</th>
            <th>เวลา</th>
            <th>ทัตแพทย์</th>
        </tr>
        <?php while ($row = $stmt->fetch()) { ?>
            <tr>
                <td><?= $row["วันที่ทันตแพทย์เข้าเวร"] ?></td>
                <td><?= $row["เวลาที่ทันตแพทย์เข้าเวร"] ?></td>
                <td><?= $row["รหัสทันตแพทย์"] ?></td>
            </tr>
        <?php } ?>

        <div>
            <form>
            <fieldset>
                <legend>เลือกวันและเวลา</legend>
                <input type="date">
                <input type="time">
            </fieldset>
            </form>
            
        </div>
    </table>
</body>

</html>