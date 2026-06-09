	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80C4B0C, "ax", %progbits
@ sub_80C4B0C @ JP 0x080C4B0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4B0C
	.thumb_func
sub_80C4B0C:
	push {r4, lr}
	ldr r0, _080C4B44 @ =0x08B23E34
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	ldr r0, _080C4B48 @ =0x08B23DBC
	ldr r1, _080C4B4C @ =0x06004C00
	bl sub_8013008
	ldr r0, _080C4B50 @ =0x08B23E54
	ldr r4, _080C4B54 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080C4B58 @ =0x02022CA8
	ldr r2, _080C4B5C @ =0x00002260
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4B44: .4byte 0x08B23E34
_080C4B48: .4byte 0x08B23DBC
_080C4B4C: .4byte 0x06004C00
_080C4B50: .4byte 0x08B23E54
_080C4B54: .4byte 0x02020188
_080C4B58: .4byte 0x02022CA8
_080C4B5C: .4byte 0x00002260

