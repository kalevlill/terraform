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

