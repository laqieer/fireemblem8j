	.syntax unified
	.set SioSend16, 0x080424EC + 1
	.set m4aSoundVSyncOn, 0x080D5574 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8048AC4, "ax", %progbits
@ sub_8048AC4 @ JP 0x08048AC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048AC4
	.thumb_func
sub_8048AC4:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08048B00 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, _08048B04 @ =0x085D325C
	movs r1, #0
	bl sub_8002BCC
	ldr r0, _08048B08 @ =0x085D3284
	adds r1, r4, #0
	bl sub_8002BCC
	ldr r0, _08048B0C @ =0x085D3234
	adds r1, r4, #0
	bl sub_8002BCC
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	bl m4aSoundVSyncOn
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048B00: .4byte 0x00002586
_08048B04: .4byte 0x085D325C
_08048B08: .4byte 0x085D3284
_08048B0C: .4byte 0x085D3234

