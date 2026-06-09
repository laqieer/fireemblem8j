	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C4274, 0x080C4274 + 1
	.section .text.sub_80BDA04, "ax", %progbits
@ sub_80BDA04 @ JP 0x080BDA04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BDA04
	.thumb_func
sub_80BDA04:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C4274
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BDA20
	adds r1, r4, #0
	adds r1, #0x41
	movs r0, #0x14
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_080BDA20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

