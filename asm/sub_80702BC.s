	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80702BC, "ax", %progbits
@ sub_80702BC @ JP 0x080702BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80702BC
	.thumb_func
sub_80702BC:
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldr r0, [r2, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldr r0, [r2, #0x5c]
	ldrh r1, [r0, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080702E2
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080702E2
	adds r0, r2, #0
	bl sub_8002DE4
_080702E2:
	pop {r0}
	bx r0
	.align 2, 0

