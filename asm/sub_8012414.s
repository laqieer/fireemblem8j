	.syntax unified
	.set sub_8085680, 0x08085680 + 1
	.section .text.sub_8012414, "ax", %progbits
@ sub_8012414 @ JP 0x08012414 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012414
	.thumb_func
sub_8012414:
	push {lr}
	bl sub_8085680
	adds r1, r0, #0
	movs r2, #0
	b _08012424
_08012420:
	adds r2, #1
	adds r1, #0x14
_08012424:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08012420
	adds r0, r2, #0
	pop {r1}
	bx r1

