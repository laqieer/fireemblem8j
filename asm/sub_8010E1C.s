	.syntax unified
	.set sub_8022200, 0x08022200 + 1
	.section .text.sub_8010E1C, "ax", %progbits
@ sub_8010E1C @ JP 0x08010E1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010E1C
	.thumb_func
sub_8010E1C:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010E32
	adds r0, r2, #0
	bl sub_8022200
_08010E32:
	movs r0, #0
	pop {r1}
	bx r1

