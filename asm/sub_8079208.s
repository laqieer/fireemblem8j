	.syntax unified
	.set CheckEkrHitDone, 0x08052FC4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8079208, "ax", %progbits
@ sub_8079208 @ JP 0x08079208 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079208
	.thumb_func
sub_8079208:
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrHitDone
	cmp r0, #1
	bne _0807921A
	adds r0, r4, #0
	bl sub_8002DE4
_0807921A:
	pop {r4}
	pop {r0}
	bx r0

