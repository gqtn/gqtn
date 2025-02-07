# GNOME information

=========================================================================

- Check the GNOME's settings:

	gsettings get org.gnome.desktop.interface text-scaling-factor
	
	gsettings get org.gnome.desktop.interface scaling-factor

- Define another configuration:

	gsettings set org.gnome.desktop.interface text-scaling-factor
	gsettings set org.gnome.desktop.interface scaling-factor

==========================================================================
Para alterar a resolução DPi do GNOME:

1. Criar arquivo em:
        $ sudo nano ~/.config/environment.d/envvars.conf

2. Adicionar o valor:
        GDK_DPI_SCALE=1.1

Isso em X.ORG
