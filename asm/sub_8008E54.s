	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8008E54, "ax", %progbits
@ sub_8008E54 @ JP 0x08008E54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008E54
	.thumb_func
sub_8008E54:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08008E8C @ =0x085B93BC
	movs r1, #0
	bl sub_8002BCC
	ldr r1, _08008E90 @ =0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, _08008E94 @ =0x06010000
	adds r1, r1, r2
	str r1, [r0, #0x4c]
	str r5, [r0, #0x54]
	str r6, [r0, #0x58]
	ldr r0, _08008E98 @ =0x085B93A4
	mov r1, r8
	bl Proc_StartBlocking
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008E8C: .4byte 0x085B93BC
_08008E90: .4byte 0x000003FF
_08008E94: .4byte 0x06010000
_08008E98: .4byte 0x085B93A4

