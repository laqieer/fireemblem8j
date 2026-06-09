	.syntax unified
	.set SioSend16, 0x080424EC + 1
	.section .text.Sio_Halt, "ax", %progbits
@ Sio_Halt @ JP 0x080428B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_Halt
	.thumb_func
Sio_Halt:
	push {lr}
	sub sp, #4
	ldr r1, _080428EC @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r0, _080428F0 @ =0x085D31E8
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, sp
	movs r1, #1
	bl SioSend16
	ldr r1, _080428F4 @ =0x030017EA
	ldr r0, _080428F8 @ =0x030017E8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _080428FC @ =0x030017F0
	ldr r2, _08042900 @ =0x030017F8
	movs r1, #3
_080428D8:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _080428D8
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080428EC: .4byte 0x00007FFF
_080428F0: .4byte 0x085D31E8
_080428F4: .4byte 0x030017EA
_080428F8: .4byte 0x030017E8
_080428FC: .4byte 0x030017F0
_08042900: .4byte 0x030017F8

