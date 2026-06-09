	.syntax unified
	.set sub_8003BC0, 0x08003BC0 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80AB514, "ax", %progbits
@ sub_80AB514 @ JP 0x080AB514 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB514
	.thumb_func
sub_80AB514:
	push {r4, r5, lr}
	ldr r1, _080AB564 @ =0x03006790
	ldr r5, _080AB568 @ =0x08A9CA5C
	ldr r0, [r5]
	ldr r4, _080AB56C @ =0x0203EF40
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x1c
	bl sub_80D65C8
	ldr r1, [r4]
	ldr r0, _080AB570 @ =0x50414D58
	cmp r1, r0
	bne _080AB580
	bl sub_8003BC0
	lsls r0, r0, #0x18
	ldr r1, _080AB574 @ =0x00020223
	adds r0, r0, r1
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _080AB580
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x18]
	adds r0, r0, r1
	str r0, [r4, #0x18]
	ldr r3, _080AB578 @ =0x0202BCEC
	ldrb r2, [r4, #0xf]
	lsls r2, r2, #0xd
	ldr r0, [r3, #0x2c]
	ldr r1, _080AB57C @ =0xFF801FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r3, #0x2c]
	movs r0, #1
	b _080AB582
	.align 2, 0
_080AB564: .4byte 0x03006790
_080AB568: .4byte 0x08A9CA5C
_080AB56C: .4byte 0x0203EF40
_080AB570: .4byte 0x50414D58
_080AB574: .4byte 0x00020223
_080AB578: .4byte 0x0202BCEC
_080AB57C: .4byte 0xFF801FFF
_080AB580:
	movs r0, #0
_080AB582:
	pop {r4, r5}
	pop {r1}
	bx r1

