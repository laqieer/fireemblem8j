	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80C6D98, "ax", %progbits
@ sub_80C6D98 @ JP 0x080C6D98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6D98
	.thumb_func
sub_80C6D98:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080C6DF8 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #0xfb
	ands r0, r2
	strb r0, [r1]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080C6DFC @ =0x08B1E9B8
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl sub_8013008
	ldr r0, _080C6E00 @ =0x08B23D3C
	movs r1, #0xa0
	movs r2, #0x80
	bl sub_8000D68
	ldr r0, _080C6E04 @ =0x08B237EC
	ldr r4, _080C6E08 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080C6E0C @ =0x020234A8
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, _080C6E10 @ =0x08AC24B0
	adds r1, r5, #0
	bl sub_8002BCC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6DF8: .4byte 0x08AC1108
_080C6DFC: .4byte 0x08B1E9B8
_080C6E00: .4byte 0x08B23D3C
_080C6E04: .4byte 0x08B237EC
_080C6E08: .4byte 0x02020188
_080C6E0C: .4byte 0x020234A8
_080C6E10: .4byte 0x08AC24B0

