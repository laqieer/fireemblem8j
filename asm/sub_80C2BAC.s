	.syntax unified
	.set sub_80BFDD4, 0x080BFDD4 + 1
	.section .text.sub_80C2BAC, "ax", %progbits
@ sub_80C2BAC @ JP 0x080C2BAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2BAC
	.thumb_func
sub_80C2BAC:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	cmp r1, #0
	blt _080C2BE0
	lsls r4, r1, #2
	adds r0, #0x2c
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	bl sub_80BFDD4
	ldr r0, _080C2BDC @ =0x03005270
	adds r4, r4, r0
	ldrb r1, [r4, #0x10]
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #0x10]
	b _080C2C18
	.align 2, 0
_080C2BDC: .4byte 0x03005270
_080C2BE0:
	movs r6, #0
	adds r4, r7, #0
	adds r4, #0x2c
_080C2BE6:
	lsls r5, r6, #2
	ldr r1, [r4]
	adds r1, #0x2b
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080C2C10
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	bl sub_80BFDD4
	ldr r1, _080C2C20 @ =0x03005270
	adds r1, r5, r1
	ldrb r2, [r1, #0x10]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1, #0x10]
_080C2C10:
	adds r4, #4
	adds r6, #1
	cmp r6, #6
	ble _080C2BE6
_080C2C18:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2C20: .4byte 0x03005270

