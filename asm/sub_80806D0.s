	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set InitScanline, 0x080841B8 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.set sub_8080D60, 0x08080D60 + 1
	.set sub_80841EC, 0x080841EC + 1
	.section .text.sub_80806D0, "ax", %progbits
@ sub_80806D0 @ JP 0x080806D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MapAnim_Init_0
	.thumb_func
MapAnim_Init_0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0xfd
	bl sub_8014B50
	bl InitScanline
	bl sub_80841EC
	ldr r0, _08080730 @ =HBlank_MapAnimEffect_Unk_0
	bl SetPrimaryHBlankHandler
	bl sub_8080CB8
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, _08080734 @ =0x02023CA8
	ldr r1, _08080738 @ =0x02020188
	ldr r2, _0808073C @ =0x00004140
	bl j_TmApplyTsa
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #2
	movs r1, #0
	movs r2, #1
	adds r3, r4, #0
	bl sub_8080D60
	ldr r0, _08080740 @ =0x08A15984
	adds r1, r4, #0
	bl sub_8002BCC
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r4, #0x4a
	strh r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080730: .4byte 0x080842E9  @ HBlank_MapAnimEffect_Unk_0
_08080734: .4byte 0x02023CA8
_08080738: .4byte 0x02020188
_0808073C: .4byte 0x00004140
_08080740: .4byte 0x08A15984

