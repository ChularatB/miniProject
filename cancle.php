<?php
$pdo = new PDO("mysql:host=localhost; dbname=funtasy; charset=utf8", "root", "");
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <style>
        body {
            background-color: #F9f2e7;
            color: #47467b;
        }

        input {
            color: #47467b;
            font-size: 1em;
        }

        .form1 {
            margin: 1em;
            font-size: 1.5em;
            padding: 0.6em;
            background-color: #7867bf;
            border-radius: 20px;

        }
        fieldset {
            margin-top: 20px;
            padding: 1em;
            text-align: center;
            font-size: 1.6em;
            color: #F9f2e7;
            border: none;
        }
        button {
            border: none;
            font-size: 1em;
            color: #47467b;
            padding: 7px 30px;
            text-align: center;
            cursor: pointer;
            background-color: #f7b1c3;
            border-radius: 10px;
        }

        button:hover {
            background-color: #47467b;
            color: white;
        }

        .logo {
            background-color: #f7b1c3;
            padding: 0.8em;

        }

        .logo img {
            width: 10%;
            margin-top: 1em;
            display: inline-block;

        }

        .logo h1 {
            display: inline-block;
            margin-left: 2%;
            font-size: 4em;
            color: #47467b;
        }
        
    </style>
    <div class="logo">
        <img src="logo.png">
        <h1>Funtasy Dental Clinic</h1>
    </div>

</head>

<body>

    <?php
    $stmt = $pdo->prepare("SELECT
    `การบันทึกข้อมูล`.`รหัสใบนัด`,
    `การบันทึกข้อมูล`.`รหัสคนไข้`,
    `การบันทึกข้อมูล`.`รหัสประเภททันตกรรม`,
    `ใบนัด`.`วันที่นัด`,
    `ตารางนัดทันตแพทย์`.`วันที่ทันตแพทย์เข้าเวร`,
    `ตารางนัดทันตแพทย์`.`เวลาที่ทันตแพทย์เข้าเวร`,
    `การตรวจสอบ`.`รหัสทันตแพทย์`
FROM
    `การบันทึกข้อมูล`
JOIN `ใบนัด` ON `ใบนัด`.`รหัสใบนัด` = `การบันทึกข้อมูล`.`รหัสใบนัด`
JOIN `ตารางนัดทันตแพทย์` ON `การบันทึกข้อมูล`.`รหัสคนไข้` = `ตารางนัดทันตแพทย์`.`รหัสคนไข้`
JOIN `การตรวจสอบ` ON `ตารางนัดทันตแพทย์`.`รหัสคนไข้` = `การตรวจสอบ`.`รหัสคนไข้`
ORDER BY `การบันทึกข้อมูล`.`รหัสคนไข้`;
");
    $stmt->execute();
    $row = $stmt->fetch();
    ?>
    <div class="form1">
        <form action="confirm.php?รหัสใบนัด=<?= $row["รหัสใบนัด"] ?>">
            <fieldset>
                <legend>Cancle</legend>
                <label for="รหัสใบนัด">รหัสใบนัด : </label>
                <input type="text" name="รหัสใบนัด" autofocus>
                <button type="submit">NEXT</button>
            </fieldset>

        </form>
    </div>


</body>

</html>