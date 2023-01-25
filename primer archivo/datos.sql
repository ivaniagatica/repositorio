create database Unirefri_BAD
use Unirefri_BAD

CREATE TABLE Empleado(
IdEmpleado int primary key identity(1,1),
NombreEmpleados varchar(100),
ApellidoEmpleados varchar(100),
PuestoEmpleados varchar(100)
)

CREATE TABLE Lista(
IdLista int primary key identity(1,1),
NombreLista varchar(100),
FechaCreacion  varchar(100),
UsuarioCreacion varchar(100),
FechaActualizacion varchar(100),
UsuarioActualizacion  varchar(100),
IdMoneda int,
Constraint FK_Moneda FOREIGN KEY (IdMoneda) References Moneda (IdMoneda)  
)

CREATE TABLE Moneda(
IdMoneda int primary key identity(1,1),
Descripcion varchar(100)
)

CREATE TABLE Permiso(
IdPermiso int primary key identity(1,1),
PermisosLectura varchar(100),
PermisosEscritura varchar(100)
)

CREATE TABLE PrecioDetalle(
IdCorrelativo int,
PrecioLista float,
IdLista int,
IdProducto int,
Constraint FK_PrecioEncabezado FOREIGN KEY (IdCorrelativo) References PrecioEncabezado(IdCorrelativo),
Constraint FK_Lista FOREIGN KEY (IdLista) References Lista (IdLista), 
Constraint FK_Producto FOREIGN KEY (IdProducto) References Producto (IdProducto) 
)

CREATE TABLE PrecioEncabezado(
IdCorrelativo int primary key identity(1,1),
FechaPrecioEncabezado varchar(100),
horaPrecioEncabezado  varchar(100),
IdUsuario int,
Constraint FK_Usuario FOREIGN KEY (IdUsuario) References Usuarios (IdUsuario)  
)

CREATE TABLE Producto(
IdProducto int primary key identity(1,1),
DescripcionProducto varchar(100),
FechaCreacionProducto  varchar(100),
UsuarioCreacionProducto  varchar(100),
FechaActualizacionProducto  varchar(100),
UsuarioActualizacionProducto   varchar(100)
)

CREATE TABLE Usuarios(
IdUsuario int primary key identity(1,1),
NombreUsuario varchar(100),
ContrasenaUsuario  varchar(100),
IdEmpleado int,
IdPermiso int,
Constraint FK_Empleado FOREIGN KEY (IdEmpleado) References Empleado (IdEmpleado), 
Constraint FK_Permiso FOREIGN KEY (IdPermiso) References Permiso (IdPermiso)
)
--------------------------------------------------------
 CREATE proc sp_RegistrarUsuarios(
@NombreUsuario varchar(100),
@ContrasenaUsuario varchar(100),
@registrado bit output,
@mensaje varchar(100) output

)
as
  begin
       if (not exists(select *from Usuarios where NombreUsuario = @NombreUsuario))
       begin
	   insert into Usuarios(NombreUsuario,ContrasenaUsuario) values (@NombreUsuario,@ContrasenaUsuario)
	   set @registrado =1
	   set @mensaje ='Usuario registrado'
	end
	else
	begin 
	   set @registrado = 0
	   set @mensaje = 'Existe el usuario'
	end 
 end
----------------------------------------------------------------
 create proc sp_validarUsuarios(
 @NombreUsuario varchar(100),
 @ContraseñaUsuario varchar(100)
 )
 as 
  begin 
      if(not exists(select*from Usuarios


 ---------------------------------Empleado-------------------------------------
 
create procedure sp_listaEmpleado
as
begin
     select * from Empleado
end

----------------------------------------

create procedure sp_obtenerEmpleado(
@IdEmpleado  int
)
as
begin 
    select * from Empleado where IdEmpleado = @IdEmpleado
end


----------------------------

create procedure sp_guardarEmpleado(
@NombreEmpleados varchar(100),
@ApellidoEmpleados varchar(100),
@PueatoEmpleados varchar(100)
)
as 
 begin [dbo].[Lista]
     insert into EmEmpleado(NombreEmpleados,telefono,correo,fecha,hora,comentario) values (@nombre,@telefono,@correo,@fecha,@hora,@comentario)
	 end

---------------------------

create procedure sp_editar(
@Idcitas int,
@nombre varchar(100),
@telefono varchar(100),
@correo varchar(100),
@fecha varchar(100),
@hora varchar(100),
@comentario varchar(100)
)
as
  begin 
      update citas set nombre = @nombre, telefono = @telefono, correo = @correo, fecha = @fecha,hora =@hora,comentario = @comentario where Idcitas = @Idcitas
end

------------------------

create procedure sp_eliminar(
@Idcitas int
)
as
begin
    delete from citas where Idcitas = @Idcitas
end

