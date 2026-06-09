	.syntax unified
	.set GetSioIndex, 0x08041650 + 1
	.set SioPollingMsg, 0x08041530 + 1
	.set SioSend16, 0x080424EC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8042DB0, "ax", %progbits
@ sub_8042DB0 @ JP 0x08042DB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042DB0
	.thumb_func
sub_8042DB0:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08042DF4 @ =0x00002586
	mov r1, sp
	strh r0, [r1]
	bl SioPollingMsg
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _08042DEC
	ldr r4, _08042DF8 @ =0x085D31E8
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0x11]
	ldr r1, [r4]
	movs r0, #5
	strh r0, [r1, #4]
	bl GetSioIndex
	ldr r1, [r4]
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl SioSend16
	adds r0, r6, #0
	bl sub_8002DE4
_08042DEC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042DF4: .4byte 0x00002586
_08042DF8: .4byte 0x085D31E8

