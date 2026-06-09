	.syntax unified
	.set LockGame, 0x08015384 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_801DA50, "ax", %progbits
@ sub_801DA50 @ JP 0x0801DA50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DA50
	.thumb_func
sub_801DA50:
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	ldr r0, _0801DA70 @ =0x085C3248
	bl Proc_StartBlocking
	adds r0, #0x4e
	strh r4, [r0]
	cmp r4, #0
	beq _0801DA6A
	bl LockGame
_0801DA6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DA70: .4byte 0x085C3248

