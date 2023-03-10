```python
filename = input("Введите имя файла: ")

with open(filename) as file:
    for line in file:
        if "ЗНР" in line:
            print(line.strip())
```
