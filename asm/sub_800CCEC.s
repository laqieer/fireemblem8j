	.syntax unified
	.set sub_80C788C, 0x080C788C + 1
	.section .text.sub_800CCEC, "ax", %progbits
@ sub_800CCEC @ JP 0x0800CCEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CCEC
	.thumb_func
sub_800CCEC:
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CD06
	adds r0, r2, #0
	movs r1, #0
	bl sub_80C788C
_0800CD06:
	movs r0, #0
	pop {r1}
	bx r1

