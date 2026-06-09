	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8057E04, "ax", %progbits
@ sub_8057E04 @ JP 0x08057E04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057E04
	.thumb_func
sub_8057E04:
	push {r4, lr}
	adds r2, r0, #0
	ldrh r3, [r2, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r2, r0]
	movs r4, #0x30
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _08057E22
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl sub_8002DE4
	b _08057E26
_08057E22:
	adds r0, r3, #1
	strh r0, [r2, #0x2c]
_08057E26:
	pop {r4}
	pop {r0}
	bx r0

