	.syntax unified
	.set sub_80C21F4, 0x080C21F4 + 1
	.section .text.sub_80C2B14, "ax", %progbits
@ sub_80C2B14 @ JP 0x080C2B14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2B14
	.thumb_func
sub_80C2B14:
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r4, r5, #2
	adds r0, #0x2c
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080C2B72
	adds r2, r1, #0
	adds r2, #0x2a
	movs r0, #0xff
	strb r0, [r2]
	adds r0, r1, #0
	bl sub_80C21F4
	ldr r0, _080C2B58 @ =0x03005270
	adds r1, r4, r0
	ldrb r2, [r1, #0x10]
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080C2B5C
	movs r0, #0
	strh r0, [r1, #0x12]
	movs r0, #2
	orrs r0, r2
	b _080C2B62
	.align 2, 0
_080C2B58: .4byte 0x03005270
_080C2B5C:
	strh r0, [r1, #0x12]
	movs r0, #0xfd
	ands r0, r2
_080C2B62:
	strb r0, [r1, #0x10]
	ldr r0, _080C2B78 @ =0x03005270
	lsls r1, r5, #2
	adds r1, r1, r0
	ldrb r2, [r1, #0x10]
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r1, #0x10]
_080C2B72:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2B78: .4byte 0x03005270

