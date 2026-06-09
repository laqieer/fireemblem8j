	.syntax unified
	.set Sio_ResetSession, 0x08041698 + 1
	.set sub_8042678, 0x08042678 + 1
	.section .text.sub_8042A8C, "ax", %progbits
@ sub_8042A8C @ JP 0x08042A8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042A8C
	.thumb_func
sub_8042A8C:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _08042AE8 @ =0x085D31E8
	ldr r1, [r5]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #0
	strb r0, [r2]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r5]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl Sio_ResetSession
	mov r1, sp
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	mov r2, sp
	ldrh r1, [r4, #0x36]
	lsrs r0, r1, #8
	strb r0, [r2, #1]
	mov r0, sp
	strb r1, [r0, #2]
	mov r1, sp
	adds r4, #0x3a
	ldrb r0, [r4]
	strb r0, [r1, #3]
	mov r0, sp
	movs r1, #4
	bl sub_8042678
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042AE8: .4byte 0x085D31E8

