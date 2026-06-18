	.syntax unified
	.set AP_ClearAll, 0x08009150 + 1
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set InitMus, 0x0807A830 + 1
	.set InitRN, 0x08000BA0 + 1
	.set Proc_Init, 0x08002B58 + 1
	.set ResetKeyStatus, 0x080013DC + 1
	.set SetLCGRNValue, 0x08000CB4 + 1
	.set Sound_SetDefaultMaxNumChannels, 0x08002820 + 1
	.set StoreIRQToIRAM, 0x08000B0C + 1
	.set StoreRoutinesToIRAM, 0x08002A48 + 1
	.set m4aSoundInit, 0x080D4E70 + 1
	.set sub_8001208, 0x08001208 + 1
	.set sub_80012E4, 0x080012E4 + 1
	.set sub_800139C, 0x0800139C + 1
	.set sub_8001BD0, 0x08001BD0 + 1
	.set sub_8009E68, 0x08009E68 + 1
	.set sub_80A7680, 0x080A7680 + 1
	.set sub_80A8AEC, 0x080A8AEC + 1
	.set sub_80ABD8C, 0x080ABD8C + 1
	.set sub_80C165C, 0x080C165C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8000A20, "ax", %progbits
@ AgbMain @ JP 0x08000A20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AgbMain
	.thumb_func
AgbMain:
	push {r4, lr}
	sub sp, #4
	movs r2, #0
	str r2, [sp]
	ldr r1, _08000AC0 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	str r0, [r1, #4]
	ldr r0, _08000AC4 @ =0x85001FE0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	str r2, [sp]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ldr r2, _08000AC8 @ =0x01010000
	mov r0, sp
	bl sub_80D636C
	ldr r1, _08000ACC @ =0x04000204
	ldr r2, _08000AD0 @ =0x000045B4
	adds r0, r2, #0
	strh r0, [r1]
	bl StoreIRQToIRAM
	movs r0, #0
	bl sub_8001208
	ldr r1, _08000AD4 @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _08000AD8 @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	ldr r4, _08000ADC @ =0x085775CC
	ldr r0, [r4]
	bl ResetKeyStatus
	ldr r0, [r4]
	bl sub_800139C
	bl StoreRoutinesToIRAM
	bl sub_80A7680
	bl Proc_Init
	bl AP_ClearAll
	bl InitMus
	ldr r0, _08000AE0 @ =0x42D690E9
	bl SetLCGRNValue
	bl AdvanceGetLCGRNValue
	bl InitRN
	bl EraseInvalidSaveData
	bl EraseSramDataIfInvalid
	bl m4aSoundInit
	bl Sound_SetDefaultMaxNumChannels
	ldr r0, _08000AE4 @ =sub_80152C8
	bl sub_8001208
	bl sub_80C165C
	bl sub_8009E68
_08000AB4:
	bl sub_80012E4
	bl sub_8001BD0
	b _08000AB4
	.align 2, 0
_08000AC0: .4byte 0x040000D4
_08000AC4: .4byte 0x85001FE0
_08000AC8: .4byte 0x01010000
_08000ACC: .4byte 0x04000204
_08000AD0: .4byte 0x000045B4
_08000AD4: .4byte 0x04000004
_08000AD8: .4byte 0x04000208
_08000ADC: .4byte 0x085775CC
_08000AE0: .4byte 0x42D690E9
_08000AE4: .4byte 0x080152C9  @ sub_80152C8

