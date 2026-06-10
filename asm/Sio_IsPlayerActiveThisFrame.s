	.syntax unified
	.section .text.Sio_IsPlayerActiveThisFrame, "ax", %progbits
@ Sio_IsPlayerActiveThisFrame @ JP 0x0804213C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_IsPlayerActiveThisFrame
	.thumb_func
Sio_IsPlayerActiveThisFrame:
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08042158 @ =0x085D31E8
	ldr r1, [r1]
	ldrb r1, [r1, #8]
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _0804215C
	movs r0, #0
	b _0804215E
	.align 2, 0
_08042158: .4byte 0x085D31E8
_0804215C:
	movs r0, #1
_0804215E:
	pop {r1}
	bx r1
	.align 2, 0

