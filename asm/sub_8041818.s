	.syntax unified
	.set Sio_ResetSession, 0x08041698 + 1
	.set Sio_SetCommParams, 0x08041660 + 1
	.set Sio_SetSubState, 0x08042904 + 1
	.section .text.sub_8041818, "ax", %progbits
@ sub_8041818 @ JP 0x08041818 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8041818
	.thumb_func
sub_8041818:
	push {r4, lr}
	ldr r2, _08041874 @ =0x085D31E8
	ldr r0, [r2]
	movs r4, #0
	strb r4, [r0]
	ldr r0, [r2]
	strb r4, [r0, #1]
	ldr r1, [r2]
	movs r3, #0
	strh r4, [r1, #2]
	strh r4, [r1, #4]
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, [r2]
	strb r3, [r0, #7]
	ldr r0, [r2]
	strb r3, [r0, #8]
	ldr r0, [r2]
	strb r3, [r0, #9]
	ldr r0, [r2]
	strb r3, [r0, #0xf]
	ldr r0, [r2]
	strb r3, [r0, #0x10]
	ldr r0, [r2]
	strb r3, [r0, #0x11]
	ldr r0, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r2]
	strb r3, [r0, #0xa]
	ldr r0, _08041878 @ =0x00006582
	movs r1, #3
	movs r2, #0x88
	bl Sio_SetCommParams
	movs r0, #0
	bl Sio_SetSubState
	bl Sio_ResetSession
	ldr r0, _0804187C @ =0x030017E4
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041874: .4byte 0x085D31E8
_08041878: .4byte 0x00006582
_0804187C: .4byte 0x030017E4

