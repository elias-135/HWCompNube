FROM ubuntu:18.04

# paquetes y actualizaciones requeridas
RUN apt update && apt install -y vim htop nginx curl net-tools iptables

# Agregar nuestra pagina web al root
RUN echo '<!DOCTYPE html> <html lang="es"><head>    <meta charset="UTF-8">    <meta name="viewport" content="width=device-width, initial-scale=1.0">    <title>Computación en la Nube deber 1</title>    <style>        body {            font-family: Arial, sans-serif;            background-color: #f0f0f0;            margin: 0;            padding: 20px;        }        h1 {            color: #333;        }        p {            font-size: 18px;        }        .content {            background-color: #fff;            padding: 20px;            border-radius: 8px;            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);        }    </style></head><body>    <div class="content">        <h1>Computación en la Nube - Deber 1</h1>        <p>Elian Garcia.</p>    </div></body></html>' > /var/www/html/index.nginx-debian.html

#establecer permisos
RUN chown -R www-data:www-data /var/www/html

# Escuchar el puerto 80 para poder tener trafico
EXPOSE 80

# activar el servicio de nginx en segundo plano
CMD ["nginx", "-g", "daemon off;"]
