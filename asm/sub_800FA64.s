	.syntax unified
	.set sub_807C178, 0x0807C178 + 1
	.set sub_807C3A0, 0x0807C3A0 + 1
	.set sub_807C40C, 0x0807C40C + 1
	.section .text.sub_800FA64, "ax", %progbits
@ sub_800FA64 @ JP 0x0800FA64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800FA64
	.thumb_func
sub_800FA64:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	cmp r5, #0
	beq _0800FAC8
	ldrb r1, [r4, #5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800FA84
	movs r0, #2
	orrs r6, r0
_0800FA84:
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _0800FAA0
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldrh r2, [r4, #4]
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x1a
	adds r0, r5, #0
	adds r3, r6, #0
	bl sub_807C40C
	b _0800FAC8
_0800FAA0:
	cmp r3, #1
	beq _0800FAAE
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800FABC
_0800FAAE:
	ldr r1, [r4, #8]
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r3, r6, #0
	bl sub_807C3A0
	b _0800FAC8
_0800FABC:
	ldr r1, [r4, #8]
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r3, r6, #0
	bl sub_807C178
_0800FAC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

