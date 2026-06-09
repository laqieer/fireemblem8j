	.syntax unified
	.set TryUnlockProc, 0x0809A040 + 1
	.section .text.sub_80877BC, "ax", %progbits
@ sub_80877BC @ JP 0x080877BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80877BC
	.thumb_func
sub_80877BC:
	push {lr}
	ldr r0, [r0, #0x14]
	bl TryUnlockProc
	pop {r0}
	bx r0

