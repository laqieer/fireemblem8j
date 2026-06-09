	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.section .text.sub_80857A0, "ax", %progbits
@ sub_80857A0 @ JP 0x080857A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80857A0
	.thumb_func
sub_80857A0:
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080857DA
_080857AA:
	ldr r0, [r4, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080857D8
	ldrb r0, [r4]
	cmp r5, r0
	bne _080857D8
	ldrb r0, [r4, #1]
	cmp r0, #0x4f
	beq _080857D0
	ldr r0, _080857D4 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _080857D8
_080857D0:
	adds r0, r4, #0
	b _080857E2
	.align 2, 0
_080857D4: .4byte 0x0202BCEC
_080857D8:
	adds r4, #0xc
_080857DA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080857AA
	movs r0, #0
_080857E2:
	pop {r4, r5}
	pop {r1}
	bx r1

