	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80B56D8, 0x080B56D8 + 1
	.set sub_80B5C24, 0x080B5C24 + 1
	.section .text.sub_80B5F70, "ax", %progbits
@ sub_80B5F70 @ JP 0x080B5F70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5F70
	.thumb_func
sub_80B5F70:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80B5C24
	ldr r2, _080B5FD0 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080B5FD4 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B5FD8 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	bl sub_80B56D8
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0
	bl sub_80B1524
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl sub_80B1FBC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5FD0: .4byte 0x03003020
_080B5FD4: .4byte 0x020234A8
_080B5FD8: .4byte 0x02022CA8

