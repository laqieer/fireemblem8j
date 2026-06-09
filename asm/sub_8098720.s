	.syntax unified
	.set BMapDispResume, 0x08030108 + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set UnlockGame, 0x08015394 + 1
	.section .text.sub_8098720, "ax", %progbits
@ sub_8098720 @ JP 0x08098720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098720
	.thumb_func
sub_8098720:
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08098734
	bl BMapDispResume
	bl UnlockGame
_08098734:
	pop {r0}
	bx r0

