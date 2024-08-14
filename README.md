# Проект для минимального восстановления системы на Ubuntu
## Содержание проекта
Проект содержит необходимые настройки и скрипт для установки на Ubuntu следующих программ:
- curl;
- Homebrew;
- vim;
- tmux;
- fzf;
- ripgrep;
- i3.

Для корректной работы указанных программ скрипт устанавливает шрифты fonts-powerline и nerd-fonts, а также создает или изменяет настроечные файлы vim, i3, tmux и некоторых плагинов vim
## Запуск
Для запуска необходимо:
1) добавить возможность пользователю выполнять операции через sudo;
2) перейти в директорию с проектом;
3) если необходимо провести операцию "chmod +x setup.sh";
4) запустить скрипт и следовать инструкциям ". setup.sh".
