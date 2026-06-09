	.syntax unified
	.set TryLockProc, 0x0809A02C + 1
	.section .text.sub_80877B0, "ax", %progbits
@ sub_80877B0 @ JP 0x080877B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80877B0
	.thumb_func
sub_80877B0:
	push {lr}
	ldr r0, [r0, #0x14]
	bl TryLockProc
	pop {r0}
	bx r0

