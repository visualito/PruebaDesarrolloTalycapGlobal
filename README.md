# PruebaDesarrolloTalycapGlobal
Solución de la prueba de Desarrollador .Net FullStack de Talycap Global


Esta solución consta de 5 proyectos que se corresponden con las capas de la arquitectura respectiva

LibreriaClimaEntitiesORM

Esta librería contiene los mapeos (ORM) de la base de datos incluyendo mapeos a procedimientos almacenados.


LibreriaClimaNegocio


Como su nombre lo indica, esta librería contiene las clases que definen e implementan los objetos que contienen toda la funcionalidad del sistema.


LibreriaClimaWCF

Esta librería encapsula a la librería de negocio de forma tal que permite establecer una interfaz funcional para ser expuesta a través de WCF para integración.

ServicioWindowsHostWCF

Es un servicio de windows que permite hacer SelfHosting de la librería WCF

WebClima

Aplicación Web con el front funcional y que hace uso de los servicios WCF.


Pasos para Instalar el sistema (Solución)


Una vez compilada la solución, se pueden seguir estos pasos para el corecto funcionamiento del sistema:

- Seleccionar una Instancia de Microsof SQl Server y correr el script
	\LibreriaClimaEntitiesORM\LibreriaClimaEntitiesORM\ModeloClima.edmx.sql
	
  esto creará la baase de datos y todos los objetos y datos necesarios para la información del clima
  
  Hace los mismo para el siguiente script:
  	\LibreriaClimaEntitiesORM\WebClima\Seguridad.edmx.sql
  	
-  Ir al directorio \LibreriaClimaEntitiesORM\ServicioWindowsHostWCF\bin\Release o \LibreriaClimaEntitiesORM\ServicioWindowsHostWCF\bin\Debug (dependiendo de que configuración
   de solución se tenga) y copiar los sigueintes archivos en un directorio de su preferencia:
   	LibreriaClimaEntitiesORM.dll
   	LibreriaClimaNegocio.dll
   	LibreriaClimaWCF.dll
   	ServicioWindowsHostWCF.exe
   	ServicioWindowsHostWCF.exe.config
   una vez copiados, abra una ventana de comando de windows (en modo administrador) y corra esta sentencia "installutil RutaDirectorio\ServicioWindowsHostWCF.exe /i"
   
   Por ejemplo si el directorio usado para copiar los archivos fue: "C:\Temp\ServicioClima" entonces la sentencia quedaría:
   
   	installutil C:\Temp\ServicioClima\ServicioWindowsHostWCF.exe /i
   Si la ruta donde se encuentra InstallUtil.exe no está adicionada al Path de windows, se puede copiar InstallUtil.exe dentro del directorio en donde se ecuentra el servicio y ejecutarlo sin darle la ruta completa asi:
   	installutil ServicioWindowsHostWCF.exe /i
   o simplemente se puede ubicar en donde esté InstallUtil.exe y ejecutarlo desde ese directorio escribiendo la ruta completa en donde se encuentran los archivos del servicio.
   
   Una vez instalado el servicio, este queda con el nombre "ServicioClima" y el nombre de display "Servicio información Clima", se puede levantar c usando el administrador de servicios
   que puede ser ejecutado mediante "services.msc".
   
   Una vez esté el servicio arriba, este hará SelfHosting se los servicios WCF los cuales estarán disponibles en la URL "net.tcp://localhost:8732/ServicioClima/Servicios/" o "net.tcp://localhost:8732/ServicioClima/Servicios/mex"
   No hay necesidad de configurar esto ya que la solución ya tiene esto configurado.
   
   Algo a tener en cuenta son las configuraciones de las cadenas de conexión tanto del Servicio de SelfHosting, como de la Aplicación Web, las cuales deben apuntar a las bases de datos eespectivas.
   
   
   Una vez todo esto esté configurado, se puede levantar la aaplicación Web En la Ruta: "localhost:58342/Home/Login"
   
   
  