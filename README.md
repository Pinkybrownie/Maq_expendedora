# Maq_expendedora
Proyecto VHDL sobre máquina de refrescos
DESCRIPCIÓN TRABAJO:
Máquina expendedora de refrescos
Diseñe una máquina expendedora de refrescos. Admite monedas de 10c, 20c, 50c y 1€. Sólo admite el 
importe exacto, de forma que si introducimos dinero de más da un error y “devuelve” todo el dinero. 
Cuando se llega al importe exacto del refresco (1€) se activará una señal para dar el producto. Como 
entradas tendrá señales indicadoras de la moneda, señales indicadoras de producto y como salidas la 
señal de error y la de producto

REQUISITOS
• Usar como reloj los 100 MHz disponibles en la placa. Si, como es probable, resultasen mas adecuadas frecuencias mas bajas, usar un “prescaler” o divisor para generarlas a partir de dicha señal.
• Usar máquinas de estados de Moore para controlar aquellos diseños que presentan distintos estados durante su funcionamiento.
• Usar para las temporizaciones un monoestable que la máquina de estado de control pueda cargar y disparar.
• No emplear “supercircuitos” o “supermáquinas” de estados que lo hagan todo. Identificar aquellas funciones que pueden diseñarse de forma independiente y dividir el sistema todo lo necesario para obtener entidades sencillas de diseñar y, sobre todo, de depurar.
• La mayor parte del tiempo se dedica a la depuración de código. Es mejor tener muchos componentes pequeños fáciles de comprobar que uno que requiera comprobaciones muy complejas y muy trabajosas de desarrollar.
• El tiempo dedicado a generar “testbenches” siempre es provechoso.
• Comprobar los componentes individualmente antes de conectarlos con más componentes.
• Si se intenta comprobar el funcionamiento de todo el sistema a la vez y sólo al final, resulta muy trabajoso (y frustrante) detectar errores cuando pueden provenir de cualquier parte.
• Siempre se debe partir de la funcionalidad del sistema a diseñar y desde ahí proceder a dividirla. Proceder al revés, es decir, diseñar los componentes y luego intentar “pegarlos” para que hagan algo juntos no suele dar buenos 
resultados, aunque inicialmente parezca más fácil.
• Pensar siempre primero en el qué (funcionalidad) y luego en el cómo (implementación) y nunca al revés.
• Dedicar el tiempo necesario a definir la interfaz de cada componente (qué entradas y qué salidas tiene), y su funcionalidad (cómo responde a sus entradas) y ponerlo por escrito. De esa forma será posible repartir el desarrollo de los 
componentes entre los miembros del grupo y trabajar en paralelo y, de paso, 
servirá de base para la memoria del trabajo.
• Es mejor simular primero y sólo probar en la placa cuando las simulaciones funcionen. Durante la simulación se tiene un control total: se pueden visualizar todas las señales y variables y se puede ejecutar el código paso a paso o poner 
puntos de ruptura. En la placa solo podremos ver si el circuito funciona o no funciona en su conjunto y sólo a través de las salidas, por lo que tendremos muy poca información. Además, se puede simular en cualquier ordenador, no es 
necesario disponer de la placa.
• Intentar que el diseño sea totalmente síncrono.
• Incluir circuitos de sincronización y antirrebote en cualquier entrada externa ala FPGA salvo el reloj (i.e. pulsadores, interruptores)
• Antes de diseñar un componente desde cero, comprobar las plantillas de VHDL que proporciona Xilinx con su herramienta. Es posible que podamos usar el componente tal cual o con pequeñas modificaciones. En cualquier caso será un 
punto de partida.
