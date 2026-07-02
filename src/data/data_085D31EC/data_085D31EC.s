/* Migrated from asm/data_085D31EC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
	.section .data.residue.085D31EC, "aw", %progbits
	.global data_085D31EC
data_085D31EC:
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte SioBigSend_Init + 0x1
	.4byte 0x00000003
	.4byte SioBigSend_Loop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte SioBigReceive_Init + 0x1
	.4byte 0x00000003
	.4byte SioBigReceive_RecvHeader + 0x1
	.4byte 0x00000003
	.4byte SioBigReceive_Loop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000001
	.4byte data_080DD3D0 + 0x30
	.4byte 0x00000015
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte SioInit + 0x1
	.4byte 0x00000003
	.4byte SioPollingMsgAndAck + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000001
	.4byte data_080DD3D0 + 0x38
	.4byte 0x00000015
	.4byte 0x00000000
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000003
	.4byte SioVsync_Loop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000001
	.4byte data_080DD3D0 + 0x44
	.4byte 0x00000015
	.4byte 0x00000000
	.4byte 0x00000003
	.4byte SioMain_Loop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x02020188
	.4byte 0x00000002
	.4byte Sio_LoadingBlendPulse_Init + 0x1
	.4byte 0x00000003
	.4byte Sio_LoadingBlendPulse_Loop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice data_085D31EC: ptr=14 data=39 skip=0 */
