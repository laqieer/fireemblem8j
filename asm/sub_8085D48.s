	.syntax unified
	.section .text.sub_8085D48, "ax", %progbits
@ sub_8085D48 @ JP 0x08085D48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085D48
	.thumb_func
sub_8085D48:
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r4, [r3]
	ldr r1, [r4, #8]
	ldrb r2, [r4, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r6, r0, #0x10
	lsrs r1, r1, #0x18
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _08085D86
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _08085D86
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	str r6, [r3, #0xc]
	str r1, [r3, #0x10]
	movs r0, #1
	b _08085D88
_08085D86:
	movs r0, #0
_08085D88:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

