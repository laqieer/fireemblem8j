	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.section .text.sub_80C46B0, "ax", %progbits
@ sub_80C46B0 @ JP 0x080C46B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C46B0
	.thumb_func
sub_80C46B0:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _080C4740 @ =0x03005270
	adds r6, r5, #0
	adds r6, #0x29
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1]
	ldr r7, _080C4744 @ =0x08AC1108
	adds r0, r7, #0
	bl Proc_Find
	ldr r3, [r0, #0x48]
	ldrb r2, [r6]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r3, #0x34
	adds r3, r3, r0
	movs r0, #0x1f
	ands r2, r0
	movs r1, #1
	lsls r1, r2
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x30
	ldrb r1, [r0]
	movs r4, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080C4720
	adds r0, r7, #0
	bl Proc_Find
	ldr r0, [r0, #0x48]
	ldrb r1, [r6]
	adds r0, #0x33
	strb r1, [r0]
	adds r0, r7, #0
	bl Proc_Find
	ldr r1, [r0, #0x48]
	adds r1, #0x32
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
_080C4720:
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r2, [r0]
	cmp r2, #0
	beq _080C4748
	cmp r2, #1
	beq _080C4750
	adds r0, #1
	b _080C4756
	.align 2, 0
_080C4740: .4byte 0x03005270
_080C4744: .4byte 0x08AC1108
_080C4748:
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	b _080C4756
_080C4750:
	adds r0, r5, #0
	adds r0, #0x2b
	strb r2, [r0]
_080C4756:
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x2c
	movs r2, #0
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

