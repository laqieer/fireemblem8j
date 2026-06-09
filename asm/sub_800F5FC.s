	.syntax unified
	.set sub_800BD98, 0x0800BD98 + 1
	.section .text.sub_800F5FC, "ax", %progbits
@ sub_800F5FC @ JP 0x0800F5FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F5FC
	.thumb_func
sub_800F5FC:
	push {r4, lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x38]
	ldrb r0, [r1]
	movs r3, #0xf
	ands r3, r0
	movs r0, #2
	ldrsh r4, [r1, r0]
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800F61A
	movs r3, #0
_0800F61A:
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_800BD98
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

