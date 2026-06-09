	.syntax unified
	.set TryLockProc, 0x0809A02C + 1
	.section .text.sub_8006530, "ax", %progbits
@ sub_8006530 @ JP 0x08006530 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006530
	.thumb_func
sub_8006530:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _08006540
	bl TryLockProc
_08006540:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0800654C
	bl TryLockProc
_0800654C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

