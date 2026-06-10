	.syntax unified
	.section .text.sub_800FE54, "ax", %progbits
@ sub_800FE54 @ JP 0x0800FE54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800FE54
	.thumb_func
sub_800FE54:
	push {lr}
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #0
	cmp r1, #1
	bne _0800FE62
	movs r2, #1
_0800FE62:
	ldrh r1, [r0, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800FE72
	movs r0, #4
	orrs r2, r0
_0800FE72:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800FE82
	movs r0, #8
	orrs r2, r0
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
_0800FE82:
	adds r0, r2, #0
	pop {r1}
	bx r1

