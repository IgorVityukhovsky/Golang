```
# Список компьютеров
$computers = Get-Content "C:\path\to\computers.txt"

# Путь к файлу для записи результатов
$outputFile = "C:\path\to\output.txt"

# Проходим по каждому компьютеру из списка
foreach ($computer in $computers) {
    # Получаем информацию о дисках
    $disks = Get-WmiObject -Class Win32_LogicalDisk -ComputerName $computer

    # Проходим по каждому диску
    foreach ($disk in $disks) {
        # Получаем имя диска и свободное место
        $diskName = $disk.DeviceID
        $freeSpace = [math]::Round($disk.FreeSpace / 1GB, 2)

        # Формируем строку с результатом
        $result = "$computer - $diskName: $freeSpace GB свободно"

        # Записываем результат в файл
        Add-Content -Path $outputFile -Value $result
    }
}
```
