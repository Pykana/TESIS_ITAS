####################
      DB ITAS
####################

#######
TABLAS
#######
    ########
    CLIENTES
    ########
        ID_CLIENTE  -- AUTOINCREMENTAL
        NOMBRE
        APELLIDO
        DIRECCION
        TELEFONO  -- 9
        RUC   -- UNICO  -- NULO
        DNI -- UNICO  -- 8 DIGITOS
        CORREO -- UNICO
        USUARIO  -- UNICO
        CONTRASEÑA
        ESTADO -- ACTIVO O INACTIVO
        FECHA_CREACION
        FECHA_MODIFICACION
        FECHA_ANULACION

    ##############
    TOKEN_TEMPORAL  -- SE BORRA CADA 5 MINUTOS -- EVENTO
    ##############
        ID_TOKEN  -- AUTOINCREMENTAL
        USUARIO  -- UNICO
        TOKEN
        FECHA_CREACION

    ##########
    PROVEEDOR 
    ##########
        ID_PROVEEDOR  -- AUTOINCREMENTAL
        NOMBRE
        DIRECCION
        TELEFONO
        RUC
        CORREO
        ESTADO -- ACTIVO O INACTIVO
        FECHA_CREACION
        FECHA_MODIFICACION

######
LOGIN  -- INDEPENDIENTE}
######
    ##############
    EVENTO A USAR
    ##############
    EVT BORRAR TOKEN_TEMPORAL
         SE BORRA EL TOKEN DE LA TABLA QUE HAYA PASADO LOS 5 MINUTOS DESDE SE FECHA_CREACION

    ################################
    PROCEDIMIENTO ALMACENADO A USAR
    ################################
        SP VERIFICAR USUARIO  -- VALIDA SI EXSITE EL USUARIO
                USUARIO
                CONTRASEÑA (CONVERTIR A HASH)
        SP VALIDAR USUARIO ACTIVO-- VALIDA SI EL USUARIO ESTA ACTIVO  //  EN EL CASO DE OLVIDO DE CONTRASEÑA
                USUARIO
        SP CAMBIAR CONTRASEÑA   -- VERIFICA SI EXISTE EL USUARIO
                USUARIO -- VALOR 
                CONTRASEÑA ANTIGUA
                CONTRASEÑA NUEVA
                CONFIRGMAR CONTRASEÑA NUEVA
        SP GENERAR TOKEN -- GENERA TOKEN A PARTIR DE LA SIGUIENTE SECUANDIA (DIA DE HOY  //  PRIMERAS 3 LETRAS DEL USUARIO // ULTIMAS 5 LETRAS DEL HASH DE LA CONTRASEÑA // UN NUMERO AL AZAR DEL 1 AL 100)   --EN CASO DE SER CORRECTO PERO YA EXISTA EL TOKEN , ESTE SE REEMPLAZA CON EL NUEVO 
                USUARIO
                CONTRASEÑA
                TOKEN
        SP VERIFICAR RUC -- VERIRIFICA QUE EL RUC NO ESTE ASOCIADO A OTRO CLIENTE O PROVEEDOR
                USUARIO
                RUC
        SP VERIFICAR DNI -- VERIFICA QUE EL DNI NO ESTE ASOCIADO A OTRO CLIENTE
                USUARIO
                DNI
        SP VERIFICAR CORREO -- VERIFICA QUE EL CORREO NO ESTE ASOCIADO A OTRO CLIENTE O PROVEEDOR
                USUARIO
                CORREO
        SP REGISTRAR USUARIO -- REGISTRA EL USUARIO
                NOMBRE
                APELLIDO
                DIRECCION
                TELEFONO
                RUC
                DNI
                CORREO
                USUARIO
                CONTRASEÑA  -- SE CONVIERTE A HASH
        SP ENVIAR CORREO -- ENVIA UN CORREO AL USUARIO CON EL TOKEN GENERADO
                USUARIO
                CORREO
                TOKEN

    ########################
    ORDEN DE FUNCIONAMIENTO
    ########################
        USUARIO TENDRA 3 OPCIONES AL INGRESAR AL LOGIN
            1. INGRESAR USUARIO Y CONTRASEÑA
            2. REGISTRAR USUARIO
            3. OLVIDO SU CONTRASEÑA

        OPCION 1
            1. SE VALIDA SI EXISTE EL USUARIO
            2. SE VALIDA SI EL USUARIO ESTA ACTIVO
            3. SE VALIDA SI LA CONTRASEÑA ES CORRECTA
            4. SE REDIRECCIONA A LA PAGINA PRINCIPAL
        OPCION 2
            1. SE VALIDA SI EL RUC NO ESTA ASOCIADO A OTRO CLIENTE O PROVEEDOR
            2. SE VALIDA SI EL DNI NO ESTA ASOCIADO A OTRO CLIENTE
            3. SE VALIDA SI EL CORREO NO ESTA ASOCIADO A OTRO CLIENTE O PROVEEDOR
            4. SE REGISTRA EL USUARIO
            5. SE REDIRECCIONA A LA PAGINA PRINCIPAL
        OPCION 3
            1. SE VALIDA SI EXISTE EL USUARIO
            2. SE VALIDA SI EL USUARIO ESTA ACTIVO
            3. SE ENVIA UN CORREO AL USUARIO CON UN TOKEN
            4. SE VALIDA EL TOKEN ENVIADO AL CORREO
            5. SE REDIRECCIONA A LA PAGINA DE CAMBIO DE CONTRASEÑA
            6. SE CAMBIA LA CONTRASEÑA
            7. SE REDIRECCIONA A LA PAGINA PRINCIPAL


##############
VALIDAR_TOKEN
##############
    ################################
    PROCEDIMIENTO ALMACENADO A USAR
    ################################
        SP VALIDAR TOKEN -- VALIDA EL TOKEN ENVIADO AL CORREO ES EL CORRECTO CON EL ESCRITO
                USUARIO
                CONTRASEÑA
                TOKEN

    #######################
    ORDEN DE FUNCIONAMIENTO
    #######################
        USUARIO TENDRA 1 OPCION AL INGRESAR AL VALIDAR_TOKEN
            1. INGRESAR EL TOKEN ENVIADO AL CORREO
            2. REDIRECCIONAR A LA PAGINA DE CAMBIO DE CONTRASEÑA

        OPCION 1
            1. SE VALIDA EL TOKEN ENVIADO AL CORREO
            2. SE REDIRECCIONA A LA PAGINA DE CAMBIO DE CONTRASEÑA

##############
MENU PRINCIPAL  -- INDEPENDIENTE 
##############
    ################################
    PROCEDIMIENTO ALMACENADO A USAR
    ################################


    #######################
    ORDEN DE FUNCIONAMIENTO
    #######################

######
PERFIL -- DE MENU PRINCIPAL
#######
    ################################
    PROCEDIMIENTO ALMACENADO A USAR
    ################################
            SP MODIFICAR DATOS
                    USUARIO     
                    NOMBRE      --NO CAMBIA
                    APELLIDO    --NO CAMBIA
                    DIRECCION
                    TELEFONO
                    DNI         --NO CAMBIA
                    CORREO      
            SP CAMBIAR CONTRASEÑA
                    USUARIO
                    CONTRASEÑA ANTIGUA
                    CONTRASEÑA NUEVA
                    CONFIRMAR CONTRASEÑA NUEVA

    #######################
    ORDEN DE FUNCIONAMIENTO
    #######################
        USUARIO TENDRA 3 OPCIONES AL INGRESAR AL PERFIL
            1. MODIFICAR DATOS
            2. CAMBIAR CONTRASEÑA
            3. CERRAR SESION
            OPCION 1
                1. SE MODIFICAN LOS DATOS
                2. SE REDIRECCIONA A LA PAGINA PRINCIPAL
            OPCION 2
                1. SE CAMBIA LA CONTRASEÑA
                2. SE REDIRECCIONA A LA PAGINA PRINCIPAL
            OPCION 3
                1. SE CIERRA SESION
                2. SE REDIRECCIONA A LA PAGINA DE LOGIN

###########
FACTURACION -- DE MENU PRINCIPAL 
###########
    ################################
    PROCEDIMIENTO ALMACENADO A USAR
    ################################


    #######################
    ORDEN DE FUNCIONAMIENTO
    #######################

###############
TOTAL DEL MES  -- DE LA VENTANA DE FACTURACION
###############
    ################################
    PROCEDIMIENTO ALMACENADO A USAR
    ################################

    #######################
    ORDEN DE FUNCIONAMIENTO
    #######################

###########
PROVEEDORES  -- DE MENU PRINCIPAL
###########
    ################################
    PROCEDIMIENTO ALMACENADO A USAR
    ################################

    #######################
    ORDEN DE FUNCIONAMIENTO
    #######################

######################
CALENDARIO DE TRABAJO  -- DE MENU PRINCIPAL 
######################
    ################################
    PROCEDIMIENTO ALMACENADO A USAR
    ################################

    #######################
    ORDEN DE FUNCIONAMIENTO
    #######################

######################
PARTE API SUNAT
######################
    ################################
    PROCEDIMIENTO ALMACENADO A USAR
    ################################

    #######################
    ORDEN DE FUNCIONAMIENTO
    #######################




