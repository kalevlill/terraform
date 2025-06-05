Deinen gewählten Anwendungsfall: 
● Welches Problem löst du? 

Dieses Projekt zeigt, wie Terraform auch außerhalb der Cloud sinnvoll nutzbar ist. Durch die Kombination aus Variablen, Modulen, Locals und Outputs wird eine übersichtliche und wiederverwendbare Struktur geschaffen, die für kleine Multi-Container-Anwendungen ideal ist.

● Warum Terraform/IaC dafür? (Ausführlicher als beim Brainstorming). Deine umgesetzte Lösung: 

Mit Terraform kann ich meine gesamte Infrastruktur als Code definieren. Dadurch ist sie: wiederholbar (z. B. CI/CD), nachvollziehbar (jede Änderung ist versionierbar), einheitlich (keine „Handarbeit“ oder vergessene Schritte), leicht erweiterbar (neue Container, Volumes usw.).


● Beschreibe die Hauptressourcen, die du verwendest, und wie sie zusammenhängen. Füge ggf. vereinfachte Diagramme oder Skizzen hinzu. 
Anwendung der gelernten Konzepte: 

docker_container - Erstellt den jeweiligen Container mit Image, Port-Mapping und Netzwerkanbindung
docker_network - Erstellt ein eigenes Docker-Netzwerk für die Container
Modul container_service - Kapselt die Container-Logik (Name, Port, Image) zur Wiederverwendung

● Ganz wichtig: Erkläre für jede genutzte Variable, jeden Output, jeden Local und jedes Modul WOFÜR und WIE du es in deiner spezifischen Lösung eingesetzt hast. 

nginx_image - Image des Nginx-Containers
app_image - Image für den App-Container
container_ports - Liste externer Ports (wird einzelnen Containern zugewiesen)
enable_logging - Demonstriert Nutzung von bool-Typ, könnte für spätere Logging-Optionen verwendet werden
container_names - Map für Container-Namen pro Rolle (z. B. nginx, app)

