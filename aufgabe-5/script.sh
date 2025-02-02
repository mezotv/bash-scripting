#!/bin/bash

error_log="/tmp/errors.txt"

echo "Admin-Skript - Wähle eine Option:"
while true; do
    echo "1. Löschen aller temporären Dateien in /tmp"
    echo "2. Backup aller Heimatverzeichnisse"
    echo "3. Erreichbarkeit der Rechner prüfen (192.168.1.1 - 192.168.1.5)"
    echo "4. Fehler-Log löschen"
    echo "5. Beenden"
    read -p "Deine Auswahl: " choice

        case $choice in
        1)
            echo "Lösche temporäre Dateien..."
            find /tmp -type f -delete 2>>"$error_log" || echo "$(date): Fehler beim Löschen von Dateien" >> "$error_log"
            find /tmp -type d -empty -delete 2>>"$error_log" || echo "$(date): Fehler beim Löschen von Verzeichnissen" >> "$error_log"
            ;;
        2)
            echo "Erstelle Backup aller Heimatverzeichnisse..."
            backup_file="/tmp/home_backup_$(date +%Y%m%d_%H%M%S).tar.gz"
            tar -czf "$backup_file" /home 2>>"$error_log" || echo "$(date): Fehler beim Erstellen des Backups" >> "$error_log"
            echo "Backup gespeichert unter $backup_file"
            ;;
        3)
            echo "Prüfe Erreichbarkeit der Rechner..."
            for ip in {1..5}; do
                ping -c 1 "192.168.1.$ip" &>/dev/null || {
                    echo "Rechner 192.168.1.$ip nicht erreichbar"
                    echo "$(date): Rechner 192.168.1.$ip nicht erreichbar" >> "$error_log"
                }
            done
            ;;
        4)
            echo "Lösche Fehler-Log..."
            > "$error_log"
            echo "Fehler-Log wurde gelöscht."
            ;;
        5)
            echo "Beende das Skript."
            exit 0
            ;;
        *)
            echo "Ungültige Auswahl, bitte erneut versuchen."
            ;;
    esac
    echo
    
done
