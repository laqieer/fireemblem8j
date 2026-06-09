	.syntax unified
	.set BMapDispSuspend, 0x080300D4 + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set LockGame, 0x08015384 + 1
	.section .text.sub_8098708, "ax", %progbits
@ sub_8098708 @ JP 0x08098708 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098708
	.thumb_func
sub_8098708:
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809871C
	bl LockGame
	bl BMapDispSuspend
_0809871C:
	pop {r0}
	bx r0

