1) systemctl status cron
● cron.service - Regular background program processing daemon
     Loaded: loaded (/usr/lib/systemd/system/cron.service; enabled; preset: ena>
     Active: active (running) since Sun 2024-10-20 14:48:33 MSK; 9h ago
 Invocation: e76aae2f3ed24edf8496e240cefeca52
       Docs: man:cron(8)
   Main PID: 1339 (cron)
      Tasks: 1 (limit: 11061)
     Memory: 484K (peak: 2.2M)
        CPU: 266ms
     CGroup: /system.slice/cron.service
             └─1339 /usr/sbin/cron -f -P

окт 21 00:05:01 sansants01-VirtualBox CRON[11296]: pam_unix(cron:session): sess>
окт 21 00:15:01 sansants01-VirtualBox CRON[11942]: pam_unix(cron:session): sess>
окт 21 00:15:01 sansants01-VirtualBox CRON[11943]: (root) CMD (command -v debia>
окт 21 00:15:01 sansants01-VirtualBox CRON[11942]: pam_unix(cron:session): sess>
окт 21 00:17:01 sansants01-VirtualBox CRON[12259]: pam_unix(cron:session): sess>
окт 21 00:17:01 sansants01-VirtualBox CRON[12260]: (root) CMD (cd / && run-part>
окт 21 00:17:01 sansants01-VirtualBox CRON[12259]: pam_unix(cron:session): sess>
окт 21 00:25:01 sansants01-VirtualBox CRON[13165]: pam_unix(cron:session): sess>
окт 21 00:25:01 sansants01-VirtualBox CRON[13166]: (root) CMD (command -v debia>
окт 21 00:25:01 sansants01-VirtualBox CRON[13165]: pam_unix(cron:session): sess>

В результате можно увидеть:

Активен ли сервис (например, active (running)).
Время последнего запуска или перезапуска.
PID процесса и другие данные, такие как используемая память.
Журнал последних записей из системного лога.
Возможные результаты:

Если сервис работает корректно, результат будет содержать статус active (running).
Если сервис остановлен, статус будет inactive (dead).
Если сервис отключен, будет указан статус disabled.
При наличии ошибок в работе сервиса могут отображаться сообщения об ошибках или предупреждения.

2) Маскирование (masking) в systemctl – это процесс, который полностью отключает сервис,
делая его невозможным для запуска, даже вручную.
При маскировании создается символическая ссылка на /dev/null, что предотвращает запуск сервиса.

Этот функционал может использоваться для:
Отключения нежелательных сервисов:
Если вы хотите полностью остановить и предотвратить запуск какого-либо сервиса
(например, для повышения безопасности или предотвращения конфликтов).
Упрощения управления: Маскирование помогает предотвратить случайный запуск сервиса, когда это нежелательно.
systemctl mask имя_сервиса #замаскировать
systemctl unmask имя_сервиса #размаскировать

3) systemctl list-dependencies service_name
examle: systemctl list-dependencies cron.service 
