
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/14/2017 16:48:42
-- Generated from EDMX file: D:\VIsual Studio Repository\WebAppSIGEF\AppSIGEF\WebAppSIGEF\Models\ModelSIGEF.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AppSIGEF];
GO
IF SCHEMA_ID(N'sigef') IS NULL EXECUTE(N'CREATE SCHEMA [sigef]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'baUnidadFinanciera'
CREATE TABLE [sigef].[baUnidadFinanciera] (
    [iUnidadFinanciera_id] int IDENTITY(1,1) NOT NULL,
    [sUnidadFinanciera_nm] nvarchar(max)  NOT NULL,
    [sUnidadFinanciera_NIT] nvarchar(max)  NOT NULL,
    [sUnidadFinanciera_dir] nvarchar(max)  NOT NULL,
    [sUnidadFinanciera_telf] nvarchar(max)  NOT NULL,
    [sUnidadFinanciera_desc] nvarchar(max)  NOT NULL,
    [iUnidadFinanciera_cantSuc] int  NOT NULL,
    [iAdmin_id] int  NOT NULL
);
GO

-- Creating table 'baModulo'
CREATE TABLE [sigef].[baModulo] (
    [iModulo_id] int IDENTITY(1,1) NOT NULL,
    [sModulo_nm] nvarchar(max)  NOT NULL,
    [sModulo_desc] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'baADM_USER'
CREATE TABLE [sigef].[baADM_USER] (
    [iADM_USER_id] int IDENTITY(1,1) NOT NULL,
    [sADM_USER_login] nvarchar(max)  NOT NULL,
    [sADM_USER_pass] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'baAdmin'
CREATE TABLE [sigef].[baAdmin] (
    [iAdmin_id] int IDENTITY(1,1) NOT NULL,
    [sAdmin_nm] nvarchar(max)  NOT NULL,
    [sAdmin_apell] nvarchar(max)  NOT NULL,
    [iADM_USER_id] int  NOT NULL,
    [iAdmin_funcionfl] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'paSucursal'
CREATE TABLE [sigef].[paSucursal] (
    [iSucursal_id] int IDENTITY(1,1) NOT NULL,
    [sSucursal_nm] nvarchar(max)  NOT NULL,
    [sSucursal_dir] nvarchar(max)  NOT NULL,
    [sSucursal_telf] nvarchar(max)  NULL,
    [iSucursal_cantCajas] int  NOT NULL,
    [iUnidadFinanciera_id] int  NOT NULL
);
GO

-- Creating table 'caPAC'
CREATE TABLE [sigef].[caPAC] (
    [iPAC_id] int IDENTITY(1,1) NOT NULL,
    [iPAC_num] smallint  NOT NULL,
    [iSucursal_id] int  NOT NULL
);
GO

-- Creating table 'caSolitudCaptacion'
CREATE TABLE [sigef].[caSolitudCaptacion] (
    [iSolitudCaptacion_id] int IDENTITY(1,1) NOT NULL,
    [dtSolitudCaptacion_fecha] datetime  NOT NULL,
    [sSolitudCaptacion_desc] nvarchar(max)  NOT NULL,
    [iPAC_id] int  NOT NULL,
    [iCliente_id] int  NOT NULL,
    [iSolicitudCaptacion_discriminador] int  NOT NULL,
    [iSolicitudCaptacion_estado] smallint  NOT NULL
);
GO

-- Creating table 'mcCaja'
CREATE TABLE [sigef].[mcCaja] (
    [iCaja_id] int IDENTITY(1,1) NOT NULL,
    [iSucursal_id] int  NOT NULL
);
GO

-- Creating table 'mcTransaccion'
CREATE TABLE [sigef].[mcTransaccion] (
    [iTransaccion_id] int IDENTITY(1,1) NOT NULL,
    [iCaja_id] int  NULL,
    [iTipoTransaccion_fl] nvarchar(max)  NOT NULL,
    [dtTransaccion_fecha] datetime  NOT NULL,
    [iMoneda_fl] nvarchar(max)  NOT NULL,
    [dTransaccion_monto] decimal(18,0)  NOT NULL,
    [iCliente_id] int  NOT NULL,
    [sTransaccion_desc] nvarchar(max)  NOT NULL,
    [iATM_id] int  NULL,
    [oaLibroATM_oaLibroATM_id] int  NOT NULL
);
GO

-- Creating table 'mcLibroCaja'
CREATE TABLE [sigef].[mcLibroCaja] (
    [iLibroCaja_id] int IDENTITY(1,1) NOT NULL,
    [iTransaccion_id] int  NULL,
    [dtLibroCaja_fecha] nvarchar(max)  NOT NULL,
    [iCaja_id] nvarchar(max)  NOT NULL,
    [dDebe_mn] decimal(18,0)  NOT NULL,
    [dDebe_me] decimal(18,0)  NOT NULL,
    [dHaber_mn] decimal(18,0)  NOT NULL,
    [dHaber_me] decimal(18,0)  NOT NULL,
    [dSaldo_mn] decimal(18,0)  NOT NULL,
    [dSaldo_me] decimal(18,0)  NOT NULL,
    [iSolicitudFondo_id] int  NULL
);
GO

-- Creating table 'mcConciliacionCaja'
CREATE TABLE [sigef].[mcConciliacionCaja] (
    [iConciliacionCaja_id] int IDENTITY(1,1) NOT NULL,
    [iCaja_id] int  NOT NULL,
    [dtConciliacion_fecha] datetime  NOT NULL,
    [dDebe_nm] decimal(18,0)  NOT NULL,
    [dDebe_me] decimal(18,0)  NOT NULL,
    [dHaber_mn] decimal(18,0)  NOT NULL,
    [dHaber_me] decimal(18,0)  NOT NULL,
    [dSaldo_mn] decimal(18,0)  NOT NULL,
    [dSaldo_me] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'mcDetalleCheque'
CREATE TABLE [sigef].[mcDetalleCheque] (
    [iDetalleCheque_id] int IDENTITY(1,1) NOT NULL,
    [sDetalleCheque_num] nvarchar(max)  NOT NULL,
    [sDetalleCheque_banco] nvarchar(max)  NOT NULL,
    [sDetalleCheque_nombre] nvarchar(max)  NOT NULL,
    [iTransaccion_id] int  NULL
);
GO

-- Creating table 'peCliente'
CREATE TABLE [sigef].[peCliente] (
    [iCliente_id] int IDENTITY(1,1) NOT NULL,
    [sCliente_nombre] nvarchar(max)  NOT NULL,
    [sCliente_apellido] nvarchar(max)  NOT NULL,
    [sCliente_ci] nvarchar(max)  NOT NULL,
    [sCliente_telf] nvarchar(max)  NOT NULL,
    [iCliente_discriminador] int  NULL
);
GO

-- Creating table 'peCAportacion'
CREATE TABLE [sigef].[peCAportacion] (
    [iCAportacion_id] int IDENTITY(1,1) NOT NULL,
    [iCliente_id] int  NOT NULL
);
GO

-- Creating table 'msFuncionario'
CREATE TABLE [sigef].[msFuncionario] (
    [iFuncionario_id] int IDENTITY(1,1) NOT NULL,
    [sFuncionario_nombre] nvarchar(max)  NOT NULL,
    [sFuncionario_apellido] nvarchar(max)  NOT NULL,
    [sFuncionario_ci] nvarchar(max)  NOT NULL,
    [dtFuncionario_fechaContratacion] datetime  NOT NULL,
    [sFuncionario_email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'msUsuario'
CREATE TABLE [sigef].[msUsuario] (
    [iUsuario_id] int IDENTITY(1,1) NOT NULL,
    [sUsuario_username] nvarchar(max)  NOT NULL,
    [sUsuario_password] nvarchar(max)  NOT NULL,
    [iFuncionario_id] int  NOT NULL,
    [iRol_id] int  NOT NULL
);
GO

-- Creating table 'msPassword'
CREATE TABLE [sigef].[msPassword] (
    [iPassword_id] int IDENTITY(1,1) NOT NULL,
    [dtPassword_fechaCambio] datetime  NOT NULL,
    [sPassword_anterior] nvarchar(max)  NOT NULL,
    [iUsuario_id] int  NOT NULL
);
GO

-- Creating table 'msRol'
CREATE TABLE [sigef].[msRol] (
    [iRol_id] int IDENTITY(1,1) NOT NULL,
    [sRol_nombre] nvarchar(max)  NOT NULL,
    [sRol_desc] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'msPrivilegio'
CREATE TABLE [sigef].[msPrivilegio] (
    [iPrivilegio_id] int IDENTITY(1,1) NOT NULL,
    [sPrivilegio_nombre] nvarchar(max)  NOT NULL,
    [sPrivilegio_desc] nvarchar(max)  NOT NULL,
    [iCasoDeUso_fl] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'msBitacora'
CREATE TABLE [sigef].[msBitacora] (
    [iBitadora_id] int IDENTITY(1,1) NOT NULL,
    [dtBitacora_fechaRegistro] nvarchar(max)  NOT NULL,
    [iUsuario_id] nvarchar(max)  NOT NULL,
    [sBitacora_desc] nvarchar(max)  NOT NULL,
    [sTablaModificada] nvarchar(max)  NOT NULL,
    [sOperacionRealizada] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'teSolicitudFondo'
CREATE TABLE [sigef].[teSolicitudFondo] (
    [iSolicitudFondo_id] int IDENTITY(1,1) NOT NULL,
    [dtSolicitud_fecha] datetime  NOT NULL,
    [dSolicitud_monto] decimal(18,0)  NOT NULL,
    [iMoneda_fl] int  NOT NULL,
    [iBoveda_id] int  NOT NULL,
    [iCaja_id] int  NOT NULL
);
GO

-- Creating table 'teBoveda'
CREATE TABLE [sigef].[teBoveda] (
    [iBoveda_id] int IDENTITY(1,1) NOT NULL,
    [dBoveda_montoActualMN] decimal(18,0)  NOT NULL,
    [dBoveda_montoActualME] decimal(18,0)  NOT NULL,
    [dtBoveda_ultimaConciliacion] datetime  NOT NULL,
    [iSucursal_id] int  NOT NULL
);
GO

-- Creating table 'teLibroMayor'
CREATE TABLE [sigef].[teLibroMayor] (
    [iLibroMayor_id] int IDENTITY(1,1) NOT NULL,
    [dtLibroMayor_fecha] datetime  NOT NULL,
    [iSolicitudFondo_id] int  NOT NULL,
    [Property1] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'teConciliacionLM'
CREATE TABLE [sigef].[teConciliacionLM] (
    [iConciliacionLM_id] int IDENTITY(1,1) NOT NULL,
    [iBoveda_id] int  NOT NULL,
    [dDebe_mn] decimal(18,0)  NOT NULL,
    [dDebe_me] decimal(18,0)  NOT NULL,
    [dHaber_mn] decimal(18,0)  NOT NULL,
    [dHaber_me] decimal(18,0)  NOT NULL,
    [dSaldo_mn] decimal(18,0)  NOT NULL,
    [dSaldo_me] decimal(18,0)  NOT NULL,
    [dtConciliacionLM_fecha] datetime  NOT NULL
);
GO

-- Creating table 'acCajaAhorro'
CREATE TABLE [sigef].[acCajaAhorro] (
    [iCajaAhorro_id] int IDENTITY(1,1) NOT NULL,
    [sCajaAhorro_num] nvarchar(max)  NOT NULL,
    [iTipoCaja_fl] int  NOT NULL,
    [iMoneda_fl] int  NOT NULL,
    [dCajaAhorro_saldo] decimal(18,0)  NOT NULL,
    [dCajaAhorro_montoMaximoRetiro] decimal(18,0)  NOT NULL,
    [iEstadoCajaAhorro_fl] int  NOT NULL,
    [iCliente_id] int  NOT NULL,
    [iTarjetaDebito_id] int  NOT NULL
);
GO

-- Creating table 'acTarjetaDebito'
CREATE TABLE [sigef].[acTarjetaDebito] (
    [iTarjetaDebito_id] int IDENTITY(1,1) NOT NULL,
    [sTarjetaDebito_num] nvarchar(max)  NOT NULL,
    [sTarjetaDebito_cvc] nvarchar(max)  NOT NULL,
    [iTarjetaDebito_PIN] nvarchar(max)  NOT NULL,
    [iCliente_id] int  NOT NULL
);
GO

-- Creating table 'acDPF'
CREATE TABLE [sigef].[acDPF] (
    [iDPF_id] int IDENTITY(1,1) NOT NULL,
    [dtDPF_fechaInicio] datetime  NOT NULL,
    [iDuracionDPF_fl] int  NOT NULL,
    [dtDPF_fechaCaducidad] datetime  NOT NULL,
    [dDPF_interes] decimal(18,0)  NOT NULL,
    [dDPF_monto] decimal(18,0)  NOT NULL,
    [iEstadoDPF_fl] int  NOT NULL,
    [iCliente_id] int  NOT NULL
);
GO

-- Creating table 'acDetalleCajaAhorro'
CREATE TABLE [sigef].[acDetalleCajaAhorro] (
    [iDetalleCajaAhorro_id] int IDENTITY(1,1) NOT NULL,
    [iCajaAhorro_id] int  NOT NULL,
    [dDebe_caja] decimal(18,0)  NOT NULL,
    [dHaber_caja] decimal(18,0)  NOT NULL,
    [dSaldo_caja] decimal(18,0)  NOT NULL,
    [dtDetalle_fecha] datetime  NOT NULL,
    [iMoneda_fl] int  NOT NULL,
    [sDetalle_desc] nvarchar(max)  NOT NULL,
    [iTransaccion_id] int  NOT NULL
);
GO

-- Creating table 'acDetalleDPF'
CREATE TABLE [sigef].[acDetalleDPF] (
    [iDetalleDPF_id] int IDENTITY(1,1) NOT NULL,
    [iDPF_id] int  NOT NULL,
    [iTipoTransaccionDPF] int  NOT NULL,
    [dDetalleDPF_monto] decimal(18,0)  NOT NULL,
    [dtDetalleDPF_fecha] datetime  NOT NULL,
    [sDetalleDPF_desc] nvarchar(max)  NOT NULL,
    [iTransaccion_id] int  NOT NULL
);
GO

-- Creating table 'acDetalleCredito'
CREATE TABLE [sigef].[acDetalleCredito] (
    [iDetalleCredito_id] int IDENTITY(1,1) NOT NULL,
    [iTransaccion_id] int  NOT NULL,
    [dDebe_nm] decimal(18,0)  NOT NULL,
    [dDebe_me] decimal(18,0)  NOT NULL,
    [dHaber_mn] decimal(18,0)  NOT NULL,
    [dHaber_me] decimal(18,0)  NOT NULL,
    [dSaldo_mn] decimal(18,0)  NOT NULL,
    [dSaldo_me] decimal(18,0)  NOT NULL,
    [dtDetalleCredito_fecha] datetime  NOT NULL
);
GO

-- Creating table 'coSolicitudCredito'
CREATE TABLE [sigef].[coSolicitudCredito] (
    [iSolicitudCredito_id] int IDENTITY(1,1) NOT NULL,
    [dtSolicitudCredito_fecha] datetime  NOT NULL,
    [iTipoCredito_fl] smallint  NOT NULL,
    [dSolicitudCredito_monto] decimal(18,0)  NOT NULL,
    [iMoneda_fl] smallint  NOT NULL,
    [iPlazoCredito_fl] smallint  NOT NULL,
    [dInteresAnual] decimal(18,0)  NOT NULL,
    [iCliente_id] int  NOT NULL,
    [iUsuario_id] int  NOT NULL,
    [iSolicitudCredito_discriminador] int  NULL,
    [iSolicitudCredito_estado] int  NOT NULL
);
GO

-- Creating table 'coCouta'
CREATE TABLE [sigef].[coCouta] (
    [iCuota_id] int IDENTITY(1,1) NOT NULL,
    [iSolicitudCredito_id] int  NOT NULL,
    [dCuota_capital] decimal(18,0)  NOT NULL,
    [dCuota_interes] decimal(18,0)  NOT NULL,
    [sCuota_num] nvarchar(max)  NOT NULL,
    [sCuota_monto] nvarchar(max)  NOT NULL,
    [iMoneda_fl] smallint  NOT NULL,
    [dtCuota_fecha] datetime  NOT NULL
);
GO

-- Creating table 'coRequisito'
CREATE TABLE [sigef].[coRequisito] (
    [iRequisito_id] int IDENTITY(1,1) NOT NULL,
    [iSolicitudCredito_id] int  NOT NULL,
    [sRequisito_desc] nvarchar(max)  NOT NULL,
    [sRequisito_estado] nvarchar(max)  NOT NULL,
    [iRequisito_importancia] smallint  NOT NULL
);
GO

-- Creating table 'coCarteraVigente'
CREATE TABLE [sigef].[coCarteraVigente] (
    [iCarteraVigente_id] int IDENTITY(1,1) NOT NULL,
    [iSolicitudCredito_id] int  NOT NULL,
    [dtVigente_fechaLimite] datetime  NOT NULL
);
GO

-- Creating table 'coCarteraMora'
CREATE TABLE [sigef].[coCarteraMora] (
    [iCarteraMora_id] int IDENTITY(1,1) NOT NULL,
    [iSolicitudCredito_id] int  NOT NULL,
    [dtMora_fechaLimite] datetime  NOT NULL,
    [dtMora_fechaMora] datetime  NOT NULL,
    [iMora_cuotasAtrasadas] int  NOT NULL
);
GO

-- Creating table 'coCarteraEjecucion'
CREATE TABLE [sigef].[coCarteraEjecucion] (
    [iCarteraEjecucion_id] int IDENTITY(1,1) NOT NULL,
    [iSolicitudCredito_id] int  NOT NULL,
    [dtEjecucion_fecha] decimal(18,0)  NOT NULL,
    [iEjecucion_notificacionNum] int  NOT NULL
);
GO

-- Creating table 'coHistoricoCredito'
CREATE TABLE [sigef].[coHistoricoCredito] (
    [iHistoricoCredito_id] int IDENTITY(1,1) NOT NULL,
    [iSolicitudCredito_id] int  NOT NULL,
    [dtHistoricoCredito_cierre] datetime  NOT NULL,
    [dtHistoricoCredito_ultimaCuota] datetime  NOT NULL
);
GO

-- Creating table 'oaATM'
CREATE TABLE [sigef].[oaATM] (
    [iATM_id] int IDENTITY(1,1) NOT NULL,
    [sATM_fabrica] nvarchar(max)  NOT NULL,
    [sATM_dir] nvarchar(max)  NOT NULL,
    [iATM_tipo] smallint  NOT NULL,
    [sATM_nombre] nvarchar(max)  NOT NULL,
    [dtATM_ultimaConciliacion] datetime  NOT NULL,
    [iATM_estado] int  NOT NULL,
    [dATM_saldoMN] decimal(18,0)  NOT NULL,
    [dATM_saldoME] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'oaTarjetaRetenida'
CREATE TABLE [sigef].[oaTarjetaRetenida] (
    [iTarjetaRetenida_id] int IDENTITY(1,1) NOT NULL,
    [dtRetenida_fecha] datetime  NOT NULL,
    [sTarjetaDebito_num] nvarchar(max)  NOT NULL,
    [sRetenida_desc] nvarchar(max)  NOT NULL,
    [iATM_id] int  NOT NULL
);
GO

-- Creating table 'oaLibroATM'
CREATE TABLE [sigef].[oaLibroATM] (
    [oaLibroATM_id] int IDENTITY(1,1) NOT NULL,
    [dtLibroATM_fecha] datetime  NOT NULL,
    [dDebe_mn] decimal(18,0)  NOT NULL,
    [dDebe_me] decimal(18,0)  NOT NULL,
    [dHaber_mn] decimal(18,0)  NOT NULL,
    [dHaber_me] decimal(18,0)  NOT NULL,
    [dSaldo_mn] decimal(18,0)  NOT NULL,
    [dSaldo_me] decimal(18,0)  NOT NULL,
    [sLibroATM_desc] nvarchar(max)  NOT NULL,
    [iAtm_id] int  NOT NULL,
    [iTransaccion_id] int  NOT NULL
);
GO

-- Creating table 'peCliente_peSocio'
CREATE TABLE [sigef].[peCliente_peSocio] (
    [dtSocio_fechaAfiliacion] datetime  NOT NULL,
    [sSocio_negocio] nvarchar(max)  NOT NULL,
    [sSocio_ingresos] nvarchar(max)  NOT NULL,
    [iCliente_id] int  NOT NULL
);
GO

-- Creating table 'coSolicitudCredito_coCredito'
CREATE TABLE [sigef].[coSolicitudCredito_coCredito] (
    [dtCredito_aprobacion] datetime  NOT NULL,
    [dtCredito_desembolso] datetime  NOT NULL,
    [iCredito_cuotas] int  NOT NULL,
    [dtCredito_vencimiento] datetime  NOT NULL,
    [iCredito_estado] int  NOT NULL,
    [iSolicitudCredito_id] int  NOT NULL
);
GO

-- Creating table 'caSolitudCaptacion_caTCertificado'
CREATE TABLE [sigef].[caSolitudCaptacion_caTCertificado] (
    [iCajaAhorro_id] int  NOT NULL,
    [iSolitudCaptacion_id] int  NOT NULL
);
GO

-- Creating table 'caSolitudCaptacion_caTCajaAhorro'
CREATE TABLE [sigef].[caSolitudCaptacion_caTCajaAhorro] (
    [iMoneda_fl] smallint  NOT NULL,
    [iTipoCaja_fl] smallint  NOT NULL,
    [iSolitudCaptacion_id] int  NOT NULL
);
GO

-- Creating table 'caSolitudCaptacion_caTDPF'
CREATE TABLE [sigef].[caSolitudCaptacion_caTDPF] (
    [dTDPF_monto] decimal(18,0)  NOT NULL,
    [dTDPF_interes] decimal(18,0)  NOT NULL,
    [iMoneda_fl] smallint  NOT NULL,
    [iDuracion_fl] smallint  NOT NULL,
    [dtTDPF_fCaducidad] datetime  NOT NULL,
    [iSolitudCaptacion_id] int  NOT NULL
);
GO

-- Creating table 'caSolitudCaptacion_caTTarjetaDebito'
CREATE TABLE [sigef].[caSolitudCaptacion_caTTarjetaDebito] (
    [iCajaAhorro_id] int  NOT NULL,
    [sTarjetaDebito_id] int  NULL,
    [iSolitudCaptacion_id] int  NOT NULL
);
GO

-- Creating table 'coSolicitudCredito_coSolicitudRechazada'
CREATE TABLE [sigef].[coSolicitudCredito_coSolicitudRechazada] (
    [sRechazado_desc] nvarchar(max)  NOT NULL,
    [dtRechazado_fecha] datetime  NOT NULL,
    [iSolicitudCredito_id] int  NOT NULL
);
GO

-- Creating table 'baModulobaUnidadFinanciera'
CREATE TABLE [sigef].[baModulobaUnidadFinanciera] (
    [baModulo_iModulo_id] int  NOT NULL,
    [baUnidadFinanciera_iUnidadFinanciera_id] int  NOT NULL
);
GO

-- Creating table 'msRolmsPrivilegio'
CREATE TABLE [sigef].[msRolmsPrivilegio] (
    [msRol_iRol_id] int  NOT NULL,
    [msPrivilegio_iPrivilegio_id] int  NOT NULL
);
GO

-- Creating table 'msUsuariomcCaja'
CREATE TABLE [sigef].[msUsuariomcCaja] (
    [msUsuario_iUsuario_id] int  NOT NULL,
    [mcCaja_iCaja_id] int  NOT NULL
);
GO

-- Creating table 'caPACmsUsuario'
CREATE TABLE [sigef].[caPACmsUsuario] (
    [caPAC_iPAC_id] int  NOT NULL,
    [msUsuario_iUsuario_id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [iUnidadFinanciera_id] in table 'baUnidadFinanciera'
ALTER TABLE [sigef].[baUnidadFinanciera]
ADD CONSTRAINT [PK_baUnidadFinanciera]
    PRIMARY KEY CLUSTERED ([iUnidadFinanciera_id] ASC);
GO

-- Creating primary key on [iModulo_id] in table 'baModulo'
ALTER TABLE [sigef].[baModulo]
ADD CONSTRAINT [PK_baModulo]
    PRIMARY KEY CLUSTERED ([iModulo_id] ASC);
GO

-- Creating primary key on [iADM_USER_id] in table 'baADM_USER'
ALTER TABLE [sigef].[baADM_USER]
ADD CONSTRAINT [PK_baADM_USER]
    PRIMARY KEY CLUSTERED ([iADM_USER_id] ASC);
GO

-- Creating primary key on [iAdmin_id] in table 'baAdmin'
ALTER TABLE [sigef].[baAdmin]
ADD CONSTRAINT [PK_baAdmin]
    PRIMARY KEY CLUSTERED ([iAdmin_id] ASC);
GO

-- Creating primary key on [iSucursal_id] in table 'paSucursal'
ALTER TABLE [sigef].[paSucursal]
ADD CONSTRAINT [PK_paSucursal]
    PRIMARY KEY CLUSTERED ([iSucursal_id] ASC);
GO

-- Creating primary key on [iPAC_id] in table 'caPAC'
ALTER TABLE [sigef].[caPAC]
ADD CONSTRAINT [PK_caPAC]
    PRIMARY KEY CLUSTERED ([iPAC_id] ASC);
GO

-- Creating primary key on [iSolitudCaptacion_id] in table 'caSolitudCaptacion'
ALTER TABLE [sigef].[caSolitudCaptacion]
ADD CONSTRAINT [PK_caSolitudCaptacion]
    PRIMARY KEY CLUSTERED ([iSolitudCaptacion_id] ASC);
GO

-- Creating primary key on [iCaja_id] in table 'mcCaja'
ALTER TABLE [sigef].[mcCaja]
ADD CONSTRAINT [PK_mcCaja]
    PRIMARY KEY CLUSTERED ([iCaja_id] ASC);
GO

-- Creating primary key on [iTransaccion_id] in table 'mcTransaccion'
ALTER TABLE [sigef].[mcTransaccion]
ADD CONSTRAINT [PK_mcTransaccion]
    PRIMARY KEY CLUSTERED ([iTransaccion_id] ASC);
GO

-- Creating primary key on [iLibroCaja_id] in table 'mcLibroCaja'
ALTER TABLE [sigef].[mcLibroCaja]
ADD CONSTRAINT [PK_mcLibroCaja]
    PRIMARY KEY CLUSTERED ([iLibroCaja_id] ASC);
GO

-- Creating primary key on [iConciliacionCaja_id] in table 'mcConciliacionCaja'
ALTER TABLE [sigef].[mcConciliacionCaja]
ADD CONSTRAINT [PK_mcConciliacionCaja]
    PRIMARY KEY CLUSTERED ([iConciliacionCaja_id] ASC);
GO

-- Creating primary key on [iDetalleCheque_id] in table 'mcDetalleCheque'
ALTER TABLE [sigef].[mcDetalleCheque]
ADD CONSTRAINT [PK_mcDetalleCheque]
    PRIMARY KEY CLUSTERED ([iDetalleCheque_id] ASC);
GO

-- Creating primary key on [iCliente_id] in table 'peCliente'
ALTER TABLE [sigef].[peCliente]
ADD CONSTRAINT [PK_peCliente]
    PRIMARY KEY CLUSTERED ([iCliente_id] ASC);
GO

-- Creating primary key on [iCAportacion_id] in table 'peCAportacion'
ALTER TABLE [sigef].[peCAportacion]
ADD CONSTRAINT [PK_peCAportacion]
    PRIMARY KEY CLUSTERED ([iCAportacion_id] ASC);
GO

-- Creating primary key on [iFuncionario_id] in table 'msFuncionario'
ALTER TABLE [sigef].[msFuncionario]
ADD CONSTRAINT [PK_msFuncionario]
    PRIMARY KEY CLUSTERED ([iFuncionario_id] ASC);
GO

-- Creating primary key on [iUsuario_id] in table 'msUsuario'
ALTER TABLE [sigef].[msUsuario]
ADD CONSTRAINT [PK_msUsuario]
    PRIMARY KEY CLUSTERED ([iUsuario_id] ASC);
GO

-- Creating primary key on [iPassword_id] in table 'msPassword'
ALTER TABLE [sigef].[msPassword]
ADD CONSTRAINT [PK_msPassword]
    PRIMARY KEY CLUSTERED ([iPassword_id] ASC);
GO

-- Creating primary key on [iRol_id] in table 'msRol'
ALTER TABLE [sigef].[msRol]
ADD CONSTRAINT [PK_msRol]
    PRIMARY KEY CLUSTERED ([iRol_id] ASC);
GO

-- Creating primary key on [iPrivilegio_id] in table 'msPrivilegio'
ALTER TABLE [sigef].[msPrivilegio]
ADD CONSTRAINT [PK_msPrivilegio]
    PRIMARY KEY CLUSTERED ([iPrivilegio_id] ASC);
GO

-- Creating primary key on [iBitadora_id] in table 'msBitacora'
ALTER TABLE [sigef].[msBitacora]
ADD CONSTRAINT [PK_msBitacora]
    PRIMARY KEY CLUSTERED ([iBitadora_id] ASC);
GO

-- Creating primary key on [iSolicitudFondo_id] in table 'teSolicitudFondo'
ALTER TABLE [sigef].[teSolicitudFondo]
ADD CONSTRAINT [PK_teSolicitudFondo]
    PRIMARY KEY CLUSTERED ([iSolicitudFondo_id] ASC);
GO

-- Creating primary key on [iBoveda_id] in table 'teBoveda'
ALTER TABLE [sigef].[teBoveda]
ADD CONSTRAINT [PK_teBoveda]
    PRIMARY KEY CLUSTERED ([iBoveda_id] ASC);
GO

-- Creating primary key on [iLibroMayor_id] in table 'teLibroMayor'
ALTER TABLE [sigef].[teLibroMayor]
ADD CONSTRAINT [PK_teLibroMayor]
    PRIMARY KEY CLUSTERED ([iLibroMayor_id] ASC);
GO

-- Creating primary key on [iConciliacionLM_id] in table 'teConciliacionLM'
ALTER TABLE [sigef].[teConciliacionLM]
ADD CONSTRAINT [PK_teConciliacionLM]
    PRIMARY KEY CLUSTERED ([iConciliacionLM_id] ASC);
GO

-- Creating primary key on [iCajaAhorro_id] in table 'acCajaAhorro'
ALTER TABLE [sigef].[acCajaAhorro]
ADD CONSTRAINT [PK_acCajaAhorro]
    PRIMARY KEY CLUSTERED ([iCajaAhorro_id] ASC);
GO

-- Creating primary key on [iTarjetaDebito_id] in table 'acTarjetaDebito'
ALTER TABLE [sigef].[acTarjetaDebito]
ADD CONSTRAINT [PK_acTarjetaDebito]
    PRIMARY KEY CLUSTERED ([iTarjetaDebito_id] ASC);
GO

-- Creating primary key on [iDPF_id] in table 'acDPF'
ALTER TABLE [sigef].[acDPF]
ADD CONSTRAINT [PK_acDPF]
    PRIMARY KEY CLUSTERED ([iDPF_id] ASC);
GO

-- Creating primary key on [iDetalleCajaAhorro_id] in table 'acDetalleCajaAhorro'
ALTER TABLE [sigef].[acDetalleCajaAhorro]
ADD CONSTRAINT [PK_acDetalleCajaAhorro]
    PRIMARY KEY CLUSTERED ([iDetalleCajaAhorro_id] ASC);
GO

-- Creating primary key on [iDetalleDPF_id] in table 'acDetalleDPF'
ALTER TABLE [sigef].[acDetalleDPF]
ADD CONSTRAINT [PK_acDetalleDPF]
    PRIMARY KEY CLUSTERED ([iDetalleDPF_id] ASC);
GO

-- Creating primary key on [iDetalleCredito_id] in table 'acDetalleCredito'
ALTER TABLE [sigef].[acDetalleCredito]
ADD CONSTRAINT [PK_acDetalleCredito]
    PRIMARY KEY CLUSTERED ([iDetalleCredito_id] ASC);
GO

-- Creating primary key on [iSolicitudCredito_id] in table 'coSolicitudCredito'
ALTER TABLE [sigef].[coSolicitudCredito]
ADD CONSTRAINT [PK_coSolicitudCredito]
    PRIMARY KEY CLUSTERED ([iSolicitudCredito_id] ASC);
GO

-- Creating primary key on [iCuota_id] in table 'coCouta'
ALTER TABLE [sigef].[coCouta]
ADD CONSTRAINT [PK_coCouta]
    PRIMARY KEY CLUSTERED ([iCuota_id] ASC);
GO

-- Creating primary key on [iRequisito_id] in table 'coRequisito'
ALTER TABLE [sigef].[coRequisito]
ADD CONSTRAINT [PK_coRequisito]
    PRIMARY KEY CLUSTERED ([iRequisito_id] ASC);
GO

-- Creating primary key on [iCarteraVigente_id] in table 'coCarteraVigente'
ALTER TABLE [sigef].[coCarteraVigente]
ADD CONSTRAINT [PK_coCarteraVigente]
    PRIMARY KEY CLUSTERED ([iCarteraVigente_id] ASC);
GO

-- Creating primary key on [iCarteraMora_id] in table 'coCarteraMora'
ALTER TABLE [sigef].[coCarteraMora]
ADD CONSTRAINT [PK_coCarteraMora]
    PRIMARY KEY CLUSTERED ([iCarteraMora_id] ASC);
GO

-- Creating primary key on [iCarteraEjecucion_id] in table 'coCarteraEjecucion'
ALTER TABLE [sigef].[coCarteraEjecucion]
ADD CONSTRAINT [PK_coCarteraEjecucion]
    PRIMARY KEY CLUSTERED ([iCarteraEjecucion_id] ASC);
GO

-- Creating primary key on [iHistoricoCredito_id] in table 'coHistoricoCredito'
ALTER TABLE [sigef].[coHistoricoCredito]
ADD CONSTRAINT [PK_coHistoricoCredito]
    PRIMARY KEY CLUSTERED ([iHistoricoCredito_id] ASC);
GO

-- Creating primary key on [iATM_id] in table 'oaATM'
ALTER TABLE [sigef].[oaATM]
ADD CONSTRAINT [PK_oaATM]
    PRIMARY KEY CLUSTERED ([iATM_id] ASC);
GO

-- Creating primary key on [iTarjetaRetenida_id] in table 'oaTarjetaRetenida'
ALTER TABLE [sigef].[oaTarjetaRetenida]
ADD CONSTRAINT [PK_oaTarjetaRetenida]
    PRIMARY KEY CLUSTERED ([iTarjetaRetenida_id] ASC);
GO

-- Creating primary key on [oaLibroATM_id] in table 'oaLibroATM'
ALTER TABLE [sigef].[oaLibroATM]
ADD CONSTRAINT [PK_oaLibroATM]
    PRIMARY KEY CLUSTERED ([oaLibroATM_id] ASC);
GO

-- Creating primary key on [iCliente_id] in table 'peCliente_peSocio'
ALTER TABLE [sigef].[peCliente_peSocio]
ADD CONSTRAINT [PK_peCliente_peSocio]
    PRIMARY KEY CLUSTERED ([iCliente_id] ASC);
GO

-- Creating primary key on [iSolicitudCredito_id] in table 'coSolicitudCredito_coCredito'
ALTER TABLE [sigef].[coSolicitudCredito_coCredito]
ADD CONSTRAINT [PK_coSolicitudCredito_coCredito]
    PRIMARY KEY CLUSTERED ([iSolicitudCredito_id] ASC);
GO

-- Creating primary key on [iSolitudCaptacion_id] in table 'caSolitudCaptacion_caTCertificado'
ALTER TABLE [sigef].[caSolitudCaptacion_caTCertificado]
ADD CONSTRAINT [PK_caSolitudCaptacion_caTCertificado]
    PRIMARY KEY CLUSTERED ([iSolitudCaptacion_id] ASC);
GO

-- Creating primary key on [iSolitudCaptacion_id] in table 'caSolitudCaptacion_caTCajaAhorro'
ALTER TABLE [sigef].[caSolitudCaptacion_caTCajaAhorro]
ADD CONSTRAINT [PK_caSolitudCaptacion_caTCajaAhorro]
    PRIMARY KEY CLUSTERED ([iSolitudCaptacion_id] ASC);
GO

-- Creating primary key on [iSolitudCaptacion_id] in table 'caSolitudCaptacion_caTDPF'
ALTER TABLE [sigef].[caSolitudCaptacion_caTDPF]
ADD CONSTRAINT [PK_caSolitudCaptacion_caTDPF]
    PRIMARY KEY CLUSTERED ([iSolitudCaptacion_id] ASC);
GO

-- Creating primary key on [iSolitudCaptacion_id] in table 'caSolitudCaptacion_caTTarjetaDebito'
ALTER TABLE [sigef].[caSolitudCaptacion_caTTarjetaDebito]
ADD CONSTRAINT [PK_caSolitudCaptacion_caTTarjetaDebito]
    PRIMARY KEY CLUSTERED ([iSolitudCaptacion_id] ASC);
GO

-- Creating primary key on [iSolicitudCredito_id] in table 'coSolicitudCredito_coSolicitudRechazada'
ALTER TABLE [sigef].[coSolicitudCredito_coSolicitudRechazada]
ADD CONSTRAINT [PK_coSolicitudCredito_coSolicitudRechazada]
    PRIMARY KEY CLUSTERED ([iSolicitudCredito_id] ASC);
GO

-- Creating primary key on [baModulo_iModulo_id], [baUnidadFinanciera_iUnidadFinanciera_id] in table 'baModulobaUnidadFinanciera'
ALTER TABLE [sigef].[baModulobaUnidadFinanciera]
ADD CONSTRAINT [PK_baModulobaUnidadFinanciera]
    PRIMARY KEY CLUSTERED ([baModulo_iModulo_id], [baUnidadFinanciera_iUnidadFinanciera_id] ASC);
GO

-- Creating primary key on [msRol_iRol_id], [msPrivilegio_iPrivilegio_id] in table 'msRolmsPrivilegio'
ALTER TABLE [sigef].[msRolmsPrivilegio]
ADD CONSTRAINT [PK_msRolmsPrivilegio]
    PRIMARY KEY CLUSTERED ([msRol_iRol_id], [msPrivilegio_iPrivilegio_id] ASC);
GO

-- Creating primary key on [msUsuario_iUsuario_id], [mcCaja_iCaja_id] in table 'msUsuariomcCaja'
ALTER TABLE [sigef].[msUsuariomcCaja]
ADD CONSTRAINT [PK_msUsuariomcCaja]
    PRIMARY KEY CLUSTERED ([msUsuario_iUsuario_id], [mcCaja_iCaja_id] ASC);
GO

-- Creating primary key on [caPAC_iPAC_id], [msUsuario_iUsuario_id] in table 'caPACmsUsuario'
ALTER TABLE [sigef].[caPACmsUsuario]
ADD CONSTRAINT [PK_caPACmsUsuario]
    PRIMARY KEY CLUSTERED ([caPAC_iPAC_id], [msUsuario_iUsuario_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [baModulo_iModulo_id] in table 'baModulobaUnidadFinanciera'
ALTER TABLE [sigef].[baModulobaUnidadFinanciera]
ADD CONSTRAINT [FK_baModulobaUnidadFinanciera_baModulo]
    FOREIGN KEY ([baModulo_iModulo_id])
    REFERENCES [sigef].[baModulo]
        ([iModulo_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [baUnidadFinanciera_iUnidadFinanciera_id] in table 'baModulobaUnidadFinanciera'
ALTER TABLE [sigef].[baModulobaUnidadFinanciera]
ADD CONSTRAINT [FK_baModulobaUnidadFinanciera_baUnidadFinanciera]
    FOREIGN KEY ([baUnidadFinanciera_iUnidadFinanciera_id])
    REFERENCES [sigef].[baUnidadFinanciera]
        ([iUnidadFinanciera_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_baModulobaUnidadFinanciera_baUnidadFinanciera'
CREATE INDEX [IX_FK_baModulobaUnidadFinanciera_baUnidadFinanciera]
ON [sigef].[baModulobaUnidadFinanciera]
    ([baUnidadFinanciera_iUnidadFinanciera_id]);
GO

-- Creating foreign key on [iADM_USER_id] in table 'baAdmin'
ALTER TABLE [sigef].[baAdmin]
ADD CONSTRAINT [FK_baADM_USERbaAdmin]
    FOREIGN KEY ([iADM_USER_id])
    REFERENCES [sigef].[baADM_USER]
        ([iADM_USER_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_baADM_USERbaAdmin'
CREATE INDEX [IX_FK_baADM_USERbaAdmin]
ON [sigef].[baAdmin]
    ([iADM_USER_id]);
GO

-- Creating foreign key on [iAdmin_id] in table 'baUnidadFinanciera'
ALTER TABLE [sigef].[baUnidadFinanciera]
ADD CONSTRAINT [FK_baUnidadFinancierabaAdmin]
    FOREIGN KEY ([iAdmin_id])
    REFERENCES [sigef].[baAdmin]
        ([iAdmin_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_baUnidadFinancierabaAdmin'
CREATE INDEX [IX_FK_baUnidadFinancierabaAdmin]
ON [sigef].[baUnidadFinanciera]
    ([iAdmin_id]);
GO

-- Creating foreign key on [iUnidadFinanciera_id] in table 'paSucursal'
ALTER TABLE [sigef].[paSucursal]
ADD CONSTRAINT [FK_baUnidadFinancierapaSucursal]
    FOREIGN KEY ([iUnidadFinanciera_id])
    REFERENCES [sigef].[baUnidadFinanciera]
        ([iUnidadFinanciera_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_baUnidadFinancierapaSucursal'
CREATE INDEX [IX_FK_baUnidadFinancierapaSucursal]
ON [sigef].[paSucursal]
    ([iUnidadFinanciera_id]);
GO

-- Creating foreign key on [iSucursal_id] in table 'caPAC'
ALTER TABLE [sigef].[caPAC]
ADD CONSTRAINT [FK_paSucursalcaPAC]
    FOREIGN KEY ([iSucursal_id])
    REFERENCES [sigef].[paSucursal]
        ([iSucursal_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_paSucursalcaPAC'
CREATE INDEX [IX_FK_paSucursalcaPAC]
ON [sigef].[caPAC]
    ([iSucursal_id]);
GO

-- Creating foreign key on [iPAC_id] in table 'caSolitudCaptacion'
ALTER TABLE [sigef].[caSolitudCaptacion]
ADD CONSTRAINT [FK_caPACcaSolitudCaptacion]
    FOREIGN KEY ([iPAC_id])
    REFERENCES [sigef].[caPAC]
        ([iPAC_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_caPACcaSolitudCaptacion'
CREATE INDEX [IX_FK_caPACcaSolitudCaptacion]
ON [sigef].[caSolitudCaptacion]
    ([iPAC_id]);
GO

-- Creating foreign key on [iSucursal_id] in table 'mcCaja'
ALTER TABLE [sigef].[mcCaja]
ADD CONSTRAINT [FK_paSucursalmcCaja]
    FOREIGN KEY ([iSucursal_id])
    REFERENCES [sigef].[paSucursal]
        ([iSucursal_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_paSucursalmcCaja'
CREATE INDEX [IX_FK_paSucursalmcCaja]
ON [sigef].[mcCaja]
    ([iSucursal_id]);
GO

-- Creating foreign key on [iCaja_id] in table 'mcTransaccion'
ALTER TABLE [sigef].[mcTransaccion]
ADD CONSTRAINT [FK_mcCajamcTransaccion]
    FOREIGN KEY ([iCaja_id])
    REFERENCES [sigef].[mcCaja]
        ([iCaja_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mcCajamcTransaccion'
CREATE INDEX [IX_FK_mcCajamcTransaccion]
ON [sigef].[mcTransaccion]
    ([iCaja_id]);
GO

-- Creating foreign key on [iTransaccion_id] in table 'mcLibroCaja'
ALTER TABLE [sigef].[mcLibroCaja]
ADD CONSTRAINT [FK_mcLibroCajamcTransaccion]
    FOREIGN KEY ([iTransaccion_id])
    REFERENCES [sigef].[mcTransaccion]
        ([iTransaccion_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mcLibroCajamcTransaccion'
CREATE INDEX [IX_FK_mcLibroCajamcTransaccion]
ON [sigef].[mcLibroCaja]
    ([iTransaccion_id]);
GO

-- Creating foreign key on [iCaja_id] in table 'mcConciliacionCaja'
ALTER TABLE [sigef].[mcConciliacionCaja]
ADD CONSTRAINT [FK_mcConciliacionCajamcCaja]
    FOREIGN KEY ([iCaja_id])
    REFERENCES [sigef].[mcCaja]
        ([iCaja_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mcConciliacionCajamcCaja'
CREATE INDEX [IX_FK_mcConciliacionCajamcCaja]
ON [sigef].[mcConciliacionCaja]
    ([iCaja_id]);
GO

-- Creating foreign key on [iTransaccion_id] in table 'mcDetalleCheque'
ALTER TABLE [sigef].[mcDetalleCheque]
ADD CONSTRAINT [FK_mcTransaccionmcDetalleCheque]
    FOREIGN KEY ([iTransaccion_id])
    REFERENCES [sigef].[mcTransaccion]
        ([iTransaccion_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mcTransaccionmcDetalleCheque'
CREATE INDEX [IX_FK_mcTransaccionmcDetalleCheque]
ON [sigef].[mcDetalleCheque]
    ([iTransaccion_id]);
GO

-- Creating foreign key on [iCliente_id] in table 'peCAportacion'
ALTER TABLE [sigef].[peCAportacion]
ADD CONSTRAINT [FK_peSociopeCAportacion]
    FOREIGN KEY ([iCliente_id])
    REFERENCES [sigef].[peCliente_peSocio]
        ([iCliente_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_peSociopeCAportacion'
CREATE INDEX [IX_FK_peSociopeCAportacion]
ON [sigef].[peCAportacion]
    ([iCliente_id]);
GO

-- Creating foreign key on [iFuncionario_id] in table 'msUsuario'
ALTER TABLE [sigef].[msUsuario]
ADD CONSTRAINT [FK_msUsuariomsFuncionario]
    FOREIGN KEY ([iFuncionario_id])
    REFERENCES [sigef].[msFuncionario]
        ([iFuncionario_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_msUsuariomsFuncionario'
CREATE INDEX [IX_FK_msUsuariomsFuncionario]
ON [sigef].[msUsuario]
    ([iFuncionario_id]);
GO

-- Creating foreign key on [iUsuario_id] in table 'msPassword'
ALTER TABLE [sigef].[msPassword]
ADD CONSTRAINT [FK_msUsuariomsPassword]
    FOREIGN KEY ([iUsuario_id])
    REFERENCES [sigef].[msUsuario]
        ([iUsuario_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_msUsuariomsPassword'
CREATE INDEX [IX_FK_msUsuariomsPassword]
ON [sigef].[msPassword]
    ([iUsuario_id]);
GO

-- Creating foreign key on [iRol_id] in table 'msUsuario'
ALTER TABLE [sigef].[msUsuario]
ADD CONSTRAINT [FK_msRolmsUsuario]
    FOREIGN KEY ([iRol_id])
    REFERENCES [sigef].[msRol]
        ([iRol_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_msRolmsUsuario'
CREATE INDEX [IX_FK_msRolmsUsuario]
ON [sigef].[msUsuario]
    ([iRol_id]);
GO

-- Creating foreign key on [msRol_iRol_id] in table 'msRolmsPrivilegio'
ALTER TABLE [sigef].[msRolmsPrivilegio]
ADD CONSTRAINT [FK_msRolmsPrivilegio_msRol]
    FOREIGN KEY ([msRol_iRol_id])
    REFERENCES [sigef].[msRol]
        ([iRol_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [msPrivilegio_iPrivilegio_id] in table 'msRolmsPrivilegio'
ALTER TABLE [sigef].[msRolmsPrivilegio]
ADD CONSTRAINT [FK_msRolmsPrivilegio_msPrivilegio]
    FOREIGN KEY ([msPrivilegio_iPrivilegio_id])
    REFERENCES [sigef].[msPrivilegio]
        ([iPrivilegio_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_msRolmsPrivilegio_msPrivilegio'
CREATE INDEX [IX_FK_msRolmsPrivilegio_msPrivilegio]
ON [sigef].[msRolmsPrivilegio]
    ([msPrivilegio_iPrivilegio_id]);
GO

-- Creating foreign key on [iCliente_id] in table 'caSolitudCaptacion'
ALTER TABLE [sigef].[caSolitudCaptacion]
ADD CONSTRAINT [FK_caSolitudCaptacionpeCliente]
    FOREIGN KEY ([iCliente_id])
    REFERENCES [sigef].[peCliente]
        ([iCliente_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_caSolitudCaptacionpeCliente'
CREATE INDEX [IX_FK_caSolitudCaptacionpeCliente]
ON [sigef].[caSolitudCaptacion]
    ([iCliente_id]);
GO

-- Creating foreign key on [msUsuario_iUsuario_id] in table 'msUsuariomcCaja'
ALTER TABLE [sigef].[msUsuariomcCaja]
ADD CONSTRAINT [FK_msUsuariomcCaja_msUsuario]
    FOREIGN KEY ([msUsuario_iUsuario_id])
    REFERENCES [sigef].[msUsuario]
        ([iUsuario_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [mcCaja_iCaja_id] in table 'msUsuariomcCaja'
ALTER TABLE [sigef].[msUsuariomcCaja]
ADD CONSTRAINT [FK_msUsuariomcCaja_mcCaja]
    FOREIGN KEY ([mcCaja_iCaja_id])
    REFERENCES [sigef].[mcCaja]
        ([iCaja_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_msUsuariomcCaja_mcCaja'
CREATE INDEX [IX_FK_msUsuariomcCaja_mcCaja]
ON [sigef].[msUsuariomcCaja]
    ([mcCaja_iCaja_id]);
GO

-- Creating foreign key on [caPAC_iPAC_id] in table 'caPACmsUsuario'
ALTER TABLE [sigef].[caPACmsUsuario]
ADD CONSTRAINT [FK_caPACmsUsuario_caPAC]
    FOREIGN KEY ([caPAC_iPAC_id])
    REFERENCES [sigef].[caPAC]
        ([iPAC_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [msUsuario_iUsuario_id] in table 'caPACmsUsuario'
ALTER TABLE [sigef].[caPACmsUsuario]
ADD CONSTRAINT [FK_caPACmsUsuario_msUsuario]
    FOREIGN KEY ([msUsuario_iUsuario_id])
    REFERENCES [sigef].[msUsuario]
        ([iUsuario_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_caPACmsUsuario_msUsuario'
CREATE INDEX [IX_FK_caPACmsUsuario_msUsuario]
ON [sigef].[caPACmsUsuario]
    ([msUsuario_iUsuario_id]);
GO

-- Creating foreign key on [iCliente_id] in table 'mcTransaccion'
ALTER TABLE [sigef].[mcTransaccion]
ADD CONSTRAINT [FK_peClientemcTransaccion]
    FOREIGN KEY ([iCliente_id])
    REFERENCES [sigef].[peCliente]
        ([iCliente_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_peClientemcTransaccion'
CREATE INDEX [IX_FK_peClientemcTransaccion]
ON [sigef].[mcTransaccion]
    ([iCliente_id]);
GO

-- Creating foreign key on [iBoveda_id] in table 'teSolicitudFondo'
ALTER TABLE [sigef].[teSolicitudFondo]
ADD CONSTRAINT [FK_teBovedateSolicitudFondo]
    FOREIGN KEY ([iBoveda_id])
    REFERENCES [sigef].[teBoveda]
        ([iBoveda_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_teBovedateSolicitudFondo'
CREATE INDEX [IX_FK_teBovedateSolicitudFondo]
ON [sigef].[teSolicitudFondo]
    ([iBoveda_id]);
GO

-- Creating foreign key on [iBoveda_id] in table 'teConciliacionLM'
ALTER TABLE [sigef].[teConciliacionLM]
ADD CONSTRAINT [FK_teBovedateConciliacionLM]
    FOREIGN KEY ([iBoveda_id])
    REFERENCES [sigef].[teBoveda]
        ([iBoveda_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_teBovedateConciliacionLM'
CREATE INDEX [IX_FK_teBovedateConciliacionLM]
ON [sigef].[teConciliacionLM]
    ([iBoveda_id]);
GO

-- Creating foreign key on [iSolicitudFondo_id] in table 'teLibroMayor'
ALTER TABLE [sigef].[teLibroMayor]
ADD CONSTRAINT [FK_teLibroMayorteSolicitudFondo]
    FOREIGN KEY ([iSolicitudFondo_id])
    REFERENCES [sigef].[teSolicitudFondo]
        ([iSolicitudFondo_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_teLibroMayorteSolicitudFondo'
CREATE INDEX [IX_FK_teLibroMayorteSolicitudFondo]
ON [sigef].[teLibroMayor]
    ([iSolicitudFondo_id]);
GO

-- Creating foreign key on [iSucursal_id] in table 'teBoveda'
ALTER TABLE [sigef].[teBoveda]
ADD CONSTRAINT [FK_teBovedapaSucursal]
    FOREIGN KEY ([iSucursal_id])
    REFERENCES [sigef].[paSucursal]
        ([iSucursal_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_teBovedapaSucursal'
CREATE INDEX [IX_FK_teBovedapaSucursal]
ON [sigef].[teBoveda]
    ([iSucursal_id]);
GO

-- Creating foreign key on [iSolicitudFondo_id] in table 'mcLibroCaja'
ALTER TABLE [sigef].[mcLibroCaja]
ADD CONSTRAINT [FK_teSolicitudFondomcLibroCaja]
    FOREIGN KEY ([iSolicitudFondo_id])
    REFERENCES [sigef].[teSolicitudFondo]
        ([iSolicitudFondo_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_teSolicitudFondomcLibroCaja'
CREATE INDEX [IX_FK_teSolicitudFondomcLibroCaja]
ON [sigef].[mcLibroCaja]
    ([iSolicitudFondo_id]);
GO

-- Creating foreign key on [iCaja_id] in table 'teSolicitudFondo'
ALTER TABLE [sigef].[teSolicitudFondo]
ADD CONSTRAINT [FK_mcCajateSolicitudFondo]
    FOREIGN KEY ([iCaja_id])
    REFERENCES [sigef].[mcCaja]
        ([iCaja_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mcCajateSolicitudFondo'
CREATE INDEX [IX_FK_mcCajateSolicitudFondo]
ON [sigef].[teSolicitudFondo]
    ([iCaja_id]);
GO

-- Creating foreign key on [iCliente_id] in table 'acCajaAhorro'
ALTER TABLE [sigef].[acCajaAhorro]
ADD CONSTRAINT [FK_acCajaAhorropeCliente]
    FOREIGN KEY ([iCliente_id])
    REFERENCES [sigef].[peCliente]
        ([iCliente_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_acCajaAhorropeCliente'
CREATE INDEX [IX_FK_acCajaAhorropeCliente]
ON [sigef].[acCajaAhorro]
    ([iCliente_id]);
GO

-- Creating foreign key on [iTarjetaDebito_id] in table 'acCajaAhorro'
ALTER TABLE [sigef].[acCajaAhorro]
ADD CONSTRAINT [FK_acCajaAhorroacTarjetaDebito]
    FOREIGN KEY ([iTarjetaDebito_id])
    REFERENCES [sigef].[acTarjetaDebito]
        ([iTarjetaDebito_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_acCajaAhorroacTarjetaDebito'
CREATE INDEX [IX_FK_acCajaAhorroacTarjetaDebito]
ON [sigef].[acCajaAhorro]
    ([iTarjetaDebito_id]);
GO

-- Creating foreign key on [iCajaAhorro_id] in table 'acDetalleCajaAhorro'
ALTER TABLE [sigef].[acDetalleCajaAhorro]
ADD CONSTRAINT [FK_acCajaAhorroacDetalleCajaAhorro]
    FOREIGN KEY ([iCajaAhorro_id])
    REFERENCES [sigef].[acCajaAhorro]
        ([iCajaAhorro_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_acCajaAhorroacDetalleCajaAhorro'
CREATE INDEX [IX_FK_acCajaAhorroacDetalleCajaAhorro]
ON [sigef].[acDetalleCajaAhorro]
    ([iCajaAhorro_id]);
GO

-- Creating foreign key on [iCliente_id] in table 'acDPF'
ALTER TABLE [sigef].[acDPF]
ADD CONSTRAINT [FK_acDPFpeCliente]
    FOREIGN KEY ([iCliente_id])
    REFERENCES [sigef].[peCliente]
        ([iCliente_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_acDPFpeCliente'
CREATE INDEX [IX_FK_acDPFpeCliente]
ON [sigef].[acDPF]
    ([iCliente_id]);
GO

-- Creating foreign key on [iDPF_id] in table 'acDetalleDPF'
ALTER TABLE [sigef].[acDetalleDPF]
ADD CONSTRAINT [FK_acDetalleDPFacDPF]
    FOREIGN KEY ([iDPF_id])
    REFERENCES [sigef].[acDPF]
        ([iDPF_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_acDetalleDPFacDPF'
CREATE INDEX [IX_FK_acDetalleDPFacDPF]
ON [sigef].[acDetalleDPF]
    ([iDPF_id]);
GO

-- Creating foreign key on [iCliente_id] in table 'acTarjetaDebito'
ALTER TABLE [sigef].[acTarjetaDebito]
ADD CONSTRAINT [FK_acTarjetaDebitopeCliente]
    FOREIGN KEY ([iCliente_id])
    REFERENCES [sigef].[peCliente]
        ([iCliente_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_acTarjetaDebitopeCliente'
CREATE INDEX [IX_FK_acTarjetaDebitopeCliente]
ON [sigef].[acTarjetaDebito]
    ([iCliente_id]);
GO

-- Creating foreign key on [iTransaccion_id] in table 'acDetalleCajaAhorro'
ALTER TABLE [sigef].[acDetalleCajaAhorro]
ADD CONSTRAINT [FK_mcTransaccionacDetalleCajaAhorro]
    FOREIGN KEY ([iTransaccion_id])
    REFERENCES [sigef].[mcTransaccion]
        ([iTransaccion_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mcTransaccionacDetalleCajaAhorro'
CREATE INDEX [IX_FK_mcTransaccionacDetalleCajaAhorro]
ON [sigef].[acDetalleCajaAhorro]
    ([iTransaccion_id]);
GO

-- Creating foreign key on [iTransaccion_id] in table 'acDetalleDPF'
ALTER TABLE [sigef].[acDetalleDPF]
ADD CONSTRAINT [FK_acDetalleDPFmcTransaccion]
    FOREIGN KEY ([iTransaccion_id])
    REFERENCES [sigef].[mcTransaccion]
        ([iTransaccion_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_acDetalleDPFmcTransaccion'
CREATE INDEX [IX_FK_acDetalleDPFmcTransaccion]
ON [sigef].[acDetalleDPF]
    ([iTransaccion_id]);
GO

-- Creating foreign key on [iTransaccion_id] in table 'acDetalleCredito'
ALTER TABLE [sigef].[acDetalleCredito]
ADD CONSTRAINT [FK_acDetalleCreditomcTransaccion]
    FOREIGN KEY ([iTransaccion_id])
    REFERENCES [sigef].[mcTransaccion]
        ([iTransaccion_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_acDetalleCreditomcTransaccion'
CREATE INDEX [IX_FK_acDetalleCreditomcTransaccion]
ON [sigef].[acDetalleCredito]
    ([iTransaccion_id]);
GO

-- Creating foreign key on [iCliente_id] in table 'coSolicitudCredito'
ALTER TABLE [sigef].[coSolicitudCredito]
ADD CONSTRAINT [FK_coSolicitudCreditopeSocio]
    FOREIGN KEY ([iCliente_id])
    REFERENCES [sigef].[peCliente_peSocio]
        ([iCliente_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_coSolicitudCreditopeSocio'
CREATE INDEX [IX_FK_coSolicitudCreditopeSocio]
ON [sigef].[coSolicitudCredito]
    ([iCliente_id]);
GO

-- Creating foreign key on [iUsuario_id] in table 'coSolicitudCredito'
ALTER TABLE [sigef].[coSolicitudCredito]
ADD CONSTRAINT [FK_msUsuariocoSolicitudCredito]
    FOREIGN KEY ([iUsuario_id])
    REFERENCES [sigef].[msUsuario]
        ([iUsuario_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_msUsuariocoSolicitudCredito'
CREATE INDEX [IX_FK_msUsuariocoSolicitudCredito]
ON [sigef].[coSolicitudCredito]
    ([iUsuario_id]);
GO

-- Creating foreign key on [iSolicitudCredito_id] in table 'coRequisito'
ALTER TABLE [sigef].[coRequisito]
ADD CONSTRAINT [FK_coSolicitudCreditocoRequisito]
    FOREIGN KEY ([iSolicitudCredito_id])
    REFERENCES [sigef].[coSolicitudCredito]
        ([iSolicitudCredito_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_coSolicitudCreditocoRequisito'
CREATE INDEX [IX_FK_coSolicitudCreditocoRequisito]
ON [sigef].[coRequisito]
    ([iSolicitudCredito_id]);
GO

-- Creating foreign key on [iSolicitudCredito_id] in table 'coCouta'
ALTER TABLE [sigef].[coCouta]
ADD CONSTRAINT [FK_coCreditocoCouta]
    FOREIGN KEY ([iSolicitudCredito_id])
    REFERENCES [sigef].[coSolicitudCredito_coCredito]
        ([iSolicitudCredito_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_coCreditocoCouta'
CREATE INDEX [IX_FK_coCreditocoCouta]
ON [sigef].[coCouta]
    ([iSolicitudCredito_id]);
GO

-- Creating foreign key on [iSolicitudCredito_id] in table 'coCarteraVigente'
ALTER TABLE [sigef].[coCarteraVigente]
ADD CONSTRAINT [FK_coCreditocoCarteraVigente]
    FOREIGN KEY ([iSolicitudCredito_id])
    REFERENCES [sigef].[coSolicitudCredito_coCredito]
        ([iSolicitudCredito_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_coCreditocoCarteraVigente'
CREATE INDEX [IX_FK_coCreditocoCarteraVigente]
ON [sigef].[coCarteraVigente]
    ([iSolicitudCredito_id]);
GO

-- Creating foreign key on [iSolicitudCredito_id] in table 'coCarteraMora'
ALTER TABLE [sigef].[coCarteraMora]
ADD CONSTRAINT [FK_coCreditocoCarteraMora]
    FOREIGN KEY ([iSolicitudCredito_id])
    REFERENCES [sigef].[coSolicitudCredito_coCredito]
        ([iSolicitudCredito_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_coCreditocoCarteraMora'
CREATE INDEX [IX_FK_coCreditocoCarteraMora]
ON [sigef].[coCarteraMora]
    ([iSolicitudCredito_id]);
GO

-- Creating foreign key on [iSolicitudCredito_id] in table 'coCarteraEjecucion'
ALTER TABLE [sigef].[coCarteraEjecucion]
ADD CONSTRAINT [FK_coCreditocoCarteraEjecucion]
    FOREIGN KEY ([iSolicitudCredito_id])
    REFERENCES [sigef].[coSolicitudCredito_coCredito]
        ([iSolicitudCredito_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_coCreditocoCarteraEjecucion'
CREATE INDEX [IX_FK_coCreditocoCarteraEjecucion]
ON [sigef].[coCarteraEjecucion]
    ([iSolicitudCredito_id]);
GO

-- Creating foreign key on [iSolicitudCredito_id] in table 'coHistoricoCredito'
ALTER TABLE [sigef].[coHistoricoCredito]
ADD CONSTRAINT [FK_coCreditocoHistoricoCredito]
    FOREIGN KEY ([iSolicitudCredito_id])
    REFERENCES [sigef].[coSolicitudCredito_coCredito]
        ([iSolicitudCredito_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_coCreditocoHistoricoCredito'
CREATE INDEX [IX_FK_coCreditocoHistoricoCredito]
ON [sigef].[coHistoricoCredito]
    ([iSolicitudCredito_id]);
GO

-- Creating foreign key on [iATM_id] in table 'mcTransaccion'
ALTER TABLE [sigef].[mcTransaccion]
ADD CONSTRAINT [FK_oaATMmcTransaccion]
    FOREIGN KEY ([iATM_id])
    REFERENCES [sigef].[oaATM]
        ([iATM_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_oaATMmcTransaccion'
CREATE INDEX [IX_FK_oaATMmcTransaccion]
ON [sigef].[mcTransaccion]
    ([iATM_id]);
GO

-- Creating foreign key on [iTransaccion_id] in table 'oaLibroATM'
ALTER TABLE [sigef].[oaLibroATM]
ADD CONSTRAINT [FK_oaLibroATMmcTransaccion]
    FOREIGN KEY ([iTransaccion_id])
    REFERENCES [sigef].[mcTransaccion]
        ([iTransaccion_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_oaLibroATMmcTransaccion'
CREATE INDEX [IX_FK_oaLibroATMmcTransaccion]
ON [sigef].[oaLibroATM]
    ([iTransaccion_id]);
GO

-- Creating foreign key on [iATM_id] in table 'oaTarjetaRetenida'
ALTER TABLE [sigef].[oaTarjetaRetenida]
ADD CONSTRAINT [FK_oaATMoaTarjetaRetenida]
    FOREIGN KEY ([iATM_id])
    REFERENCES [sigef].[oaATM]
        ([iATM_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_oaATMoaTarjetaRetenida'
CREATE INDEX [IX_FK_oaATMoaTarjetaRetenida]
ON [sigef].[oaTarjetaRetenida]
    ([iATM_id]);
GO

-- Creating foreign key on [iCliente_id] in table 'peCliente_peSocio'
ALTER TABLE [sigef].[peCliente_peSocio]
ADD CONSTRAINT [FK_peSocio_inherits_peCliente]
    FOREIGN KEY ([iCliente_id])
    REFERENCES [sigef].[peCliente]
        ([iCliente_id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [iSolicitudCredito_id] in table 'coSolicitudCredito_coCredito'
ALTER TABLE [sigef].[coSolicitudCredito_coCredito]
ADD CONSTRAINT [FK_coCredito_inherits_coSolicitudCredito]
    FOREIGN KEY ([iSolicitudCredito_id])
    REFERENCES [sigef].[coSolicitudCredito]
        ([iSolicitudCredito_id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [iSolitudCaptacion_id] in table 'caSolitudCaptacion_caTCertificado'
ALTER TABLE [sigef].[caSolitudCaptacion_caTCertificado]
ADD CONSTRAINT [FK_caTCertificado_inherits_caSolitudCaptacion]
    FOREIGN KEY ([iSolitudCaptacion_id])
    REFERENCES [sigef].[caSolitudCaptacion]
        ([iSolitudCaptacion_id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [iSolitudCaptacion_id] in table 'caSolitudCaptacion_caTCajaAhorro'
ALTER TABLE [sigef].[caSolitudCaptacion_caTCajaAhorro]
ADD CONSTRAINT [FK_caTCajaAhorro_inherits_caSolitudCaptacion]
    FOREIGN KEY ([iSolitudCaptacion_id])
    REFERENCES [sigef].[caSolitudCaptacion]
        ([iSolitudCaptacion_id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [iSolitudCaptacion_id] in table 'caSolitudCaptacion_caTDPF'
ALTER TABLE [sigef].[caSolitudCaptacion_caTDPF]
ADD CONSTRAINT [FK_caTDPF_inherits_caSolitudCaptacion]
    FOREIGN KEY ([iSolitudCaptacion_id])
    REFERENCES [sigef].[caSolitudCaptacion]
        ([iSolitudCaptacion_id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [iSolitudCaptacion_id] in table 'caSolitudCaptacion_caTTarjetaDebito'
ALTER TABLE [sigef].[caSolitudCaptacion_caTTarjetaDebito]
ADD CONSTRAINT [FK_caTTarjetaDebito_inherits_caSolitudCaptacion]
    FOREIGN KEY ([iSolitudCaptacion_id])
    REFERENCES [sigef].[caSolitudCaptacion]
        ([iSolitudCaptacion_id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [iSolicitudCredito_id] in table 'coSolicitudCredito_coSolicitudRechazada'
ALTER TABLE [sigef].[coSolicitudCredito_coSolicitudRechazada]
ADD CONSTRAINT [FK_coSolicitudRechazada_inherits_coSolicitudCredito]
    FOREIGN KEY ([iSolicitudCredito_id])
    REFERENCES [sigef].[coSolicitudCredito]
        ([iSolicitudCredito_id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------