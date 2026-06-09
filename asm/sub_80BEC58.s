	.syntax unified
	.set GmapTimeMonsExists, 0x080C699C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80BEC58, "ax", %progbits
@ sub_80BEC58 @ JP 0x080BEC58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEC58
	.thumb_func
sub_80BEC58:
	push {r4, lr}
	adds r4, r0, #0
	bl GmapTimeMonsExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BEC6C
	adds r0, r4, #0
	bl sub_8002DE4
_080BEC6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

