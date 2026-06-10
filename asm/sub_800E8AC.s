	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80088E4, 0x080088E4 + 1
	.section .text.sub_800E8AC, "ax", %progbits
@ sub_800E8AC @ JP 0x0800E8AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E8AC
	.thumb_func
sub_800E8AC:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80088E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800E8C0
	adds r0, r4, #0
	bl sub_8002DE4
_0800E8C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

