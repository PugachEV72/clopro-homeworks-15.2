# Домашнее задание к занятию `«Вычислительные мощности. Балансировщики нагрузки»` - Пугач Евгений.


---

## `Задание 1. Yandex Cloud`

1. Создать бакет Object Storage и разместить в нём файл с картинкой:
- Создать бакет в Object Storage с произвольным именем (например, имя_студента_дата).
- Положить в бакет файл с картинкой.
- Сделать файл доступным из интернета.

### Решение: 

### `Object Storage`

![Скриншот 0](https://github.com/PugachEV72/Images/blob/master/2024-05-25_00-48-45.png)

### `Ссылка для скачивания`

https://storage.yandexcloud.net/tanker72-first-bucket/test_pic.jpg

![Скриншот 1](https://github.com/PugachEV72/Images/blob/master/2024-05-25_01-31-10.png)

### `Ссылка на ресурс`

[bucket.tf](https://github.com/PugachEV72/clopro-homeworks-15.2/blob/main/terraform_vms/bucket.tf)

---

2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку  
   на картинку из бакета:
- Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать image_id = fd827b91d99psvq5fjit.
- Для создания стартовой веб-страницы рекомендуется использовать раздел user_data в meta_data.
- Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
- Настроить проверку состояния ВМ.

### Решение:

### `Instance Group`

![Скриншот 2](https://github.com/PugachEV72/Images/blob/master/2024-05-25_00-43-36.png)

### `Стартовая веб-страница шаблонной ВМ`

![Скриншот 3](https://github.com/PugachEV72/Images/blob/master/2024-05-25_01-04-18.png)

![Скриншот 4](https://github.com/PugachEV72/Images/blob/master/2024-05-25_01-27-57.png)

### `Ссылка на группу`

[vms.tf](https://github.com/PugachEV72/clopro-homeworks-15.2/blob/main/terraform_vms/vms.tf)

---

3. Подключить группу к сетевому балансировщику:
- Создать сетевой балансировщик.
- Проверить работоспособность, удалив одну или несколько ВМ.

### Решение:

### `Сетевой балансировщик`

![Скриншот 5](https://github.com/PugachEV72/Images/blob/master/2024-05-25_00-58-58.png)

### `Целевая группа`

![Скриншот 6](https://github.com/PugachEV72/Images/blob/master/2024-05-25_00-59-16.png)

### `Удаление ВМ`

![Скриншот 7](https://github.com/PugachEV72/Images/blob/master/2024-05-25_01-07-24.png)

### `Восстановление ВМ`

![Скриншот 8](https://github.com/PugachEV72/Images/blob/master/2024-05-25_01-13-39.png)

![Скриншот 9](https://github.com/PugachEV72/Images/blob/master/2024-05-25_01-18-10.png)

### `Ссылка на ресурс`

[lbalancer.tf](https://github.com/PugachEV72/clopro-homeworks-15.2/blob/main/terraform_vms/lbalancer.tf)
 
---

### `Terraform apply`

![Скриншот 10](https://github.com/PugachEV72/Images/blob/master/2024-05-25_00-39-39.png)

### `Созданные ресурсы`

![Скриншот 11](https://github.com/PugachEV72/Images/blob/master/2024-05-25_00-46-48.png)

### `Общая конфигурация`

[terraform](https://github.com/PugachEV72/clopro-homeworks-15.2/tree/main/terraform_vms)

---

4. (дополнительно)* Создать Application Load Balancer с использованием Instance group и проверкой состояния.

---






