	.syntax unified
	.section .text.sub_80A3DC8, "ax", %progbits
@ sub_80A3DC8 @ JP 0x080A3DC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3DC8
	.thumb_func
sub_80A3DC8:
	push {r4, lr}
	movs r1, #0
	movs r4, #0xf0
	cmp r0, #0
	ble _080A3DD4
	adds r1, r0, #0
_080A3DD4:
	cmp r0, #0
	bge _080A3DDE
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r0, r2
_080A3DDE:
	cmp r4, #0xf0
	bgt _080A3DEC
	adds r0, r4, #0
	cmp r0, #0
	bge _080A3DEE
	movs r0, #0
	b _080A3DEE
_080A3DEC:
	movs r0, #0xf0
_080A3DEE:
	adds r4, r0, #0
	cmp r1, #0xf0
	bgt _080A3DFC
	cmp r1, #0
	bge _080A3DFE
	movs r1, #0
	b _080A3DFE
_080A3DFC:
	movs r1, #0xf0
_080A3DFE:
	ldr r2, _080A3E20 @ =0x03003020
	adds r3, r2, #0
	adds r3, #0x2d
	movs r0, #0
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x31
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	strb r4, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A3E20: .4byte 0x03003020

