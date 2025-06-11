Reflexion 03.06

* Was ist die Rolle des provider Blocks in deiner Konfiguration? Warum ist er notwendig? 

A: Der provider Block in der Terraform-Konfiguration gibt an, mit welchem Dienst oder System Terraform arbeiten soll, in unserem Fall z.B Docker. Er ist nötig, weil er die Verbindung und Authentifizierung zu diesem Dienst herstellt und definiert, welche Ressourcen Terraform verwalten kann.

* Was ist die Rolle des resource Blocks? Was repräsentiert er im Vergleich zu einem provider? 

A: der resource Block legt fest, welche einzelnen Ressourcen innerhalb dieses Dienstes angelegt werden, wie z.B VM's oder ein Docker Container.

* Wie hast du in deiner Konfiguration eine implizite Abhängigkeit zwischen der docker_container Ressource und der docker_image Ressource erstellt? Warum ist es wichtig, dass Terraform diese Abhängigkeit versteht?

A: ich hab im docker_container die Image-Bezeichnung auf das docker_image verweist. Das ist wichtig, damit Terraform die Ressourcen in der richtigen Reihenfolge anlegt und Fehler vermeidet.

* Was genau bewirkt der Befehl terraform init, wenn du ihn zum ersten Mal in einem Verzeichnis ausführst?

A: Es lädt die benötigen Provider aus'm Internet herunter und speichert sie lokal im Projet. Außerdem erstellt Terraform iterne Dateien und Verzeichnisse, die es für die weitere Arbeit braucht.

* Was genau zeigt der Output von terraform plan an? Welche Informationen liefert er, bevor du die Infrastruktur tatsächlich erstellst?

A: Der Output von terraform plan zeigt, was Terraform tun wird, bevor es etwas verändert. Er listet alle geplanten Änderungen auf - welche Ressourcen neu erstellt, geändert oder gelöscht werden. So kann man prüfen, ob alles wie gewünscht eingerichtet ist, bevor man die Infrastruktur wirklich anlegt.

Reflexion 04.06

* Was hat der Befehl terraform apply getan, als du ihn zum ersten Mal mit deiner initialen Konfiguration (ohne Variablen) ausgeführt hast?

A: Beim ersten Ausführen von terraform apply mit der ursprünglichen Konfiguration hat Terraform die benötigte Infrastruktur aufgebaut. Es wurde automatisch das nginx-Image heruntergeladen, ein Container mit dem in variables.tf definierten Standardnamen gestartet und auf dem festgelegten Port bereitgestellt. Zusätzlich wurde mithilfe eines lokalen Befehls eine HTML-Datei im Container erstellt, die den voreingestellten Inhalt angezeigt hat.

* Was ist mit dem Terraform State (terraform.tfstate) passiert, nachdem du terraform apply und terraform destroy ausgeführt hast? 

A: Nachdem ich terraform apply ausgeführt habe, wurde die Datei terraform.tfstate erstellt oder aktualisiert. Sie speichert den aktuellen Zustand der Infrastruktur, also z. B. welche Container laufen und mit welchen Eigenschaften. Als ich später terraform destroy ausgeführt habe, wurden alle Ressourcen gelöscht, und der Inhalt der State-Datei wurde entsprechend angepasst.
f
* Wie haben die Variablen (variable {}, var.) deine Konfiguration flexibler und wiederverwendbarer gemacht, verglichen mit der initialen Konfiguration (ohne Variablen)? 

A: Durch die Verwendung von Variablen wurde die Konfiguration deutlich flexibler, weil ich bestimmte Werte, wie den Containernamen oder den Port nicht mehr fest in die Terraform-Dateien schreiben musste. Stattdessen konnte ich sie über var.name einfügen und dann in einer separaten .tfvars-Datei anpassen. Das macht die Konfiguration wiederverwendbar für verschiedene Umgebungen, ohne dass ich den Code selbst ändern muss.

* Auf welche drei Arten hast du Werte an deine Input Variablen übergeben? Beschreibe kurz die Methode und ihre Priorität

A: 1. Über eine .tfvars-Datei, die ich mit dem -var-file-Flag beim Ausführen von terraform apply eingebunden habe. Diese Methode erlaubt es, viele Variablen übersichtlich in einer Datei zu verwalten.

   2. Über das -var-Flag in der Kommandozeile angeben, also zum Beispiel -var="container_name=mein-container". Diese Methode hat eine höhere Priorität als die .tfvars-Datei, weil sie später ausgewertet wird.

   3. Direkt in der variables.tf-Datei definiert. Diese greifen nur, wenn kein anderer Wert übergeben wurde – also haben sie die niedrigste Priorität.

* Was zeigen die Outputs (output {}, terraform output) an, nachdem du apply ausgeführt hast? Wofür sind sie nützlich?

A: Die Outputs zeigen nach dem terraform apply die Werte an, die im output {}-Block definiert wurden, z.B den Namen des Containers oder den externen Port. Sie geben mir wichtige Informationen über die erstellte Infrastruktur zurück.

* Wie hast du den Inhalt der Variable nginx_html_content in die index.html Datei im laufenden Docker Container bekommen? Welche Terraform-Funktion (Provisioner) wurde dafür genutzt? (Hinweis: Dies ist nur eine von mehreren möglichen Methoden). 

A: Ich habe den Inhalt der Variable nginx_html_content mit dem Provisioner local-exec in die index.html im laufenden Docker-Container geschrieben. Dabei wurde ein lokaler Befehl ausgeführt, der per docker exec den Container betritt und den HTML-Text direkt in die Datei schreibt.


aws-vpc-ec2

In diesem Projekt wird mit Terraform eine einfache AWS-Infrastruktur bereitgestellt.  
Die Konfiguration erstellt folgende Ressourcen:

- Ein virtuelles privates Netzwerk (VPC) mit dem IP-Bereich 10.0.0.0/16  
- Ein Subnetz im VPC mit dem IP-Bereich 10.0.1.0/24  
- Eine Sicherheitsgruppe, die SSH-Zugriff (Port 22) von überall erlaubt  
- Eine EC2-Instanz im Subnetz, die die Sicherheitsgruppe nutzt und per SSH erreichbar ist