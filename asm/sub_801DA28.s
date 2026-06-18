	.syntax unified
	.set LockGame, 0x08015384 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_801DA28, "ax", %progbits
@ NewBMXFADE @ JP 0x0801DA28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewBMXFADE
	.thumb_func
NewBMXFADE:
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	ldr r0, _0801DA4C @ =0x085C3248
	movs r1, #3
	bl sub_8002BCC
	adds r0, #0x4e
	strh r4, [r0]
	cmp r4, #0
	beq _0801DA44
	bl LockGame
_0801DA44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DA4C: .4byte 0x085C3248

