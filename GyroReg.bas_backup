$regfile = "m2560def.dat"                                   ' used micro
$crystal = 16000000                                         ' used xtal
$hwstack = 1000
$swstack = 1000
$framesize = 1000
$frameprotect = 1


 Config porta.3 =output
 PUls alias porta.3

 config PORTa.7=OUTPUT
 Direction alias porta.7
 config PORTB.5 =OUTPUT
 beep alias portb.5
 dim x as integer


 Dim vei as integer
 dim pulser as integer

topp:

for  x=1 to 2000
puls=1
waitus 10
puls=0

waitms 10
Next
toggle direction
beep=1
waitms 100
beep=0
wait 1

goto topp


  '#  ([+] = used in the code, [-] = not used or useful, [ ] = TBD)
'    LSM_FUNC_CFG_ACCESS   = 0x01  # [-] Configuration of embedded
'                                  #     functions, e.g. pedometer

'    LSM_FIFO_CTRL1        = 0x06  # [-] FIFO threshold setting
'    LSM_FIFO_CTRL2        = 0x07  # [-] FIFO control register
'    LSM_FIFO_CTRL3        = 0x08  # [-] Gyro/Acceleromter-specific FIFO settings
'    LSM_FIFO_CTRL4        = 0x09  # [-] FIFO data storage control
'    LSM_FIFO_CTRL5        = 0x0A  # [-] FIFO ODR/Mode selection

'    LSM_ORIENT_CFG_G      = 0x0B  # [ ] Gyroscope sign/orientation

'    LSM_INT1_CTRL         = 0x0D  # [-] INT1 pad control - unavailable for AltIMU
'    LSM_INT2_CTRL         = 0x0E  # [-] INT2 pad control - unavailable for AltIMU
'    LSM_WHO_AM_I          = 0x0F  # [-] Returns 0x69 (read only)
'    LSM_CTRL1_XL          = 0x10  # [+] Acceleration sensor control
'    LSM_CTRL2_G           = 0x11  # [+] Angular rate sensor (gyroscope) control
'    LSM_CTRL3_C           = 0x12  # [+] Device/communication settings
'    LSM_CTRL4_C           = 0x13  # [ ] Bandwith/sensor/communication settings
'    LSM_CTRL5_C           = 0x14  # [ ] Rounding/self-test control
'    LSM_CTRL6_C           = 0x15  # [ ] Gyroscope settings
'    LSM_CTRL7_G           = 0x16  # [ ] Gyroscope settings
'    LSM_CTRL8_XL          = 0x17  # [ ] Acceleration sensor settings
'    LSM_CTRL9_XL          = 0x18  # [ ] Acceleration sensor axis control
'    LSM_CTRL10_C          = 0x19  # [ ] Gyroscope axis control / misc. settings

'    LSM_WAKE_UP_SRC       = 0x1B  # [-] Wake up interrupt source register
'    LSM_TAP_SRC           = 0x1C  # [-] Tap source register
'    LSM_D6D_SRC           = 0x1D  # [-] Orientation sensing for Android devices

'    LSM_STATUS_REG        = 0x1E  # [ ] Status register. Shows if new data
'                                  #     is available from one or more of the
'                                  #     sensors

'    LSM_OUT_TEMP_L        = 0x20  # [+] Temperature output, low byte
'    LSM_OUT_TEMP_H        = 0x21  # [+] Temperature output, high byte
'    LSM_OUTX_L_G          = 0x22  # [+] Gyroscope X output, low byte
'    LSM_OUTX_H_G          = 0x23  # [+] Gyroscope X output, high byte
'    LSM_OUTY_L_G          = 0x24  # [+] Gyroscope Y output, low byte
'    LSM_OUTY_H_G          = 0x25  # [+] Gyroscope Y output, high byte
'    LSM_OUTZ_L_G          = 0x26  # [+] Gyroscope Z output, low byte
'    LSM_OUTZ_H_G          = 0x27  # [+] Gyroscope Z output, high byte
'    LSM_OUTX_L_XL         = 0x28  # [+] Accelerometer X output, low byte
'    LSM_OUTX_H_XL         = 0x29  # [+] Accelerometer X output, high byte
'    LSM_OUTY_L_XL         = 0x2A  # [+] Accelerometer Y output, low byte
'    LSM_OUTY_H_XL         = 0x2B  # [+] Accelerometer Y output, high byte
'    LSM_OUTZ_L_XL         = 0x2C  # [+] Accelerometer Z output, low byte
'    LSM_OUTZ_H_XL         = 0x2D  # [+] Accelerometer Z output, high byte


'    # Output registers used by the accelerometer
'    lsmAccRegisters = [
'        LSM_OUTX_L_XL,       # low byte of X value
'        LSM_OUTX_H_XL,       # high byte of X value
'        LSM_OUTY_L_XL,       # low byte of Y value
'        LSM_OUTY_H_XL,       # high byte of Y value
'        LSM_OUTZ_L_XL,       # low byte of Z value
'        LSM_OUTZ_H_XL,       # high byte of Z value
'    ]

'    # Output registers used by the gyroscope
'    lsmGyroRegisters = [
'        LSM_OUTX_L_G,       # low byte of X value
'        LSM_OUTX_H_G,       # high byte of X value
'        LSM_OUTY_L_G,       # low byte of Y value
'        LSM_OUTY_H_G,       # high byte of Y value
'        LSM_OUTZ_L_G,       # low byte of Z value
'        LSM_OUTZ_H_G,       # high byte of Z value
'    ]

'    # Output registers used by the temperature sensor
'    lsmTempRegisters = [
'        LSM_OUT_TEMP_L,     # low byte of temperature value
'        LSM_OUT_TEMP_H,     # high byte of temperature value