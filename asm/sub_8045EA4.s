	.syntax unified
	.set SioSend16, 0x080424EC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8045EA4, "ax", %progbits
@ sub_8045EA4 @ JP 0x08045EA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045EA4
	.thumb_func
sub_8045EA4:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08045EDC @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, _08045EE0 @ =0x085D325C
	movs r1, #0
	bl sub_8002BCC
	ldr r0, _08045EE4 @ =0x085D3284
	adds r1, r4, #0
	bl sub_8002BCC
	ldr r0, _08045EE8 @ =0x085D3234
	adds r1, r4, #0
	bl sub_8002BCC
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045EDC: .4byte 0x00002586
_08045EE0: .4byte 0x085D325C
_08045EE4: .4byte 0x085D3284
_08045EE8: .4byte 0x085D3234

